ESX = nil

local firstspawn = false

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    end
end)

local lib, anim = Config.lib, Config.anim 

Citizen.CreateThread(function()
	while status do
		Citizen.Wait(0)
        DisableAllControlActions(1)
        EnableControlAction(0, 2, false)
        EnableControlAction(0, 1, false)
	end
end)

function SetKevlarSkin(type1, type2)
    TriggerEvent('skinchanger:getSkin', function(skinData)
        if skinData ~= nil then
            skinData['bproof_2'] = type2
            skinData['bproof_1'] = type1
            TriggerEvent('skinchanger:loadSkin', skinData)
        end
    end)
end




RegisterNetEvent('aRii0:kevlar')
AddEventHandler('aRii0:kevlar', function()

    local playerPed = PlayerPedId()
    
	Citizen.Wait(250)
      
	ESX.Streaming.RequestAnimDict(lib, function()
        status = true
        SetPedArmour(playerPed, Config.kevlarArmour)
        Citizen.Wait(250)
        SetKevlarSkin(Config.kevlar, Config.kevlar_2)
		TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
        Citizen.Wait(3000)
        status = false
    end)
end)

RegisterNetEvent('aRii0:kevlar_m')
AddEventHandler('aRii0:kevlar_m', function()

    local playerPed = PlayerPedId()
	
    
	Citizen.Wait(250)
      
	ESX.Streaming.RequestAnimDict(lib, function()
        status = true
        SetPedArmour(playerPed, Config.kevlarArmour_m)
        SetKevlarSkin(Config.mediumkevlar, Config.mediumkevlar_2)
		TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
        Citizen.Wait(3000)
        status = false
    end)
end)

RegisterNetEvent('aRii0:kevlar_s')
AddEventHandler('aRii0:kevlar_s', function()

    local playerPed = PlayerPedId()
    
	Citizen.Wait(250)
      
	ESX.Streaming.RequestAnimDict(lib, function()
        status = true
        SetPedArmour(playerPed, Config.kevlarArmour_s)
        SetKevlarSkin(Config.lowkevlar, Config.lowkevlar_2)
		TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
        Citizen.Wait(3000)
        status = false
    end)
end)

RegisterNetEvent('aRii0:kevlar_p')
AddEventHandler('aRii0:kevlar_p', function()

    local playerPed = PlayerPedId()

	Citizen.Wait(250)
    SetKevlarSkin(Config.policekevlar, Config.policekevlar_2)
	ESX.Streaming.RequestAnimDict(lib, function()
        status = true
        SetPedArmour(playerPed, Config.kevlarArmour_p)
		TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
        Citizen.Wait(3000)
        status = false
    end)
end)

RegisterCommand('kevlar', function()
    TriggerServerEvent('aRii0:GiveKevlar')
end)

AddEventHandler('playerSpawned', function()
    if Config.UseHotkey then
        RegisterKeyMapping('kevlar', Config.KeyInfo, 'keyboard', Config.DefaultKey)
    end
    if firstspawn == false then
        print('-----------------------------------------------------------')
        print('      Script was made by aRii0 from Novel Devevolution')
        print('-----------------------------------------------------------')
        TriggerServerEvent('aRii0:GetPlayerArmour')
        firstspawn = true
    end
end)

  


