TEAM_RED = 1
TEAM_BLUE = 2

function GM:CreateTeams()
    team.SetUp( TEAM_RED, "Red Team", Color(255, 0, 0) )
    team.SetClass( TEAM_RED, { "player_red" } )
    team.SetUp( TEAM_BLUE, "Blue Team", Color(0, 162, 255) )
    team.SetClass( TEAM_BLUE, { "player_blue" } )
    team.SetUp( TEAM_SPECTATOR, "Spectateur", Color(150, 150, 150) )
    team.SetSpawnPoint( TEAM_SPECTATOR, "worldspawn" )
end

function GM:PlayerChangedTeam( pPlayer, _, iNewTeam )
    if not iNewTeam or iNewTeam == TEAM_SPECTATOR then return end
    local oPlayerClass = team.GetClass( iNewTeam )
    player_manager.SetPlayerClass( pPlayer, oPlayerClass[math.random(1, #oPlayerClass)] )
end