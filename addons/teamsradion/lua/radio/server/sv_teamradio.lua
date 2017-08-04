util.AddNetworkString( "radiostate" )

hook.Add("PlayerCanHearPlayersVoice", "Icanhearthat?", function( lisener, talker )
	if talker:IsPlayer() and lisener:IsPlayer() then
		if talker:getJobTable().hasRadio and talker:GetNWBool( "deviceIsOn" ) and lisener:getJobTable().hasRadio and lisener:GetNWBool( "deviceIsOn" ) then
			if talker:GetNWInt( "channelID" ) == 0 and lisener:GetNWInt( "channelID" ) == 0 then
				return true, false 
			end
			if talker:GetNWInt( "channelID" ) == lisener:GetNWInt( "channelID" ) then
				return true, false
			end
			if table.HasValue(TeamRadio.Config.GlobalRadio, talker:getJobTable().command) and talker:GetNWInt( "channelID" ) == 0 and lisener:getJobTable().canTalkToGlobal then
				return true, false
			end
		end
	end
end)

function switchChannel( pl )
	if table.Count(findChannels( pl )) > 1 then	
		if(findChannels( pl )[ table.KeyFromValue(findChannels( pl ), pl:GetNWInt( "channelID" )) ]) == table.GetLastKey(findChannels( pl )) then
			if pl:getJobTable().canTalkToGlobal then
				pl:SetNWInt( "channelID", 0 )
			else
				pl:SetNWInt( "channelID", findChannels( pl )[1])
			end
		else
			if pl:GetNWInt( "channelID" ) == 0 then
				pl:SetNWInt( "channelID", findChannels( pl )[1])
			else
				pl:SetNWInt( "channelID", findChannels( pl )[ table.KeyFromValue(findChannels( pl ), pl:GetNWInt( "channelID" ) ) + 1 ] )
			end
		end
	else
		if pl:getJobTable().canTalkToGlobal and table.HasValue(TeamRadio.Config.GlobalRadio, pl:getJobTable().command) and table.Count(findChannels( pl )) == 0 then
			pl:SetNWInt( "channelID", 0)
		else
			if pl:getJobTable().canTalkToGlobal then	
				if pl:GetNWInt( "channelID" ) == 0 then
					pl:SetNWInt( "channelID", findChannels( pl )[1])
				else
					pl:SetNWInt( "channelID", 0)
				end
			else
				pl:SetNWInt( "channelID", findChannels( pl )[1])
			end
		end
	end
	pl:SendLua("surface.PlaySound('npc/metropolice/vo/on1.wav')")
end

hook.Add("OnPlayerChangedTeam", "autoTurnOff", function( pl )
	if pl:getJobTable().hasRadio then
		pl:SetNWBool( "deviceIsOn", false )
		if table.HasValue(TeamRadio.Config.GlobalRadio, pl:getJobTable().command) and table.Count(findChannels( pl )) == 0 then
			pl:SetNWInt( "channelID", 0)
		else
			pl:SetNWInt( "channelID", findChannels( pl )[1])
		end
		net.Start( "radiostate" )
		net.Send( pl )
	end
end)

hook.Add("Think", "getKey?", function ()
	for k,v in pairs(player.GetAll()) do
		if v:KeyDown( TeamRadio.Config.SwitchChannelKey ) and v:KeyDown( IN_SPEED ) then
			if v:getJobTable().hasRadio then
				if !v.sw then
					if v:GetNWInt( "deviceIsOn" ) then
						switchChannel( v )
						v.sw = true
						timer.Simple(1, function()
							v.sw = false
						end)
					end
				end
			end
		end
		if v:KeyDown( IN_SPEED ) and v:KeyDown( TeamRadio.Config.KeyToTurnOn ) then
			if v:getJobTable().hasRadio then
				if !v.tu then
					timer.Simple(1, function()
						v.tu = false
					end)
					if !v:GetNWBool( "deviceIsOn" ) then
						v:SendLua("surface.PlaySound('npc/metropolice/vo/on2.wav')")
						v:SetNWBool( "deviceIsOn", true )
						v:ChatPrint( TeamRadio_lang.on )
					else
						v:SendLua("surface.PlaySound('npc/metropolice/vo/off2.wav')")
						v:SetNWBool( "deviceIsOn", false )
						v:ChatPrint( TeamRadio_lang.off )
					end
					v.tu = true
					if table.HasValue(TeamRadio.Config.GlobalRadio, v:getJobTable().command) and table.Count(findChannels( v )) == 0 then
						v:SetNWInt( "channelID", 0)
					else
						v:SetNWInt( "channelID", findChannels( v )[1])
					end
					net.Start( "radiostate" )
					net.Send( v )
				end
			end
		end
	end
end)