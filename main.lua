-- Script initialization
local module = {
    core = {},
    tools = {},
    scripts = {
        ["prizzlife"] = "https://raw.githubusercontent.com/elliexmln/PrizzLife/main/pladmin.lua"
    }
}

-- Functions (help)
function module:GetScriptList(readable)
    if readable then
        for key, value in pairs(self.scripts) do
            print(key .. ": " .. value)
        end
    else
        return scripts
    end
end

-- Functions (Scripts)
function module:LoadScript(scr)
    if scripts[scr] then
        loadstring(game:HttpGet(scripts[scr], true))()  -- Load and execute the script
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
    if url then
        return module.core:__createloadstring(url)
    else
        return module.core:__createloadstring(str)
    end
end

function module.core:__createloadstring(url, str)
    local __func = {}
    if url then
        -- Fix missing closing parenthesis
        function __func:Activate()
            return loadstring(game:HttpGet(url, true))()  -- Load and execute the script
        end
    elseif str then
        function __func:Activate()
            return loadstring(str)()  -- Load and execute the string
        end
    else
        function __func:Activate()
            if __func.str then
                return loadstring(__func.str)()  -- Load and execute if str is set
            else
                return error("No string to activate, set func.str to the string you want to load (func is loadstring created and returned)")
            end
        end
    end
    
    return __func  -- Return the function table
end

return module
