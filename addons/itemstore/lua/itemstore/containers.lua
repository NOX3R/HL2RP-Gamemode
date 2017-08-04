itemstore.containers = {}
itemstore.containers.Active = {}

local Container = {}

AccessorFunc( Container, "Owner", "Owner" )

function Container:GetID()
	return self.ID
end

function Container:CanFitItem( item )
	if ( item and item.Stackable ) then
		for i = 1, self.Size do
			local target = self.Items[ i ]
			if ( target and target:Run( "CanMerge", item ) and item:Run( "CanMerge", target ) ) then
				return true
			end
		end
	end

	if ( self:GetFirstEmptySlot() ) then
		return true
	end

	return false
end

function Container:GetFirstEmptySlot()
	for i = 1, self.Size do
		if ( not self.Items[ i ] ) then
			return i
		end
	end

	return false
end

function Container:GetOpenSlots()
	local space = 0

	for i = 1, self.Size do
		if ( not self.Items[ i ] ) then
			space = space + 1
		end
	end

	return space
end

function Container:CountItems( itemtocount )
	local count = 0

	for i = 1, self.Size do
		local item = self.Items[ i ]
		if ( item and item.UniqueName == itemtocount ) then
			count = count + ( item.Stackable and ( item:GetData( "Amount" ) or 1 ) or 1 )
		end
	end

	return count
end

function Container:TakeItems( itemtotake, amount )
	for i = 1, self.Size do
		local item = self.Items[ i ]

		if ( item and item.UniqueName == itemtotake ) then
			local count = item.Stackable and ( item:GetData( "Amount" ) or 1 ) or 1
			local leftover = count - amount
			amount = amount - count

			if ( leftover >= 1 ) then
				item:SetData( "Amount", leftover )
				self:Sync()
			else
				self:SetItem( nil, i )
			end

			if ( amount <= 0 ) then
				return true
			end
		end
	end

	return false
end

function Container:SetItem( item, slot )
	if ( item and not slot ) then
		for i = 1, self.Size do
			local target = self.Items[ i ]
			if ( target and item ~= target and target:Run( "CanMerge", item ) and item:Run( "CanMerge", target ) ) then
				item:Run( "Merge", target )
				self:Sync()

				return true
			end
		end
	end

	if ( slot or self:GetFirstEmptySlot() ) then
		slot = math.Clamp( slot or self:GetFirstEmptySlot(), 1, self.Size )

		if ( slot and self:DoCallback( "set", item, slot ) ~= false ) then
			self.Items[ slot ] = item
			self:Sync()

			return true
		end
	end

	return false
end

-- AddItem implies that an item is going to be added to the first empty slot but both will do the same thing
Container.AddItem = Container.SetItem

function Container:GetItem( slot )
	slot = math.Clamp( slot, 1, self.Size )
	return self.Items[ slot ]
end

function Container:HasItem( item )
	for i = 1, self.Size do
		if ( self.Items[ i ] == item ) then
			return true
		end
	end

	return false
end

function Container:SetPlayerPermissions( pl, read, write )
	if ( self:DoCallback( "permissions", pl, read, write ) ~= false ) then
		self.Permissions[ pl ] = { Read = read, Write = write }

		if ( read ) then
			itemstore.containers.Sync( pl, self )
		end
	end
end

function Container:PlayerCanRead( pl )
	local res = self:DoCallback( "canread", pl )
	if ( res ~= nil ) then
		return res
	end

	if ( self.Permissions[ pl ] ) then
		return self.Permissions[ pl ].Read
	end

	return false
end

function Container:PlayerCanWrite( pl )
	local res = self:DoCallback( "canwrite", pl )
	if ( res ~= nil ) then
		return res
	end

	if ( self.Permissions[ pl ] ) then
		return self.Permissions[ pl ].Write
	end

	return false
end

function Container:Sync()
	if SERVER then
		local players = {}
		--[[
		for pl, perms in pairs( self.Permissions ) do
			if ( perms.Read ) then
				table.insert( players, pl )
			end
		end]]

		for _, pl in ipairs( player.GetAll() ) do
			if ( self:PlayerCanRead( pl ) ) then
				table.insert( players, pl )
			end
		end

		itemstore.containers.Sync( players, self )
	end
end

function Container:Swap( pl, sourceslot, dest, destslot )
	local sourceitem = self:GetItem( sourceslot )
	local destitem = dest:GetItem( destslot )
	sourceslot = math.floor( sourceslot )
	destslot = math.floor( destslot )

	if ( self:DoCallback( "swap", pl, sourceslot, sourceitem, dest, destslot, destitem ) ~= false and dest:DoCallback( "swap", pl, destslot, destitem, self, sourceslot, sourceitem ) ~= false ) then
		self:SetItem( destitem, sourceslot )
		dest:SetItem( sourceitem, destslot )

		--self:Sync()
		--dest:Sync()
	end
end

function Container:Merge( pl, sourceslot, dest, destslot )
	local sourceitem = self:GetItem( sourceslot )
	local destitem = dest:GetItem( destslot )
	sourceslot = math.floor( sourceslot )
	destslot = math.floor( destslot )

	if ( self:DoCallback( "merge", pl, sourceslot, sourceitem, dest, destslot, destitem ) ~= false and dest:DoCallback( "merge", pl, destslot, destitem, self, sourceslot, sourceitem ) ~= false ) then
		local dontdelete = sourceitem:Run( "Merge", destitem )

		if ( not dontdelete ) then
			self:SetItem( nil, sourceslot )
		end

		self:Sync()

		if ( self ~= dest ) then
			dest:Sync()
		end
	end
end

function Container:Split( pl, slot, amount )
	local split_slot = self:GetFirstEmptySlot()

	if ( split_slot ) then
		slot = math.floor( slot )
		local item = self:GetItem( slot )

		if ( self:DoCallback( "split", pl, slot, item, amount ) ~= false ) then
			local split_item = item:Run( "Split", amount )

			if ( split_item ) then
				self:SetItem( split_item, split_slot )
			end
		end
	end
end

function Container:SetCallback( id, func )
	self.Callbacks[ id ] = func
end

function Container:GetCallback( id )
	return self.Callbacks[ id ]
end

function Container:DoCallback( id, ... )
	if ( self.Callbacks[ id ] ) then
		return self.Callbacks[ id ]( self, ... )
	end
end

function Container:Remove()
	itemstore.containers.Remove( self:GetID() )
end

function itemstore.containers.Create( size )
	local container = setmetatable( {
		Items = {},
		Callbacks = {},
		Permissions = {},
		Owner = nil,
		ID = 0,
		Size = size or 16
	}, {
		__index = Container
	} )

	return container
end

function itemstore.containers.New( size )
	local container = itemstore.containers.Create( size )

	local id = table.insert( itemstore.containers.Active, container )
	itemstore.containers.Active[ id ].ID = id

	return container
end

function itemstore.containers.Get( id )
	local container = itemstore.containers.Active[ id ]

	if ( container ) then
		return container
	end
end

function itemstore.containers.Remove( id )
	itemstore.containers.Active[ id ] = nil
end

function itemstore.containers.Shipment( id, w, h, model, items )
	local ENT = {}
	ENT.Type = "anim"
	ENT.Base = "itemstore_box_small"
	ENT.Spawnable = false
	ENT.AdminSpawnable = false

	--function ENT:CanTool( ... ) return self.BaseClass.CanTool( ... ) end

	if SERVER then
		ENT.Items = items
		ENT.Model = model
		ENT.ContainerDimensions = { w = w, h = h }
	end

	local name = "itemstore_shipment_" .. id
	scripted_ents.Register( ENT, name )

	return name
end

if SERVER then
	util.AddNetworkString( "ItemStoreSyncContainer" )
	function itemstore.containers.Sync( pl, container )
		net.Start( "ItemStoreSyncContainer" )
			net.WriteInt( container:GetID(), 32 )
			net.WriteInt( container.Size, 32 )

			local tab = {}
			for k, v in pairs( container.Items ) do
				if ( v ) then
					tab[ k ] = { Class = v.UniqueName, Data = v.Data }
				end
			end

			net.WriteTable( tab )
		net.Send( pl )
	end

	concommand.Add( "itemstore_swap", function( pl, cmd, args )
		local source = itemstore.containers.Active[ tonumber( args[ 1 ] ) ]
		local dest = itemstore.containers.Active[ tonumber( args[ 3 ] ) ]

		if ( source and dest and source:PlayerCanWrite( pl ) and dest:PlayerCanWrite( pl ) ) then
			local sourceslot = tonumber( args[ 2 ] )
			local destslot = tonumber( args[ 4 ] )

			source:Swap( pl, sourceslot, dest, destslot )
		end
	end )

	concommand.Add( "itemstore_merge", function( pl, cmd, args )
		local source = itemstore.containers.Active[ tonumber( args[ 1 ] ) ]
		local dest = itemstore.containers.Active[ tonumber( args[ 3 ] ) ]

		if ( source and dest and source:PlayerCanWrite( pl ) and dest:PlayerCanWrite( pl ) ) then
			local sourceslot = tonumber( args[ 2 ] )
			local destslot = tonumber( args[ 4 ] )

			local sourceitem = source.Items[ sourceslot ]
			local destitem = dest.Items[ destslot ]

			if ( sourceitem and destitem and sourceitem:Run( "CanMerge", destitem ) and destitem:Run( "CanMerge", sourceitem ) ) then
				source:Merge( pl, sourceslot, dest, destslot )
			end
		end
	end )

	concommand.Add( "itemstore_split", function( pl, cmd, args )
		local container = itemstore.containers.Active[ tonumber( args[ 1 ] ) ]

		if ( container and container:PlayerCanWrite( pl )  ) then
			local slot = tonumber( args[ 2 ] )
			local amount = math.Clamp( tonumber( args[ 3 ] ), 1, 2 ^ 16 )
			local item = container.Items[ slot ]

			if ( item and item:Run( "CanSplit", amount ) ) then
				container:Split( pl, slot, amount )
			end
		end
	end )

	util.AddNetworkString( "ItemStoreOpenContainer" )
	function itemstore.containers.Open( pl, container, name, x, y, hideinv )
		net.Start( "ItemStoreOpenContainer" )
			net.WriteInt( container:GetID(), 32 )
			net.WriteString( name )
			net.WriteInt( x, 16 )
			net.WriteInt( y, 16 )
			net.WriteBit( hideinv )
		net.Send( pl )
	end
else
	itemstore.containers.Panels = {}

	function itemstore.containers.Open( containerid, name, x, y )
		local frame = vgui.Create( "ItemStoreContainerWindow" )
		frame:SetTitle( name )
		frame:SetDimensions( x, y )
		frame:SetContainerID( containerid )

		return frame
	end

	net.Receive( "ItemStoreOpenContainer", function()
		local container = itemstore.containers.Active[ net.ReadInt( 32 ) ]

		if ( container ) then
			local window = itemstore.containers.Open( container:GetID(), net.ReadString(), net.ReadInt( 16 ), net.ReadInt( 16 ) )
			window:Center()
			window:MakePopup()

			local x, y = window:GetPos()

			local dimensions = LocalPlayer():GetInventoryDimensions()

			if ( net.ReadBit() ~= 1 ) then
				local inv = itemstore.containers.Open( LocalPlayer().InventoryID, "Inventory", dimensions[ 1 ], dimensions[ 2 ] )
				inv:SetPos( ScrW() / 2 - inv:GetWide() / 2, y + window:GetTall() + 25 )
				inv:ShowCloseButton( false )

				inv:MakePopup()

				window.OnClose = function( self )
					inv:Close()
				end
			end
		end
	end )

	net.Receive( "ItemStoreSyncContainer", function()
		local id = net.ReadInt( 32 )
		local container = itemstore.containers.Create( net.ReadInt( 32 ) )
		container.ID = id

		for k, v in pairs( net.ReadTable() ) do
			local item = itemstore.items.New( v.Class, v.Data )

			container:SetItem( item, k )
		end

		itemstore.containers.Active[ id ] = container

		for k, v in pairs( itemstore.containers.Panels ) do
			if ( IsValid( v ) ) then
				if ( v:GetContainerID() == id ) then
					v:Refresh()
				end
			else
				itemstore.containers.Panels[ k ] = nil
			end
		end
	end )
end
