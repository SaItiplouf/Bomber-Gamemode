AddCSLuaFile()
DEFINE_BASECLASS( "player_default" )
local PLAYER = {}

function PLAYER:Loadout()
    self.Player:Give( "weapon_rpg" )
    self.Player:GiveAmmo( 999, "RPG_Round" )
end

function PLAYER:SetModel()
    self.Player:SetModel( "models/player/odessa.mdl" )
end

player_manager.RegisterClass( "player_red", PLAYER, "player_custom" )