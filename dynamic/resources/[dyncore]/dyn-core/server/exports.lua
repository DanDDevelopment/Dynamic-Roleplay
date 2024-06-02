-- Add or change (a) method(s) in the DynCore.Functions table
local function SetMethod(methodName, handler)
    if type(methodName) ~= 'string' then
        return false, 'invalid_method_name'
    end

    DynCore.Functions[methodName] = handler

    TriggerEvent('DynCore:Server:UpdateObject')

    return true, 'success'
end

DynCore.Functions.SetMethod = SetMethod
exports('SetMethod', SetMethod)

-- Add or change (a) field(s) in the DynCore table
local function SetField(fieldName, data)
    if type(fieldName) ~= 'string' then
        return false, 'invalid_field_name'
    end

    DynCore[fieldName] = data

    TriggerEvent('DynCore:Server:UpdateObject')

    return true, 'success'
end

DynCore.Functions.SetField = SetField
exports('SetField', SetField)

-- Single add job function which should only be used if you planning on adding a single job
local function AddJob(jobName, job)
    if type(jobName) ~= 'string' then
        return false, 'invalid_job_name'
    end

    if DynCore.Shared.Jobs[jobName] then
        return false, 'job_exists'
    end

    DynCore.Shared.Jobs[jobName] = job

    TriggerClientEvent('DynCore:Client:OnSharedUpdate', -1, 'Jobs', jobName, job)
    TriggerEvent('DynCore:Server:UpdateObject')
    return true, 'success'
end

DynCore.Functions.AddJob = AddJob
exports('AddJob', AddJob)

-- Multiple Add Jobs
local function AddJobs(jobs)
    local shouldContinue = true
    local message = 'success'
    local errorItem = nil

    for key, value in pairs(jobs) do
        if type(key) ~= 'string' then
            message = 'invalid_job_name'
            shouldContinue = false
            errorItem = jobs[key]
            break
        end

        if DynCore.Shared.Jobs[key] then
            message = 'job_exists'
            shouldContinue = false
            errorItem = jobs[key]
            break
        end

        DynCore.Shared.Jobs[key] = value
    end

    if not shouldContinue then return false, message, errorItem end
    TriggerClientEvent('DynCore:Client:OnSharedUpdateMultiple', -1, 'Jobs', jobs)
    TriggerEvent('DynCore:Server:UpdateObject')
    return true, message, nil
end

DynCore.Functions.AddJobs = AddJobs
exports('AddJobs', AddJobs)

-- Single Remove Job
local function RemoveJob(jobName)
    if type(jobName) ~= 'string' then
        return false, 'invalid_job_name'
    end

    if not DynCore.Shared.Jobs[jobName] then
        return false, 'job_not_exists'
    end

    DynCore.Shared.Jobs[jobName] = nil

    TriggerClientEvent('DynCore:Client:OnSharedUpdate', -1, 'Jobs', jobName, nil)
    TriggerEvent('DynCore:Server:UpdateObject')
    return true, 'success'
end

DynCore.Functions.RemoveJob = RemoveJob
exports('RemoveJob', RemoveJob)

-- Single Update Job
local function UpdateJob(jobName, job)
    if type(jobName) ~= 'string' then
        return false, 'invalid_job_name'
    end

    if not DynCore.Shared.Jobs[jobName] then
        return false, 'job_not_exists'
    end

    DynCore.Shared.Jobs[jobName] = job

    TriggerClientEvent('DynCore:Client:OnSharedUpdate', -1, 'Jobs', jobName, job)
    TriggerEvent('DynCore:Server:UpdateObject')
    return true, 'success'
end

DynCore.Functions.UpdateJob = UpdateJob
exports('UpdateJob', UpdateJob)

-- Single add item
local function AddItem(itemName, item)
    if type(itemName) ~= 'string' then
        return false, 'invalid_item_name'
    end

    if DynCore.Shared.Items[itemName] then
        return false, 'item_exists'
    end

    DynCore.Shared.Items[itemName] = item

    TriggerClientEvent('DynCore:Client:OnSharedUpdate', -1, 'Items', itemName, item)
    TriggerEvent('DynCore:Server:UpdateObject')
    return true, 'success'
end

DynCore.Functions.AddItem = AddItem
exports('AddItem', AddItem)

-- Single update item
local function UpdateItem(itemName, item)
    if type(itemName) ~= 'string' then
        return false, 'invalid_item_name'
    end
    if not DynCore.Shared.Items[itemName] then
        return false, 'item_not_exists'
    end
    DynCore.Shared.Items[itemName] = item
    TriggerClientEvent('DynCore:Client:OnSharedUpdate', -1, 'Items', itemName, item)
    TriggerEvent('DynCore:Server:UpdateObject')
    return true, 'success'
end

DynCore.Functions.UpdateItem = UpdateItem
exports('UpdateItem', UpdateItem)

-- Multiple Add Items
local function AddItems(items)
    local shouldContinue = true
    local message = 'success'
    local errorItem = nil

    for key, value in pairs(items) do
        if type(key) ~= 'string' then
            message = 'invalid_item_name'
            shouldContinue = false
            errorItem = items[key]
            break
        end

        if DynCore.Shared.Items[key] then
            message = 'item_exists'
            shouldContinue = false
            errorItem = items[key]
            break
        end

        DynCore.Shared.Items[key] = value
    end

    if not shouldContinue then return false, message, errorItem end
    TriggerClientEvent('DynCore:Client:OnSharedUpdateMultiple', -1, 'Items', items)
    TriggerEvent('DynCore:Server:UpdateObject')
    return true, message, nil
end

DynCore.Functions.AddItems = AddItems
exports('AddItems', AddItems)

-- Single Remove Item
local function RemoveItem(itemName)
    if type(itemName) ~= 'string' then
        return false, 'invalid_item_name'
    end

    if not DynCore.Shared.Items[itemName] then
        return false, 'item_not_exists'
    end

    DynCore.Shared.Items[itemName] = nil

    TriggerClientEvent('DynCore:Client:OnSharedUpdate', -1, 'Items', itemName, nil)
    TriggerEvent('DynCore:Server:UpdateObject')
    return true, 'success'
end

DynCore.Functions.RemoveItem = RemoveItem
exports('RemoveItem', RemoveItem)

-- Single Add Gang
local function AddGang(gangName, gang)
    if type(gangName) ~= 'string' then
        return false, 'invalid_gang_name'
    end

    if DynCore.Shared.Gangs[gangName] then
        return false, 'gang_exists'
    end

    DynCore.Shared.Gangs[gangName] = gang

    TriggerClientEvent('DynCore:Client:OnSharedUpdate', -1, 'Gangs', gangName, gang)
    TriggerEvent('DynCore:Server:UpdateObject')
    return true, 'success'
end

DynCore.Functions.AddGang = AddGang
exports('AddGang', AddGang)

-- Multiple Add Gangs
local function AddGangs(gangs)
    local shouldContinue = true
    local message = 'success'
    local errorItem = nil

    for key, value in pairs(gangs) do
        if type(key) ~= 'string' then
            message = 'invalid_gang_name'
            shouldContinue = false
            errorItem = gangs[key]
            break
        end

        if DynCore.Shared.Gangs[key] then
            message = 'gang_exists'
            shouldContinue = false
            errorItem = gangs[key]
            break
        end

        DynCore.Shared.Gangs[key] = value
    end

    if not shouldContinue then return false, message, errorItem end
    TriggerClientEvent('DynCore:Client:OnSharedUpdateMultiple', -1, 'Gangs', gangs)
    TriggerEvent('DynCore:Server:UpdateObject')
    return true, message, nil
end

DynCore.Functions.AddGangs = AddGangs
exports('AddGangs', AddGangs)

-- Single Remove Gang
local function RemoveGang(gangName)
    if type(gangName) ~= 'string' then
        return false, 'invalid_gang_name'
    end

    if not DynCore.Shared.Gangs[gangName] then
        return false, 'gang_not_exists'
    end

    DynCore.Shared.Gangs[gangName] = nil

    TriggerClientEvent('DynCore:Client:OnSharedUpdate', -1, 'Gangs', gangName, nil)
    TriggerEvent('DynCore:Server:UpdateObject')
    return true, 'success'
end

DynCore.Functions.RemoveGang = RemoveGang
exports('RemoveGang', RemoveGang)

-- Single Update Gang
local function UpdateGang(gangName, gang)
    if type(gangName) ~= 'string' then
        return false, 'invalid_gang_name'
    end

    if not DynCore.Shared.Gangs[gangName] then
        return false, 'gang_not_exists'
    end

    DynCore.Shared.Gangs[gangName] = gang

    TriggerClientEvent('DynCore:Client:OnSharedUpdate', -1, 'Gangs', gangName, gang)
    TriggerEvent('DynCore:Server:UpdateObject')
    return true, 'success'
end

DynCore.Functions.UpdateGang = UpdateGang
exports('UpdateGang', UpdateGang)

local resourceName = GetCurrentResourceName()
local function GetCoreVersion(InvokingResource)
    local resourceVersion = GetResourceMetadata(resourceName, 'version')
    if InvokingResource and InvokingResource ~= '' then
        print(('%s called DynCore version check: %s'):format(InvokingResource or 'Unknown Resource', resourceVersion))
    end
    return resourceVersion
end

DynCore.Functions.GetCoreVersion = GetCoreVersion
exports('GetCoreVersion', GetCoreVersion)

local function ExploitBan(playerId, origin)
    local name = GetPlayerName(playerId)
    MySQL.insert('INSERT INTO bans (name, license, discord, ip, reason, expire, bannedby) VALUES (?, ?, ?, ?, ?, ?, ?)', {
        name,
        DynCore.Functions.GetIdentifier(playerId, 'license'),
        DynCore.Functions.GetIdentifier(playerId, 'discord'),
        DynCore.Functions.GetIdentifier(playerId, 'ip'),
        origin,
        2147483647,
        'Anti Cheat'
    })
    DropPlayer(playerId, Lang:t('info.exploit_banned', { discord = DynCore.Config.Server.Discord }))
    TriggerEvent('dyn-log:server:CreateLog', 'anticheat', 'Anti-Cheat', 'red', name .. ' has been banned for exploiting ' .. origin, true)
end

exports('ExploitBan', ExploitBan)
