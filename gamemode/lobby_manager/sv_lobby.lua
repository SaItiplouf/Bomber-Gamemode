util.AddNetworkString("open_lobby")
util.AddNetworkString("start_game")

function EnterLobby(ply)
    print(ply:Team())
    if ply:Team() == 0 then
        net.Start("open_lobby")
        net.Send(ply)
    end
end
net.Receive("start_game", function()
    BeginRound()
end)

hook.Add("PlayerInitialSpawn", "Openplayerlobby", EnterLobby)