
	local function CreateTitle(PANEL,Text)
		local TITLE = vgui.Create("DPanel") PANEL:AddItem(TITLE)
		TITLE:SetTall(40)
		TITLE.Paint = function(slf)
			draw.SimpleText(Text, "RX4F4_30", 10,5, Color(255,255,255,255))
		end
	end
	
	local function CreateButton(PANEL,Text,ClickFunc)
		local BTN = vgui.Create("MetroF4_CommandButton") PANEL:AddItem(BTN)
		BTN:SetTall(40)
		BTN:SetTexts(Text)
		BTN.DoClick = ClickFunc
	end
	
	local function CreateSpace(PANEL,tall)
		local Spacing = vgui.Create("DPanel") PANEL:AddItem(Spacing)
		Spacing:SetTall(tall or 20)
		Spacing.Paint = function(slf) end
	end

local function MakeDefaultOptions(Lister)	
	CreateTitle(Lister,"Gestion de l'Argent")
	
	CreateButton(Lister,"Donner de l'argent à quelqu'un",function()
		Derma_StringRequest("Montant ?", "Combien voulez-vous donner ?", "", function(a) LocalPlayer():ConCommand("darkrp give " .. tostring(a)) end)
	end)
	
	CreateButton(Lister,"Lâcher de l'argent par terre",function()
		Derma_StringRequest("Montant ?", "Combien voulez-vous lâcher ?", "", function(a) LocalPlayer():ConCommand("darkrp dropmoney " .. tostring(a)) end)
	end)
end


local ELEMENT = F4Element_CreateStruct("Commands")
ELEMENT:SetPrintName("Commandes")

function ELEMENT:OnCanvasCreated(Panel,SX,SY)
	local ListBG = vgui.Create("DPanel",Panel)
	ListBG:SetPos(50,50)
	ListBG:SetSize(350,SY-100)
	ListBG.Paint = function(slf)
		slf:RX4F4_DrawBoarder(1,Color(RX4F4_Colors.MainColor.r,RX4F4_Colors.MainColor.g,RX4F4_Colors.MainColor.b,10))
		slf:RX4F4_DrawBoarderEdge(10,2,RX4F4_Colors.EdgeColor)
	end
	
	local Lister = vgui.Create("DPanelList",ListBG) Panel.Lister = Lister
	Lister:SetPos(1,1)
	Lister:SetSize(ListBG:GetWide()-2,ListBG:GetTall()-2)
	Lister:EnableHorizontal( false )
	Lister:EnableVerticalScrollbar( true )
	Lister:RX4F4_PaintListBarC()
	
	MakeDefaultOptions(Lister)	
	
	
	local ListBG = vgui.Create("DPanel",Panel)
	ListBG:SetPos(450,50)
	ListBG:SetSize(SX-500,SY-100)
	ListBG.Paint = function(slf)
		slf:RX4F4_DrawBoarder(1,Color(RX4F4_Colors.MainColor.r,RX4F4_Colors.MainColor.g,RX4F4_Colors.MainColor.b,10))
		slf:RX4F4_DrawBoarderEdge(10,2,RX4F4_Colors.EdgeColor)
	end
	
	local Lister = vgui.Create("DPanelList",ListBG) Panel.Lister = Lister
	Lister:SetPos(1,1)
	Lister:SetSize(ListBG:GetWide()-2,ListBG:GetTall()-2)
	Lister:EnableHorizontal( false )
	Lister:EnableVerticalScrollbar( true )
	Lister:RX4F4_PaintListBarC()
end

F4Element_Register(ELEMENT)