
timer.Simple(5, function()

AddEntity("Table de craft", { 
ent = "crafting_table", 
model = "models/props_wasteland/controlroom_desk001b.mdl", 
price = 2000, 
max = 1, 
cmd = "buythecraftingtable",
allowed = {TEAM_ADMIN,TEAM_CHIEF_REBELLE,TEAM_GUN} 
}) 

AddEntity("Bois", { 
ent = "wood", 
model = "models/props_phx/construct/wood/wood_boardx1.mdl", 
price = 250, 
max = 15, 
cmd = "buythewood", 
allowed = {TEAM_ADMIN,TEAM_GUN} 
}) 

AddEntity("Ressort", { 
ent = "spring", 
model = "models/props_c17/TrapPropeller_Lever.mdl", 
price = 250, 
max = 15, 
cmd = "buythespring", 
allowed = {TEAM_ADMIN,TEAM_GUN} 
}) 

AddEntity("Clé", { 
ent = "wrench", 
model = "models/props_c17/tools_wrench01a.mdl", 
price = 250, 
max = 15, 
cmd = "buythewrench", 
allowed = {TEAM_ADMIN,TEAM_GUN} 
}) 

AddEntity("Barre de fer", { 
ent = "ironbar", 
model = "models/Items/CrossbowRounds.mdl", 
price = 250, 
max = 15, 
cmd = "buytheironbar", 
allowed = {TEAM_ADMIN,TEAM_GUN} 
}) 

end)