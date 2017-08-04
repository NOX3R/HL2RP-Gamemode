function PROVIDER:LoadPlayerInventory( pl )
	local path = "itemstore/" .. pl:UniqueID() .. ".txt"
	local data = file.Read( path, "DATA" )

	if ( data ) then
		local inv = util.JSONToTable( data )

		if ( inv ) then
			for k, v in pairs( inv ) do
				local item = itemstore.items.New( v.UniqueName, v.Data )

				pl:GetInventory():SetItem( item, k )
			end
		end
	end
end

function PROVIDER:SavePlayerInventory( pl )
	local path = "itemstore/" .. pl:UniqueID() .. ".txt"

	local data = {}
	for k, v in pairs( pl:GetInventory().Items ) do
		data[ k ] = { UniqueName = v.UniqueName, Data = v.Data }
	end

	file.Write( path, util.TableToJSON( data ) )
end

function PROVIDER:LoadPlayerBank( pl, bank )
	local path = "itemstore/banks/" .. pl:UniqueID() .. ".txt"
	local data = file.Read( path, "DATA" )

	if ( data ) then
		local inv = util.JSONToTable( data )

		if ( inv ) then
			local items = {}

			for k, v in pairs( inv ) do
				local item = itemstore.items.New( v.UniqueName, v.Data )

				items[ k ] = item
			end

			bank.Inventories[ pl ].Items = items
		end
	end
end

function PROVIDER:SavePlayerBank( pl, bank )
	local path = "itemstore/banks/" .. pl:UniqueID() .. ".txt"

	if ( bank.Inventories[ pl ] ) then
		local data = {}
		for k, v in pairs( bank.Inventories[ pl ].Items ) do
			data[ k ] = { UniqueName = v.UniqueName, Data = v.Data }
		end

		file.Write( path, util.TableToJSON( data ) )
	end
end

function PROVIDER:FullSave()
	for _, pl in ipairs( player.GetAll() ) do
		itemstore.data.SavePlayerInventory( pl )

		local bank = ents.FindByClass( "itemstore_bank" )[ 1 ]
		if ( IsValid( bank ) ) then
			itemstore.data.SavePlayerBank( pl, bank )
		end
	end
end
