GM.NAME = "Bomber.exe"
GM.Prefix = "bmbexe"
GM.Author = "ShawN"
GM.TeamBased = true
include("team/team.lua")
include("player_class/player.lua")
include("player_class/team_blue.lua")
include("player_class/team_red.lua")
function GM:Initialize()
    self.BaseClass.Initialize(self)
end