include("shared.lua")

include("round_controller/cl_round_controller.lua")

include("thirdperson.lua")
include("team/cl_showteam.lua")

function GM:InitPostEntity()
    net.Start("client_ready")
    net.SendToServer()
end


