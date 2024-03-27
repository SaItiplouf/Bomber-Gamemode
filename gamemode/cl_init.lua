include("shared.lua")

include("round_controller/cl_round_controller.lua")
include("lobby_manager/cl_lobby.lua")

include("thirdperson.lua")

function GM:InitPostEntity()
    net.Start("client_ready")
    net.SendToServer()
end