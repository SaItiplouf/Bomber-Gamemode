util.AddNetworkString("open_lobby")
util.AddNetworkString("start_game")

function enterLobby(ply)
    print(ply:Team())
    if ply:Team() == 0 then
        net.Start("open_lobby")
        net.Send(ply)
    end
end
net.Receive("start_game", function()
    beginRound()
end)

hook.Add("PlayerInitialSpawn", "Openplayerlobby", enterLobby)