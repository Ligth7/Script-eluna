--[[
╔══════════════════════════════════════════╗
║         Información de Script            ║
╠══════════════════════════════════════════╣
║- Editado por: Ligth.                     ║
║- Contribuidor(s): A los creadores.       ║
║- Completo: 85/100 %                      ║
║- Nombre de Script: Comando_Chat          ║
║- Descripción: Con este comando #chat     ║
║  podras hablar entre facciones ...       ║                                 
╚══════════════════════════════════════════╝
--]]
local WorldChannelName = "Mundo"; -- Nombre del canal.
local CooldownTimer = 3; -- Tiempo de envio entre mensajes en segundos. Establézcalo en 0 para que no haya CD, obviamente.
local ChatPrefix = "#chat"; -- El comando para hablar en el canal.
 
local Class = { -- Colores segun su clase.
    [1] = "C79C6E|TInterface\\icons\\INV_Sword_27.png:15|t", -- Warrior
    [2] = "F58CBA|TInterface\\icons\\INV_Hammer_01.png:15|t", -- Paladin
    [3] = "ABD473|TInterface\\icons\\INV_Weapon_Bow_07.png:15|t", -- Cazador
    [4] = "FFF569|TInterface\\icons\\INV_ThrowingKnife_04.png:15|t", -- Picaro
    [5] = "FFFFFF|TInterface\\icons\\INV_Staff_30.png:15|t", -- Sacerdote
    [6] = "C41F3B|TInterface\\icons\\Spell_Deathknight_ClassIcon.png:15|t", -- Caballero de la muerte.
    [7] = "0070DE|TInterface\\icons\\inv_jewelry_talisman_04.png:15|t", -- Chaman
    [8] = "69CCF0|TInterface\\icons\\INV_Staff_13.png:15|t", -- Mago
    [9] = "9482C9|TInterface\\ICONS/Spell_Nature_FaerieFire.png:15|t", -- Brujo
    [11] = "FF7d0A|TInterface\\icons\\Ability_Druid_Maul.png:15|t" -- Druida
};
 
local Rank = { -- Los rangos segun sus coleres [0, 1, 2, 3, 4]
   [0] = "7DFF00[", -- color de letras del Jugador
   [1] = "E700B1[MOD|cff7DFF00] [|cffE700B1", -- Color de letra del moderador
   [2] = "E7A200[GM|cff7DFF00] [|cffE7A200", -- Color de letra del Mestro de Juego
   [3] = "E7A200[ADMIN|cff7DFF00] [|cffE7A200", -- Color de letra del Administrador
   [4] = "E7A200[OWNER|cff7DFF00] [|cffE7A200", -- Color de letra del desarollador
};
 

if (ChatPrefix:sub(-1) ~= " ") then
    ChatPrefix = ChatPrefix.." ";
end
 
local RCD = {};
function ChatSystem(event, player, msg, _, lang)
    if (RCD[player:GetGUIDLow()] == nil) then
        RCD[player:GetGUIDLow()] = 0;
    end

    if (msg:sub(1, ChatPrefix:len()) == ChatPrefix) then
        local r = RCD[player:GetGUIDLow()] - os.clock();
        if (0 < r) then
            local s = string.format("|cFFFF0000¡Tienes que esperar %i segundo(s) para hablar de nuevo!|r", math.floor(r));
            player:SendAreaTriggerMessage(s);
        else
            RCD[player:GetGUIDLow()] = os.clock() + CooldownTimer;
            local t = table.concat({"|cff000000[", WorldChannelName, "] |cff", Rank[player:GetGMRank()] or Rank[0], "|Hplayer:", player:GetName(), "|h", player:GetName(), "|h|r|cff7DFF00]: |r|cff", Class[player:GetClass()], msg:sub(ChatPrefix:len()+1), "|r"});
            SendWorldMessage(t);
        end
        return false;
    end
end
 
RegisterPlayerEvent(18, ChatSystem);
RegisterPlayerEvent(4, function(_, player) RCD[player:GetGUIDLow()] = 0; end);