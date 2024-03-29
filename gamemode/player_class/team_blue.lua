AddCSLuaFile()
DEFINE_BASECLASS( "player_default" )
local PLAYER = {}
function PLAYER:Spawn()
    local tTeamColor = team.GetColor(self.Player:Team())
    self.Player:SetPlayerColor(Vector(tTeamColor.r / 255, tTeamColor.g / 255, tTeamColor.b / 255))
    -- self.Player:SetPos(Vector(-2923.273926, -1253.170654, 240.031250))
end

function PLAYER:Loadout()
    self.Player:Give( "weapon_smg1" )
    self.Player:GiveAmmo( 255, "smg1" )
end

function PLAYER:SetModel()
    self.Player:SetModel( "models/player/odessa.mdl" )
end

player_manager.RegisterClass( "player_blue", PLAYER, "player_custom" )