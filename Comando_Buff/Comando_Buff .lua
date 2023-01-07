--[[
╔══════════════════════════════════════════╗
║         Información de Script            ║
╠══════════════════════════════════════════╣
║- Creado por: Ligth.                      ║
║- Contribuidor(s): Developer              ║
║- Completo: 75/100 %                         ║
║- Nombre de Script: Comando_Buff          ║
║- Descripción: Con este comando #buff     ║
║  podras darte todos los buffos ...       ║                                 
╚══════════════════════════════════════════╝
--]]

local GMRango = 2 -- Los rangos que podrán acceder a buffos extras.
local function Buffcommand(event, player, msg, Type, lang)
	if(msg == "#buff") then  -- Comando que se utilizara en el juego.
        player:CastSpell(player, 15366, true) -- (Jugador, hechizo, Si es true, el hechizo es instantáneo y no tiene costo.)
        player:CastSpell(player, 16609, true)
        player:CastSpell(player, 48162, true)
        player:CastSpell(player, 48074, true)
        player:CastSpell(player, 48170, true)
        player:CastSpell(player, 43223, true)
        player:CastSpell(player, 36880, true)
        player:CastSpell(player, 467, true)
        player:CastSpell(player, 30562, true)
        player:CastSpell(player, 30567, true)
        player:CastSpell(player, 30557, true)
        player:CastSpell(player, 33081, true)
        player:CastSpell(player, 48469, true)
        player:SendBroadcastMessage("|cffFF0000¡Has sido Buffeado por el Administrador!") 
        player:SendNotification("¡Has sido Buffeado por el Administrador!")
        if(player:GetGMRank() >= GMRango)then -- Los buffos extras que serán para los Maestros de Juego.
        player:CastSpell(player, 26035, true)
        player:CastSpell(player, 69994, true)
        player:CastSpell(player, 35076, true)
        player:CastSpell(player, 26393, true)
        player:CastSpell(player, 24425, true)
        player:CastSpell(player, 53758, true)
        player:CastSpell(player, 69559, true)
        player:CastSpell(player, 24705, true)
        player:CastSpell(player,35874, true)
        player:CastSpell(player,35912, true)
        player:CastSpell(player,38734, true)
        player:CastSpell(player, 23735, true)
        player:CastSpell(player, 23736, true)
        player:CastSpell(player, 23737, true)
        player:CastSpell(player, 23738, true)
        player:CastSpell(player, 23767, true)
        player:CastSpell(player, 23768, true)
        player:CastSpell(player, 23769, true)
        end
	end
	return false;
end
RegisterPlayerEvent(18, Buffcommand)