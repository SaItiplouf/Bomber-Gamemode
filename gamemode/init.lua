AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
-- Include others scripts
AddCSLuaFile("round_controller/cl_round_controller.lua")
include("round_controller/sv_round_controller.lua")
include("lobby_manager/sv_lobby.lua")
include("boom/sv_boom.lua")
AddCSLuaFile("thirdperson.lua")
include("shared.lua")
function GM:PlayerInitialSpawn(ply)
    GAMEMODE:PlayerSpawnAsSpectator(ply)
    print("Player " .. ply:Name() .. " has spawned")
    ply:SetCustomCollisionCheck(true)
end