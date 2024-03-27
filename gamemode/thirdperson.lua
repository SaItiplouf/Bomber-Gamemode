function GM:CalcView(ply, origin, angles, fov)
    -- Vérifier si le joueur local souhaite utiliser la vue à la troisième personne
    if ply:GetNWBool("Thirdperson", false) then
        -- Créer une table pour stocker les données de vue
        local view = {}

        -- Calculer la position de la caméra en fonction de la position, des angles et du champ de vision
        view.origin = origin - (angles:Forward() * 100) + (angles:Up() * 20)
        -- Utiliser les mêmes angles et champ de vision que ceux fournis
        view.angles = angles
        view.fov = fov
        -- Indiquer que le joueur doit être dessiné
        view.drawviewer = true
        -- Retourner la table de vue mise à jour
        return view
    end
end