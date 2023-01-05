local mensagens = { -- Bloquea las palabras desde [1] a [40] puedes agregar más palabras que no quieres bloquear en tu servidor.

    [1] = "www.", 
    [2] = ".com",
    [3] = ".net",
    [4] = "servegame",
    [5] = ".br",
    [6] = ".www",
    [7] = "zapto",
    [8] = ".org",
    [9] = "http",
    [10] = "venha jogar",
    [11] = "-wow",
    [12] = "no-ip",
	[13] = "www",
	[14] = "#chat www.", 
    [15] = "#chat .com",
    [16] = "#chat .net",
    [17] = "#chat servegame",
    [18] = "#chat .br",
    [19] = "#chat .www",
    [20] = "#chat zapto",
    [21] = "#chat .org",
    [22] = "#chat http",
    [23] = "#chat venha jogar",
    [24] = "#chat -wow",
    [25] = "#chat no-ip",
	[26] = "#chat www",
	[27] = "Terra Golfa",
	[28] = "TerraGolfa",
	[28] = "wowmetal",
	[29] = "wow metal",
	[30] = "Sunwell",
	[31] = "Otro server",
	[32] = "WowWarmane",
	[33] = "wowragnaros",
	[34] = "wowarg",
	[35] = "WardLegion",
	[36] = "Busquemos otro server",
	[37] = "Ultimowow",
	[38] = "ultimo wow",
	[39] = "deathwow",
	[40] = "MX",
	
	

};

local cont = 0;



local function OnEvents(event, player, msg, Type, lang)
    for k, v in pairs(mensagens) do
        if string.find(string.lower(msg), v) then
        local plr = player:GetName();
        SendWorldMessage("|cffffffff[" .. plr .. "] dice : Amo jugar WoW Azeroth !!") -- 
        player:SendBroadcastMessage("|cffff0000Prohibido devulgar webs, dentro del servidor, si continua haciendolo sera baneado Att: Staff ")
        player:SendBroadcastMessage("Si continua divulgando sera Kickeado automaticamente. y posteriormente baneado!")
        cont=cont+1;
        if (cont==3) then
            player:KickPlayer()
        end
        return false;
    end
end
end

RegisterPlayerEvent(18, OnEvents)
RegisterPlayerEvent(19, OnEvents)
RegisterPlayerEvent(20, OnEvents)
RegisterPlayerEvent(21, OnEvents)
RegisterPlayerEvent(22, OnEvents)