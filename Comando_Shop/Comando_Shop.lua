--[[
╔══════════════════════════════════════════╗
║         Información de Script            ║
╠══════════════════════════════════════════╣
║- Creado por: Ligth.                      ║
║- Contribuidor(s): Developer              ║
║- Completo: 75/100 %                      ║
║- Nombre de Script: Comando_Shop          ║
║- Descripción: Con este comando #Shop     ║
║  podras teleportarte a tu zona ...       ║                                 
╚══════════════════════════════════════════╝
--]]

local function OnCommand(event, player, command, lang)
      if (player and command == "shop") then -- Comando que pondrás en el juego.
       if (player:IsInCombat() == true) then -- Esto no permitira que utilizes el comando cuando estes en batalla "combate".
        player:SendNotification("No puedes utilizar este comando porque estas en combate.")
        player:SendBroadcastMessage("|cffFF0000No puedes utilizar este comando porque estas en combate.")
   else
    if (player:IsHorde() == true) then 
        player:Teleport( 1, 1438.910034, -4421.930176, 25.463301, 0.113060 ) -- Coordenadas para la Horda.
        player:SendNotification("¡Usted ha sido teletransportado!")
        player:SendBroadcastMessage("|cffFF0000¡Usted ha sido teletransportado!")
    else 
        player:Teleport( 0, -8919.160156, 548.473022, 94.119797, 0.647108 ) -- Coordenadas para la Alianza.
        player:SendNotification("¡Usted ha sido teletransportado!")
        player:SendBroadcastMessage("|cffFF0000¡Usted ha sido teletransportado!")
  end
 end
 return false
 
    end
end

RegisterPlayerEvent(42, OnCommand)