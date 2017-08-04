CRP = {}
CRP.Config = {}
CRP.Build = "100"
CRP.Version = "1.0.0"
CRP.CurrentBuild = "0"
CRP.LatestBuild = "0"
CRP.BuildOutdated = false

local function CompareVersions()
	if tonumber(CRP.CurrentBuild) < tonumber(CRP.LatestBuild) then
		MsgN('')
		MsgN('CRP est obsolète!')
		MsgN('Version actuelle: ' .. CRP.CurrentBuild .. ', Dernière version: ' .. CRP.LatestBuild .. '')
		MsgN('Téléchargez la dernière version ici : https://github.com/NOX3R/HL2RP-Gamemode')
		MsgN('')
		CRP.BuildOutdated = true
	else
		MsgN('')
		MsgN('CRP est à jour.')
		MsgN('')
	end
end

hook.Add("PlayerInitialSpawn", "NotifyOutdated", function( ply )
	if(CRP.BuildOutdated)then
		ply:SendLua("notification.AddLegacy(\"Le gamemode a été mis à jour, veuillez le retélécharger !\", NOTIFY_ERROR, 300)")
	end
end)

function CheckVersion()
	local url = 'https://raw.githubusercontent.com/NOX3R/HL2RP-Gamemode/master/Version.txt'
	http.Fetch( url,
		function( content )
			CRP.LatestBuild = tostring( content ) or "Error"
			CompareVersions()
		end,
		function(failCode)
			MsgN('CRP n\'a pas pu vérifié la version.')
			MsgN(url, ' returned ', failCode)
		end
	)
end