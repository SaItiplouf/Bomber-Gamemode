hook.Add("HUDPaint", "DrawTeamScores", function()
    -- Position de départ pour le score de la team rouge
    local redScoreX = ScrW() - 200
    local redScoreY = 20

    -- Dessiner le score de la team rouge
    draw.SimpleText("Red Team: " .. TEAM_RED_SCORE, "DermaLarge", redScoreX, redScoreY, Color(255, 0, 0), TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)

    -- Position de départ pour le score de la team bleue
    local blueScoreX = ScrW() - 200
    local blueScoreY = 60

    -- Dessiner le score de la team bleue
    draw.SimpleText("Blue Team: " .. TEAM_BLUE_SCORE, "DermaLarge", blueScoreX, blueScoreY, Color(0, 0, 255), TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP)
end)