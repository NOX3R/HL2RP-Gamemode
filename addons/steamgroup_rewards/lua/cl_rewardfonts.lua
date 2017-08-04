--Modern MOTD Fonts
local function LoadModernMOTDFonts()
if REWARDS.FontsLoaded then return end
print("loaded rewards fonts")
surface.CreateFont("Bebas24Font", {font = "Bebas Neue", size= 24, weight = 400, antialias = true } ) --Font used for menu bar
REWARDS.FontsLoaded = true
end
LoadModernMOTDFonts()
hook.Add("InitPostEntity", "REWARDS_InitPostLoadFonts", LoadModernMOTDFonts)