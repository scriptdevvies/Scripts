-- Scripts provided
local scripts = {
  ["prizzlife"] = "https://raw.githubusercontent.com/elliexmln/PrizzLife/main/pladmin.lua"
}

-- Script initialization
local module = {
  core = {},
  tools = {}
}

-- Functions (help)
function module:GetScriptList()
  return scripts
end

-- Functions (Scripts)
function module:LoadScript(scr:string)
  if scripts[scr] then
    loadstring(game:HttpGet((scripts[scr]),true))()
  else
    return error("Invalid script, use the GetScriptList() function")
  end
end

-- Functions (Tools)
-- loadstring() via HttpGet (put into a function)
function module.tools:LoadStringHttp(url:string)
  if url then
    loadstring(game:HttpGet((url),true))()
  else
    return error("No URL specified")
  end
end

-- loadstring() via string (bytecode or minified, no HttpGet)
function module.tools:LoadString(str:string)
  if str then
    loadstring(str)
  else
    return error("Please specify a string")
  end
end


-- Create loadstring() function via variable that can be activated
function module.tools:CreateLoadString(url:string,str:string)
  if url then
    return module.core:__createloadstring(url)
  else
    return module.core:__createloadstring(str)
  end
end

function module.core:__createloadstring(url:string,str:string)
  local __func = {}
  if url then
    local function __func:Activate()
      loadstring(game:HttpGet((url),true)()
    end
  elseif str then
    local function __func:Activate()
      loadstring(str)
    end
  else
    local function __func:Activate()
      if __func.str then
        loadstring(__func.str)
      else
        return error("No string to activate, set func.str to the string you want to load (func is loadstring created and returned)")
      end
  end
return __func
end

return module
