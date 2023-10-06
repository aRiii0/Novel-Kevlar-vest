ESX = nil

local firstspawn = false

Citizen.CreateThread(function()
    while ESX == nil do
        ESX = exports["es_extended"]:getSharedObject()
    end
end)

local PlayerData = {}

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer   
  
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
  
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
        local skin = GetKevlarSkin("kevlar")
        SetKevlarSkin(skin.kevlar_1, skin.kevlar_2)
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
        local skin = GetKevlarSkin("kevlar_m")
        SetKevlarSkin(skin.kevlar_1, skin.kevlar_2)
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
        local skin = GetKevlarSkin("kevlar_s")
        SetKevlarSkin(skin.kevlar_1, skin.kevlar_2)
		TaskPlayAnim(playerPed, lib, anim, 8.0, -8.0, -1, 0, 0.0, false, false, false)
        Citizen.Wait(3000)
        status = false
    end)
end)

RegisterNetEvent('aRii0:kevlar_p')
AddEventHandler('aRii0:kevlar_p', function()

    local playerPed = PlayerPedId()

	Citizen.Wait(250)
    
	ESX.Streaming.RequestAnimDict(lib, function()
        status = true
        SetPedArmour(playerPed, Config.kevlarArmour_p)
        local skin = GetKevlarSkin("kevlar_p")
        SetKevlarSkin(skin.kevlar_1, skin.kevlar_2)
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
        while ESX == nil do 
            Citizen.Wait(100)
        end
        TriggerServerEvent('aRii0:GetPlayerArmour')
        firstspawn = true
    end
end)

function GetKevlarSkin(kevlartype)
    if  Config.KevlarSkins[PlayerData.job.name] ~= nil then 
        return Config.KevlarSkins[PlayerData.job.name]
    end

    return Config.KevlarSkins[kevlartype]
end
  


