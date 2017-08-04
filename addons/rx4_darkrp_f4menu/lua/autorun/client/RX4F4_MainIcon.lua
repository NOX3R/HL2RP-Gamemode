local GraMat = Material("gui/gradient")

local PANEL = {}
function PANEL:Init()
	self:SetText(" ")
	self.Status = "idle"
	self.Text = " "
	self.Font = "RX4F4_25"
	self.TextCol = RX4F4_Colors.IconA.Text
	self.EventTime = nil
	self.HoverAnimTime = 0.3
	
	
	self.CreatedTime = CurTime()
	self.DeltaSec1 = 1
end

function PANEL:CursorEnter() end
function PANEL:CursorExit() end

function PANEL:OnCursorEntered()
	surface.PlaySound("buttons/lightswitch2.wav")
	self.EventTime = {Time=CurTime(),Mode="HoverPer"}
	self:CursorEnter()
end
function PANEL:OnCursorExited()
end
function PANEL:DoClick()
	surface.PlaySound("ui/buttonclick.wav")
	self.ClickTime = CurTime()
	self.EventTime = {Time=CurTime(),Mode="Click"}
	self:Click()
	return
end

function PANEL:SetTexts(name)
	self.Text = name
end

function PANEL:DrawHighlight()

end

function PANEL:PaintBackGround()
	-- override
end
function PANEL:PaintOverlay()
	-- override
end

function PANEL:Paint()
	local DeltaTime = CurTime() - self.CreatedTime
	
	surface.SetDrawColor(0,0,0,100)
	surface.DrawRect(0,0,self:GetWide(),self:GetTall())
	
	surface.SetMaterial(GraMat)
	surface.SetDrawColor(Color(RX4F4_Colors.MainColor.r,RX4F4_Colors.MainColor.g,RX4F4_Colors.MainColor.b,10))
	surface.DrawTexturedRectRotated(self:GetWide()/2,0,self:GetTall(),self:GetWide(),270)
	surface.DrawTexturedRectRotated(self:GetWide()/2,self:GetTall(),self:GetTall(),self:GetWide(),90)
	
	surface.SetDrawColor(20,20,20,100)
	surface.DrawRect(0,0,self:GetWide(),self:GetTall())
	
	if self:DrawHighlight() then
		self:RX4F4_DrawBoarderEdge(10,2,RX4F4_Colors.EdgeColor)
		surface.SetDrawColor(Color(RX4F4_Colors.HightLightColor.r,RX4F4_Colors.HightLightColor.g,RX4F4_Colors.HightLightColor.b,100))
	else
		surface.SetDrawColor(Color(RX4F4_Colors.MainColor.r,RX4F4_Colors.MainColor.g,RX4F4_Colors.MainColor.b,10))
	end
	
	surface.DrawRect(1,1,self:GetWide()-2,1)
	surface.DrawRect(1,self:GetTall()-2,self:GetWide()-2,1)
	surface.DrawRect(1,1,1,self:GetTall()-2)
	surface.DrawRect(self:GetWide()-2,1,1,self:GetTall()-2)
	
	draw.SimpleText(self.Text, self.Font, 20,self:GetTall()/2, self.TextCol, TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
		self:PaintOverlay()
end
function PANEL:Click()
	-- Override
end

vgui.Register("RX4F4_MainIcon",PANEL,"DButton")