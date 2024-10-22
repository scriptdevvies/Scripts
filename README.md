# ScriptDevvies Scripts
### ScriptDevvies Scripts is an API service designed for exploiters and penetration testers to use to make their jobs easier.

### Documentation
URL to load: https://raw.githubusercontent.com/scriptdevvies/Scripts/refs/heads/main/main.lua<br>
Parameters in *italic* are required.<br>
Use this snippet to load the ScriptDevvies API.
```lua
local scriptdevvies = loadstring(game:HttpGet('https://raw.githubusercontent.com/scriptdevvies/Scripts/refs/heads/main/main.lua',true))()
```

##### Stored Scripts

function *GetScriptList(readable)*<br>
Returns a `table` with all script hubs or exploit URLs available.
Parameters: *readable*, to show a readable format of table as a `string`, created for the `print()` function.
If *readable* is false, it provides a `table` for general use.
```lua
print(scriptdevvies:GetScriptList(true))
-- Output
key: value, key: value, etc...
print(scriptdevvies:GetScriptList(false))
-- Output
table:0x12345678
```

function *LoadScript(scr)*<br>
Loads script from our API's database of scripts.<br>
Parameters: *scr*, which is the name of the script obtained via function *GetScriptList(readable)*.<br>
If not provided or invalid name in the table, will `return error("Invalid script, use the GetScriptList() function for a list of scripts")`
```lua
scriptdevvies:LoadScript("prizzlife")
-- Output
(No output, executes the script "PrizzLife" in our database.)
```

##### Tools

function *scriptdevvies.tools:LoadStringHttp(url)*<br>
Loads the HTTP URL provided in the `url` parameter of the function via `loadstring(game:HttpGet(url,true))()`
Parameters: *url*, the URL to load in the `loadstring()` function.<br>
If not provided, will `return error("No URL specified")`
```lua
scriptdevvies.tools:LoadStringHttp("https://example.com/myscript.lua")
-- Output
(No output, executes the loadstring() function with the URL provided, which is https://example.com/myscript.lua)
```

function *scriptdevvies.tools:LoadString(str:string)*<br>
loadstring() function wrapped in our API.
Parameters: *str*, the string to be executed.<br>
If not provided, will `return error("Please specify a string")`
```lua
scriptdevvies.tools:LoadString("print('Hello, world!')")
-- Output
Hello, world!
```

function *scriptdevvies.tools:CreateLoadString(url:string,str:string)*<br>
Creates a `table` containing the `:Activate()` function for use to execute the wrapped `loadstring()` function when needed.<br>
Parameters: url, URL for loadstring via HttpGet, and str, string for loadstring<br>
If neither used, it will `return error("No variables specified (specify __func.str and/or __func.url and check documentation)")`<br>
It uses the internal function `scriptdevvies.core:__createloadstring(url,str)` for creation.<br>
Example 1:
```lua
local UrlLoadString = scriptdevvies.tools:CreateLoadString("https://example.com/myscript.lua")
-- Output:
(No output, returns a table which contains the :Activate() function)
UrlLoadString:Activate()
-- Output:
(No output, executes loadstring(game:HttpGet("https://example.com",true))())
```
Example 2:
```lua
local StringLoadString = scriptdevvies.tools:CreateLoadString(nil,"print('Hello, world!')")
-- Output:
(No output, returns a table which contains the :Activate() function)
StringLoadString:Activate()
-- Output:
Hello, world!
```
Example 3:
```lua
local LoadString = scriptdevvies.tools:CreateLoadString()
LoadString.url = "https://example.com/myscript.lua"
LoadString.str = "print('Hello, world!')"
-- Output
(No output, returns a table which has the :Activate(isURL) function)
LoadString:Activate(true)
-- Output
(No output, executes loadstring(game:HttpGet("https://example.com/myscript.lua",true))())
LoadString:Activate(false)
-- Output
Hello, world!
```

**That's all the functions we currently have! Documentation may be updated soon.**
