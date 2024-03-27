util.AddNetworkString("join_red_team")
util.AddNetworkString("join_blue_team")

net.Receive("join_red_team", function(len, ply)
    GAMEMODE:PlayerJoinTeam(ply, TEAM_RED)
end)

net.Receive("join_blue_team", function(len, ply)
    GAMEMODE:PlayerJoinTeam(ply, TEAM_BLUE)
end)




