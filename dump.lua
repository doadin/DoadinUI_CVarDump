--local json = _G['json']

local frame = CreateFrame("FRAME"); -- Need a frame to respond to events
frame:RegisterEvent("ADDON_LOADED"); -- Fired when saved variables are loaded
frame:RegisterEvent("PLAYER_LOGOUT"); -- Fired when about to log out

function frame:OnEvent(event, arg1)
    if event == "ADDON_LOADED" and arg1 == "DoadinUICVarDump" then
      -- Our saved variables are ready at this point. If there are none, both variables will set to nil.
        if DoadinUICVarDump == nil then
            DoadinUICVarDump = 0; -- This is the first time this addon is loaded; initialize the count to 0.
        end
    end
    
    local CVarTable = C_Console.GetAllCommands()
    --local CVarTableString = table.tostring(CVarTable)
    DoadinUICVarDump = CVarTable
    --DoadinUICVarDump = json.encode(CVarTableString)
    
    --for _, info in pairs(C_Console.GetAllCommands()) do
	--    if
	--      info.commandType == 0 -- cvar, rather than script
	--      and info.category ~= 0 -- ignore debug category
	--      and not strfind(info.command:lower(), 'debug') -- a number of commands with "debug" in their name are inexplicibly not in the "debug" category
	--      and info.category ~= 8 -- ignore GM category
	--    then
	--    	local value = GetCVar(info.command)
	--    	local optionTable = {
	--    		-- prettyName = info.command, -- the api doesn't provide pretty names, so the only way to keep these would be to create a table for them
	--    		description = info.help,		
	--    	}
	--    end
    --end    
end

---local json = _G['json']
---local str = message
---if (json ~= nil) then
---    local obj, pos, err = json.decode (message, 1, nil)
---    if err then
---        print ("Error:", err)
---    else
---        HeroesData = obj
---        print(HeroesData)
---    end
---end

frame:SetScript("OnEvent", frame.OnEvent);