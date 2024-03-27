local function createEffect(explosionPos)
    local effectdata = EffectData()
    effectdata:SetStart(explosionPos)
    effectdata:SetOrigin(explosionPos)
    effectdata:SetScale(1)
    util.Effect("Explosion", effectdata)
end

local function CreateExplosion(ent1, ent2)
    local collisionDistance = 50
    if ent1:GetPos():Distance(ent2:GetPos()) > collisionDistance then return end
    print("Collision entre deux joueurs: " .. ent1:Name() .. " et " .. ent2:Name())
    local explosionPos = (ent1:GetPos() + ent2:GetPos()) / 2
    util.ScreenShake(explosionPos, 5, 5, 1, 500)
    createEffect(explosionPos)
    ent1:EmitSound("ambient/explosions/explode_4.wav", 100, 100)
    ent1:Kill()
    IncrementScore(ent2)
end

function GM:ShouldCollide(ent1, ent2)
    if ent1:IsPlayer() and ent2:IsPlayer() and ent1:Alive() and ent2:Alive() and ent1:Team() ~= ent2:Team() then return false end
    CreateExplosion(ent1, ent2)
    return true
end