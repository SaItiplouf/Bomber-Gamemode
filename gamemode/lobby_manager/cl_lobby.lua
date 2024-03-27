function OpenLobby()
    local frame = vgui.Create("DFrame")
    frame:SetSize(ScrW(), ScrH())
    frame:Center()
    frame:SetVisible(true)
    frame:ShowCloseButton(false)
    frame:SetDraggable(false)
    frame:SetTitle("")

    frame.Paint = function(s, w, h)
        Derma_DrawBackgroundBlur(frame, frame.startTime)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 200))
    end
    frame:MakePopup()

    local redButton = vgui.Create("DButton", frame)
redButton:SetSize(200, 75)
redButton:SetPos(ScrW() / 2 - 250, ScrH() / 2 - (75 / 2))
redButton:SetText("")
redButton:SetTextColor(Color(255, 255, 255))
redButton.Paint = function(s, w, h)
    if redButton:IsHovered() then
        draw.RoundedBox(0, 0, 0, w, h, Color(255, 0, 0))
    else
        draw.RoundedBox(0, 0, 0, w, h, Color(255, 0, 0, 200))
    end

    draw.SimpleText("Team Red", "Trebuchet24", w / 2, h / 2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end
redButton.DoClick = function()
    net.Start("join_red_team")
    net.SendToServer()
    frame:Close()
end

local blueButton = vgui.Create("DButton", frame)
blueButton:SetSize(200, 75)
blueButton:SetPos(ScrW() / 2 + 50, ScrH() / 2 - (75 / 2))
blueButton:SetText("")
blueButton:SetTextColor(Color(255, 255, 255))
blueButton.Paint = function(s, w, h)
    if blueButton:IsHovered() then
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 200))
    else
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 255, 200))
    end

    draw.SimpleText("Team Blue", "Trebuchet24", w / 2, h / 2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
end
blueButton.DoClick = function()
    net.Start("join_blue_team")
    net.SendToServer()
    frame:Close()
end
    local specButton = vgui.Create("DButton", frame)
    specButton:SetSize(100, 30)
    specButton:SetPos(10, 10)
    specButton:SetText("Spectateur")
    specButton:SetTextColor(Color(255, 255, 255))
    specButton.Paint = function(s, w, h)
        if s:IsHovered() then
            draw.RoundedBox(0, 0, 0, w, h, Color(200, 200, 200, 200))
        else
            draw.RoundedBox(0, 0, 0, w, h, Color(150, 150, 150, 200))
        end
    end
    specButton.DoClick = function()
        frame:Close()
    end
end



net.Receive("open_lobby", OpenLobby)
