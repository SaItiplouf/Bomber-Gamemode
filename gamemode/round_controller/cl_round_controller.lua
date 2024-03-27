local round_status = 0
local iTeamRedScore = 0
local iTeamBlueScore = 0

include("cl_score_hud.lua")

net.Receive("UpdateRoundStatus", function(len)
    round_status = net.ReadInt(4)
end)

net.Receive("UpdateTeamScore", function(len)
    iTeamRedScore = net.ReadInt(4)
    iTeamBlueScore = net.ReadInt(4)
end)

function GetRoundStatus()
    return round_status
end

