function GM:ShowTeam()
    if IsValid(self.TeamSelectFrame) then return end
    self.TeamSelectFrame = vgui.Create("DFrame")
    self.TeamSelectFrame:SetSize(ScrW(), ScrH())
    self.TeamSelectFrame:Center()
    self.TeamSelectFrame:SetVisible(true)
    self.TeamSelectFrame:ShowCloseButton(false)
    self.TeamSelectFrame:SetDraggable(false)
    self.TeamSelectFrame:SetTitle("")
    self.TeamSelectFrame.Paint = function(s, w, h) draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 200)) end
    self.TeamSelectFrame:MakePopup()
    local AllTeams = team.GetAllTeams()
    local buttonY = ScrH() / 2 - (#AllTeams * 30) / 2
    for teamID, teamInfo in pairs(AllTeams) do
        if teamID ~= TEAM_CONNECTING and teamID ~= TEAM_UNASSIGNED then
            local teamButton = vgui.Create("DButton", self.TeamSelectFrame)
            teamButton:SetSize(200, 30)
            teamButton:SetPos(ScrW() / 2 - 100, buttonY)
            teamButton:SetText("")
            teamButton:SetTextColor(Color(255, 255, 255))
            teamButton.Paint = function(s, w, h)
                if teamButton:IsHovered() then
                    draw.RoundedBox(0, 0, 0, w, h, teamInfo.Color)
                else
                    draw.RoundedBox(0, 0, 0, w, h, Color(teamInfo.Color.r, teamInfo.Color.g, teamInfo.Color.b, 200))
                end

                draw.SimpleText(teamInfo.Name, "Trebuchet24", w / 2, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
            end

            teamButton.DoClick = function()
                RunConsoleCommand("changeteam", teamID)
                self.TeamSelectFrame:Close()
            end

            buttonY = buttonY + 40
        end
    end
end