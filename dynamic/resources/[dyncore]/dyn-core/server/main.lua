DynCore = {}
DynCore.Config = QBConfig
DynCore.Shared = QBShared
DynCore.ClientCallbacks = {}
DynCore.ServerCallbacks = {}

exports('GetCoreObject', function()
    return DynCore
end)

-- To use this export in a script instead of manifest method
-- Just put this line of code below at the very top of the script
-- local DynCore = exports['dyn-core']:GetCoreObject()
