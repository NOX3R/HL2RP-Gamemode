resource.AddFile( "sound/combine/voice_start.wav" )
resource.AddFile( "sound/combine/voice_end.wav" )


local function PlayerStartVoice( ply )
        if ( ply:IsPlayer() and ply:isCP() ) then
                ply:EmitSound("npc/overwatch/radiovoice/on1.wav")
        elseif(ply:IsPlayer() and ply:Team()==TEAM_OTA  or ply:Team()==TEAM_OTA_KING or ply:Team()==TEAM_OTA_PRISON) then
		        ply:EmitSound("npc/combine_soldier/vo/on"..math.random(1,2)..".wav")
		end
end
hook.Add( "PlayerStartVoice" , "PlayerStartedTheirVoice" , PlayerStartVoice)

local function PlayerEndVoice( ply )
        if ( ply:IsPlayer() and ply:isCP() ) then
                ply:EmitSound("npc/overwatch/radiovoice/off4.wav")
        elseif(ply:IsPlayer() and ply:Team()==TEAM_OTA  or ply:Team()==TEAM_OTA_KING or ply:Team()==TEAM_OTA_PRISON) then
		        ply:EmitSound("npc/combine_soldier/vo/off3.wav")
		end
		
           
end       
hook.Add( "PlayerEndVoice" , "PlayerEndedTheirVoice" , PlayerEndVoice)
        


 