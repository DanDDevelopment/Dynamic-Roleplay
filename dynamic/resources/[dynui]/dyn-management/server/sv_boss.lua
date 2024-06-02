local DynCore = exports['dyn-core']:GetCoreObject()

function ExploitBan(id, reason)
	MySQL.insert('INSERT INTO bans (name, license, discord, ip, reason, expire, bannedby) VALUES (?, ?, ?, ?, ?, ?, ?)', {
		GetPlayerName(id),
		DynCore.Functions.GetIdentifier(id, 'license'),
		DynCore.Functions.GetIdentifier(id, 'discord'),
		DynCore.Functions.GetIdentifier(id, 'ip'),
		reason,
		2147483647,
		'dyn-management'
	})
	TriggerEvent('dyn-log:server:CreateLog', 'bans', 'Player Banned', 'red', string.format('%s was banned by %s for %s', GetPlayerName(id), 'dyn-management', reason), true)
	DropPlayer(id, 'You were permanently banned by the server for: Exploiting')
end

-- Get Employees
DynCore.Functions.CreateCallback('dyn-bossmenu:server:GetEmployees', function(source, cb, jobname)
	local src = source
	local Player = DynCore.Functions.GetPlayer(src)

	if not Player.PlayerData.job.isboss then
		ExploitBan(src, 'GetEmployees Exploiting')
		return
	end

	local employees = {}

	local players = MySQL.query.await("SELECT * FROM `players` WHERE `job` LIKE '%" .. jobname .. "%'", {})

	if players[1] ~= nil then
		for _, value in pairs(players) do
			local Target = DynCore.Functions.GetPlayerByCitizenId(value.citizenid) or DynCore.Functions.GetOfflinePlayerByCitizenId(value.citizenid)

			if Target and Target.PlayerData.job.name == jobname then
				local isOnline = Target.PlayerData.source
				employees[#employees + 1] = {
					empSource = Target.PlayerData.citizenid,
					grade = Target.PlayerData.job.grade,
					isboss = Target.PlayerData.job.isboss,
					name = (isOnline and '🟢 ' or '❌ ') .. Target.PlayerData.charinfo.firstname .. ' ' .. Target.PlayerData.charinfo.lastname
				}
			end
		end
		table.sort(employees, function(a, b)
			return a.grade.level > b.grade.level
		end)
	end
	cb(employees)
end)

RegisterNetEvent('dyn-bossmenu:server:stash', function()
	local src = source
	local Player = DynCore.Functions.GetPlayer(src)
	if not Player then return end
	local playerJob = Player.PlayerData.job
	if not playerJob.isboss then return end
	local playerPed = GetPlayerPed(src)
	local playerCoords = GetEntityCoords(playerPed)
	if not Config.BossMenus[playerJob.name] then return end
	local bossCoords = Config.BossMenus[playerJob.name]
	for i = 1, #bossCoords do
		local coords = bossCoords[i]
		if #(playerCoords - coords) < 2.5 then
			local stashName = 'boss_' .. playerJob.name
			exports['dyn-inventory']:OpenInventory(src, stashName, {
				maxweight = 4000000,
				slots = 25,
			})
			return
		end
	end
end)

-- Grade Change
RegisterNetEvent('dyn-bossmenu:server:GradeUpdate', function(data)
	local src = source
	local Player = DynCore.Functions.GetPlayer(src)
	local Employee = DynCore.Functions.GetPlayerByCitizenId(data.cid) or DynCore.Functions.GetOfflinePlayerByCitizenId(data.cid)

	if not Player.PlayerData.job.isboss then
		ExploitBan(src, 'GradeUpdate Exploiting')
		return
	end
	if data.grade > Player.PlayerData.job.grade.level then
		TriggerClientEvent('DynCore:Notify', src, 'You cannot promote to this rank!', 'error')
		return
	end

	if Employee then
		if Employee.Functions.SetJob(Player.PlayerData.job.name, data.grade) then
			TriggerClientEvent('DynCore:Notify', src, 'Sucessfully promoted!', 'success')
			Employee.Functions.Save()

			if Employee.PlayerData.source then -- Player is online
				TriggerClientEvent('DynCore:Notify', Employee.PlayerData.source, 'You have been promoted to' .. data.gradename .. '.', 'success')
			end
		else
			TriggerClientEvent('DynCore:Notify', src, 'Promotion grade does not exist.', 'error')
		end
	end
	TriggerClientEvent('dyn-bossmenu:client:OpenMenu', src)
end)

-- Fire Employee
RegisterNetEvent('dyn-bossmenu:server:FireEmployee', function(target)
	local src = source
	local Player = DynCore.Functions.GetPlayer(src)
	local Employee = DynCore.Functions.GetPlayerByCitizenId(target) or DynCore.Functions.GetOfflinePlayerByCitizenId(target)

	if not Player.PlayerData.job.isboss then
		ExploitBan(src, 'FireEmployee Exploiting')
		return
	end

	if Employee then
		if target == Player.PlayerData.citizenid then
			TriggerClientEvent('DynCore:Notify', src, 'You can\'t fire yourself', 'error')
			return
		elseif Employee.PlayerData.job.grade.level > Player.PlayerData.job.grade.level then
			TriggerClientEvent('DynCore:Notify', src, 'You cannot fire this citizen!', 'error')
			return
		end
		if Employee.Functions.SetJob('unemployed', '0') then
			Employee.Functions.Save()
			TriggerClientEvent('DynCore:Notify', src, 'Employee fired!', 'success')
			TriggerEvent('dyn-log:server:CreateLog', 'bossmenu', 'Job Fire', 'red', Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname .. ' successfully fired ' .. Employee.PlayerData.charinfo.firstname .. ' ' .. Employee.PlayerData.charinfo.lastname .. ' (' .. Player.PlayerData.job.name .. ')', false)

			if Employee.PlayerData.source then -- Player is online
				TriggerClientEvent('DynCore:Notify', Employee.PlayerData.source, 'You have been fired! Good luck.', 'error')
			end
		else
			TriggerClientEvent('DynCore:Notify', src, 'Error..', 'error')
		end
	end
	TriggerClientEvent('dyn-bossmenu:client:OpenMenu', src)
end)

-- Recruit Player
RegisterNetEvent('dyn-bossmenu:server:HireEmployee', function(recruit)
	local src = source
	local Player = DynCore.Functions.GetPlayer(src)
	local Target = DynCore.Functions.GetPlayer(recruit)

	if not Player.PlayerData.job.isboss then
		ExploitBan(src, 'HireEmployee Exploiting')
		return
	end

	if Target and Target.Functions.SetJob(Player.PlayerData.job.name, 0) then
		TriggerClientEvent('DynCore:Notify', src, 'You hired ' .. (Target.PlayerData.charinfo.firstname .. ' ' .. Target.PlayerData.charinfo.lastname) .. ' come ' .. Player.PlayerData.job.label .. '', 'success')
		TriggerClientEvent('DynCore:Notify', Target.PlayerData.source, 'You were hired as ' .. Player.PlayerData.job.label .. '', 'success')
		TriggerEvent('dyn-log:server:CreateLog', 'bossmenu', 'Recruit', 'lightgreen', (Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname) .. ' successfully recruited ' .. (Target.PlayerData.charinfo.firstname .. ' ' .. Target.PlayerData.charinfo.lastname) .. ' (' .. Player.PlayerData.job.name .. ')', false)
	end
	TriggerClientEvent('dyn-bossmenu:client:OpenMenu', src)
end)

-- Get closest player sv
DynCore.Functions.CreateCallback('dyn-bossmenu:getplayers', function(source, cb)
	local src = source
	local players = {}
	local PlayerPed = GetPlayerPed(src)
	local pCoords = GetEntityCoords(PlayerPed)
	for _, v in pairs(DynCore.Functions.GetPlayers()) do
		local targetped = GetPlayerPed(v)
		local tCoords = GetEntityCoords(targetped)
		local dist = #(pCoords - tCoords)
		if PlayerPed ~= targetped and dist < 10 then
			local ped = DynCore.Functions.GetPlayer(v)
			players[#players + 1] = {
				id = v,
				coords = GetEntityCoords(targetped),
				name = ped.PlayerData.charinfo.firstname .. ' ' .. ped.PlayerData.charinfo.lastname,
				citizenid = ped.PlayerData.citizenid,
				sources = GetPlayerPed(ped.PlayerData.source),
				sourceplayer = ped.PlayerData.source
			}
		end
	end
	table.sort(players, function(a, b)
		return a.name < b.name
	end)
	cb(players)
end)
