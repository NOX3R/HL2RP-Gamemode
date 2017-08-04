local PANEL = {}
PANEL.Gradient = Material( "gui/gradient_down" )

function PANEL:Init()
end

function PANEL:Paint()
	local x, y, w, h = 0, 0, self:GetWide(), self:GetTall()
	
	surface.SetDrawColor( itemstore.config.Colours.Lower )
	surface.DrawRect( x, y, w, h )
	
	surface.SetMaterial( self.Gradient )
	surface.SetDrawColor( itemstore.config.Colours.Upper )
	surface.DrawTexturedRect( x, y, w, h )
	
	surface.SetDrawColor( itemstore.config.Colours.OuterBorder )
	surface.DrawOutlinedRect( x, y, w, h )
	
	surface.SetDrawColor( itemstore.config.Colours.InnerBorder )
	surface.DrawOutlinedRect( x + 1, y + 1, w - 2, h - 2 )
	
	surface.SetDrawColor( itemstore.config.Colours.TitleBackground )
	surface.DrawRect( x + 2, y + 2, w - 4 , 22 )
end

function PANEL:PerformLayout()
	vgui.GetControlTable( "DFrame" ).PerformLayout( self )
	self.lblTitle:SetColor( itemstore.config.Colours.Title )
end

vgui.Register( "ItemStoreWindow", PANEL, "DFrame" )