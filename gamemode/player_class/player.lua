AddCSLuaFile()
DEFINE_BASECLASS( "player_default" )

 local PLAYER = {}

function PLAYER:SetModel()
    self.Player:SetModel( "models/player/odessa.mdl" )
end

player_manager.RegisterClass( "player_custom", PLAYER, "player_default" )