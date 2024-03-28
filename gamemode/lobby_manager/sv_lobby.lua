util.AddNetworkString( "Monolith.Client.Ready" )
local function EnterLobby( pPlayer )
    GAMEMODE:ShowTeam( pPlayer )
end

net.Receive( "Monolith.Client.Ready", function( _, pPlayer )
    EnterLobby( pPlayer )
    pPlayer:SetNWBool( "ThirdPerson", true )
    print( "thirdperson" )
end)