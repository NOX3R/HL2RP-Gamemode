local function UpdateList() end
local function UpdateJobInfo() end
local function BecomeJob() end

local ELEMENT = F4Element_CreateStruct("Jobs")
ELEMENT:SetPrintName("Factions")

function ELEMENT:OnIconCreated(Panel,SX,SY)
end

function ELEMENT:OnCanvasCreated(Panel,SX,SY)
	Panel.VIPMode = false
	
	local VIPMode = vgui.Create("DCheckBoxLabel",Panel)
	VIPMode:SetPos(50,SY-33)
	VIPMode:SetText("Voir les factions VIP")
	VIPMode:SizeToContents()
	VIPMode.OnChange = function(slf,b)
		Panel.VIPMode = b
		UpdateList(Panel.Lister,Panel.VIPMode)
	end
	
	local ListBG = vgui.Create("DPanel",Panel)
	ListBG:SetPos(50,50)
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
	
	local PreViewModel = vgui.Create("RX4F4_PlayerModelViewer",Panel) Lister.PreViewModel = PreViewModel
	PreViewModel:SetPos(SX-400,50)
	PreViewModel:SetSize(350,SY-200)
	PreViewModel.PaintOverlay = function(slf)
		slf:RX4F4_DrawBoarder(1,Color(RX4F4_Colors.MainColor.r,RX4F4_Colors.MainColor.g,RX4F4_Colors.MainColor.b,10))
		slf:RX4F4_DrawBoarderEdge(10,2,RX4F4_Colors.EdgeColor)
	end
	
	local JobInfoLister = vgui.Create("DPanelList",PreViewModel)  Lister.JobInfoLister = JobInfoLister
	JobInfoLister:SetPos(1,1)
	JobInfoLister:SetSize(PreViewModel:GetWide()-2,PreViewModel:GetTall()-2)
	JobInfoLister:EnableHorizontal( false )
	JobInfoLister:EnableVerticalScrollbar( true )
	JobInfoLister:RX4F4_PaintListBarC()	
	
	local BecomeJob = vgui.Create( "RX4F4_MainIcon",Panel )  Lister.BecomeJob = BecomeJob
		BecomeJob:SetPos(SX-400,SY-100)
		BecomeJob:SetSize( 350 , 50 )
		BecomeJob.Text = "Choisir une faction"
		BecomeJob.Click = function(slf)
		end
		BecomeJob.DrawHighlight = function(slf)
			if slf:IsHovered() then
				return true
			end
		end
			
	UpdateList(Lister,Panel.VIPMode)
end

function ELEMENT:RenderOnSelector(SX,SY)

end
F4Element_Register(ELEMENT)





//=========================
function UpdateList(Lister,VIPMode)
	Lister:Clear()
		local function AddIcon(Count,Model, name, description, Weapons, command, special, specialcommand)
			local JTB = {}
			local JobNumber = nil
			local PlayerCount = 0
			for a,b in pairs(RPExtraTeams) do
				if b.name == name then
					for k,v in pairs(player.GetAll()) do
						if v:Team() == a then
							PlayerCount = PlayerCount + 1
						end
					end
					JTB = b
					JobNumber = a
				end
			end
			
			if JTB.VIPOnly and !VIPMode then
				return
			end
			if !JTB.VIPOnly and VIPMode then
				return
			end
			
			local BGP = vgui.Create("DButton")
			BGP:SetSize(Lister:GetWide()/2-5,50)
			BGP:SetText("")
			BGP.Paint = function(slf)
				draw.SimpleTextOutlined(name, "RX4F4_25", (slf:GetWide()-slf:GetTall())/2 + slf:GetTall(),slf:GetTall()/2,Color(255,255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER,1,Color(0,0,0,100))
				if slf:IsHovered() then
					slf:RX4F4_DrawBoarder(1,RX4F4_Colors.HoverBoarder)
					slf:RX4F4_DrawBoarderEdge(10,2,RX4F4_Colors.HoverBoarderEdge)
				end
			end
			
			BGP.DoClick = function(slf)
				Lister.JobInfoLister:Clear()
				UpdateJobInfo(Lister,JTB,JobNumber)
			end
			
			local icon = vgui.Create("ModelImage",BGP)
			icon:SetPos(2,2)
			icon:SetSize(BGP:GetTall()-4,BGP:GetTall()-4)
			local IconModel = Model
			if type(Model) == "table" then
				IconModel = Model[math.random(#Model)]
			end
			
			
			BGP.OnCursorEntered = function(slf)
				Lister.JobInfoLister:Clear()
				Lister.PreViewModel:SetModel(IconModel)
			end
			
			icon:SetModel(IconModel)
			Lister:AddItem(BGP)
		end
	
		local JCount = 0
	
		for k,v in ipairs(RPExtraTeams) do
			if LocalPlayer():Team() ~= k and GAMEMODE:CustomObjFitsMap(v) then
				local nodude = true
				
				if v.admin == 1 and not LocalPlayer():IsAdmin() then
					nodude = false
				end
				if v.admin > 1 and not LocalPlayer():IsSuperAdmin() then
					nodude = false
				end
				if v.customCheck and not v.customCheck(LocalPlayer()) then
					nodude = false
				end

				if (type(v.NeedToChangeFrom) == "number" and LocalPlayer():Team() ~= v.NeedToChangeFrom) or (type(v.NeedToChangeFrom) == "table" and not table.HasValue(v.NeedToChangeFrom, LocalPlayer():Team())) then
					nodude = false
				end

				if nodude then
					local weps = "no extra weapons"
					if v.weapons and type(v.weapons) == "table" and #v.weapons > 0 then
						weps = table.concat(v.weapons, "\n")
					end
					if (not v.RequiresVote and v.vote) or (v.RequiresVote and v.RequiresVote(LocalPlayer(), k)) then
						local condition = ((v.admin == 0 and LocalPlayer():IsAdmin()) or (v.admin == 1 and LocalPlayer():IsSuperAdmin()) or LocalPlayer().DarkRPVars["Priv"..v.command])
						if not v.model or not v.name or not v.description or not v.command then chat.AddText(Color(255,0,0,255), "Incorrect team! Fix your shared.lua!") return end
						JCount = JCount + 1
						AddIcon(JCount,v.model, v.name, v.description, weps,v.command, condition,v.command)
					else
						if not v.model or not v.name or not v.description or not v.command then chat.AddText(Color(255,0,0,255), "Incorrect team! Fix your shared.lua!") return end
						JCount = JCount + 1
						AddIcon(JCount,v.model, v.name, v.description, weps,v.command)
					end
				end
			end
		end
	
	
end


function UpdateJobInfo(Lister,JTB,JobNumber)
	Lister.JobInfoLister:Clear()
	Lister.UID = 76561197998645424
	Lister.BecomeJob.Text = "Devenir " .. JTB.name
	Lister.BecomeJob.Click = function(slf)
		BecomeJob(JTB,JobNumber)
	end
	
	-- Title
	local BGP = vgui.Create("DPanel") Lister.JobInfoLister:AddItem(BGP)
	BGP:SetSize(Lister.JobInfoLister:GetWide()-5,50)
	BGP.Paint = function(slf)
		surface.SetDrawColor( JTB.color )
		surface.DrawRect(0,0,slf:GetWide(),slf:GetTall())
		draw.SimpleTextOutlined(JTB.name, "RX4F4_30", (slf:GetWide()-slf:GetTall())/2 + slf:GetTall(),slf:GetTall()/2,Color(255,255,255,255),TEXT_ALIGN_CENTER,TEXT_ALIGN_CENTER,1,Color(0,0,0,100))
	end
	
	local icon = vgui.Create("ModelImage",BGP)
	icon:SetSize(BGP:GetTall(),BGP:GetTall())
	local IconModel = JTB.model
	if type(JTB.model) == "table" then
		IconModel = JTB.model[math.random(#JTB.model)]
	end
	icon:SetModel(IconModel)
	
	-- Description

		local LABEL = vgui.Create("DLabel") Lister.JobInfoLister:AddItem(LABEL)
		LABEL:SetAutoStretchVertical(true)
		LABEL:SetText("> Description")
		LABEL:SetFont("RX4F4_30")
		LABEL:SetColor(RX4F4_Colors.MainTextHightlightColor)
		
		local LABEL = vgui.Create("DLabel") Lister.JobInfoLister:AddItem(LABEL)
		LABEL:SetAutoStretchVertical(true)
		LABEL:SetWrap(true)
		LABEL:SetText(JTB.description)
		LABEL:SetFont("RX4F4_17")
		LABEL:SetColor(RX4F4_Colors.MainTextColor)
			
	-- Weapons
	
		local LABEL = vgui.Create("DLabel") Lister.JobInfoLister:AddItem(LABEL)
		LABEL:SetAutoStretchVertical(true)
		LABEL:SetText("> Armes")
		LABEL:SetFont("RX4F4_30")
		LABEL:SetColor(RX4F4_Colors.MainTextHightlightColor)
		
		local GunsCount = 0
		for k,v in pairs(JTB.weapons or {}) do
			GunsCount = GunsCount + 1
			if GunsCount >= 6 then continue end
			
			local LABEL = vgui.Create("DLabel") Lister.JobInfoLister:AddItem(LABEL)
			LABEL:SetTall(20)
			LABEL:SetText(v)
			LABEL:SetFont("RX4F4_17")
		LABEL:SetColor(RX4F4_Colors.MainTextColor)
		end
		
		if GunsCount >= 6 then
			local LABEL = vgui.Create("DLabel") Lister.JobInfoLister:AddItem(LABEL)
			LABEL:SetTall(20)
			LABEL:SetText("And More...")
			LABEL:SetFont("RX4F4_17")
		LABEL:SetColor(RX4F4_Colors.MainTextColor)
		end
		if GunsCount == 0 then
			local LABEL = vgui.Create("DLabel") Lister.JobInfoLister:AddItem(LABEL)
			LABEL:SetTall(20)
			LABEL:SetText("Pas d'armes")
			LABEL:SetFont("RX4F4_17")
		LABEL:SetColor(RX4F4_Colors.MainTextColor)
		end
end

function BecomeJob(JTB,JobNumber)
	--function PANEL:Become_Job(JTB,Count,Model, name, description, Weapons, command, special, specialcommand)
	local Model = JTB.model
	local command = JTB.command
	local special = JTB.special
	
	
	local function DoChatCommand(frame)
		if special then
			local menu = DermaMenu()
			menu:AddOption("Vote" , function() RunConsoleCommand("darkrp","vote" .. command) frame:Close() end)
			menu:AddOption("Do not vote", function() RunConsoleCommand("darkrp",command) frame:Close() end)
			menu:Open()
		else
			if JTB.vote then
				RunConsoleCommand("darkrp","vote" .. command)
			else
				RunConsoleCommand("darkrp",command)
			end
							
				frame:Close()
			end
		end

		if type(Model) == "table" and #Model > 0 then
			local frame = vgui.Create("DFrame")
			frame:SetTitle("Choose model")
			frame:SetVisible(true)
			frame:MakePopup()
			frame.Paint = function(slf)
				surface.SetDrawColor( 0,0,0,250 )
				surface.DrawRect( 0, 0, slf:GetWide(), slf:GetTall() )
				
				slf:RX4F4_DrawBoarder(1,RX4F4_Colors.MainColor)
				slf:RX4F4_DrawBoarderEdge(10,2,RX4F4_Colors.EdgeColor)
			end
						
			local levels = 1
			local IconsPerLevel = math.floor(ScrW()/64)

			while #Model * (64/levels) > ScrW() do
				levels = levels + 1
			end
			frame:SetSize(math.Min(#Model * 64, IconsPerLevel*64), math.Min(90+(64*(levels-1)), ScrH()))
			frame:Center()

			local CurLevel = 1
			for k,v in pairs(Model) do
				local icon = vgui.Create("SpawnIcon", frame)
				if (k-IconsPerLevel*(CurLevel-1)) > IconsPerLevel then
					CurLevel = CurLevel + 1
				end
				icon:SetPos((k-1-(CurLevel-1)*IconsPerLevel) * 64, 25+(64*(CurLevel-1)))
				icon:SetModel(v)
				icon:SetSize(64, 64)
				icon:SetToolTip()
				icon.DoClick = function()
					DarkRP.setPreferredJobModel(JobNumber, v)
					DoChatCommand(frame)
				end
			end
		else
			if special then
				local menu = DermaMenu()
				menu:AddOption("Vote", function() RunConsoleCommand("darkrp","vote"..command) end)
				menu:AddOption("Do not vote", function() RunConsoleCommand("darkrp",command) end)
				menu:Open()
			else
				if JTB.vote then
					RunConsoleCommand("darkrp","vote" .. command)
				else
					RunConsoleCommand("darkrp",command)
				end
			end
		end
end