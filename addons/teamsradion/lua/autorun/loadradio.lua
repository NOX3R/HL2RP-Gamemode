if SERVER then
	AddCSLuaFile("radio/sh_teamradio.lua")
	AddCSLuaFile("radio/sh_teamradioconfig.lua")
	AddCSLuaFile("radio/sh_teamradiolang.lua")
	AddCSLuaFile("radio/client/cl_teamradio.lua")

	include("radio/server/sv_teamradio.lua")
	resource.AddFile("resource/fonts/bebasneue.ttf")
end

include("radio/sh_teamradio.lua")
include("radio/sh_teamradioconfig.lua")
include("radio/sh_teamradiolang.lua")

if CLIENT then
	include("radio/client/cl_teamradio.lua")
end