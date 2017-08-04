itemstore.admin = {}

if ( SERVER ) then
	concommand.Add( "itemstore_admin_open", function( pl, cmd, args )
		if ( pl:IsSuperAdmin() ) then
			local id = tonumber( args[ 1 ] )

			if ( id ) then
				local target = Entity( id )

				if ( IsValid( target ) and target:IsPlayer() ) then
					local inv = target:GetInventory()
					inv:SetPlayerPermissions( pl, true, true )

					itemstore.containers.Open( pl, inv, target:Name() .. "'s inventory", unpack( target:GetInventoryDimensions() ) )
				end
			end
		end
	end )

	concommand.Add( "itemstore_admin_open_bank", function( pl, cmd, args )
		if ( pl:IsSuperAdmin() ) then
			local id = tonumber( args[ 1 ] )

			if ( id ) then
				local target = Entity( id )
				local bank = ents.FindByClass( "itemstore_bank" )[ 1 ]

				if ( IsValid( target ) and target:IsPlayer() and IsValid( bank ) ) then
					local inv = bank.Inventories[ target ]

					if ( inv ) then
						inv:SetPlayerPermissions( pl, true, true )
						itemstore.containers.Open( pl, inv, target:Name() .. "'s bank", bank:GetBankSize( target ) )
					end
				end
			end
		end
	end )
else
	concommand.Add( "itemstore_admin", function( pl )
		if ( pl:IsSuperAdmin() ) then
			local panel = vgui.Create( "ItemStoreAdmin" )
			panel:Center()
			panel:MakePopup()
		end
	end )
end
