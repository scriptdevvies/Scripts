# ScriptDevvies Scripts
### ScriptDevvies Scripts is a Lua file meant to contain scripts and tools for you to use in your career of exploiting. Or whatever you please.

### Documentation
URL to load: https://raw.githubusercontent.com/scriptdevvies/Scripts/refs/heads/main/main.lua
The term `module` is the equivalent of `scriptdevvies` stated below.
Parameters in *italic* are required.
When using `loadstring('the url to load the module is stated above')` to load the module, you should do this:
```lua
local scriptdevvies = loadstring('url stated above')
```
This way, you can get functions easily from the module.

##### Stored Scripts

function *GetScriptList()*
Returns a `table` with all scripts (raw exploit urls) available.
```lua
module:GetScriptList()
-- Output
{...}
```
Defined table at line 2 of main.lua.

function *LoadScript(scr:string)*
Loads script from table of function module:GetScriptList()
Parameters: *scr*, script name in table, such as `"prizzlife"`
If not provided or invalid name in the table, will `return error("Invalid script, use the GetScriptList() function for a list of scripts")`
```lua
module:LoadScript("prizzlife")
-- Output
(none, executes loadstring of prizzlife script)
```

##### Tools

function *module.tools:LoadStringHttp(url:string)*
Loads an HTTP URL with raw data to the loadstring() function via DataModel:HttpGet().
Parameters: *url*, URL to load via loadstring() such as `"https://example.com"`
If not provided, will `return error("No URL specified")`
```lua
module.tools:LoadStringHttp("https://example.com")
-- Output
(none, executes loadstring(game:HttpGet(("https://example.com"),true))())
```

function *module.tools:LoadString(str:string)*
loadstring() function but wrapped in a function. Differs from LoadStringHttp as it does not load with DataModel:HttpGet()
Parameters: *str*, string to be loaded
If not provided, will `return error("Please specify a string")`
```lua
module.tools:LoadString("print('hi')")
-- Output
hi
```

function *module.tools:CreateLoadString(url:string,str:string)*
Creates a table with functions that can activate a loadstring when needed. *__func* is defined as the returned table.
Parameters: url, URL for loadstring via HttpGet, str, string for loadstring
If neither used, and `__func.str` is nil (empty), will `return error("No string to activate, set func.str to the string you want to load (func is loadstring created and returned)")`
Uses: *module.core:__createloadstring(url:string,str:string)*
**THE FUNCTION WILL BE UPDATED WITH NEW FEATURES, MEANING IT MAY NOT WORK IF YOU USE THIS. DOCUMENTATION WILL BE UPDATED WHEN THIS MESSAGE IS NOT HERE.**
Example 1:
```lua
local UrlLoadString = module.tools:CreateLoadString("https://example.com")
-- Output: (none, returns __func)
UrlLoadString:Activate()
-- Output:
(executes loadstring(game:HttpGet(("https://example.com"),true))())
```
Example 2:
```lua
local StringLoadString = module.tools:CreateLoadString(nil,"print('hi')")
-- Output: (none, returns __func)
StringLoadString:Activate()
-- Output:
hi (executes loadstring "print('hi')")
```
Example 3:
```lua
local LoadString = module.tools:CreateLoadString()
LoadString.str = "print('hi')"
-- Output
(none, __func.str has been defined)
LoadString:Activate()
-- Output
hi (string has been activated)
```

**That's all we have as of now! Documentation may be updated soon.**
