local function OnPlayerCommand(event, player, command)
    local gmRank = player:GetGMRank()

    if command == "setgm" then
        if gmRank >= 2 then
            player:SendBroadcastMessage("|cffFF0000[Error]|r Necesitas ser GM nivel 2 o superior para usar este comando.")
            return false
        end

        local target = player:GetSelection()
        if not target or not target:IsPlayer() then
            player:SendBroadcastMessage("|cffff0000[Error]|r Debes tener seleccionado a un jugador para darle el set de GM.")
            return false
        end

        local targetPlayer = target:ToPlayer()

        -- Items a entregar
        local itemsToAdd = {
            43651, -- Caña de pescar
            12064, -- Cabeza
            2586,  -- Túnica
            11508, -- Pies
            18582, -- Espada de una mano
            --17,  -- camisa esto puede ser un problema si cae en manos de gms malos.
            192,   -- Arma de mano derecha
            {23162, 4}, -- 4 Bolsas de 36 casillas
        }

        for _, item in ipairs(itemsToAdd) do
            if type(item) == "table" then
                targetPlayer:AddItem(item[1], item[2])
            else
                targetPlayer:AddItem(item, 1)
            end
        end

        player:SendBroadcastMessage("|cff00ff00[Éxito]|r Has entregado el set de GM a " .. targetPlayer:GetName() .. ".")
        targetPlayer:SendBroadcastMessage("|cff00ff00¡Has recibido un set de GM por un administrador!|r")

        return false
    end

    return true
end

RegisterPlayerEvent(42, OnPlayerCommand)
