

util.AddNetworkString("bodygroups_change")
util.AddNetworkString("skins_change")
util.AddNetworkString("bodyman_chatprint")
util.AddNetworkString("bodyman_model_change")

function BODYMAN:ChatPrint( ply, msg )
	if IsValid( ply ) then
		net.Start( "bodyman_chatprint" )
		net.WriteString( msg )
		net.Send( ply )
	else
		self:Log( msg )
	end
end

hook.Add("PlayerInitialSpawn", "GiveBodygroupsTable", function(ply)
	ply.bodygroups = {}

	ply.LastJob_bodygroupr = "none"
	ply.LastPlayermodel = nil

	-- check the allowed bodygroups and apply them

end)

net.Receive("bodyman_model_change", function( len, ply )
	local job = ply:getJobTable()

	local playermodels = job.model

	if type( playermodels ) == "table" then
		local idx = net.ReadInt(8)

		if playermodels[idx] then
			ply:SetModel( playermodels[idx] )
		end
	end

	timer.Simple(0.2, function() ply:SendLua( [[BODYMAN:RefreshAppearanceMenu()]] ) end )

	ply.LastJob_bodygroupr = job.command or "none"
	ply.LastPlayermodel = ply:GetModel()
end)

net.Receive("bodygroups_change", function(len, ply)

	if (not BODYMAN:CloseEnoughCloset( ply )) and (BODYMAN.ClosetsOnly) then return false end

	local data = net.ReadTable()
	if not ply.bodygroups[ply:GetModel()] then
		ply.bodygroups[ply:GetModel()] = {}
	end
	data[1] = math.Round(data[1])
	data[2] = math.Round(data[2])

	local curgroups = ply:GetBodyGroups()
	if curgroups[data[1]+1] then
		if curgroups[data[1]+1].submodels[data[2]] then
		else
			return false
		end
	else
		return false
	end

		ply.bodygroups[ply:GetModel()][data[1]] = data[2]

		-- check if the bodygroup is allowed --
		local name = ply:GetBodygroupName( data[1] )
		local job = ply:getJobTable()
		local allowedbodygroups = {}
		local allowed = false

		if job.bodygroups then
			allowedbodygroups = job.bodygroups
		else
			for i = 2, #ply:GetBodyGroups() do
				local bg = ply:GetBodyGroups()[i]
				if bg then
					for k,v in pairs( bg ) do
						if k == "name" then
							allowedbodygroups[v] = {}
							for k2, v2 in pairs( bg["submodels"] ) do
								table.insert( allowedbodygroups[v], k2 )
							end
						end
					end	
				end
			end
		end



		if allowedbodygroups ~= {} then
			if allowedbodygroups[name] then
				for k,v in pairs(allowedbodygroups[name]) do
					if v == data[2] then
						allowed = true
					end
				end
			end
		end

		if allowed then
			ply:SetBodygroup(data[1], data[2])
			BodygroupManagerLog( ply:Nick().." changed their bodygroup: ("..ply:GetBodygroupName(data[1])..","..tostring(data[2])..")" )
		end

	ply.LastJob_bodygroupr = job.command or "none"
	ply.LastPlayermodel = ply:GetModel()

end)

net.Receive("skins_change", function(len, ply)

	if (not BODYMAN:CloseEnoughCloset( ply )) and (BODYMAN.ClosetsOnly) then return false end

	local wants = net.ReadInt(8) -- the skin that they wants

	local job = ply:getJobTable()
	local skins = {}
	if job.skins then
		skins = job.skins
	else
		local numskins = ply:SkinCount()
		for i = 0, numskins do
			table.insert( skins, i )
		end
	end

	if skins ~= {} then
		local allowed = false
		for k,v in ipairs(skins) do
			if v == wants then
				allowed = true
			end
		end

		if allowed then
			ply:SetSkin(wants)
			BodygroupManagerLog( ply:Nick().." changed their skin: ("..tostring(wants)..")" )
		end
	else
		ply:SetSkin( wants )
		BodygroupManagerLog( ply:Nick().." changed their skin: ("..tostring(wants)..")" )
	end

	ply.LastJob_bodygroupr = job.command or "none"
	ply.LastPlayermodel = ply:GetModel()
	
end)

