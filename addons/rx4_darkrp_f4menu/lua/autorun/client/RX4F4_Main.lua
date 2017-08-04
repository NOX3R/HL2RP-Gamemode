function ChangeJobVGUI()
	if !F4Menu or !F4Menu:IsValid() then
		local GRID = 50
		
		local XSize,YSize = ScrW()*RX4F4_Configs.Main_Size_X, ScrH()*RX4F4_Configs.Main_Size_Y
		XSize = math.ceil(XSize/GRID)*GRID
		YSize = math.ceil(YSize/GRID)*GRID
		
		F4Menu = vgui.Create("RX4F4_Main")
		F4Menu.GRID = GRID
		F4Menu:SetSize(XSize,YSize)
		F4Menu.GRID_x = math.ceil(F4Menu:GetWide()/F4Menu.GRID)
		F4Menu.GRID_y = math.ceil(F4Menu:GetTall()/F4Menu.GRID)
		F4Menu:Center()
		F4Menu:Install()
	
		F4Menu:MakePopup()
	else
		F4Menu:Remove()
	end
end

local GraMat = Material("gui/gradient")

// =============================================== Inventory Main ==============================================================================================
local PANEL = {}

function PANEL:Init()
	self.CreatedTime = CurTime()
	self:SetTitle(" ")
	self:ShowCloseButton(false)
	self:SetDraggable(false)
	
end

function PANEL:PaintGRID()
	surface.SetDrawColor(RX4F4_Colors.GRID)
	local X,Y = self.GRID_x,self.GRID_y
	for k = 1,Y do
		surface.DrawRect(0,self.GRID*k,self:GetWide(),1)
	end
	for k = 1,X do
		surface.DrawRect(self.GRID*k,0,1,self:GetTall())
	end
	
	surface.SetDrawColor(RX4F4_Colors.GRIDBox)
	for a = 0,X do
		for k = 0,Y do
			surface.DrawRect(self.GRID*a -1,self.GRID*k -1,3,3)
		end
	end
end

function PANEL:Paint()
	local DeltaTime = CurTime() - self.CreatedTime
	self:SetAlpha(math.min(1,DeltaTime*2)*255)
	Derma_DrawBackgroundBlur( self, self.CreatedTime +1 )

	surface.SetDrawColor(RX4F4_Colors.BackGround)
	surface.DrawRect(0,0,self:GetWide(),self:GetTall())
	
	self:PaintGRID()

	
	if input.IsKeyDown(95) then
		if self.ReadyToClose then
			self:Remove()
			return
		end
	else
		if CurTime() - self.CreatedTime > 0.2 then
			self.ReadyToClose = true
		end
	end
end

function PANEL:InstallTopBar()
	self.TopBar = vgui.Create("DPanel",self)
	self.TopBar:SetPos(0,0)
	self.TopBar:SetSize(self:GetWide(),50)
	self.TopBar.Paint = function(slf)
		surface.SetDrawColor(RX4F4_Colors.Title)
		surface.DrawRect(0,0,slf:GetWide(),slf:GetTall())
	
		surface.SetDrawColor( 0, 0, 0, 40 )
		draw.NoTexture()
		
		for k=1,slf:GetWide()/15 do
			local PX,SX = k*20 , 8
			surface.DrawPoly( {
				{ x = PX, y = 0 },
				{ x = PX+SX, y = 0 },
				{ x = PX-50, y = slf:GetTall() },
				{ x = PX-50-SX, y = slf:GetTall() }
			} )
		end
		
		draw.SimpleText(RX4F4_Configs.MainTitleText, "RX4F4_40", 30,slf:GetTall()/2,Color(255,255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
	
		
	end
end

function PANEL:HideMain()
	if self.MainLister and self.MainLister:IsValid() then
		self.MainLister:Remove()
		self.MainLister = nil
	end
end
--
function PANEL:BuildCanvas()
	if self.Canvas and self.Canvas:IsValid() then
		self.Canvas:Remove()
	end
	
	self.Canvas = vgui.Create("DPanel",self)
	self.Canvas:SetPos(350,100)
	self.Canvas:SetSize(self:GetWide()-400,self:GetTall()-150)
	self.Canvas.PaintOverlay = function(slf) end
	
	self.Canvas.Paint = function(slf)
		surface.SetDrawColor(0,0,0,150)
		surface.DrawRect(0,0,slf:GetWide(),slf:GetTall())
		slf:RX4F4_DrawBoarder(1,Color(RX4F4_Colors.MainColor.r,RX4F4_Colors.MainColor.g,RX4F4_Colors.MainColor.b,10))
		slf:RX4F4_DrawBoarderEdge(10,2,RX4F4_Colors.EdgeColor)
		slf:PaintOverlay()
	end
	return self.Canvas
end

function PANEL:BuildLeft()
	self:HideMain()
	
	self.LeftLister = vgui.Create("DPanelList",self)
	self.LeftLister:SetPos(50,100)
	self.LeftLister:SetSize(250,self:GetTall()-100)
	self.LeftLister:EnableHorizontal( false )
	self.LeftLister:EnableVerticalScrollbar( true )
	self.LeftLister:SetSpacing(0)
	
	local XAmount = 5
	
	for k,v in pairs(F4_Elements) do
		local SButton = vgui.Create( "RX4F4_MainIcon" )
			SButton:SetSize( self.LeftLister:GetWide() , 50 )
			SButton.Text = v.PrintName
			SButton.Click = function(slf)
				self.SelectedMenu = k
				local Canvas = self:BuildCanvas()
				v:OnCanvasCreated(Canvas,Canvas:GetWide(),Canvas:GetTall())
			end
			SButton.DrawHighlight = function(slf)
				if self.SelectedMenu == k then return true end
				if slf:IsHovered() then
					return true
				end
			end
			
			if !self.FS then
				self.FS = true
				SButton:Click()
			end
		self.LeftLister:AddItem(SButton)
	end
	
end

function PANEL:Install()
	self:InstallTopBar()
	self:BuildLeft()
end

function PANEL:UpdateMenu(ModeName,ExecuteD)
	self.Menus = ModeName
	self:HideMain()
	if self.MenuPanel and self.MenuPanel:IsValid() then
		self.MenuPanel:RX2F4_PanelAnim_Remove_Fade({Delay=0,Speed=0.5,Smooth=2,Fade=1})
	end
	local P = ExecuteD(self)
		P:SetPos(40,self:GetTall()/10 + 90 )
		P:SetSize(self:GetWide()-80,self:GetTall()/10*9 - 220)
		P:Install(true)
		P.ModeName = ModeName
		P:RX2F4_PanelAnim_Appear_FlyIn({Delay=0,Dir="FromLeft",Speed=0.7,Smooth=30,Fade=3000})
		P.OldPaint = P.Paint
		P.Paint = function(slf)
			slf.OldPaint(slf)
			surface.SetDrawColor( 0,0,0,100 )
			surface.DrawRect( 0, 0, slf:GetWide(), slf:GetTall() )
		end
	self.MenuPanel = P
	self.Title = ModeName
	
	if self.BackButton and self.BackButton:IsValid() then
		self.BackButton:RX2F4_PanelAnim_Remove_Fade({Delay=0,Speed=0.5,Smooth=2,Fade=1})
	end
	
	self.BackButton = vgui.Create("DButton",self)
	self.BackButton:SetPos(40,self:GetTall()/10*9-48)
	self.BackButton:SetSize(200,40)
	self.BackButton:SetText("")
	self.BackButton.Paint = function(slf)
		draw.SimpleText("<", "RXF2_TrebLWOut_S70", 5,slf:GetTall()/2, Color(255,255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
		draw.SimpleText("Retour", "RXF2_TrebLWOut_S30", 50,slf:GetTall()/2, Color(255,255,255,255),TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
	end
	self.BackButton.DoClick = function(slf)
		self:BuildMain()
	end
end

vgui.Register("RX4F4_Main",PANEL,"DFrame")


timer.Simple(0.7,function() -- Override --
GAMEMODE.ShowSpare2 = ChangeJobVGUI
end)
