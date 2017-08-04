function dermadesc()
local text="C'est un simple citoyen de Cité 8 reconnaissable à sa tenue sale et abimée"
if(LocalPlayer():getDarkRPVar("Description")) then text=LocalPlayer():getDarkRPVar("Description") end
local DermaPanel = vgui.Create( "DFrame" )
DermaPanel:SetPos( ScrW()/2.5,ScrH()/3 )
DermaPanel:SetSize( 500, 120 )
DermaPanel:SetTitle( "Description physique" )
DermaPanel:ShowCloseButton( true )
DermaPanel:SetVisible( true )
DermaPanel:SetSkin("nocturnal")
DermaPanel:MakePopup()

local DLabel = vgui.Create( "DLabel", DermaPanel )
DLabel:SetPos( 20, 30 )
DLabel:SetSize( 400, 20 )
DLabel:SetText( "Ecrivez votre description physique, utilisez les modèles pour vous inspirer:" )
 
local DermaText = vgui.Create( "DTextEntry", DermaPanel )
DermaText:SetPos( 20, 50 )
DermaText:SetTall( 20 )
DermaText:SetWide( 450 )
DermaText:SetText( text )
DermaText:SetEnterAllowed( true )
DermaText.OnEnter = function()

end
local DermaButton = vgui.Create( "DButton" )
DermaButton:SetParent( DermaPanel ) -- Set parent to our "DermaPanel"
DermaButton:SetText( "Envoyer" )
DermaButton:SetPos( 380, 80 )
DermaButton:SetSize( 100, 25)
DermaButton.DoClick = function ()
	RunConsoleCommand("say","/description "..DermaText:GetValue())
    DermaPanel:SetVisible( false )
end

local DermaButton1 = vgui.Create( "DButton" )
DermaButton1:SetParent( DermaPanel ) -- Set parent to our "DermaPanel"
DermaButton1:SetText( "Citoyen" )
DermaButton1:SetPos( 30, 80 )
DermaButton1:SetSize( 60, 25)
DermaButton1.DoClick = function ()
	DermaText:SetValue("XXmXX | XXkg | Tenue de citoyen sale | Maigre | Cheveux gras")
 
end

local DermaButton2 = vgui.Create( "DButton" )
DermaButton2:SetParent( DermaPanel ) -- Set parent to our "DermaPanel"
DermaButton2:SetText( "Milice" )
DermaButton2:SetPos( 100, 80 )
DermaButton2:SetSize( 60, 25)
DermaButton2.DoClick = function ()
	DermaText:SetValue("Brassard de XX | 9mm à la ceinture | Stunstick en main | Amicale ")
 
end

local DermaButton2 = vgui.Create( "DButton" )
DermaButton2:SetParent( DermaPanel ) -- Set parent to our "DermaPanel"
DermaButton2:SetText( "CWU" )
DermaButton2:SetPos( 170, 80 )
DermaButton2:SetSize( 60, 25)
DermaButton2.DoClick = function ()
	DermaText:SetValue("Uniforme de CWU | Propre sur lui | Chaussure en bon état | Souriant")
 
end

local DermaButton2 = vgui.Create( "DButton" )
DermaButton2:SetParent( DermaPanel ) -- Set parent to our "DermaPanel"
DermaButton2:SetText( "OTA" )
DermaButton2:SetPos( 240, 80 )
DermaButton2:SetSize( 60, 25)
DermaButton2.DoClick = function ()
	DermaText:SetValue("Armure blindée | AR2 en main | Terrifiant | Froid")
 
end

local DermaButton2 = vgui.Create( "DButton" )
DermaButton2:SetParent( DermaPanel ) -- Set parent to our "DermaPanel"
DermaButton2:SetText( "Rebelle" )
DermaButton2:SetPos( 310, 80 )
DermaButton2:SetSize( 60, 25)
DermaButton2.DoClick = function ()
	DermaText:SetValue("Tenue légérement renforcée | Signe Lambda | XXmXX | XXkg")
 
end
end

usermessage.Hook("Opendesc",dermadesc)
