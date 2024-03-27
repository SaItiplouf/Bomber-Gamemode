hook.Add("HUDPaint", "DrawTeamScores", function()
    local redScoreX = ScrW() - 200
    local redScoreY = 20
    draw.SimpleText("Red Team: " .. iTeamRedScore, "DermaLarge", redScoreX, redScoreY, Color(255, 0, 0), TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)

    local blueScoreX = ScrW() - 200
    local blueScoreY = 60
    draw.SimpleText("Blue Team: " .. iTeamBlueScore, "DermaLarge", blueScoreX, blueScoreY, Color(0, 0, 255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)
end)