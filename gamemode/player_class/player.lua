AddCSLuaFile()
DEFINE_BASECLASS( "player_default" )
local PLAYER = {}
function PLAYER:SetModel()
    self.Player:SetModel( "models/player/odessa.mdl" )
end

function PLAYER:Spawn()
    local tTeamColor = team.GetColor(self.Player:Team())
    self.Player:SetPlayerColor(Vector(tTeamColor.r / 255, tTeamColor.g / 255, tTeamColor.b / 255))
end

player_manager.RegisterClass( "player_custom", PLAYER, "player_default" )