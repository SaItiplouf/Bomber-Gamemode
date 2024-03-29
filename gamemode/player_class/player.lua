AddCSLuaFile()
DEFINE_BASECLASS( "player_default" )
local PLAYER = {}
function PLAYER:SetModel()
    self.Player:SetModel( "models/player/odessa.mdl" )
end

function PLAYER:Spawn()
    local oTeamColor = team.GetColor(self.Player:Team())
    self.Player:SetPlayerColor( Vector( oTeamColor.r / 255, oTeamColor.g / 255, oTeamColor.b / 255 ) )
end

player_manager.RegisterClass( "player_custom", PLAYER, "player_default" )