hook.Add('Initialize','CH_S_1d068eb4feb000ab0718603610fa2222', function()
	http.Post('http://coderhire.com/api/script-statistics/usage/5730/1304/1d068eb4feb000ab0718603610fa2222', {
		port = GetConVarString('hostport'),
		hostname = GetHostName()
	})
end)