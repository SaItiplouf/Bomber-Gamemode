util.AddNetworkString("start_game")
util.AddNetworkString( "client_ready" )

local function EnterLobby(ply)
    GAMEMODE:ShowTeam(ply)
end

net.Receive("start_game", function()
    BeginRound()
end)


net.Receive( "client_ready", function( len, ply )
    EnterLobby(ply)
    ply:SetNWBool("ThirdPerson", true)
end )