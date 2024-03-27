hook.Add("CalcView", "ThirdPersonView", function(ply, pos, angles, fov)
    if LocalPlayer():GetNWBool("Thirdperson", false) then
    local view = {}
    view.origin = pos - (angles:Forward() * 100) + (angles:Up() * 20) -- Ajustez ces valeurs selon vos préférences
    view.angles = angles
    view.fov = fov
    view.drawviewer = true
    return view
end
end)
