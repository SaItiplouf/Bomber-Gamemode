AddCSLuaFile()
DEFINE_BASECLASS( "player_default" )
local PLAYER = {}

function PLAYER:Loadout()
    self.Player:Give( "weapon_smg1" )
    self.Player:GiveAmmo( 255, "smg1" )
end

player_manager.RegisterClass( "player_blue", PLAYER, "player_custom" )