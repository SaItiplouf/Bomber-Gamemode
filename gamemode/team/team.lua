TEAM_RED = 1
TEAM_BLUE = 2

-- Fonction pour initialiser les équipes
function GM:CreateTeams()
    team.SetUp(TEAM_RED, "Red Team", Color(255, 0, 0))
    team.SetUp(TEAM_BLUE, "Blue Team", Color(0, 0, 255))
end
