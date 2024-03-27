local function CreateExplosion(ent1, ent2)
    local collisionDistance = 50
    if ent1:GetPos():Distance(ent2:GetPos()) <= collisionDistance then
        print("Collision entre deux joueurs: " .. ent1:Name() .. " et " .. ent2:Name())
        local explosionPos = (ent1:GetPos() + ent2:GetPos()) / 2
        util.ScreenShake(explosionPos, 5, 5, 1, 500)
        ent1:EmitSound("ambient/explosions/explode_4.wav", 100, 100)
        local effectdata = EffectData()
        effectdata:SetStart(explosionPos)
        effectdata:SetOrigin(explosionPos)
        effectdata:SetScale(1)
        util.Effect("Explosion", effectdata)
        ent1:Kill()
        IncrementScore(ent2)
    end
end

function GM:ShouldCollide(ent1, ent2)
    if ent1:IsPlayer() and ent2:IsPlayer() then
        if not (ent1:Alive() and ent2:Alive() and ent1:Team() ~= ent2:Team()) then return false end
        CreateExplosion(ent1, ent2)
    end
    return true
end