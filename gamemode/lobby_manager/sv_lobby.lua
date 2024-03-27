util.AddNetworkString("open_lobby")
util.AddNetworkString("start_game")
util.AddNetworkString( "client_ready" )

function EnterLobby(ply)
    print(ply:Team())
    net.Start("open_lobby")
    net.Send(ply)
end

net.Receive("start_game", function()
    BeginRound()
end)


net.Receive( "client_ready", function( len, ply )
    EnterLobby(ply)
    ply:SetNWBool("ThirdPerson", true)
end )