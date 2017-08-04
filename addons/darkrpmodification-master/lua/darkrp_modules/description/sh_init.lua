
/*---------------------------------------------------------------------------
Chat commands
---------------------------------------------------------------------------*/
DarkRP.declareChatCommand{
	command = "description",
	description = "Permet de rajouter une description physique",
	delay = 1.5
}

DarkRP.declareChatCommand{
	command = "setdescription",
	description = "Permet de rajouter une description physique via menu",
	delay = 1.5
}

DarkRP.registerDarkRPVar("Description", net.WriteString, net.ReadString)