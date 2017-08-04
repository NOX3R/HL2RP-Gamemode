include("shared.lua")

function ENT:Draw()
	self:DrawModel()
end
function dermatest()
local DermaPanel = vgui.Create( "DFrame" )
DermaPanel:SetPos( ScrW()/2.5,ScrH()/3 )
DermaPanel:SetSize( 500, 120 )
DermaPanel:SetTitle( "Radio d'urgence CWU" )
DermaPanel:ShowCloseButton( true )
DermaPanel:SetVisible( true )
DermaPanel:SetSkin("nocturnal")
DermaPanel:MakePopup()

local DLabel = vgui.Create( "DLabel", DermaPanel )
DLabel:SetPos( 20, 30 )
DLabel:SetSize( 400, 20 )
DLabel:SetText( "Saisissez un message d'urgence à transmettre aux unités de la milice!" )
 
local DermaText = vgui.Create( "DTextEntry", DermaPanel )
DermaText:SetPos( 20, 50 )
DermaText:SetTall( 20 )
DermaText:SetWide( 450 )
DermaText:SetEnterAllowed( true )
DermaText.OnEnter = function()

end
local DermaButton = vgui.Create( "DButton" )
DermaButton:SetParent( DermaPanel ) -- Set parent to our "DermaPanel"
DermaButton:SetText( "Envoyer" )
DermaButton:SetPos( 350, 80 )
DermaButton:SetSize( 100, 25)
DermaButton.DoClick = function ()
		for k, v in pairs(player.GetAll()) do
		if(v:Team()==TEAM_CHIEF or v:Team()==TEAM_POLICE_GHOST or v:Team()==TEAM_POLICEC or v:Team()==TEAM_POLICE_RCT or v:Team()==TEAM_POLICE_05 or v:Team()==TEAM_POLICE_04 or v:Team()==TEAM_POLICE_03 or v:Team()==TEAM_POLICE_02 or v:Team()==TEAM_POLICE_01 or v:Team()==TEAM_OTA or v:Team()==TEAM_GUNPC or v:Team()==TEAM_OTA_KING or v:Team()==TEAM_REB_PC) then
			    RunConsoleCommand("say","/request "..DermaText:GetValue())
		end
		end
    DermaPanel:SetVisible( false )
end
end

usermessage.Hook("Openpls",dermatest)
