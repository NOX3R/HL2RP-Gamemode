
if SERVER then
	AddCSLuaFile()
	AddCSLuaFile( "chess/sh_player_ext.lua" )
	AddCSLuaFile( "chess/cl_top.lua" )
	AddCSLuaFile( "chess/cl_dermaboard.lua" )
	
	include( "chess/sh_player_ext.lua" )
	include( "chess/sv_sql.lua" )
else
	include( "chess/sh_player_ext.lua" )
	include( "chess/cl_top.lua" )
	include( "chess/cl_dermaboard.lua" )
end

if SERVER then
	function ChessBoard_DoOverrides()
		if GAMEMODE.Name=="Cinema" then --Cinema overrides
			hook.Add("CanPlayerEnterVehicle", "EnterSeat", function(ply, vehicle) --Overrides default func
				if vehicle:GetClass() != "prop_vehicle_prisoner_pod" then return end

				if vehicle.Removing then return false end
				return (vehicle:GetOwner() == ply) or vehicle:GetNWBool( "IsChessSeat", false )
			end)
		end
	end
	hook.Add( "Initialize", "ChessBoardOverrides", ChessBoard_DoOverrides )
end