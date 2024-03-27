local round_status = 0
local TEAM_RED_SCORE = 0
local TEAM_BLUE_SCORE = 0

util.AddNetworkString("UpdateRoundStatus")
util.AddNetworkString("UpdateTeamScore")

function beginRound()
    round_status = 1
    updateClientRoundStatus()
end

function endRound()
    round_status = 0
    TEAM_RED_SCORE = 0
    TEAM_BLUE_SCORE = 0
    updateClientRoundStatus()
    updateClientScore()
    for _, ply in ipairs(player.GetAll()) do
        ply:KillSilent()
        getTeamPerks(ply)
    end
end

function getRoundStatus()
    return round_status
end


function incrementScore(ply)
    if ply:Team() == TEAM_RED then
        TEAM_RED_SCORE = TEAM_RED_SCORE + 1
    elseif ply:Team() == TEAM_BLUE then
        TEAM_BLUE_SCORE = TEAM_BLUE_SCORE + 1
    end
    if TEAM_RED_SCORE == 3 or TEAM_BLUE_SCORE == 3 then
        endRound()
        return
    end
    updateClientScore()

end

function updateClientScore()
    net.Start("UpdateTeamScore")
    net.WriteInt(TEAM_RED_SCORE, 4)
    net.WriteInt(TEAM_BLUE_SCORE, 4)
    net.Broadcast()
end

function updateClientRoundStatus()
    net.Start("UpdateRoundStatus")
     net.WriteInt(round_status, 4)
    net.Broadcast()
end
