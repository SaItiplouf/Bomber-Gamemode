TEAM_RED = 1
TEAM_BLUE = 2

function GM:CreateTeams()
    team.SetUp(TEAM_RED, "Red Team", Color(255, 0, 0))
    team.SetUp(TEAM_BLUE, "Blue Team", Color(0, 0, 255))
    team.SetUp(TEAM_SPECTATOR, "Spectateur", Color(150, 150, 150))
    team.SetSpawnPoint( TEAM_SPECTATOR, "worldspawn" )
end

function GM:PlayerSetModel( ply )
    ply:SetModel( "models/player/odessa.mdl" )
end

function GM:OnPlayerChangedTeam(ply, oldTeam, newTeam)
    if IsValid(ply) and ply:IsPlayer() then
        if ply:Team() == TEAM_BLUE then
            ply:SetPlayerColor(Vector(0, 0, 1))
        elseif ply:Team() == TEAM_RED then
            ply:SetPlayerColor(Vector(1, 0, 0))
        end
    end
end

function GM:PlayerSpawn(ply)
    self.BaseClass:PlayerSpawn(ply)

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