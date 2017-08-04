TeamRadio = {}

--Addon Config
TeamRadio.Config = {}
TeamRadio.Config.GlobalRadio = {} -- Jobs who can talk to everybody
TeamRadio.radioChannel = {} -- DO NOT DELETE THIS LINE!

--Box
TeamRadio.Config.TextColor = Color(255, 255, 255)
TeamRadio.Config.TextBoxColor = Color(0, 0, 0, 180)

--Player
TeamRadio.Config.PlayerBoxColor = Color(52, 152, 219)
TeamRadio.Config.PlayerNameColor = Color(255, 255, 255)
TeamRadio.Config.KeyToTurnOn = IN_RELOAD
TeamRadio.Config.SwitchChannelKey = IN_ATTACK


--Channels will came here


TeamRadio.radioChannel[1] = {
	channelName = "Milice",
	channelColor = Color( 0, 0, 255 ),
	jobs = { "gangsterpc","cpm","cp","cps","gundealerpc","cpsm","cp05","cp04","cp03","cp02","cp01","chief", "mayor","otap","ota","ghost","otaking"}
}

TeamRadio.radioChannel[2] = {
	channelName = "Milice 05",
	channelColor = Color( 0, 0, 255 ),
	jobs = { "cpm","cps","gundealerpc","cpsm","cp05","cp04","cp03","cp02","cp01","chief", "mayor"}
}

TeamRadio.radioChannel[3] = {
	channelName = "Milice 04",
	channelColor = Color( 0, 0, 255 ),
	jobs = { "cps","gundealerpc","cpsm","cp04","cp03","cp02","cp01","chief", "mayor"}
}

TeamRadio.radioChannel[4] = {
	channelName = "Milice 03",
	channelColor = Color( 0, 0, 255 ),
	jobs = { "cps","cpsm","cp03","cp02","cp01","chief", "mayor"}
}

TeamRadio.radioChannel[5] = {
	channelName = "Milice 02",
	channelColor = Color( 0, 0, 255 ),
	jobs = { "cps","cpsm","cp02","cp01","chief", "mayor"}
}

TeamRadio.radioChannel[6] = {
	channelName = "Milice 01",
	channelColor = Color( 0, 0, 255 ),
	jobs = { "cps","gundealerpc","cpsm","cp01","chief", "mayor","otap","ota","ghost","otaking"}
}

TeamRadio.radioChannel[7] = {
	channelName = "O.T.A",
	channelColor = Color( 0, 0, 255 ),
	jobs = { "mayor","otap","ota","otaking"}
}

TeamRadio.radioChannel[8] = {
	channelName = "C.W.U",
	channelColor = Color( 0, 0, 255 ),
	jobs = { "cwu","cwuF","cwuC","cwuM","cpm","cp","cps","gundealerpc","cpsm","cp05","cp04","cp03","cp02","cp01","chief", "mayor","otap","ota","ghost","otaking"}
}

TeamRadio.radioChannel[9] = {
	channelName = "Résistance",
	channelColor = Color( 0, 0, 255 ),
	jobs = { "gangster" ,"gangsterC","gangsterF","gangstermedF","gangstermed","mobboss","mobbossf","gangsterpc","chiefrebelle" }
}