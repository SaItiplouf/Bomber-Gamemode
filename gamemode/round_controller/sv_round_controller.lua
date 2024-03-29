util.AddNetworkString( "Monolith.Game.UpdateRoundStatus" )
local iRoundStatus = 0


local function UpdateClientRoundStatus()
    net.Start( "Monolith.Game.UpdateRoundStatus" )
    net.WriteInt( iRoundStatus, 4 )
    net.Broadcast()
end

local function EndRound()
    iRoundStatus = 1
    UpdateClientRoundStatus()
    for _, pPlayer in ipairs( player.GetAll() ) do
        if pPlayer:Team() ~= TEAM_SPECTATOR then
            pPlayer:KillSilent()
        end
    end
    timer.Simple(5, function()
        BeginRound()
    end)
end


function BeginRound()
    iRoundStatus = 0
    UpdateClientRoundStatus()
end

function GetRoundStatus()
    return iRoundStatus
end

function IncrementScore( pPlayer )
    local iTeamIndex = pPlayer:Team()
    team.AddScore( iTeamIndex, 1 )

    if team.GetScore( iTeamIndex ) >= 3 then
        local tTeams = team.GetAllTeams()
        for iTeam, _ in pairs(tTeams) do
             team.SetScore(iTeam, 0)
        end

        EndRound()
        return
    end
end

-- Block respawn when round is over
function GM:PlayerDeathThink( pPlayer )
    if pPlayer:Team() ~= TEAM_SPECTATOR and iRoundStatus == 1 then
        return false
    end
    pPlayer:Spawn()
    return true
end
