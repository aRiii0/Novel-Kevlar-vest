local ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterUsableItem('kevlar', function (source)
    local ped = GetPlayerPed(source)
    local armour = GetPedArmour(ped)
    if armour < Config.kevlarArmour then
        local xPlayer = ESX.GetPlayerFromId(source)
        xPlayer.removeInventoryItem('kevlar', 1)

        TriggerClientEvent('aRii0:kevlar', source)
    else
        Notify(source, Config.HaveKevlar)
    end

end)

ESX.RegisterUsableItem('kevlar_m', function (source)
    local ped = GetPlayerPed(source)
    local armour = GetPedArmour(ped)
    if armour < Config.kevlarArmour_m then
        local xPlayer = ESX.GetPlayerFromId(source)

        xPlayer.removeInventoryItem('kevlar_m', 1)

        TriggerClientEvent('aRii0:kevlar_m', source)
    else
        Notify(source, Config.HaveKevlar)
    end

end)

ESX.RegisterUsableItem('kevlar_p', function (source)
    local ped = GetPlayerPed(source)
    local armour = GetPedArmour(ped)
    local xPlayer = ESX.GetPlayerFromId(source)

    xPlayer.removeInventoryItem('kevlar_p', 1)

    TriggerClientEvent('aRii0:kevlar_p', source)

end)

ESX.RegisterUsableItem('kevlar_s', function (source)
    local ped = GetPlayerPed(source)
    local armour = GetPedArmour(ped)
    if armour < Config.kevlarArmour_s then
        local xPlayer = ESX.GetPlayerFromId(source)

        xPlayer.removeInventoryItem('kevlar_s', 1)

        TriggerClientEvent('aRii0:kevlar_s', source)
    else
        Notify(source, Config.HaveKevlar)
    end

end)


RegisterServerEvent('aRii0:GiveKevlar')
AddEventHandler('aRii0:GiveKevlar', function()
    xPlayer = ESX.GetPlayerFromId(source)
    local kev_s = xPlayer.getInventoryItem('kevlar_s').count
    local kev_m = xPlayer.getInventoryItem('kevlar_m').count
    local kev = xPlayer.getInventoryItem('kevlar').count
    local kev_p = xPlayer.getInventoryItem('kevlar_p').count

    if kev_p > 0 then 
        local ped = GetPlayerPed(source)
        local armour = GetPedArmour(ped)
        if armour < Config.kevlarArmour_p then
            xPlayer.removeInventoryItem('kevlar_p', 1)

            TriggerClientEvent('aRii0:kevlar_p', source)
        else
            Notify(source, Config.HaveKevlar)
        end
        return
    elseif kev > 0 then
        local ped = GetPlayerPed(source)
        local armour = GetPedArmour(ped)
        if armour < Config.kevlarArmour then
            xPlayer.removeInventoryItem('kevlar', 1)

            TriggerClientEvent('aRii0:kevlar', source)
        else
            Notify(source, Config.HaveKevlar)
        end
        return
    elseif kev_m > 0 then
        local ped = GetPlayerPed(source)
        local armour = GetPedArmour(ped)
        if armour < Config.kevlarArmour_m then
            xPlayer.removeInventoryItem('kevlar_m', 1)

            TriggerClientEvent('aRii0:kevlar_m', source)
        else
            Notify(source, Config.HaveKevlar)
        end
        return
    elseif kev_s > 0 then
        local ped = GetPlayerPed(source)
        local armour = GetPedArmour(ped)
        if armour < Config.kevlarArmour_s then
            xPlayer.removeInventoryItem('kevlar_s', 1)

            TriggerClientEvent('aRii0:kevlar_s', source)
        else
            Notify(source, Config.HaveKevlar)
        end
        return
    end
end)

AddEventHandler('playerDropped', function (reason)
    local _source = source
    TriggerEvent('aRii0:SaveArmour', _source)
end)  


RegisterServerEvent('aRii0:SaveArmour')
AddEventHandler('aRii0:SaveArmour', function (_source)
    local ped = GetPlayerPed(_source)
    local pedarmour = GetPedArmour(ped)
    if ped == 0 then    
        debug("ERROR: the ped from ID:" .. _source .. " is 0. The kevlar from the player cant saved!")
    end 
    local xPlayer = ESX.GetPlayerFromId(_source)
    local id = xPlayer.identifier
    MySQL.Async.insert('UPDATE users SET armour=@armour WHERE identifier=@id',
    { 
        ['@armour'] = pedarmour,
        ['@id'] = id
    },
    function(insertId)
        debug("^5 armour saved from id: " .. _source .. " armour: " .. pedarmour)
    end)
end)
  
RegisterServerEvent('aRii0:GetPlayerArmour')
AddEventHandler('aRii0:GetPlayerArmour', function()
    local _Source = source
    local xPlayer = ESX.GetPlayerFromId(_Source)
    local id = xPlayer.identifier
    MySQL.Async.fetchAll('SELECT armour FROM users WHERE identifier = @id', { 
        ['@id'] = id
    }, function(result)
        for i = 1, #result, 1 do
            local db_armour = result[i].armour
            debug("^5 kevlar loaded fromd id: " .. _Source.. " armour: " ..db_armour)
            JoinGiveKevlar(db_armour, _Source)
        end
    end)
end)

function JoinGiveKevlar(armour, _source)

    local xPlayer = ESX.GetPlayerFromId(_source)

    if xPlayer.getInventoryItem('kevlar_p').count > 0 and armour == 100 then
        TriggerClientEvent('aRii0:kevlar_p', _source)
        return
    end

    if Config.kevlarArmour <= armour then
        TriggerClientEvent('aRii0:kevlar', _source)
        return
    elseif Config.kevlarArmour_m <= armour then
        TriggerClientEvent('aRii0:kevlar_m', _source)
        return
    elseif Config.kevlarArmour_s <= armour or armour > 10 then
        TriggerClientEvent('aRii0:kevlar_s', _source)
        return
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(Config.SaveInterval)
        debug("^1 Start autosave!")
        local xPlayers = ESX.GetPlayers()
        for i = 1, #xPlayers, 1 do 
            TriggerEvent('aRii0:SaveArmour', xPlayers[i])
        end
        debug("^1 Autosave successfully!")
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if resourceName ~= GetCurrentResourceName() then
        return
    end
    if GetCurrentResourceName() == "Novel-Kevlar-vest" then
        while true do
            Citizen.Wait(10000)
            print('.........................Novel Kevlar .....................')
            print('-----------------------------------------------------------')
            print('      Script was made by aRii0 from Novel Devevolution')
            print('-----------------------------------------------------------')
        end
    end
end)


