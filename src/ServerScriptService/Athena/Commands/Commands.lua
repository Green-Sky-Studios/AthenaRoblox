-- This is just to grab all the commands in the commands folder
local Athena = script.Parent.Parent -- ATHENA

local Commands = {}

for _,cmdSet in pairs(script.Parent:GetChildren()) do -- checks for children of commands folder
	if cmdSet ~= script then -- if not this script
		for i,cmd in pairs(require(cmdSet)) do
			table.insert(Commands,cmd) -- inserting commands to a single folder, can be sorted by admin level whenever
		end
	end
end

return Commands
