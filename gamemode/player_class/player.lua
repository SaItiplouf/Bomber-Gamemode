DEFINE_BASECLASS( "player_default" )

 local PLAYER = {}

 function PLAYER:Spawn()
    if self.Player:Team() == TEAM_BLUE then
        self.Player:Give("weapon_smg1")
        self.Player:GiveAmmo(255, "smg1")
        self.Player:SetPos(Vector(-2923.273926, -1253.170654, 240.031250))
    elseif self.Player:Team() == TEAM_RED then
        self.Player:Give("weapon_rpg")
        self.Player:GiveAmmo(999, "RPG_Round")
        self.Player:SetPos(Vector(-4612.067383, 377.925354, 124.851517))
    end
end

function PLAYER:SetModel()
    self.Player:SetModel( "models/player/odessa.mdl" )
end

player_manager.RegisterClass( "player_custom", PLAYER, "player_default" )y