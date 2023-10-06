Config = {}

Config.debug = true

Config.SaveInterval = 5 * 60000 -- Saves the kevlar every 5 minutes from all players

-- Kevlar skin

Config.kevlar = 22
Config.kevlar_2 = 0

Config.mediumkevlar = 22
Config.mediumkevlar_2 = 1

Config.lowkevlar = 22
Config.lowkevlar2 = 2

Config.policekevlar = 22
Config.policekevlar_2 = 3

Config.KevlarSkins = {
    ["kevlar"] = {
        kevlar_1 = 22,
        kevlar_2 = 0
    },
    ["kevlar_s"] = {
        kevlar_1 = 22,
        kevlar_2 = 2
    },
    ["kevlar_m"] = {
        kevlar_1 = 22,
        kevlar_2 = 1
    },
    ["kevlar_police"] = {
        kevlar_1 = 22,
        kevlar_2 = 3
    },
    ["fib"] = { --job example
        kevlar_1 = 5,
        kevlar_2 = 0
    }
 }

-- animation when dressing kevlar

Config.lib = 'oddjobs@basejump@ig_15'
Config.anim = 'puton_parachute'


-- Using Hotkey to take a kevlar
Config.UseHotkey = true
Config.KeyInfo = "Kevlar ziehen" -- info text for the key
Config.DefaultKey = "ADD" -- the default key https://docs.fivem.net/docs/game-references/input-mapper-parameter-ids/keyboard/

-- how many have armour have the type of kevlar
Config.kevlarArmour = 100 -- full kevlar
Config.kevlarArmour_p = 100 -- police kevlar
Config.kevlarArmour_m = 75 -- medium kevlar
Config.kevlarArmour_s = 40 -- small kevlar

Config.HaveKevlar = "Du hast schon so eine Weste"


function Notify(source, msg)
    TriggerClientEvent('notifications', source, '#66ff00', 'INFORMATION', msg )
end