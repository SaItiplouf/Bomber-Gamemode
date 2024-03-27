function OpenLobby()
    local frame = vgui.Create("DFrame")
    frame:SetSize(ScrW(), ScrH())
    frame:Center()
    frame:SetVisible(true)
    frame:ShowCloseButton(false)
    frame:SetDraggable(false)
    frame:SetTitle("")
    frame.Paint = function (s, w, h)
        draw.RoundedBox(0, 0, 0, w, h, Color(0, 0, 0, 255))
    end
    frame:MakePopup()

    local redButton = vgui.Create("DButton", frame)
    redButton:SetSize(200, 75)
    redButton:SetPos(ScrW() / 2 - 250, ScrH() / 2 - (75 / 2))
    redButton:SetText("Join Red Team")
    redButton.DoClick = function()
        net.Start("join_red_team")
        net.SendToServer()
        frame:Close()
    end

    local blueButton = vgui.Create("DButton", frame)
    blueButton:SetSize(200, 75)
    blueButton:SetPos(ScrW() / 2 + 50, ScrH() / 2 - (75 / 2))
    blueButton:SetText("Join Blue Team")
    blueButton.DoClick = function()
        net.Start("join_blue_team")
        net.SendToServer()
        frame:Close()
    end
end


net.Receive("open_lobby", OpenLobby)
