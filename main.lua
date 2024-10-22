-- Script initialization
local module = {
    core = {},
    tools = {},
    scripts = loadstring(game:HttpGet("https://github.com/scriptdevvies/Scripts/raw/refs/heads/main/scripts.lua",true))()
}
-- Functions (help)
function module:GetScriptList(readable)
    if readable then
        for key, value in pairs(self.scripts) do
            if type(value) == "table" then
                print(key .. ":")
                for subkey, subvalue in pairs(value) do
                    print("    " .. subkey .. ": " .. subvalue)
                end
            else
                print(key .. ": " .. tostring(value))
            end
        end
    else
        return self.scripts
    end
end

-- Functions (Scripts)
function module:LoadScript(scr)
    if self.scripts[scr] then
        loadstring(game:HttpGet(self.scripts[scr], true))()  -- Load and execute the script
    else
        return error("Invalid script, use the GetScriptList() function")
    end
end

-- Functions (Tools)
-- loadstring() via HttpGet (put into a function)
function module.tools:LoadStringHttp(url)
    if url then
        loadstring(game:HttpGet(url, true))()  -- Load and execute the script
    else
        return error("No URL specified")
    end
end

-- loadstring() via string (bytecode or minified, no HttpGet)
function module.tools:LoadString(str)
    if str then
        return loadstring(str)()  -- Load and execute the string
    else
        return error("Please specify a string")
    end
end

-- Create loadstring() function via variable that can be activated
function module.tools:CreateLoadString(url, str)
    if url ~= nil and str ~= nil then
        return module.core:__createloadstring(url,str)
    elseif url ~= nil and str == nil then
        return module.core:__createloadstring(url,nil)
    elseif url == nil and str ~= nil then
        return module.core:__createloadstring(nil,str)
    else
        return module.core:__createloadstring(nil,nil)
    end
end

function module.core:__createloadstring(url, str)
    local __func = {}
    if url ~= nil and str ~= nil then
        __func.url = url
        __func.str = str
        function __func:Activate(isURL)
            if isURL then
                loadstring(game:HttpGet(__func.url,true))()
            elseif isURL == false then
                loadstring(__func.str)
            end
        end
    elseif url ~= nil and str == nil then
        __func.url = url
        function __func:Activate()
            loadstring(game:HttpGet(__func.url,true))()
        end
    elseif url == nil and str ~= nil then
        __func.str = str
        function __func:Activate()
                return loadstring(__func.str)()
        end
    elseif url == nil and str == nil then
        function __func:Activate(isURL)
            if isURL then
                loadstring(game:HttpGet(__func.url,true))()
            elseif isURL == false then
                loadstring(__func.str)
            else
                return error("No variables specified (specify __func.str and/or __func.url and check documentation)")
            end
        end
    end
    
    return __func
end

return module
