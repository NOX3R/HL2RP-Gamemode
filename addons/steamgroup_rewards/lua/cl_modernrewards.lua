--Modern Rewards Main Client Dist
if REWARDS then REWARDS = REWARDS
else REWARDS = {} end

REWARDS.DrawHeight = 35
REWARDS.ControlHeight = 27
REWARDS.CurrentAlpha = 0
REWARDS.DisplayType = 1
REWARDS.MessageBoxPadding = 14
include('cl_rewardfonts.lua')
include('sh_rewardsconfig.lua')

--Include panels
include('sgrpanels/cl_menubutton.lua')

function REWARDS.OpenRewards( settings )
	if not LocalPlayer() then return end
	REWARDS.MainWindowOpen = true
	REWARDS.JoinCheckWidth = 0
	REWARDS.DisplayType = 1
	if !RewardsMainWindow then
		REWARDS.CurrentAlpha = 0
		RewardsMainWindow = vgui.Create( "DFrame" )
		RewardsMainWindow:SetSize( ScrW(), REWARDS.DrawHeight )
		RewardsMainWindow:SetPos(0,0)
		RewardsMainWindow:SetDraggable( false )
		RewardsMainWindow:ShowCloseButton( false )
		RewardsMainWindow:SetTitle( "" )
		RewardsMainWindow.Paint = REWARDS.PaintMainWindow
		
		//Button list
		local MenuButtonList = vgui.Create( "DPanelList", RewardsMainWindow )
		MenuButtonList:SetPadding( 0 )
		MenuButtonList:SetSpacing( 5 )
		MenuButtonList:SetAutoSize( true )
		MenuButtonList:SetNoSizing( false )
		MenuButtonList:EnableHorizontal( true )
		MenuButtonList:EnableVerticalScrollbar( false )
		MenuButtonList.Paint = function() end
		MenuButtonList.Think = function()
			if REWARDS.DisplayType == 3 then MenuButtonList:Remove() end
		end
		
		local JoinButton = vgui.Create( "ModernRewardsButton" )
		JoinButton:SetText(REWARDS.JoinButtonText)
		JoinButton.DoClick = function() 
			LocalPlayer():ConCommand("rewards_joinsteam")
			REWARDS.DisplayType = 2
			gui.OpenURL(REWARDS.Settings.SteamGroupPage)
			gui.EnableScreenClicker(false)
		end
		//Button:SetColor(v.settings.color)
		//Button:SizeToContents()
		MenuButtonList:AddItem(JoinButton)
		
		local DontJoinButton = vgui.Create( "ModernRewardsButton" )
		DontJoinButton:SetText(REWARDS.DontJoinButtonText)
		DontJoinButton.DoClick = function() REWARDS.CloseRewards() gui.EnableScreenClicker(false) end
		if settings.autoclosetime then REWARDS.AutoCloseTime = CurTime() + settings.autoclosetime end
		DontJoinButton.Think = function()
			if (REWARDS.DisplayType > 1) then
				DontJoinButton:SetText(REWARDS.DontJoinButtonText)
			elseif REWARDS.AutoCloseTime then
				local time = math.Clamp(REWARDS.AutoCloseTime - CurTime(), 0, settings.autoclosetime)
				local timetext = string.FormattedTime(time, "%02i:%02i")
				DontJoinButton:SetText(REWARDS.DontJoinButtonText .. " (Closing " .. timetext  .." )")				
				if time <= 0 then REWARDS.CloseRewards() end
			end
			local width = 0
			for k,v in pairs(MenuButtonList:GetItems()) do
				width = width + v.CurrentWidth + 5
			end
			MenuButtonList:SetSize( width , 27)
			MenuButtonList:SetPos(ScrW() - (5 + MenuButtonList:GetWide()), 4)
		end
		//Button:SetColor(v.settings.color)
		MenuButtonList:AddItem(DontJoinButton)
		
		local width = 0
		for k,v in pairs(MenuButtonList:GetItems()) do
			width = width + v.CurrentWidth + 5
		end
		MenuButtonList:SetSize( width , 27)
		MenuButtonList:SetPos(ScrW() - (5 + MenuButtonList:GetWide()), 4)

		//RewardsMainWindow:MakePopup()
	else
		REWARDS.CloseRewards()
	end
end
concommand.Add("rewards", REWARDS.OpenRewards)

//local FKeyReleased = false
function REWARDS.PaintMainWindow()
	
	//Paint window itself
	REWARDS.CurrentAlpha = math.Approach( REWARDS.CurrentAlpha, 225, FrameTime() * 200 )

	surface.SetDrawColor(REWARDS.ColorWithCurrentAlpha(REWARDS.Theme.WindowColor))
	
	surface.DrawRect(0, 0, ScrW(), REWARDS.DrawHeight)
	
	//Steam/Group Logo
	surface.SetMaterial( REWARDS.Theme.Logo );
	surface.SetDrawColor( REWARDS.Theme.LogoColor );
	surface.DrawTexturedRect( 5, 2, 64, 32 );	
	
	
	//Draw message box
	local cin = (math.sin(CurTime()) + 1) / 2
	
	//Display SHOW ONLY
	if REWARDS.DisplayType == 1 then
		surface.SetDrawColor(REWARDS.ColorWithCurrentAlpha(REWARDS.Theme.MessageBoxBackColor))
		surface.DrawRect(107, 4, REWARDS.FindMessageBoxWidth(REWARDS.Settings.RewardsMessage), 27)

		draw.DrawText(REWARDS.Settings.RewardsMessage, REWARDS.Theme.Font, 114, 7, color_white, 0)
	//Display JOIN CHECK DELAY 
	elseif REWARDS.DisplayType == 2 then
		local width = REWARDS.FindMessageBoxWidth(REWARDS.Settings.RewardsMessage)
		surface.SetDrawColor(REWARDS.ColorWithCurrentAlpha(REWARDS.Theme.MessageBoxJoinCheckBackColor))
		surface.DrawRect(107, 4, width, 27)
		
		REWARDS.JoinCheckWidth = math.Approach( REWARDS.JoinCheckWidth, width, FrameTime() * ((width / REWARDS.Settings.JoinCheckDelay)))
		surface.SetDrawColor(REWARDS.ColorWithCurrentAlpha(REWARDS.Theme.MessageBoxJoinBarColor))
		surface.DrawRect(107, 4, REWARDS.JoinCheckWidth, 27)
		draw.DrawText(REWARDS.Settings.RewardsJoinCheckMessage, REWARDS.Theme.Font, 114, 7, color_white, 0)
	//Display REWARDS SUCCESS
	elseif REWARDS.DisplayType == 3 then
		if REWARDS.Theme.SuccessColorEffect then
			surface.SetDrawColor(cin * 255,255 - (cin * 255),255,REWARDS.CurrentAlpha)
		else
			surface.SetDrawColor(REWARDS.ColorWithCurrentAlpha(REWARDS.Theme.MessageBoxSuccessBackColor))
		end
		surface.DrawRect(107, 4, REWARDS.FindMessageBoxWidth(REWARDS.Settings.RewardsSuccessMessage), 27)
	
		draw.DrawText(REWARDS.Settings.RewardsSuccessMessage, REWARDS.Theme.Font, 114, 7, color_white, 0)
	else
		surface.SetDrawColor(REWARDS.ColorWithCurrentAlpha(REWARDS.Theme.MessageBoxBackColor))
		surface.DrawRect(107, 4, REWARDS.FindMessageBoxWidth(REWARDS.Settings.RewardsMessage), 27)
	
		draw.DrawText(REWARDS.Settings.RewardsMessage, REWARDS.Theme.Font, 114, 7, color_white, 0)
	end
end

function REWARDS.ColorWithCurrentAlpha(c)
	local r,g,b = c.r,c.g,c.b
	return Color(r,g,b,REWARDS.CurrentAlpha)
end

function REWARDS.FindMessageBoxWidth(text)
	surface.SetFont(REWARDS.Theme.Font)
	local tw = surface.GetTextSize(text) 
	return tw + REWARDS.MessageBoxPadding
end

local function RewardsOpenCommand(msg)
	//Open steam rewards network command
	local autoclosetime = msg:ReadLong()
	local settings = {}
	if autoclosetime and autoclosetime > 0 then
		settings.autoclosetime = tonumber(autoclosetime)
	else gui.EnableScreenClicker(true) end
	REWARDS.OpenRewards( settings )
end
usermessage.Hook("REWARDS_Open", RewardsOpenCommand)

local function RewardsSuccessCommand(msg)
	//Success steam rewards network command
	local settings = {}
	if not RewardsMainWindow then REWARDS.OpenRewards( settings ) end
	REWARDS.DisplayType = 3
	if REWARDS.Settings.PlaySounds then surface.PlaySound(REWARDS.Settings.SuccessSound) end
	timer.Simple(REWARDS.Settings.SuccessCloseTime or 5, function()
		REWARDS.CloseRewards()
	end)
end
usermessage.Hook("REWARDS_Success", RewardsSuccessCommand)

function REWARDS.CloseRewards()
	if RewardsMainWindow then
		RewardsMainWindow:Remove()
		RewardsMainWindow = nil
		REWARDS.AutoCloseTime = nil
	end
	REWARDS.MainWindowOpen = false
end
usermessage.Hook("REWARDS_Close", REWARDS.CloseRewards)

--BindKey
local Binds = {
	["gm_showhelp"] = "F1",
	["gm_showteam"] = "F2",
	["gm_showspare1"] = "F3",
	["gm_showspare2"] = "F4"
}

local ShowCursor
function REWARDS.PlayerBindPress( ply, bind, down )
	local bnd = string.match(string.lower(bind), "gm_[a-z]+[12]?")
	if bnd and Binds[bnd] and Binds[bnd] == REWARDS.Settings.FKeyShowCursor then
		local settings = {}
			ShowCursor = !ShowCursor
			gui.EnableScreenClicker(ShowCursor)
	end
end
hook.Add("PlayerBindPress","REWARDS_PlayerBindPress",REWARDS.PlayerBindPress)

local function RewardsNotify()
	local ply = net.ReadEntity()
	if not IsValid(ply) then return end
	chat.AddText(REWARDS.Theme.NoticePrefixColor, REWARDS.NoticePrefix .. " ", REWARDS.Theme.NoticeTextColor,
		string.format("%s %s",ply:Nick(),REWARDS.Settings.RewardsChatMessage))
end
net.Receive("REWARDS_Notify", RewardsNotify)