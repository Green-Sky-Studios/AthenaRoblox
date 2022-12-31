-- This is supposed to act as a fake datastore, should game API not be enabled (for whatever reason)

local DB = {}

local tab = {}

tab["GetDataStore"] = function(a,datastore)
end

return tab