local PANEL = {}

function PANEL:Init()
	self.List = vgui.Create( "DListView", self )

	self.List:AddColumn( "Player" )
end

function PANEL:PerformLayout()
	self.BaseClass.PerformLayout( self )

	self:SetTitle( "ItemStore Admin" )
	self:SetSize( 200, 300 )

	self.List:Clear()
	self.List:Dock( FILL )
	for _, pl in ipairs( player.GetAll() ) do
		self.List:AddLine( pl:Name() ).EntIndex = pl:EntIndex()
	end

	function self.List:OnRowSelected( lineid, line )
		local menu = DermaMenu()
		menu:AddOption( "Inventory", function() RunConsoleCommand( "itemstore_admin_open", line.EntIndex ) end )
		menu:AddOption( "Bank", function() RunConsoleCommand( "itemstore_admin_open_bank", line.EntIndex ) end )
		menu:Open()
	end
end

vgui.Register( "ItemStoreAdmin", PANEL, "ItemStoreWindow" )
