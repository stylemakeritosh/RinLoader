-- Services
local HttpService = game:GetService("HttpService")
local gameId = game.PlaceId

-- Table to store game IDs and their corresponding loadstring URLs
local gameLoadstrings = {
    -- Format: [gameId] = "loadstring_url"
    [10449761463] = "https://raw.githubusercontent.com/stylemakeritosh/Otherscriptsrc/refs/heads/main/camlocktsbsrcc",
    [137925884276740] = "https://raw.githubusercontent.com/stylemakeritosh/Otherscriptsrc/refs/heads/main/Buildaplaneinfmoneysrc"
}

-- Function to load and execute the loadstring for the current game
local function loadGameScript()
    local loadstringUrl = gameLoadstrings[gameId]
    
    if loadstringUrl then
        pcall(function()
            local loadstringCode = game:HttpGet(loadstringUrl)
            local success, result = pcall(function()
                return loadstring(loadstringCode)()
            end)
            if not success then
                warn("Failed to execute loadstring for Game ID " .. gameId .. ": " .. tostring(result))
            end
        end)
    else
        warn("No loadstring found for Game ID: " .. gameId)
    end
end

-- Execute the loadstring for the current game
loadGameScript()