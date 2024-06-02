# dyn-sling 2.0

# -- If you are using illenium-appearance make sure to head to illenium-appearance/server/server.lua and replace these commands with these.
lib.addCommand("reloadskin", { help = _L("commands.reloadskin.title") }, function(source)
    local src = source
    TriggerClientEvent("illenium-appearance:client:reloadSkin", src)
    Wait(500)
    TriggerClientEvent("Pug:ReloadGuns:sling", src)
end)

lib.addCommand("clearstuckprops", { help = _L("commands.clearstuckprops.title") }, function(source)
    local src = source
    TriggerClientEvent("illenium-appearance:client:ClearStuckProps", src)
    Wait(500)
    TriggerClientEvent("Pug:ReloadGuns:sling", src)
end)
# --

# -- Use this event to clear items stuck on players without removing the weapons on the players back
TriggerEvent("Pug:ReloadGuns:sling")
# --


Advanced Weapon Sling | Weapons On Back: For any questions please contact me here:  https://discord.com/invite/jYZuWYjfvq

PREVIEW HERE: https://youtu.be/hluGYRiVY1E

This script is partially locked using escrow encryption. Most of the script is accessible in client/open.lua, and config.lua.

Full DynCore & ESX Compatibility.

This completely configurable script consist of:

● Wearable weapons and items that are placed onto the player when they have the set weapon or item anywhere within their inventory.
● Advanced system controlling and moving around items/weapons in 3D space to get the best position of where the items/weapons should sit on the player.
● Option for individual players to tailor the placement of items and weapons on their characters, enabling unique item positioning for each player. (DynCore ONLY)
● Full control over the items/weapons with the ability to adjust rotation, XYZ position, and edit the entire script from in-game without doing any code or configuring.
● /rack Command Utilizes the custom weapon racking system, which is exclusively available for select jobs and used to store weapons in emergency service vehicles.
● Version 1.0 comes with this script and is a completely different system shown off and explained in the video.
● Anti-Car tornadoing mechanics designed to prevent car tornadoing from ever occurring on your server.
● /weaponposition command for individual players to set personal weapon and item placements (optional).
● /setweapon command to begin editing where the weapons/items should sit on the player.
● Advanced checks to avoid and stop car tornadoing that occurs in every FiveM server.
● 30 weapons and items pre-configured for you.
● 0:00 ms ResMon for complete optimization.
● dyn-inventory support.
● ox_inventory support.
● qs-inventory support.
● ps-inventory support.
● Request inventory support and i will do it for this script if it is possible.

Requirements consist of:
DynCore OR ESX (other frameworks will work but not supported)
dyn-inventory OR ox_inventory OR qs-inventory OR ps-inventory (any dyn-inventory resource name changed will work)

1400 LINES OF CODE