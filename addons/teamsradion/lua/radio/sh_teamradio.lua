function findChannels( pl )
	local channels = {}
	for k,v in pairs(TeamRadio.radioChannel) do
		if table.HasValue(TeamRadio.radioChannel[k].jobs, pl:getJobTable().command) then
			table.insert( channels, k )
		end
	end
	return channels
end