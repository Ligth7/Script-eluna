--[[
╔══════════════════════════════════════════╗
║             Script Info                  ║
╠══════════════════════════════════════════╣
║- Creado por: Ligth.                      ║
║- Revisado y Mejorado por: Yaniel         ║
║- Completo: 100%                          ║
║- Nombre de Script: Comando_Buff_Mejorado ║
║- Descripción: Este script permite a los  ║
║  jugadores recibir buffs usando el       ║
║  comando #buff, con buffs extra para GMs.║
╚══════════════════════════════════════════╝
--]]

-- Rango de GM mínimo requerido para recibir los buffs extra.
local GM_RANK_REQUIRED = 2 

-- Tabla con los IDs de los hechizos para los buffs estándar.
local standardBuffs = {
    -- Buffs generales para todos los jugadores
    15366, 16609, 48162, 48074, 48170, 43223, 36880, 467, 
    30562, 30567, 30557, 33081, 48469
}

-- Tabla con los IDs de los hechizos para los buffs adicionales de Maestros de Juego.
local gmBuffs = {
    -- Buffs extra específicamente para GMs
    26035, 69994, 35076, 26393, 24425, 53758, 69559, 24705, 
    35874, 35912, 38734, 23735, 23736, 23737, 23738, 23767, 
    23768, 23769
}

-- Función de ayuda para aplicar una lista de hechizos a un jugador.
local function applyBuffs(player, spellTable)
    for _, spellId in ipairs(spellTable) do
        player:CastSpell(player, spellId, true)
    end
end

-- Función principal para manejar el comando de chat.
local function Buffcommand(event, player, msg, Type, lang)
    -- Verifica si el comando es #buff. El mensaje ya está en minúsculas.
    if msg:lower() == "#buff" then
        
        -- Aplica los buffs estándar al jugador.
        applyBuffs(player, standardBuffs)

        -- Envía notificaciones al jugador y a todo el servidor.
        player:SendNotification("¡Has recibido un conjunto de buffs básicos!")
        player:SendBroadcastMessage("|cffFF0000Un jugador ha recibido un conjunto de buffs básicos.")
        
        -- Verifica si el rango de GM del jugador es lo suficientemente alto para los buffs extra.
        if player:GetGMRank() >= GM_RANK_REQUIRED then
            -- Aplica los buffs extra de GM.
            applyBuffs(player, gmBuffs)
            
            -- Envía notificaciones específicas para el GM.
            player:SendNotification("¡Has recibido buffs adicionales de GM!")
            player:SendBroadcastMessage("|cffFFFF00Un GM ha recibido buffs adicionales.")
        end
        return true -- Retorna true para evitar que el comando se muestre en el chat.
    end
    return false
end

-- Registra la función al evento de comando de chat (ID de evento 18).
RegisterPlayerEvent(18, Buffcommand)
