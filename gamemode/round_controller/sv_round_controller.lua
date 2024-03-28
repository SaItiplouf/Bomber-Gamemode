local iRoundStatus = 0
local iTeamRedScore = 0
local iTeamBlueScore = 0
util.AddNetworkString( "Monolith.Game.UpdateRoundStatus" )
util.AddNetworkString( "Monolith.Game.UpdateTeamScore" )
local function UpdateClientScore()
    net.Start( "Monolith.Game.UpdateTeamScore" )
    net.WriteInt( iTeamRedScore, 4 )
    net.WriteInt( iTeamBlueScore, 4)
    net.Broadcast()
end

local function UpdateClientRoundStatus()
    net.Start( "Monolith.Game.UpdateRoundStatus" )
    net.WriteInt( iRoundStatus, 4 )
    net.Broadcast()
end

local function EndRound()
    iRoundStatus = 0
    iTeamRedScore = 0
    iTeamBlueScore = 0
    updateClientRoundStatus()
    updateClientScore()
    for _, pPlayer in ipairs( player.GetAll() ) do
        pPlayer:KillSilent()
        GetTeamPerks( pPlayer )
    end
end

function BeginRound()
    iRoundStatus = 1
    UpdateClientRoundStatus()
end

function GetRoundStatus()
    return iRoundStatus
end

function IncrementScore( pPlayer )
    if pPlayer:Team() == TEAM_RED then
        iTeamRedScore = iTeamRedScore + 1
    elseif pPlayer:Team() == TEAM_BLUE then
        iTeamBlueScore = iTeamBlueScore + 1
    end

    if iTeamRedScore == 10 or iTeamBlueScore == 10 then
        EndRound()
        return
    end

    UpdateClientScore()
end