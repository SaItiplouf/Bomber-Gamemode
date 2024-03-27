local round_status = 0
local TEAM_RED_SCORE = 0
local TEAM_BLUE_SCORE = 0

include("cl_score_hud.lua")

net.Receive("UpdateRoundStatus", function(len)
    round_status = net.ReadInt(4)
end)

net.Receive("UpdateTeamScore", function(len)
    TEAM_RED_SCORE = net.ReadInt(4)
    TEAM_BLUE_SCORE = net.ReadInt(4)
end)

function getRoundStatus()
    return round_status
end

