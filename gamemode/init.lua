AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")

-- Include others scripts
AddCSLuaFile("round_controller/cl_round_controller.lua")
include("round_controller/sv_round_controller.lua")

AddCSLuaFile("lobby_manager/cl_lobby.lua")
include("lobby_manager/sv_lobby.lua")

include("team/sv_team.lua")
include("team/team.lua")


include("shared.lua")

function GM:PlayerInitialSpawn(ply)
    print("Player " .. ply:Name() .. " has spawned")
    ply:SetNWBool("ThirdPerson", true)
end

function GM:PlayerSetModel( ply )
ply:SetModel( "models/player/odessa.mdl" )
end

