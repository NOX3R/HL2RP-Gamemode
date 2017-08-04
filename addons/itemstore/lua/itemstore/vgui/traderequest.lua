local PANEL = {}

AccessorFunc( PANEL, "TradeID", "TradeID" )

function PANEL:Init()
	self.Label = vgui.Create( "DLabel", self )
	
	self.Accept = vgui.Create( "DButton", self )
	self.Deny = vgui.Create( "DButton", self )
end

function PANEL:PerformLayout()
	self.BaseClass.PerformLayout( self )
	
	self:SetTitle( "Trade request" )
	
	local pl = itemstore.trading.Active[ self:GetTradeID() ].Left.Player
	self.Label:SetText( pl:Name() .. " wants to trade!" )
	self.Label:SizeToContents()
	self.Label:SetPos( self:GetWide() / 2 - self.Label:GetWide() / 2, 30 )
	
	self.Accept:SetText( "Accept" )
	self.Accept:SetSize( 75, 30 )
	self.Accept:SetPos( self:GetWide() / 2 - self.Accept:GetWide() - 15, self:GetTall() / 2 + 10 )
	self.Accept.DoClick = function()
		itemstore.trading.Open( self:GetTradeID() )
		self:Remove()
	end
	
	self.Deny:SetText( "Deny" )
	self.Deny:SetSize( 75, 30 )
	self.Deny:SetPos( self:GetWide() / 2 + 15, self:GetTall() / 2 + 10 )
	self.Deny.DoClick = function()
		RunConsoleCommand( "itemstore_trading_close", self:GetTradeID() )
		self:Remove()
	end
end

vgui.Register( "ItemStoreTradeRequest", PANEL, "ItemStoreWindow" )