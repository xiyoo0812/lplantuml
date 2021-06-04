--generate_uml"
local lfs 	= require("lfs")

local ldir          = lfs.dir
local lmkdir        = lfs.mkdir
local lcurdir       = lfs.currentdir
local lattributes   = lfs.attributes
local ssub 			= string.sub
local sfind 		= string.find

local slash 		= "\\"
local plantuml_jar 	= "plantuml.1.2021.7.jar"

--入口函数
local function export_plantuml(input_dir)
    for file_name in ldir(input_dir) do
        if file_name == "." or file_name == ".." then
            goto continue
        end
        local input_name = input_dir .. slash .. file_name
        local attr = lattributes(input_name)
        if attr.mode == "directory" then
            export_plantuml(input_name)
            goto continue
        end
        os.execute(string.format("java -jar %s %s", plantuml_jar, input_name))
        :: continue ::
    end
end

--检查配置
local function export_config()
    local input_dir = lcurdir()
    local env_input = arg[1]
    if not env_input or #env_input == 0 then
        print("input dir not config!")
        input_dir = input_dir
    else
        input_dir = input_dir .. slash .. env_input
    end
    return input_dir
end

print("useage: lua.exe plantuml.lua input_dir")
print("begin export plantuml to image!")
local input_dir = export_config()
local ok, err = pcall(export_plantuml, input_dir)
if not ok then
    print("export plantuml to image failed:", err)
end
print("success export plantuml to image!")
