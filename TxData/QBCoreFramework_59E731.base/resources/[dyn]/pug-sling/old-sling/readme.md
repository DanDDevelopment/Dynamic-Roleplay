# pug-sling
Advanced weapons slings for the qbcore framework. Any weapon in the players inventory will show up on there back.

# -- if you are using ox_inventory make sure to change Config.Inventory no other inventory name matters.

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

# -- Support
Full support provided in my discord here: https://discord.gg/jYZuWYjfvq
# --

# -- My other scripts
https://pug-webstore.tebex.io/
# --

# -- Config file
To add a new weapon you must change the first option to the qbcore shared.lua.
# --

# -- Commands
`/sling` - Will toggle the weapon placement on the front and back.
# --

# -- Use this event to clear items stuck on players without removing the weapons on the players back
TriggerEvent("Pug:ReloadGuns:sling")
# --