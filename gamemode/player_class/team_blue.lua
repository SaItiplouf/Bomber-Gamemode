AddCSLuaFile()
DEFINE_BASECLASS("player_default")
local PLAYER = {}
function PLAYER:Spawn()
    self.Player:SetPlayerColor(Vector(0, 0, 1))
    -- self.Player:SetPos(Vector(-2923.273926, -1253.170654, 240.031250))
end

function PLAYER:Loadout()
    self.Player:Give("weapon_smg1")
    self.Player:GiveAmmo(255, "smg1")
end

function PLAYER:SetModel()
    self.Player:SetModel("models/player/odessa.mdl")
end

player_manager.RegisterClass("player_blue", PLAYER, "player_custom")