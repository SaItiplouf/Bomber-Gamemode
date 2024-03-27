util.AddNetworkString("join_red_team")
util.AddNetworkString("join_blue_team")

function GetTeamPerks(ply)
    if IsValid(ply) and ply:IsPlayer() then
        if ply:Team() == TEAM_BLUE then
            ply:Give("weapon_smg1")
            ply:GiveAmmo(255, "smg1")
            ply:SetPos(Vector(-2923.273926, -1253.170654, 240.031250))
        elseif ply:Team() == TEAM_RED then
            ply:Give("weapon_rpg")
            ply:GiveAmmo(999, "RPG_Round")
            ply:SetPos(Vector(-4612.067383, 377.925354, 124.851517))
        end
    end
end

net.Receive("join_red_team", function(len, ply)
    GAMEMODE:PlayerJoinTeam(ply, TEAM_RED)
end)

net.Receive("join_blue_team", function(len, ply)
    GAMEMODE:PlayerJoinTeam(ply, TEAM_BLUE)
end)



hook.Add("PlayerSpawn", "SpawnAtTeamSpawnpoint", function(ply)
    GetTeamPerks(ply)
end)

