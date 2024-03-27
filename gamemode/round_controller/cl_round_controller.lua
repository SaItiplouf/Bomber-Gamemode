local round_status = 0
local iTeamRedScore = 0
local iTeamBlueScore = 0

function GM:HUDPaint()
    local redScoreX = ScrW() - 200
    local redScoreY = 20
    local blueScoreX = ScrW() - 200
    local blueScoreY = 60
    draw.SimpleText("Équipe Rouge : " .. iTeamRedScore, "DermaLarge", redScoreX, redScoreY, Color(255, 0, 0), TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)
    draw.SimpleText("Équipe Bleue : " .. iTeamBlueScore, "DermaLarge", blueScoreX, blueScoreY, Color(0, 0, 255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)
end

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

