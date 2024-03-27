local function thirdPerson(ply, origin, angles, fov)
    if not ply:GetNWBool("ThirdPerson", false) then return end
    local view = {}
    view.origin = origin - (angles:Forward() * 100) + (angles:Up() * 20)
    view.angles = angles
    view.fov = fov
    view.drawviewer = true
    return view
end

function GM:CalcView(ply, origin, angles, fov)
    thirdPerson(ply, origin, angles, fov)
end