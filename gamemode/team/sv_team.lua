util.AddNetworkString("join_red_team")
util.AddNetworkString("join_blue_team")

local function getTeamPerks(ply)
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
    if IsValid(ply) and ply:IsPlayer() then
        ply:SetTeam(TEAM_RED)
        ply:SetPlayerColor(Vector(1, 0, 0))
        ply:Spawn()
    end
end)

net.Receive("join_blue_team", function(len, ply)
    if IsValid(ply) and ply:IsPlayer() then
        ply:SetTeam(TEAM_BLUE)
        ply:SetPlayerColor(Vector(0, 0, 1))
        ply:Spawn()
    end
end)



hook.Add("PlayerSpawn", "SpawnAtTeamSpawnpoint", function(ply)
    getTeamPerks(ply)
    if ply:Team() == TEAM_RED then
        ply:SetPos(Vector(-4612.067383, 377.925354, 124.851517))
    elseif ply:Team() == TEAM_BLUE then
        ply:SetPos(Vector(-2923.273926, -1253.170654, 240.031250))
    end
end)


