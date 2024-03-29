AddCSLuaFile()
DEFINE_BASECLASS( "player_default" )
local PLAYER = {}
function PLAYER:Spawn()
    local tTeamColor = team.GetColor(self.Player:Team())
    self.Player:SetPlayerColor(Vector(tTeamColor.r / 255, tTeamColor.g / 255, tTeamColor.b / 255))
    -- self.Player:SetPos(Vector(-4612.067383, 377.925354, 124.851517))
end

function PLAYER:Loadout()
    self.Player:Give( "weapon_rpg" )
    self.Player:GiveAmmo( 999, "RPG_Round" )
end

function PLAYER:SetModel()
    self.Player:SetModel( "models/player/odessa.mdl" )
end

player_manager.RegisterClass( "player_red", PLAYER, "player_custom" )