function dermajail()

local DermaPanel = vgui.Create( "DFrame" )
DermaPanel:SetPos( ScrW()/2.5,ScrH()/3 )
DermaPanel:SetSize( 500, 120 )
DermaPanel:SetTitle( "Temps d'arrestation" )
DermaPanel:ShowCloseButton( true )
DermaPanel:SetVisible( true )
DermaPanel:SetSkin("nocturnal")
DermaPanel:MakePopup()

local DLabel = vgui.Create( "DLabel", DermaPanel )
DLabel:SetPos( 20, 30 )
DLabel:SetSize( 400, 20 )
DLabel:SetText( "Cochez le temps de prison pour cette personne:" )

local CheckBoxThing = vgui.Create( "DCheckBoxLabel", DermaPanel )
CheckBoxThing:SetPos( 40,70 )
CheckBoxThing:SetText( "5 minutes" )
CheckBoxThing:SetValue( 0 )
CheckBoxThing:SizeToContents() -- Make its size to the contents. Duh?

local CheckBoxThing1 = vgui.Create( "DCheckBoxLabel", DermaPanel )
CheckBoxThing1:SetPos( 120,70 )
CheckBoxThing1:SetText( "10 minutes" )
CheckBoxThing1:SetValue( 0)
CheckBoxThing1:SizeToContents() -- Make its size to the contents. Duh?

local CheckBoxThing2 = vgui.Create( "DCheckBoxLabel", DermaPanel )
CheckBoxThing2:SetPos( 200,70 )
CheckBoxThing2:SetText( "15 minutes" )
CheckBoxThing2:SetValue( 0 )
CheckBoxThing2:SizeToContents() -- Make its size to the contents. Duh?

local CheckBoxThing3 = vgui.Create( "DCheckBoxLabel", DermaPanel )
CheckBoxThing3:SetPos( 280,70 )
CheckBoxThing3:SetText( "20 minutes" )
CheckBoxThing3:SetValue( 0 )
CheckBoxThing3:SizeToContents() -- Make its size to the contents. Duh?

local DermaButton = vgui.Create( "DButton" )
DermaButton:SetParent( DermaPanel ) -- Set parent to our "DermaPanel"
DermaButton:SetText( "Envoyer" )
DermaButton:SetPos( 380, 80 )
DermaButton:SetSize( 100, 25)
DermaButton.DoClick = function ()
	local minute =0
	if CheckBoxThing:GetChecked()==true then minute=300 end
	if CheckBoxThing1:GetChecked()==true then minute=600 end
	if CheckBoxThing2:GetChecked()==true then minute=900 end
	if CheckBoxThing3:GetChecked()==true then minute=1200 end
	if minute==0 then return end
	local ent = LocalPlayer():getEyeSightHitEntity(nil, nil, function(p) return p ~= LocalPlayer() and p:IsPlayer() and p:Alive() end)
	RunConsoleCommand("_FAdmin", "unfreeze", ent:UserID())
	RunConsoleCommand("rp_arresttation",ent:UserID(),minute)
	ply:changeTeam(TEAM_PRISONNIER, true)
    DermaPanel:SetVisible( false )
end

end
usermessage.Hook("Openjail",dermajail)
