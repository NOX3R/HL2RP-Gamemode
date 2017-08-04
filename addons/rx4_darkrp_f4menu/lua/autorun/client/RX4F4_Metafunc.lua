local meta = FindMetaTable("Panel")
function meta:RX4F4_DrawBoarder(width,col)
	width = width or 1
	col = col or Color(255,255,255,255)
	
	surface.SetDrawColor( col )
	surface.DrawRect( 0, 0, self:GetWide(), width )
	surface.DrawRect( 0, self:GetTall()-width, self:GetWide(), width )
	surface.DrawRect( 0, 0, width, self:GetTall() )
	surface.DrawRect( self:GetWide()-width, 0, width, self:GetTall() )
end
	
	
function meta:RX4F4_DrawBoarderEdge(width,thick,col)
	width = width or 10
	thick = thick or 1
	col = col or Color(0,255,255,255)
	
	surface.SetDrawColor( col )
	
	local Wide = self:GetWide()
	local Tall = self:GetTall()
	
	-- 11
	surface.DrawRect( 0, 0, width, thick )
	surface.DrawRect( 0, 0, thick, width )
	
	-- 1
	surface.DrawRect( Wide-width, 0, width, thick )
	surface.DrawRect( Wide-thick, 0, thick, width )
	
	-- 5
	surface.DrawRect( Wide-width, Tall-thick, width, thick )
	surface.DrawRect( Wide-thick, Tall-width, thick, width )
	
	-- 7
	surface.DrawRect( 0, Tall-thick, width, thick )
	surface.DrawRect( 0, Tall-width, thick, width )
end
	
function meta:RX4F4_PaintListBarC(bCol,iCol)
	local bCol = bCol or Color(255,255,255,255)
	local iCol = iCol or Color(0,200,255,20)
	
	self.VBar.btnDown.Paint = function(selfk)
	end
	self.VBar.btnUp.Paint = function(selfk)
	end
	self.VBar.btnGrip.Paint = function(selfk)
		surface.SetDrawColor( iCol.r,iCol.g,iCol.b,iCol.a )
		surface.DrawRect( selfk:GetWide()/3*2, 0, selfk:GetWide()/3, selfk:GetTall() )
	end
	self.VBar.Paint = function(selfk)
	end
end
