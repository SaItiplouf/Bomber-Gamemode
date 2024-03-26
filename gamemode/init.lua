AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

-- Include others scripts
AddCSLuaFile("round_controller/cl_round_controller.lua")
include("round_controller/sv_round_controller.lua")


include("shared.lua")

function GM:PlayerInitialSpawn(ply)
    print("Player " .. ply:Name() .. " has spawned")
end