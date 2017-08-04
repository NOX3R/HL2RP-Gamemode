--[[---------------------------------------------------------------------------
DarkRP Agenda's
---------------------------------------------------------------------------
Agenda's can be set by the agenda manager and read by both the agenda manager and the other teams connected to it.


HOW TO MAKE AN AGENDA:
AddAgenda(Title of the agenda, Manager (who edits it), {Listeners (the ones who just see and follow the agenda)})
---------------------------------------------------------------------------]]
-- Example: AddAgenda("Gangster's agenda", TEAM_MOB, {TEAM_GANG})
-- Example: AddAgenda("Police agenda", TEAM_MAYOR, {TEAM_CHIEF, TEAM_POLICE})


AddAgenda("Directives Rebelle", TEAM_CHIEF_REBELLE, {TEAM_REB, TEAM_REBF,TEAM_REB_MED,TEAM_REB_MEDF,TEAM_REB_ELITE,TEAM_REB_ELITEF,TEAM_REB_PC,TEAM_REBC})
AddAgenda("Directives Union", TEAM_CHIEF, {TEAM_OTA_PRISON,TEAM_MAYOR,TEAM_POLICE_RCT, TEAM_POLICE_05, TEAM_POLICE_04, TEAM_POLICE_03, TEAM_POLICE_02 , TEAM_POLICE_01, TEAM_GUNPC, TEAM_SCN, TEAM_SCN_MINE,TEAM_OTA,TEAM_OTA_KING,TEAM_CHIEF,TEAM_POLICEC,TEAM_POLICE_GHOST})
AddAgenda("Civil Worker Union", TEAM_CWUS, {TEAM_CWU,TEAM_CWUF,TEAM_CWUM,TEAM_CWUS,TEAM_COOK})
