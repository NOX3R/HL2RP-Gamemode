local meta = FindMetaTable( "Player" )

function meta:GetInventoryDimensions()
	for k, v in pairs( itemstore.config.RankSizes ) do
		if ( self:IsUserGroup( k ) ) then
			return v
		end
	end

	return itemstore.config.InventorySize
end

if SERVER then
	function meta:SetupInventory()
		local dimensions = self:GetInventoryDimensions()

		self.Inventory = itemstore.containers.New( dimensions[ 1 ] * dimensions[ 2 ] )
		self.Inventory:SetOwner( self )
		self.Inventory:SetPlayerPermissions( self, true, true )

		self.Inventory:SetCallback( "canwrite", function( container, pl )
			if ( pl:isArrested() ) then
				return false
			end
		end )

		if ( GetConVarNumber( "itemstore_inventory_persist" ) == 1 ) then
			itemstore.data.LoadPlayerInventory( self )
		end
	end

	function meta:GetInventory( pl )
		if ( not self.Inventory ) then
			self:SetupInventory()
		end

		return self.Inventory
	end

	function meta:SetItem( item, slot )
		if ( not self:GetInventory():SetItem( item, slot ) ) then
			local pos = self:GetShootPos() + self:GetAimVector() * 32
			local ent = itemstore.items.CreateEntity( item, pos )

			item:Run( "Overflow", self, ent )

			ent:Spawn()
		end
	end

	meta.AddItem = meta.SetItem

	function meta:UseItem( container, slot )
		if ( container and container:PlayerCanWrite( self ) ) then
			local item = container:GetItem( slot )

			if ( item and container:DoCallback( "use", self, slot, item ) ~= false ) then
				if ( item:Run( "Use", self ) ) then
					if ( not item.Stackable or ( item:GetData( "Amount" ) or 1 ) <= 1 ) then
						container:SetItem( nil, slot )
					elseif ( item.Stackable ) then
						item:SetData( "Amount", item:GetData( "Amount" ) - 1 )
						container:Sync()
					end
				else
					container:Sync() -- This is for updating the item descriptions. Not needed if the item gets deleted since it will resync anyways.
				end
			end
		end
	end

	concommand.Add( "itemstore_use", function( pl, cmd, args )
		local container = itemstore.containers.Active[ tonumber( args[ 1 ] ) ]

		if ( container ) then
			pl:UseItem( container, tonumber( args[ 2 ] ) )
		end
	end )

	function meta:PickupItem( ent )
		if ( not self.PickupCooldown or self.PickupCooldown < CurTime() ) then
			ent = ent or self:GetEyeTrace().Entity

			if ( IsValid( ent ) and not ent.__Deleted and ent:GetPos():Distance( self:GetShootPos() ) < itemstore.config.PickupDistance ) then
				local tr = util.TraceLine{
					start = self:EyePos(),
					endpos = ent:GetPos(),
					filter = self
				}

				--if ( tr.HitWorld ) then return false end

				local class = ent:GetClass()

				if ( itemstore.items.CanPickup( class ) ) then
					local item = class == "itemstore_item" and ent:GetItem() or itemstore.items.New( itemstore.items.Pickups[ class ] )

					if ( self:GetInventory():CanFitItem( item ) ) then
						if ( item:Run( "CanPickup", self, ent ) ) then
							item:Run( "SaveData", ent )
							item:Run( "Pickup", self, ent )

							self:EmitSound( "items/itempickup.wav" )

							if ( itemstore.config.PicksupGotoBank ) then
								local bank = ents.FindByClass( "itemstore_bank" )[ 1 ]

								if ( IsValid( bank ) ) then
									if ( not bank.Inventories[ self ] ) then
										bank:CreateAccount( self )
									end

									bank.Inventories[ self ]:AddItem( item )
								end
							else
								self:AddItem( item )
							end

							ent:Remove()
						end
					else
						self:PrintMessage( HUD_PRINTTALK, "Your inventory is too full to pick up this item!" )
					end
				end
			end

			self.PickupCooldown = CurTime() + itemstore.config.PickupCooldown
		end
	end

	concommand.Add( "itemstore_pickup", function( pl, cmd, args )
		local id = tonumber( args[ 1 ] )

		if ( id ) then
			pl:PickupItem( Entity( id ) )
		else
			pl:PickupItem()
		end
	end )
	--AddChatCommand( "/pickup", meta.PickupItem )

	function meta:DropItem( container, slot )
		if ( container and container:PlayerCanWrite( self ) ) then
			local item = container:GetItem( slot )

			if ( item and container:DoCallback( "drop", self, slot, item ) ~= false ) then
				local pos = self:GetShootPos() + self:GetAimVector() * 32
				local ent = itemstore.items.CreateEntity( item, pos )

				item:Run( "Drop", self, ent )

				ent:Spawn()

				if ( item.DropAll or not item.Stackable or ( item:GetData( "Amount" ) or 1 ) <= 1 ) then
					container:SetItem( nil, slot )
				elseif ( item.Stackable ) then
					item:SetData( "Amount", ( item:GetData( "Amount" ) or 1 ) - 1 )
					container:Sync()
				end

				self:EmitSound( "items/ammocrate_open.wav" )
			end
		end
	end
	--AddChatCommand( "/drop", function( pl, arg ) pl:DropItem( tonumber( arg ) ) end )
	concommand.Add( "itemstore_drop", function( pl, cmd, args )
		local container = itemstore.containers.Active[ tonumber( args[ 1 ] ) ]

		if ( container ) then
			pl:DropItem( container, tonumber( args[ 2 ] ) )
		end
	end )

	function meta:DestroyItem( container, slot )
		if ( container and container:PlayerCanWrite( self ) ) then
			local item = container:GetItem( slot )

			if ( item and container:DoCallback( "destroy", self, slot, item ) ~= false ) then
				container:SetItem( nil, slot )
			end
		end
	end
	concommand.Add( "itemstore_destroy", function( pl, cmd, args )
		local container = itemstore.containers.Active[ tonumber( args[ 1 ] ) ]

		if ( container ) then
			pl:DestroyItem( container, tonumber( args[ 2 ] ) )
		end
	end )

	CreateConVar( "itemstore_dropondeath", 0, FCVAR_ARCHIVE )
	CreateConVar( "itemstore_dropondeath_linger", 5, FCVAR_ARCHIVE )
	hook.Add( "PlayerDeath", "ItemStoreDropItems", function( pl )
		if ( GetConVarNumber( "itemstore_dropondeath" ) == 1 and table.Count( pl:GetInventory().Items ) > 0 ) then
			local box = ents.Create( "itemstore_box_large" )
			box:SetPos( pl:GetPos() + Vector( 0, 0, 16 ) )
			box:Spawn()

			for slot, item in pairs( pl:GetInventory().Items ) do
				box.Container:SetItem( item, slot )
				pl:SetItem( nil, slot )
			end

			timer.Simple( 60 * GetConVarNumber( "itemstore_dropondeath_linger" ), function()
				if ( IsValid( box ) ) then
					box:Remove()
				end
			end )
		end
	end )

	hook.Add( "PlayerInitialSpawn", "ItemStoreSetupInventory", function( pl )
		if ( game.SinglePlayer() ) then
			-- monty python and the holy why
			pl:GetInventory()
		end
	end )

	--util.AddNetworkString( "ItemStoreInventory" )
	concommand.Add( "itemstore_syncinventory", function( pl )
		-- net doesn't work right here. I have no FUCKING idea why. thanks garry.
		umsg.Start( "ItemStoreInventory", pl )
			umsg.Long( pl:GetInventory():GetID() )

			local dimensions = pl:GetInventoryDimensions()
			umsg.Short( dimensions[ 1 ] )
			umsg.Short( dimensions[ 2 ] )
		umsg.End()

		pl:GetInventory():Sync()
	end )

	CreateConVar( "itemstore_ctrle", 1, FCVAR_ARCHIVE )
	hook.Add( "PlayerUse", "ItemStoreAltEPickup", function( pl, ent )
		if ( GetConVarNumber( "itemstore_ctrle" ) == 1 and pl:KeyDown( IN_DUCK ) ) then
			pl:PickupItem()
			return false
		end
	end )

	hook.Add( "PlayerLoadout", "ItemStoreGivePickup", function( pl )
		if ( itemstore.config.GivePickupSWEP ) then
			pl:Give( "itemstore_pickup" )
		end

		if ( itemstore.config.DontUsePocket ) then
			timer.Simple( 0, function()
				pl:StripWeapon( "pocket" )
			end )
		end
	end )
else
	function meta:GetInventory()
		if ( self == LocalPlayer() and LocalPlayer().InventoryID ) then
			return itemstore.containers.Active[ LocalPlayer().InventoryID ]
		end
	end

	hook.Add( "InitPostEntity", "ItemStoreSyncInv", function()
		RunConsoleCommand( "itemstore_syncinventory" )
	end )

	-- again, net library doesn't work for some fucking reason. garry.
	usermessage.Hook( "ItemStoreInventory", function( um )
		local id = um:ReadLong( 32 )
		local w, h = um:ReadShort( 8 ), um:ReadShort( 8 )

		LocalPlayer().InventoryID = id

		if ( itemstore.Menu ) then
			itemstore.Menu:SetContainerID( id )
			itemstore.Menu:SetDimensions( w, h )
			if ( itemstore.config.InventoryAtLeft ) then
				itemstore.Menu:SetPos( 0, ScrH() / 2 - itemstore.Menu:GetTall() / 2 )
			else
				itemstore.Menu:SetPos( ScrW() / 2 - itemstore.Menu:GetWide() / 2, ScrH() - itemstore.Menu:GetTall() )
			end
		end
	end )
end
