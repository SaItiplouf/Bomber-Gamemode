local function createEffect(vExplosionPos)
    local oEffectData = EffectData()
    oEffectData:SetStart(vExplosionPos)
    oEffectData:SetOrigin(vExplosionPos)
    oEffectData:SetScale(1)
    util.Effect("Explosion", oEffectData)
end

local function CreateExplosion(eVictim, eAttacker)
    local iCOLLISION_DISTANCE = 50
    if not eVictim:IsPlayer() or not eAttacker:IsPlayer() then return end
    if not eVictim:Alive() or not eAttacker:Alive() then return end
    if eVictim:Team() == eAttacker:Team() then return end
    if eVictim:GetPos():Distance(eAttacker:GetPos()) > iCOLLISION_DISTANCE then return end
    print("Collision entre deux joueurs: " .. eVictim:Name() .. " et " .. eAttacker:Name())
    local vExplosionPos = (eVictim:GetPos() + eAttacker:GetPos()) / 2
    util.ScreenShake(vExplosionPos, 5, 5, 1, 500)
    createEffect(vExplosionPos)
    eVictim:EmitSound("ambient/explosions/explode_4.wav", 100, 100)
    eVictim:Kill()
    IncrementScore(eAttacker)
end

function GM:ShouldCollide(eVictim, eAttacker)
    CreateExplosion(eVictim, eAttacker)
    return true
end