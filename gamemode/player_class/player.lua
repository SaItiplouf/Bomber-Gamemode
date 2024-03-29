AddCSLuaFile()
DEFINE_BASECLASS( "player_default" )
local PLAYER = {}
function PLAYER:SetModel()
    self.Player:SetModel( "models/player/odessa.mdl" )
end

function PLAYER:Spawn()
    local oTeamColor = team.GetColor(self.Player:Team())
    self.Player:SetPlayerColor( oTeamColor:ToVector() )
end

player_manager.RegisterClass( "player_custom", PLAYER, "player_default" )