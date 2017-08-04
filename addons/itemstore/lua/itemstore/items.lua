itemstore.items = {}
itemstore.items.Registered = {}
itemstore.items.Pickups = {}

local Item = {}

function Item:Run( funcname, ... )
	local func = self[ funcname ]

	if ( func ) then
		return func( self, ... )
	end
end

function Item:Initialize()
end

function Item:GetName()
	return self.Name
end

function Item:GetDescription()
	return self.Description
end

function Item:GetModel()
	return self.Model
end

function Item:ModifyEntity( ent )
end

function Item:CanPickup( pl, ent )
	return true
end

function Item:Pickup( pl, ent )
end

function Item:Drop( pl, ent )
end

function Item:CanMerge( item )
	return self.Stackable and item.Stackable and self.UniqueName == item.UniqueName and ( itemstore.config.MaxStack == -1 or ( self:GetData( "Amount" ) or 1 ) + ( item:GetData( "Amount" ) or 1 ) <= itemstore.config.MaxStack )
end

function Item:Merge( item )
	-- oops I'm really stupid
	local count = math.Clamp( itemstore.config.MaxStack - ( item:GetData( "Amount" ) or 1 ), 0, ( self:GetData( "Amount" ) or 1 ) )

	self:SetData( "Amount", ( self:GetData( "Amount" ) or 1 ) - count )
	item:SetData( "Amount", ( item:GetData( "Amount" ) or 1 ) + count )

	return self:GetData( "Amount" ) > 0
end

function Item:CanSplit( amount )
	return self.Stackable and ( ( self:GetData( "Amount" ) or 1 ) > 1 ) and ( ( self:GetData( "Amount" ) or 1 ) > ( amount + 1 ) )
end

function Item:Split( amount )
	self:SetData( "Amount", self:GetData( "Amount" ) - amount )

	local item = itemstore.items.New( self.UniqueName, table.Copy( self.Data ) )
	item:SetData( "Amount", amount )

	return item
end

function Item:SpawnEntity( pos )
	local ent = ents.Create( "itemstore_item" )
	ent:SetItem( self )
	ent:SetPos( pos )

	return ent
end

function Item:SetData( index, value )
	self.Data[ index ] = value
end

function Item:GetData( index )
	return self.Data[ index ]
end

function Item:Overflow( pl, ent )
	self:Drop( pl, ent )
end

function Item:RegisterPickup( classname )
	itemstore.items.RegisterPickup( classname, self.UniqueName )
end;

function itemstore.items.RegisterPickup( classname, itemname )
	itemstore.items.Pickups[ classname ] = itemname
end

function itemstore.items.CanPickup( classname )
	if ( classname == "itemstore_item" or itemstore.items.Pickups[ classname ] and not itemstore.config.RestrictedItems[ classname ] ) then
		return true
	end

	return false
end

function itemstore.items.Exists( itemtype )
	if ( itemstore.items.Registered[ itemtype ] ) then
		return true
	end

	return false
end

function itemstore.items.Load()
	for _, filename in ipairs( file.Find( "itemstore/items/*.lua", "LUA" ) ) do
		local name = string.match( filename, "^(.+).lua$" )

		if ( name ) then
			ITEM = setmetatable( {}, { __index = Item } )
			ITEM.UniqueName = name

			if SERVER then AddCSLuaFile( "itemstore/items/" .. filename ) end
			include( "itemstore/items/" .. filename )

			itemstore.items.Registered[ name ] = ITEM

			ITEM = nil
		end
	end

	for k, v in pairs( itemstore.config.CustomItems ) do
		local ITEM = setmetatable( {}, { __index = Item } )

		ITEM.UniqueName = k
		ITEM.Name = v[ 1 ]
		ITEM.Description = v[ 2 ]
		ITEM.Stackable = v[ 3 ]
		ITEM.Base = "base_auto"

		itemstore.items.Registered[ ITEM.UniqueName ] = ITEM
	end

	for _, item in pairs( itemstore.items.Registered ) do
		if ( item.Base ) then
			if ( itemstore.items.Exists( item.Base ) ) then
				setmetatable( item, { __index = itemstore.items.Registered[ item.Base ] } )
			end
		end
	end

	for _, item in pairs( itemstore.items.Registered ) do
		item:Run( "Load" )
	end
end
itemstore.items.Load()

concommand.Add( "itemstore_reload", itemstore.items.Load )

function itemstore.items.New( itemtype, data )
	local itembase = itemstore.items.Registered[ itemtype ]

	if ( itembase ) then
		local item = setmetatable( { Data = data or {} }, { __index = itembase } )
		item:Run( "Initialize" )

		return item
	end
end

if SERVER then
	function itemstore.items.CreateEntity( item, pos )
		local ent = item:Run( "SpawnEntity", pos )

		if ( IsValid( ent ) ) then
			item:Run( "LoadData", ent )

			return ent
		end
	end
end
