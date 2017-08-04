--[[---------------------------------------------------------------------------
Door groups
---------------------------------------------------------------------------
The server owner can set certain doors as owned by a group of people, identified by their jobs.


HOW TO MAKE A DOOR GROUP:
AddDoorGroup("NAME OF THE GROUP HERE, you will see this when looking at a door", Team1, Team2, team3, team4, etc.)
---------------------------------------------------------------------------]]


-- Example: AddDoorGroup("Cops and Mayor only", TEAM_CHIEF, TEAM_POLICE, TEAM_MAYOR)
-- Example: AddDoorGroup("Gundealer only", TEAM_GUN)

AddDoorGroup("Administrateur et Milice", TEAM_CHIEF, TEAM_POLICEC,TEAM_POLICE_RCT,TEAM_POLICE_05,TEAM_POLICE_04,TEAM_POLICE_03,TEAM_POLICE_02,
TEAM_POLICE_01, TEAM_MAYOR,TEAM_OTA,TEAM_GUNPC,TEAM_OTA_KING,TEAM_POLICE_GHOST,TEAM_OTA_PRISON)
AddDoorGroup("Civil Worker Union", TEAM_CWU,TEAM_CWUF,TEAM_CWUS,TEAM_CWUM,TEAM_COOK)
AddDoorGroup("Résistance", TEAM_REB_PC, TEAM_REB,TEAM_REBF,TEAM_REB_MED,TEAM_REB_MEDF,TEAM_REB_ELITE,TEAM_REB_ELITEF,TEAM_CHIEF_REBELLE,TEAM_REBC)