function GM:CalcView(ply, origin, angles, fov)
    if ply:GetNWBool("Thirdperson", false) then
        local view = {}
        view.origin = origin - (angles:Forward() * 100) + (angles:Up() * 20)
        view.angles = angles
        view.fov = fov
        view.drawviewer = true
        return view
    end
end