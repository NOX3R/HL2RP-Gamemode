/*#################################################
###          PlainHUD config file
#################################################*/

-- Use RGB color codes! ( r,g,b,alpha )

-- Alternative layout (HP/Armor/Hunger/License/etc)
PlainHUD.Alternative     = true

-- Hide hud when menu/chat/scoreboard is open
PlainHUD.HideOnMenu      = true

-- Main HUD colors
PlainHUD.ColorMain       = Color(0,0,0,220)
PlainHUD.ColorText       = Color(255,255,255,255)
PlainHUD.ColorAgendaText = Color(200,200,200,230)

-- Health & Armor bars
PlainHUD.DrawHPArmor     = true
PlainHUD.ColorBar        = Color(0,0,0,255)
PlainHUD.ColorBarText    = Color(180,180,180,255)

PlainHUD.ColorBarHealth  = Color(220,40,40,255)
PlainHUD.DrawHPText      = true
PlainHUD.HPBlink         = 20    -- Bar blink threshold in %

PlainHUD.ColorBarArmor   = Color(40,40,220,255)
PlainHUD.DrawArmorText   = true
PlainHUD.ArmorBlink      = 20    -- Bar blink threshold in %

-- Weapon & ammo bars
PlainHUD.DrawAmmo        = true
PlainHUD.ColorAmmoBar    = Color(220,220,220,220)

-- Enable/disable elements (player avatar needs a reconnect)
PlainHUD.DrawAvatar      = false
PlainHUD.DrawWanted      = true
PlainHUD.DrawArrested    = true
PlainHUD.DrawArrestTime  = true
PlainHUD.DrawLicense     = true
PlainHUD.DrawTalking     = true
PlainHUD.DrawAdminTell   = true

-- Event sounds
PlainHUD.SoundArrested  = "doors/default_stop.wav"
PlainHUD.SoundAdminTell = "common/warning.wav"

-- Hunger bar
PlainHUD.DrawHunger      = true -- Only enable if hungermod is turned on
PlainHUD.HungerBlink     = 20    -- Bar blink threshold in %
PlainHUD.HungerWarning   = 1     -- Starving warning threshold in %
PlainHUD.ColorBarHunger  = Color(40,220,40,80)
PlainHUD.ColorStarvText  = Color(220,20,20,255)

-- Stamina support
PlainHUD.DrawStam        = true -- Only enable if you have a stamina mod
PlainHUD.StamBlink       = 10    -- Bar blink threshold in %
PlainHUD.ColorStamina    = Color(200,200,200,150)

-- Level system
PlainHUD.DrawLevel       = false -- Only enable if you use a level system
PlainHUD.DrawExp         = true
PlainHUD.ColorBarXP      = Color(240,240,240,150)

-- Pointshop
PlainHUD.DrawPS          = false -- Only enable if pointshop is installed

------------ Advanced configuration ------------

/*--   HUD icons 
It is possible to use the gmod builtin silkicons or every 16x16 icon available on the server.
Get the gmod icon list from here: http://www.famfamfam.com/lab/icons/silk/previews/index_abc.png
If you want to use your own icons make sure you place them somewhere in the materials folders because all icons will be loaded from there.
  Example:
    newusergrp = "myicons/group1.png"
    -> This would draw the "group1.png" from the materials/myicons/ folder for a new usergroup named "newusergrp"
*/

-- Usergroup icons
PlainHUD.UserGroups = {
    superadmin = "icon16/shield.png",
    admin = "icon16/shield.png",
    vip = "icon16/star.png"
}

/*--   Box configurations (Icons and colors for the information boxes of the hud)
It is possible to change the icon and color for every element.
Usualy a box will use PlainHUD.ColorMain for its background color, you can change this by adding a color value to the related table below
  Example:
    name = { "icon16/user.png" },      --- change to --->      name = { "icon16/user.png", Color(40,40,40,230) },
Do not add any icons to an element that has no icon entry!
*/
PlainHUD.Bars = {
    health = { "icon16/heart.png", Color(40,40,40,230) },
    armor = { "icon16/stop.png", Color(40,40,40,230) },
    name = { "icon16/user.png" },
    avatar = { Color(0,0,0,220) },
    job = { "" },
    money = { "icon16/money.png" },
    salary = { "icon16/table.png" },
    agenda = { "icon16/page.png", Color(0,0,0,220), Color(62,62,62,160) },
    lockdown = { "icon16/shield.png" },
    wanted = { "icon16/eye.png" },
    arrested = { "icon16/lock.png" },
    admintell = { "icon16/information.png" },
    license = { "icon16/gun.png", Color(0,100,0,220) },
    stamina = { Color(200,200,200,150) },
    hunger = { "icon16/cup.png", Color(40,40,40,230) },
    level = { "icon16/color_wheel.png" },
    pointshop = { "icon16/ruby.png" },
}

-- Modify shape of the boxes (advanced users only!)
-- Gmod Wiki: http://wiki.garrysmod.com/page/surface/DrawPoly
PlainHUD.Shape = function(BoxX,BoxY,BoxW,BoxH)
    return {{ -- Left side boxes
        { x = BoxX, y = BoxY },
        { x = BoxX+BoxW, y = BoxY },
        { x = BoxX+BoxW, y = BoxY+BoxH/2 },
        { x = BoxX+BoxW-BoxH/2, y = BoxY+BoxH },
        { x = BoxX, y = BoxY+BoxH}
    },{       -- Right side boxes
        { x = BoxX, y = BoxY },
        { x = BoxX+BoxW, y = BoxY },
        { x = BoxX+BoxW, y = BoxY+BoxH },
        { x = BoxX+BoxH/2, y = BoxY+BoxH },
        { x = BoxX, y = BoxY+BoxH-BoxH/2 }
    }}
end
