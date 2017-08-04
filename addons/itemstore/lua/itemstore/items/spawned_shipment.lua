ITEM.Name = "Shipment"
ITEM.Description = "A shipment of guns.\n\nContents: %s\nAmount: %d"
ITEM.Model = "models/Items/item_item_crate.mdl"
ITEM.Base = "base_darkrp"

-- Because all of you feel the need to fuck with your shipments on a daily basis.
if SERVER then
	function ITEM:Initialize()
		if ( self:GetData( "Class" ) ) then
			local shipment = CustomShipments[ self:GetData( "Contents" ) ]

			if ( not shipment or shipment.entity ~= self:GetData( "Class" ) ) then
				for k, v in ipairs( CustomShipments ) do

					if ( v.entity == self:GetData( "Class" ) ) then
						print( "correcting shipment..." )
						self:SetData( "Contents", k )
						return
					end
				end
			end
		end
	end
end

function ITEM:GetDescription()
	local shipment = CustomShipments[ self:GetData( "Contents" ) ]

	if ( shipment ) then
		return string.format( self.Description, shipment.name, self:GetData( "Amount" ) )
	else
		return "ERROR: Shipment invalid. Delete this item!"
	end
end

function ITEM:CanPickup( pl, ent )
	return itemstore.config.MaxStack >= ent:Getcount()
end

function ITEM:CanMerge( item )
	return item.UniqueName == self.UniqueName and item:GetData( "Contents" ) == self:GetData( "Contents" ) and ( itemstore.config.MaxStack == -1 or ( ( self:GetData( "Amount" ) or 1 ) + ( item:GetData( "Amount" ) or 1 ) ) <= itemstore.config.MaxStack )
end

function ITEM:Merge( item )
	item:SetData( "Amount", item:GetData( "Amount" ) + self:GetData( "Amount" ) )
end

function ITEM:CanSplit( amount )
	return ( ( self:GetData( "Amount" ) or 1 ) > amount )
end

function ITEM:SaveData( ent )
	self:SetData( "Owner", ent:Getowning_ent() )
	self:SetData( "Contents", ent:Getcontents() )
	self:SetData( "Amount", ent:Getcount() )

	self:SetData( "Class", CustomShipments[ ent:Getcontents() ].entity )

	timer.Destroy( ent:EntIndex() .. "crate" )
end

function ITEM:LoadData( ent )
	ent:Setcontents( self:GetData( "Contents" ) )
	ent:Setcount( self:GetData( "Amount" ) )
	ent:Setowning_ent( self:GetData( "Owner" ) )
end

function ITEM:Use( pl )
	if pl:isArrested() then return false end
	if pl:HasWeapon( CustomShipments[ self:GetData( "Contents" ) ].entity ) then
		local weapon_table = weapons.Get( CustomShipments[ self:GetData( "Contents" ) ].entity )

		if weapon_table then
			pl:GiveAmmo( weapon_table.Primary.DefaultClip, weapon_table.Primary.Ammo )
		end
	else
		pl:Give( CustomShipments[ self:GetData( "Contents" ) ].entity )
	end
	
	self:SetData( "Amount", self:GetData( "Amount" ) -  1 )

	if ( self:GetData( "Amount" ) < 1 ) then
		return true
	end
end
