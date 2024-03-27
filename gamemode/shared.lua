GM.NAME = "Bomber.exe"
GM.Prefix			= "bmbexe"
GM.Author 			= "ShawN"
GM.TeamBased 		= true

include("team/team.lua")

function GM:Initialize()
    self.BaseClass.Initialize(self)
end

