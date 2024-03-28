local function thirdPerson(pPlayer, vOrigin, aAngle, iFov)
    if not pPlayer:GetNWBool("ThirdPerson", false) then return end
    local tView = {}
    tView.origin = vOrigin - (aAngle:Forward() * 100) + (aAngle:Up() * 20)
    tView.angles = aAngle
    tView.fov = iFov
    tView.drawtViewer = true
    return tView
end

function GM:CalcView(pPlayer, vOrigin, aAngle, iFov)
    return thirdPerson(pPlayer, vOrigin, aAngle, iFov)
end