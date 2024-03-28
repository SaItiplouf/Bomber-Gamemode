local iRoundStatus = 0
local iTeamRedScore = 0
local iTeamBlueScore = 0
function GM:HUDPaint()
    local redScoreX = ScrW() - 200
    local redScoreY = 20
    local blueScoreX = ScrW() - 200
    local blueScoreY = 60
    draw.SimpleText('Red Team : ' .. iTeamRedScore, 'DermaLarge', redScoreX, redScoreY, Color(255, 0, 0), TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)
    draw.SimpleText('Blue Team : ' .. iTeamBlueScore, 'DermaLarge', blueScoreX, blueScoreY, Color(0, 0, 255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)
end

net.Receive('Monolith.Game.UpdateRoundStatus', function(len) iRoundStatus = net.ReadInt(4) end)
net.Receive('Monolith.Game.UpdateTeamScore', function(len)
    iTeamRedScore = net.ReadInt(4)
    iTeamBlueScore = net.ReadInt(4)
end)

function GetRoundStatus()
    return iRoundStatus
end