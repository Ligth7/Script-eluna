
local function OnPlayerCommand(event, player, command)
    gmRank = player:GetGMRank()
    if (gmRank > 0 and command == "setgm")then -- Comando que te dara el set de gm.
        player:AddItem(43651)
        player:AddItem(12064)
        player:AddItem(2586)
        player:AddItem(11508)
        player:AddItem(18582)
        player:AddItem(17)
        player:AddItem(192)
        player:AddItem(23162, 4)
        return false
    end
        player:SendBroadcastMessage("|cffFF0000Necesitas ser Maestro de Juego para poder acceder a este comando") -- Mensaje que te saldra si no eres Mestro de Juego.
        return false
end

RegisterPlayerEvent(42, OnPlayerCommand)
