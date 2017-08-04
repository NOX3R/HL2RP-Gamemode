local tab =
{
 [ "$pp_colour_addr" ] = 0,
 [ "$pp_colour_addg" ] = 0,
 [ "$pp_colour_addb" ] = 0,
 [ "$pp_colour_brightness" ] = 0,
 [ "$pp_colour_contrast" ] = 1,
 [ "$pp_colour_colour" ] = 0,
 [ "$pp_colour_mulr" ] = 30,
 [ "$pp_colour_mulg" ] = 0,
 [ "$pp_colour_mulb" ] = 20
}

function DrawBinoc()
local ply=LocalPlayer()
     if (ply:Team()==TEAM_CHIEF or ply:Team()==TEAM_POLICE_GHOST or ply:Team()==TEAM_REB_PC or ply:Team()==TEAM_POLICEC or ply:Team()==TEAM_POLICE_RCT or ply:Team()==TEAM_POLICE_05 or ply:Team()==TEAM_POLICE_04 or ply:Team()==TEAM_POLICE_03 or ply:Team()==TEAM_POLICE_02 or ply:Team()==TEAM_POLICE_01 or ply:Team()==TEAM_GUNPC) then
    DrawMaterialOverlay( "effects/combine_binocoverlay.vmt", 0.1 )
	end
	
    if (ply:Team()==TEAM_OTA or ply:Team()==TEAM_OTA_PRISON or ply:Team()==TEAM_OTA_KING) then
    DrawMaterialOverlay( "effects/combine_tactview.vmt", 0.1 )
	end	
	
     if (ply:Health() <30 and (ply:Team()==TEAM_CHIEF or ply:Team()==TEAM_POLICE_GHOST or ply:Team()==TEAM_REB_PC or ply:Team()==TEAM_POLICEC or ply:Team()==TEAM_POLICE_RCT or ply:Team()==TEAM_POLICE_05 or ply:Team()==TEAM_POLICE_04 or ply:Team()==TEAM_POLICE_03 or ply:Team()==TEAM_POLICE_02 or ply:Team()==TEAM_POLICE_01 or ply:Team()==TEAM_GUNPC or ply:Team()==TEAM_OTA or ply:Team()==TEAM_OTA_KING)) then
	
    DrawMaterialOverlay( "effects/tvscreen_noise002a.vmt", 0.1 )
	end
	
     if (ply:Team()==TEAM_VORT) then
    DrawMaterialOverlay( "effects/tp_eyefx/tpeye2.vmt", 0.1 )
	end

	if (ply:Team()==TEAM_CITIZEN  and ply:Health() <20) then
   
	end
	
	if(ply:Team()==TEAM_HOBO or ply:Team()==TEAM_HOBOF or ply:Team()==TEAM_HOBOZ or ply:Team()==TEAM_HOBOH) then
  	DrawColorModify(tab)
	end
end
 
hook.Add( "RenderScreenspaceEffects", "BinocDraw", DrawBinoc )
