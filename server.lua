local QBCore = exports['qb-core']:GetCoreObject()

QBCore.Commands.Add("dvall", "Sunucudaki tüm araçları çeker",  { }, false, function(source, args)
    dvAll()
end, "god")

dvAll = function()
    TriggerClientEvent("QBCore:Notify", -1, "Sunucudaki tüm araçlar 30 saniye sonra çekilecektir.", "error")
    Wait(15000)
    TriggerClientEvent("QBCore:Notify", -1, "Sunucudaki tüm araçlar 15 saniye sonra çekilecektir.", "error")
    Wait(5000)
    TriggerClientEvent("QBCore:Notify", -1, "Sunucudaki tüm araçlar 10 saniye sonra çekilecektir.", "error")
    Wait(5000)
    TriggerClientEvent("QBCore:Notify", -1, "Sunucudaki tüm araçlar 5 saniye sonra çekilecektir.", "error")
    Wait(1000)
    TriggerClientEvent("QBCore:Notify", -1, "Sunucudaki tüm araçlar 4 saniye sonra çekilecektir.", "error")
    Wait(1000)
    TriggerClientEvent("QBCore:Notify", -1, "Sunucudaki tüm araçlar 3 saniye sonra çekilecektir.", "error")
    Wait(1000)
    TriggerClientEvent("QBCore:Notify", -1, "Sunucudaki tüm araçlar 2 saniye sonra çekilecektir.", "error")
    Wait(1000)
    TriggerClientEvent("QBCore:Notify", -1, "Sunucudaki tüm araçlar 1 saniye sonra çekilecektir.", "error")
    Wait(1000)
    TriggerClientEvent("Syrox-DvAll:dvall", -1)
    TriggerClientEvent("QBCore:Notify", -1, "Sunucudaki tüm araçlar çekilmiştir, iyi roller.", "error")
end

CreateThread(function()
    while true do
        Wait(1000 * 60 * 60)
        dvAll()
    end
end)

QBCore.Commands.Add("wipe", "Kişinin karakterini siler.",  { }, false, function(source, args)
    local id = tonumber(args[1])
    if not (id == nil) and type(id) == "number" and id > 0 then
        local tPlayer = QBCore.Functions.GetPlayer(id)
        local citizenid = tPlayer.PlayerData.citizenid
        if tPlayer then
            DropPlayer(id, "Karakter Silindi, Tekrar Giriş Sağlayabilirsin")
            if WipeAt(citizenid) then
                TriggerClientEvent("QBCore:Notify", source, "Kişiye wipe atıldı.", "success")
            end
        else
            TriggerClientEvent("QBCore:Notify", source, "Kişi bulunamadı.", "error")
        end
    end
end, "god")

function WipeAt(citizenid)
    local parameters = {
        ['@citizenid'] = citizenid
    }

    MySQL.Async.execute('DELETE FROM players WHERE citizenid = @citizenid', parameters)
    return true
end