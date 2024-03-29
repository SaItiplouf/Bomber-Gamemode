local iRoundStatus = 0

function GM:HUDPaint()

    local iHudWidth, iHudHeight = 250, 50
    local iHudX = ( ScrW() - iHudWidth ) / 2
    local iHudY = 20

    draw.RoundedBox(8, iHudX, iHudY, iHudWidth, iHudHeight, Color(0, 0, 0, 150))

    local sRoundText
    if iRoundStatus == 0 then
        sRoundText = "Round in progress.."
    else
        sRoundText = "Round is finishing"
    end

    local iTextX = iHudX + iHudWidth / 2
    local iTextY = iHudY + iHudHeight / 2
    draw.SimpleText(sRoundText, "DermaLarge", iTextX, iTextY, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

    if iRoundStatus == 0 then
        local iYoffset = 20
        for iTeamIndex, tTeamData in pairs(team.GetAllTeams()) do
            if tTeamData.Joinable and iTeamIndex ~= 1002 then
                local tTeamColor = team.GetColor( iTeamIndex )
                local sTeamName = team.GetName( iTeamIndex )
                local iTeamScore = team.GetScore( iTeamIndex )
                draw.SimpleText( sTeamName .. " : " .. iTeamScore, "DermaLarge", ScrW() - 200, iYoffset, tTeamColor, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )
                iYoffset = iYoffset + 40
            end
        end
    end
end


net.Receive( "Monolith.Game.UpdateRoundStatus", function(_)
    iRoundStatus = net.ReadInt(4)
    print(iRoundStatus)
end )

function GetRoundStatus()
    return iRoundStatus
end
