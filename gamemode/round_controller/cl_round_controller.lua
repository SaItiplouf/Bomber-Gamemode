local iRoundStatus = 0



local function DrawTeamText( iTeamIndex, iYoffset )
    local oTeamColor = team.GetColor( iTeamIndex )
    local sTeamName = team.GetName( iTeamIndex )
    local iTeamScore = team.GetScore( iTeamIndex )
    draw.SimpleText( sTeamName .. " : " .. iTeamScore, "DermaLarge", ScrW() - 200, iYoffset, oTeamColor, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )
end

function GM:HUDPaint()
    local iHudWidth, iHudHeight = 250, 50
    local iHudX = ( ScrW() - iHudWidth ) / 2
    local iHudY = 20

    draw.RoundedBox( 8, iHudX, iHudY, iHudWidth, iHudHeight, Color(0, 0, 0, 150) )

    local sRoundText = ( iRoundStatus == 0 ) and "Round in progress.." or "Round is finishing"

    local iTextX = iHudX + iHudWidth / 2
    local iTextY = iHudY + iHudHeight / 2
    draw.SimpleText( sRoundText, "DermaLarge", iTextX, iTextY, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER )
    local iYoffset = 20
    for iTeamIndex, tTeamData in pairs( team.GetAllTeams() ) do
        if iRoundStatus ~= 0 then continue end
        if not tTeamData.Joinable or iTeamIndex == TEAM_SPECTATOR then continue end
        DrawTeamText( iTeamIndex, iYoffset )
        iYoffset = iYoffset + 40
    end
end


net.Receive( "Monolith.Game.UpdateRoundStatus", function(_)
    iRoundStatus = net.ReadInt(4)
    print(iRoundStatus)
end )

function GetRoundStatus()
    return iRoundStatus
end
