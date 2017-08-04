local function UpdateList() end

	local Menus = {} -- N is Printname. Do not touch M
		table.insert(Menus,{M="shipment",N="Caisses"})
		table.insert(Menus,{M="entity",N="Entités"})
		table.insert(Menus,{M="foods",N="Nourritures"})

local ELEMENT = F4Element_CreateStruct("Boutique")
ELEMENT:SetPrintName("Boutique")

function ELEMENT:OnCanvasCreated(Panel,SX,SY)
	Panel.Founded = 0
	Panel.VIPMode = false
	
	Panel.PaintOverlay = function(slf)
		draw.SimpleText(slf.Founded .. " Item(s) trouvé(s)", "RX4F4_20", slf:GetWide()-75,slf:GetTall()-25,Color(255,255,255,255),TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER)
	end

	local TopFilterBG = vgui.Create("DPanel",Panel)
	TopFilterBG:SetPos(50,50)
	TopFilterBG:SetSize(SX-100,50)
	TopFilterBG.Paint = function(slf)
		slf:RX4F4_DrawBoarder(1,Color(RX4F4_Colors.MainColor.r,RX4F4_Colors.MainColor.g,RX4F4_Colors.MainColor.b,10))
		slf:RX4F4_DrawBoarderEdge(10,2,RX4F4_Colors.EdgeColor)
	end
	
	local VIPMode = vgui.Create("DCheckBoxLabel",TopFilterBG)
	VIPMode:SetPos(30,17)
	VIPMode:SetText("Seulement voir les entités VIP")
	VIPMode:SizeToContents()
	VIPMode.OnChange = function(slf,b)
		Panel.VIPMode = b
		if Panel.SelectedMenu then
			Panel.SelectedMenu:DoClick()
		end
	end
	
	local FilterBG = vgui.Create("DPanel",Panel)
	FilterBG:SetPos(50,150)
	FilterBG:SetSize(150,SY-200)
	FilterBG.Paint = function(slf)
		slf:RX4F4_DrawBoarder(1,Color(RX4F4_Colors.MainColor.r,RX4F4_Colors.MainColor.g,RX4F4_Colors.MainColor.b,10))
		slf:RX4F4_DrawBoarderEdge(10,2,RX4F4_Colors.EdgeColor)
	end
	
	local FilterLister = vgui.Create("DPanelList",FilterBG)
	FilterLister:SetPos(1,1)
	FilterLister:SetSize(FilterBG:GetWide()-2,FilterBG:GetTall()-2)
	FilterLister:EnableHorizontal( false )
	FilterLister:EnableVerticalScrollbar( true )
	FilterLister:RX4F4_PaintListBarC()
	
	local ListBG = vgui.Create("DPanel",Panel)
	ListBG:SetPos(250,150)
	ListBG:SetSize(SX-300,SY-200)
	ListBG.Paint = function(slf)
		slf:RX4F4_DrawBoarder(1,Color(RX4F4_Colors.MainColor.r,RX4F4_Colors.MainColor.g,RX4F4_Colors.MainColor.b,10))
		slf:RX4F4_DrawBoarderEdge(10,2,RX4F4_Colors.EdgeColor)
	end
	
	local Lister = vgui.Create("DPanelList",ListBG)
	Lister:SetPos(1,1)
	Lister:SetSize(ListBG:GetWide()-2,ListBG:GetTall()-2)
	Lister:EnableHorizontal( false )
	Lister:EnableVerticalScrollbar( true )
	Lister:RX4F4_PaintListBarC()
	
	function Lister:AddItem2Sell(Model,PrintName,Price,ClickFunc)
		Panel.Founded = Panel.Founded + 1
		local Currency = GAMEMODE.Config.currency or "$"
			
		local Button = vgui.Create("DButton")
		Button:SetSize(self:GetWide()-20,50)
		Button:SetText("")
		
		if Model then
			local icon = vgui.Create("ModelImage",Button)
			icon:SetSize(46,46)
			icon:SetPos(2,2)
			icon:SetModel(Model)
		end
		Button.Paint = function(slf)
			draw.SimpleText(PrintName, "RX4F4_25", 70,slf:GetTall()/2,RX4F4_Colors.MainTextColor,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
			
			if Price > (LocalPlayer().DarkRPVars.money or 0) then
				draw.SimpleText(Currency .. Price, "RX4F4_25", slf:GetWide()-20,slf:GetTall()/2,Color(255,0,0,255),TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER)
			else
				draw.SimpleText(Currency .. Price, "RX4F4_25", slf:GetWide()-20,slf:GetTall()/2,RX4F4_Colors.MainTextColor,TEXT_ALIGN_RIGHT,TEXT_ALIGN_CENTER)
			end
			
			if slf:IsHovered() then
				slf:RX4F4_DrawBoarder(1,RX4F4_Colors.HoverBoarder)
				slf:RX4F4_DrawBoarderEdge(10,2,RX4F4_Colors.HoverBoarderEdge)
			end
		end
		Button.DoClick = function(slf)
			ClickFunc()
		end
		
		self:AddItem(Button)
	end
	
	for k,v in pairs(Menus) do
		local MenuB = vgui.Create("DButton")
		MenuB:SetTall(50)
		MenuB.Paint = function(slf)
			if Panel.Selected == v.M then
				draw.SimpleText(v.N, "RX4F4_25", 20,slf:GetTall()/2,RX4F4_Colors.MainTextHightlightColor,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
			else
				draw.SimpleText(v.N, "RX4F4_25", 20,slf:GetTall()/2,RX4F4_Colors.MainTextColor,TEXT_ALIGN_LEFT,TEXT_ALIGN_CENTER)
			end
		end
		MenuB.DoClick = function(slf)
			Panel.Founded = 0
			Panel.Selected = v.M
			Panel.SelectedMenu = MenuB
			UpdateList(Lister,v.M,Panel.VIPMode)
		end
		MenuB:SetText("")
		FilterLister:AddItem(MenuB)
		
		if !Panel.FS then
			Panel.FS = true
			MenuB:DoClick()
		end
	end
	
end

F4Element_Register(ELEMENT)





//=========================

function UpdateList(List,filter,VIPMode)
	filter = filter or "ammo"
	List:Clear()
	
	---- Ammo ----
	if filter == "ammo" then
		for k,v in pairs(GAMEMODE.AmmoTypes) do
			if !VIPMode and v.VIPOnly then 
				continue 
			end
			if VIPMode and !v.VIPOnly then 
				continue 
			end
			if not v.customCheck or v.customCheck(LocalPlayer()) then
				List:AddItem2Sell(v.model,v.name,v.price,function()
					RunConsoleCommand("DarkRP","buyammo",v.ammoType)
				end)
			end
		end
	end
	---- CustomShipments ----
	if filter == "weapons" then
		for k,v in pairs(CustomShipments) do
			if !VIPMode and v.VIPOnly then 
				continue 
			end
			if VIPMode and !v.VIPOnly then 
				continue 
			end
			if not GAMEMODE:CustomObjFitsMap(v) then continue end
			if (v.seperate and (not GAMEMODE.Config.restrictbuypistol or
				(GAMEMODE.Config.restrictbuypistol and (not v.allowed[1] or table.HasValue(v.allowed, LocalPlayer():Team())))))
				and (not v.customCheck or v.customCheck and v.customCheck(LocalPlayer())) then
				
				List:AddItem2Sell(v.model,v.name,v.pricesep,function()
					RunConsoleCommand("DarkRP","buy",v.name)
				end)
			end
		end
	end
	---- CustomShipments B----
	if filter == "shipment" then
		for k,v in pairs(CustomShipments) do
			if !VIPMode and v.VIPOnly then 
				continue 
			end
			if VIPMode and !v.VIPOnly then 
				continue 
			end
			
			if not GAMEMODE:CustomObjFitsMap(v) then continue end
			if not v.noship and table.HasValue(v.allowed, LocalPlayer():Team())
				and (not v.customCheck or (v.customCheck and v.customCheck(LocalPlayer()))) then
				List:AddItem2Sell(v.model,v.name,v.price,function()
					RunConsoleCommand("DarkRP","buyshipment",v.name)
				end)
			end
		end
	end
	---- Entities ----
	if filter == "entity" then
			for k,v in pairs(DarkRPEntities) do
				if !VIPMode and v.VIPOnly then 
					continue 
				end
				if VIPMode and !v.VIPOnly then 
					continue 
				end
				if not v.allowed or (type(v.allowed) == "table" and table.HasValue(v.allowed, LocalPlayer():Team()))
					and (not v.customCheck or (v.customCheck and v.customCheck(LocalPlayer()))) then
					List:AddItem2Sell(v.model,v.name,v.price,function()
						RunConsoleCommand("DarkRP",v.cmd)
					end)
				end
			end
	end	
	if filter == "foods" then
			if FoodItems and (GAMEMODE.Config.foodspawn or LocalPlayer():Team() == TEAM_COOK) and LocalPlayer():Team() == TEAM_COOK then
				for k,v in pairs(FoodItems) do
					if !VIPMode and v.VIPOnly then 
						continue 
					end
					if VIPMode and !v.VIPOnly then 
						continue 
					end
					List:AddItem2Sell(v.model,v.name,v.price or 15,function()
						RunConsoleCommand("DarkRP","buyfood",v.name)
					end)
				end
			end
	end
	---- Entities ----
	if filter == "vehicle" then
		for k,v in pairs(CustomVehicles) do
			if !VIPMode and v.VIPOnly then 
				continue 
			end
			if VIPMode and !v.VIPOnly then 
				continue 
			end
			if (not v.allowed or table.HasValue(v.allowed, LocalPlayer():Team())) and (not v.customCheck or v.customCheck(LocalPlayer())) then
				List:AddItem2Sell(v.model,v.name,v.price,function()
					RunConsoleCommand("DarkRP","buyvehicle",v.name)
				end)
			end
		end
	end
end