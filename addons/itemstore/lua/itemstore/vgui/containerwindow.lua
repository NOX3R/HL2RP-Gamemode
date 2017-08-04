local PANEL = {}

function PANEL:Init()
	self.Container = vgui.Create( "ItemStoreContainer", self )
end

function PANEL:SetContainerID( containerid )
	self.Container:SetContainerID( containerid )
end

function PANEL:SetDimensions( columns, rows )
	self:SetSize( 10 + ( itemstore.config.SlotSize[ 1 ] + 1 ) * columns - 1, ( itemstore.config.SlotSize[ 2 ] + 1 ) * rows + 33 )
end

function PANEL:PerformLayout()
	self.BaseClass.PerformLayout( self )
	self.Container:Dock( FILL )
end

vgui.Register( "ItemStoreContainerWindow", PANEL, "ItemStoreWindow" )