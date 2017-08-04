itemstore.trading = {}
itemstore.trading.Active = {}

local Trade = {}

function Trade:GetSide( pl )
	if ( self.Right.Player == pl ) then
		return self.Right
	elseif ( self.Left.Player == pl ) then
		return self.Left
	end
end

function Trade:SetMoneyOffer( pl, offer )
	local side = self:GetSide( pl )

	if ( side ) then
		side.Money = math.Clamp( offer, 0, itemstore.gamemodes.GetMoney( pl ) )
		self:Sync()
	end
end

function Trade:GetMoneyOffer( pl )
	local side = self:GetSide( pl )

	if ( side ) then
		return side.Money
	end
end

function Trade:SetReady( pl, ready )
	local side = self:GetSide( pl )

	if ( side ) then
		side.Ready = ready
		self:Sync()
	end
end

function Trade:GetReady( pl )
	local side = self:GetSide( pl )

	if ( side ) then
		return side.Ready
	end
end

function Trade:IsConfirmed()
	return self.Left.Ready and self.Right.Ready
end

function Trade:GetID()
	return self.ID
end

function Trade:Sync()
	if SERVER then
		itemstore.trading.Sync( self )
	end
end

function Trade:Close()
	if SERVER then
		if ( IsValid( self.Left.Player ) ) then
			for k, v in pairs( self.Left.Container.Items ) do
				self.Left.Player:AddItem( v )
			end
		end

		if ( IsValid( self.Right.Player ) ) then
			for k, v in pairs( self.Right.Container.Items ) do
				self.Right.Player:AddItem( v )
			end
		end
	end

	itemstore.trading.Remove( self:GetID() )
end

function Trade:Accept()
	if ( IsValid( self.Left.Player ) and IsValid( self.Right.Player ) ) then
		local leftmoney = self.Left.Player:getDarkRPVar( "money" )
		local rightmoney = self.Right.Player:getDarkRPVar( "money" )

		if ( leftmoney >= self.Left.Money and rightmoney >= self.Right.Money ) then
			for k, v in pairs( self.Left.Container.Items ) do
				self.Left.Container:SetItem( nil, k )
				self.Right.Player:AddItem( v )
			end

			for k, v in pairs( self.Right.Container.Items ) do
				self.Right.Container:SetItem( nil, k )
				self.Left.Player:AddItem( v )
			end

			itemstore.gamemodes.GiveMoney( self.Left.Player, -self.Left.Money )
			itemstore.gamemodes.GiveMoney( self.Left.Player, self.Right.Money )

			itemstore.gamemodes.GiveMoney( self.Right.Player, self.Left.Money )
			itemstore.gamemodes.GiveMoney( self.Right.Player, -self.Right.Money )
		else
			self.Left.Player:ChatPrint( "Trade failed. Did you offer more money than you had?" )
			self.Right.Player:ChatPrint( "Trade failed. Did you offer more money than you had?" )
		end
	end

	self:Close()
end

function itemstore.trading.Create( left, right, leftcon, rightcon )
	local trade = {
		Left = {
			Player = left,
			Money = 0,
			Container = leftcon,
			Ready = false
		},
		Right = {
			Player = right,
			Money = 0,
			Container = rightcon,
			Ready = false
		}
	}

	setmetatable( trade, { __index = Trade } )

	return trade
end

if SERVER then util.AddNetworkString( "ItemStoreTradeClose" ) end
function itemstore.trading.Remove( id )
	local trade = itemstore.trading.Active[ id ]

	if SERVER then
		net.Start( "ItemStoreTradeClose" )
			net.WriteInt( trade:GetID(), 32 )
		net.Send( { trade.Left.Player, trade.Right.Player } )
	end

	trade.Left.Container:Remove()
	trade.Right.Container:Remove()

	itemstore.trading.Active[ id ] = nil
end

function itemstore.trading.GetPlayerTrade( pl )
	for _, trade in ipairs( itemstore.trading.Active ) do
		if ( trade:GetSide( pl ) ) then
			return trade
		end
	end
end

if SERVER then
	CreateConVar( "itemstore_trading", 1, FCVAR_ARCHIVE )
	CreateConVar( "itemstore_trading_distance", 0, FCVAR_ARCHIVE )
	CreateConVar( "itemstore_trading_cooldown", 60, FCVAR_ARCHIVE )

	function itemstore.trading.New( left, right )
		local leftcon = itemstore.containers.New( 12 )
		leftcon:SetPlayerPermissions( left, true, true )
		leftcon:SetPlayerPermissions( right, true, false )

		local rightcon = itemstore.containers.New( 12 )
		rightcon:SetPlayerPermissions( right, true, true )
		rightcon:SetPlayerPermissions( left, true, false )

		local trade = itemstore.trading.Create( left, right, leftcon, rightcon )
		trade.ID = #itemstore.trading.Active + 1
		table.insert( itemstore.trading.Active, trade )

		trade:Sync()

		return trade
	end

	util.AddNetworkString( "ItemStoreTrade" )
	function itemstore.trading.Sync( trade )
		net.Start( "ItemStoreTrade" )
			net.WriteInt( trade:GetID(), 32 )

			net.WriteEntity( trade.Left.Player )
			net.WriteInt( trade.Left.Money, 32 )
			net.WriteInt( trade.Left.Container:GetID(), 32 )
			net.WriteBit( trade.Left.Ready )

			net.WriteEntity( trade.Right.Player )
			net.WriteInt( trade.Right.Money, 32 )
			net.WriteInt( trade.Right.Container:GetID(), 32 )
			net.WriteBit( trade.Right.Ready )
		net.Send( { trade.Left.Player, trade.Right.Player } )
	end

	function itemstore.trading.Start( pl, partner )
		if ( GetConVarNumber( "itemstore_trading" ) == 1 and IsValid( partner ) and partner ~= pl ) then
			if ( not itemstore.trading.GetPlayerTrade( pl ) ) then
				if ( not itemstore.trading.GetPlayerTrade( partner ) ) then
					if ( not pl.TradeCooldown or pl.TradeCooldown < CurTime() ) then
						local distance = GetConVarNumber( "itemstore_trading_distance" )
						if ( distance == 0 or pl:GetPos():Distance( partner:GetPos() ) < distance ) then
							itemstore.trading.New( pl, partner )
							pl.TradeCooldown = CurTime() + GetConVarNumber( "itemstore_trading_cooldown" )
						else
							pl:ChatPrint( "That player is too far away." )
						end
					else
						pl:ChatPrint( "You must wait a while before you can trade again!" )
					end
				else
					pl:ChatPrint( "That player is currently in another trade!" )
				end
			end
		else
			pl:ChatPrint( "You're already in a trade!" )
		end
	end

	--[[concommand.Add( "itemstore_trading_start", function( pl, cmd, args )
		itemstore.trading.Start( pl, Entity( tonumber( args[ 1 ] or "0" ) or 0 )
	end )]]

	concommand.Add( "itemstore_trading_setready", function( pl, cmd, args )
		local trade = itemstore.trading.GetPlayerTrade( pl )
		local ready = tonumber( args[ 1 ] ) == 1

		if ( trade and ready ~= nil ) then
			trade:SetReady( pl, ready )
		end
	end )

	concommand.Add( "itemstore_trading_setmoney", function( pl, cmd, args )
		local trade = itemstore.trading.GetPlayerTrade( pl )
		local money = tonumber( args[ 1 ] )

		if ( trade and money ) then
			trade:SetMoneyOffer( pl, money )
		end
	end )

	concommand.Add( "itemstore_trading_accept", function( pl, cmd, args )
		local trade = itemstore.trading.GetPlayerTrade( pl )

		if ( trade and trade:IsConfirmed() ) then
			trade:Accept()
		end
	end )

	concommand.Add( "itemstore_trading_close", function( pl, cmd, args )
		local trade = itemstore.trading.GetPlayerTrade( pl )

		if ( trade ) then
			trade:Close()
		end
	end )

	util.AddNetworkString( "ItemStoreTradingChat" )
	concommand.Add( "itemstore_trading_say", function( pl, cmd, args )
		local trade = itemstore.trading.GetPlayerTrade( pl )

		if ( trade ) then
			net.Start( "ItemStoreTradingChat" )
				net.WriteEntity( pl )
				net.WriteString( args[ 1 ] )
			net.Send( { trade.Right.Player, trade.Left.Player } )
		end
	end )
else
	itemstore.trading.Panels = {}

	function itemstore.trading.Open( id )
		local window = vgui.Create( "ItemStoreTrade" )
		window:SetTradeID( id )
		window:Center()

		local x, y = window:GetPos()

		local dimensions = LocalPlayer():GetInventoryDimensions()
		local inv = itemstore.containers.Open( LocalPlayer().InventoryID, "Inventory", dimensions[ 1 ], dimensions[ 2 ] )
		inv:SetPos( ScrW() / 2 - inv:GetWide() / 2, y + window:GetTall() + 25 )
		inv:ShowCloseButton( false )

		inv:MakePopup()
		window:MakePopup()

		window.OnClose = function( self )
			inv:Close()
		end

		return window
	end

	function itemstore.trading.OpenRequest( id )
		local request = vgui.Create( "ItemStoreTradeRequest" )
		request:SetTradeID( id )
		request:SetSize( 250, 100 )
		request:SetPos( ScrW() - request:GetWide(), ScrH() - request:GetTall() )
		request:ShowCloseButton( false )
		request:SetDraggable( false )
		--request:MakePopup()

		surface.PlaySound( "buttons/bell1.wav" )
	end

	net.Receive( "ItemStoreTradeClose", function()
		local id = net.ReadInt( 32 )

		if ( itemstore.trading.Active[ id ] ) then
			itemstore.trading.Active[ id ]:Close()
		end

		for k, v in pairs( itemstore.trading.Panels ) do
			if ( IsValid( v ) ) then
				if ( v:GetTradeID() == id ) then
					v:Remove()
				end
			else
				itemstore.trading.Panels[ k ] = nil
			end
		end
	end )

	net.Receive( "ItemStoreTrade", function()
		local id = net.ReadInt( 32 )

		local left = {
			pl = net.ReadEntity(),
			money = net.ReadInt( 32 ),
			cont = net.ReadInt( 32 ),
			ready = net.ReadBit() == 1
		}

		local right = {
			pl = net.ReadEntity(),
			money = net.ReadInt( 32 ),
			cont = net.ReadInt( 32 ),
			ready = net.ReadBit() == 1
		}

		local trade = itemstore.trading.Create( left.pl, right.pl, itemstore.containers.Get( left.cont ), itemstore.containers.Get( right.cont ) )
		trade.ID = id

		trade:SetMoneyOffer( left.pl, left.money )
		trade:SetReady( left.pl, left.ready )

		trade:SetMoneyOffer( right.pl, right.money )
		trade:SetReady( right.pl, right.ready )

		itemstore.trading.Active[ id ] = trade

		local found = false
		for k, v in pairs( itemstore.trading.Panels ) do
			if ( IsValid( v ) ) then
				if ( v:GetTradeID() == id ) then
					v:Refresh()
					found = true
				end
			else
				itemstore.trading.Panels[ k ] = nil
			end
		end

		if ( not found ) then
			if ( left.pl == LocalPlayer() and IsValid( right.pl ) ) then
				itemstore.trading.Open( id )
			else
				itemstore.trading.OpenRequest( id )
			end
		end
	end )

	net.Receive( "ItemStoreTradingChat", function()
		for k, v in pairs( itemstore.trading.Panels ) do
			if ( IsValid( v ) ) then
				v:ChatMessage( net.ReadEntity(), net.ReadString() )
			else
				itemstore.trading.Panels[ k ] = nil
			end
		end
	end )
end
