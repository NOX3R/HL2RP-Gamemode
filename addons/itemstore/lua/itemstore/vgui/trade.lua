local PANEL = {}

AccessorFunc( PANEL, "TradeID", "TradeID" )

function PANEL:Init()
	self.LeftContainer = vgui.Create( "ItemStoreContainer", self )
	self.RightContainer = vgui.Create( "ItemStoreContainer", self )
	
	self.LeftMoneyIcon = vgui.Create( "DImage", self )
	self.LeftMoneyIcon:SetImage( "icon16/money.png" )
	
	self.RightMoneyIcon = vgui.Create( "DImage", self )
	self.RightMoneyIcon:SetImage( "icon16/money.png" )
	
	self.LeftMoney = vgui.Create( "DTextEntry", self )
	self.LeftMoney.OnLoseFocus = function( money )
		local amount = tonumber( money:GetValue() )
		
		if ( amount ) then
			RunConsoleCommand( "itemstore_trading_setmoney", amount )
		end
	end
	
	self.RightMoney = vgui.Create( "DLabel", self )
	self.RightMoney:SetText( "0" )
	
	self.LeftReady = vgui.Create( "DCheckBoxLabel", self )
	self.LeftReady:SetText( "Ready?" )
	self.LeftReady.OnChange = function( ready )
		RunConsoleCommand( "itemstore_trading_setready", ready:GetChecked() and 1 or 0 )
	end
	
	self.RightReady = vgui.Create( "DLabel", self )
	self.RightReady:SetText( "Not ready" )
	
	self.Accept = vgui.Create( "DButton", self )
	self.Accept:SetText( "Accept!" )
	self.Accept:SetFont( "DermaLarge" )
	self.Accept:SetDisabled( true )
	self.Accept.DoClick = function()
		surface.PlaySound( "buttons/button9.wav" )
		
		RunConsoleCommand( "itemstore_trading_accept" )
		self:Remove()
	end
	
	self.Chat = vgui.Create( "RichText", self )
	function self.Chat:Paint()
		draw.RoundedBox( 4, 0, 0, self:GetWide(), self:GetTall(), Color( 230, 230, 230 ) )
	end
	
	self.ChatEntry = vgui.Create( "DTextEntry", self )
	
	function self.ChatEntry:OnEnter()
		RunConsoleCommand( "itemstore_trading_say", self:GetText() )
		self:SetText( "" )
		self:RequestFocus()
	end
	
	table.insert( itemstore.trading.Panels, self )
end

function PANEL:SetTradeID( id )
	self.TradeID = id
	self:Refresh()
end

function PANEL:ChatMessage( pl, message )
	if ( pl == LocalPlayer() ) then
		self.Chat:InsertColorChange( 255, 0, 0, 255 )
	else
		self.Chat:InsertColorChange( 0, 0, 255, 255 )
	end
	
	self.Chat:AppendText( pl:Name() )
	self.Chat:InsertColorChange( 100, 100, 100, 255 )
	self.Chat:AppendText( ": " .. message .. "\n" )
end

function PANEL:Refresh()
	local trade = itemstore.trading.Active[ self:GetTradeID() ]
	
	if ( trade ) then
		local ourside = trade.Left
		local otherside = trade.Right
		if ( LocalPlayer() == trade.Right.Player ) then
			ourside = trade.Right
			otherside = trade.Left
		end
		
		self:SetTitle( "Trading with " .. otherside.Player:Name() )
		
		self.LeftContainer:SetContainerID( ourside.Container:GetID() )
		self.RightContainer:SetContainerID( otherside.Container:GetID() )
		
		self.LeftMoney:SetText( ourside.Money )
		self.RightMoney:SetText( otherside.Money )
		
		self.LeftReady:SetChecked( ourside.Ready )
		self.RightReady:SetText( otherside.Ready and "Ready" or "Not ready" )
		
		self.Accept:SetDisabled( not ( ourside.Ready and otherside.Ready ) )
	end
end

function PANEL:PerformLayout()
	self.BaseClass.PerformLayout( self )
	
	self:SetSize( 600, 280 )
	
	self.LeftContainer:SetPos( 5, 33 )
	self.LeftContainer:SetSize( 183, 91 )
	
	self.RightContainer:SetPos( 5 + 183 + 24, 33 )
	self.RightContainer:SetSize( 183, 91 )
	
	self.LeftMoneyIcon:SetPos( 5, 33 + 150 )
	self.LeftMoneyIcon:SetSize( 16, 16 )
	
	self.LeftMoney:SetPos( 5 + 16 + 5, 33 + 150 )
	self.LeftMoney:SetSize( 183 - 5 - 16 - 5, 16 )

	self.RightMoneyIcon:SetPos( 5 + 183 + 24, 33 + 150 )
	self.RightMoneyIcon:SetSize( 16, 16 )
	
	self.RightMoney:SetPos( 5 + 183 + 24 + 5 + 16 + 5, 33 + 150 )
	self.RightMoney:SetSize( 183 - 5 - 16 - 5, 16 )
	
	self.LeftReady:SetPos( 5, 33 + 150 + 16 + 5 )
	self.LeftReady:SizeToContents()
	
	self.RightReady:SetPos( 5 + 183 + 24, 33 + 150 + 16 + 5 )
	
	self.RightReady:SizeToContents()
	
	self.Accept:SetPos( 5, 33 + 150 + ( 16 + 5 ) * 2 )
	self.Accept:SetSize( 390, 50 )
	
	self.Chat:SetPos( 400, 27 )
	self.Chat:SetSize( 195, 220 )
	
	self.ChatEntry:SetPos( 400, 250 )
	self.ChatEntry:SetSize( 195, 25 )
end

function PANEL:Remove()
	if ( self:GetTradeID() ) then
		RunConsoleCommand( "itemstore_trading_close", self:GetTradeID() )
	end
	
	self:OnClose()
	
	self.BaseClass.Remove( self )
end

vgui.Register( "ItemStoreTrade", PANEL, "ItemStoreWindow" )