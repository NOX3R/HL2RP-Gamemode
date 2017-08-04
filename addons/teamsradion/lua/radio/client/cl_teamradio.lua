surface.CreateFont( "radiotitle", {
	font = "bebasneue",
	size = 28,
	weight = 500,
	antialias = true,
	underline = false
} )

surface.CreateFont( "sub", {
	font = "bebasneue",
	size = 24,
	weight = 400,
	antialias = true,
	underline = false
} )


local playersWhoTaking = {}

hook.Add("PlayerStartVoice", "WhoIsTalkingOnTheRadio", function( pl )
	if pl:GetNWBool( "deviceIsOn" ) and pl:getJobTable().hasRadio and LocalPlayer():getJobTable().hasRadio and LocalPlayer():GetNWBool( "deviceIsOn" ) then
		if pl:GetNWInt( "channelID" ) == LocalPlayer():GetNWInt( "channelID" ) or pl:GetNWInt( "channelID" ) == 0 and LocalPlayer():getJobTable().canTalkToGlobal then
			table.insert( playersWhoTaking, pl )
			pl.playerframe = vgui.Create("DFrame")
			pl.playerframe:SetSize(220, 60)
			pl.playerframe:SetPos(ScrW() - 220 - 20 * 3, 90 * table.Count( playersWhoTaking ))
			pl.playerframe:SetTitle("")
			pl.playerframe:ShowCloseButton( false )
			pl.playerframe.Paint = function()
				draw.RoundedBox( 8, 0, 16, pl.playerframe:GetWide(), pl.playerframe:GetTall() - 16, TeamRadio.Config.PlayerBoxColor )
				draw.RoundedBox( 8, 2, 18, pl.playerframe:GetWide() - 4, pl.playerframe:GetTall() - 20, Color(0, 0, 0, 80) )
			end

			pl.playername = vgui.Create("DLabel", pl.playerframe)
			pl.playername:SetText( pl:Nick() )
			pl.playername:SetFont("sub")
			pl.playername:SetColor( TeamRadio.Config.PlayerNameColor )
			pl.playername:SetPos(65, 20)
			pl.playername:SetWidth( 120 )

			pl.playerjob = vgui.Create("DLabel", pl.playerframe)
			if pl:GetNWInt( "channelID" ) == 0 then 
				pl.playerjob:SetText( pl:getJobTable().name )
				pl.playerjob:SetColor( pl:getJobTable().color )
			else
				pl.playerjob:SetText( TeamRadio.radioChannel[ pl:GetNWInt( "channelID" ) ].channelName )
				pl.playerjob:SetColor( TeamRadio.radioChannel[ pl:GetNWInt( "channelID" ) ].channelColor )	
			end
			pl.playerjob:SetFont("sub")
			pl.playerjob:SetPos(65, 37)
			pl.playerjob:SizeToContents()

			pl.modelicon = vgui.Create( "SpawnIcon", pl.playerframe ) 
			pl.modelicon:SetModel( pl:GetModel() )
			pl.modelicon:SetPos(2, 5)
			pl.modelicon:SetSize( 55, 55 )

		end
	end
end)

net.Receive("radiostate", function()
	if !LocalPlayer():GetNWBool( "deviceIsOn" ) then
		for k,v in pairs(player.GetAll()) do
			if v.playerframe then
				v.playerframe:Close()
				table.Empty( playersWhoTaking )
				v.playerframe = nil
			end
		end
	end
end)

hook.Add( "PlayerEndVoice", "WhoIsTalkingOnTheRadio", function( pl )
	if pl.playerframe then
		table.remove( playersWhoTaking, table.KeyFromValue(playersWhoTaking, pl))
		pl.playerframe:Close()
		pl.playerframe = nil
	end
end)

function removeplayerframe( pl )
   	if pl.playerframe then
		table.remove( playersWhoTaking, table.KeyFromValue(playersWhoTaking, pl))
		pl.playerframe:Close()
		pl.playerframe = nil
	end
end
hook.Add("EntityRemoved", "removeplayerframe", removeplayerframe)



hook.Add("HUDPaint", "painttalkers", function()
	if LocalPlayer():getJobTable().hasRadio then
		surface.SetFont("radiotitle")
		if LocalPlayer():GetNWBool( "deviceIsOn" ) then
			if LocalPlayer():GetNWInt( "channelID" ) == nil or LocalPlayer():GetNWInt( "channelID" ) == 0 then
				draw.WordBox( 5, ScrW() - surface.GetTextSize(TeamRadio_lang.inchannel.. " global channel") - 20 * 3 , 10, TeamRadio_lang.inchannel.. " global channel", "radiotitle", TeamRadio.Config.TextBoxColor, TeamRadio.Config.TextColor )
			else
				draw.WordBox( 5, ScrW() - surface.GetTextSize(TeamRadio_lang.inchannel .. TeamRadio.radioChannel[LocalPlayer():GetNWInt( "channelID" )].channelName) - 20 * 3, 10, TeamRadio_lang.inchannel .. TeamRadio.radioChannel[LocalPlayer():GetNWInt( "channelID" )].channelName , "radiotitle", TeamRadio.Config.TextBoxColor, TeamRadio.Config.TextColor )
			end
		else
			draw.WordBox( 5, ScrW() - surface.GetTextSize(TeamRadio_lang.hasradio) - 20 * 3, 10, TeamRadio_lang.hasradio, "radiotitle", TeamRadio.Config.TextBoxColor, TeamRadio.Config.TextColor )		end
	end



end)


hook.Add("OnPlayerChat", "helpcommand", function( pl, text )
	if string.lower(text) == "!radio" then
		LocalPlayer():ChatPrint( TeamRadio_lang.chatmsg )	
		return true
	end
end)