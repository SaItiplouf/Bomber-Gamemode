TEAM_RED = 1
TEAM_BLUE = 2

function GM:CreateTeams()
    team.SetUp(TEAM_RED, "Red Team", Color(255, 0, 0))
    team.SetUp(TEAM_BLUE, "Blue Team", Color(0, 0, 255))
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