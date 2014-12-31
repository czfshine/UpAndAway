---coding: UTF-8--
--auto build this mod 
--like MAKEFILE but use lua 
--can under window  linux 
-------------------------------------
Usage=[[
--$lua MAKE.lua [commonly]
--The most commonly used MAKE.lua commands are:
-- all (default)   make all and clean 
-- clean           clean all log 
-- anim_image      only build anim and image
-- image           only build image (using ktools)
-- clean-push      clean  all anim , image   for push
-- cp2mod          copy all required resources to a new dir ,Used to release :)
-- help            print this ]]
----------------------------------------------------------
--****configure****----------------------------------
---------------------------------------------------------
require "tools.osystem"
sep= os.islinux and "/" or 
    os.iswindows and "\\" or
--[[ismac]]  "/"

--the mod_tools autocompiler
--mod_tools/../../dont_starve/mod/upandway/
----------------------------------------------
--root 
--   ├─tools
--   │     └mod_tools
--   │ 
--   └dont_starve
--         └mod
--            └upandway (this mod)
-----------------------------------------------
mod_tools_dir=string.gsub("../../tools/mod_tools","/",sep)

--if has the mod_tools ,this can not 
--ktools_dir =string.gsub("./bin/tools","/",sep)
--using_ktool=true
--------------------------------------
--****get arg ******
commonly=arg[1] or  ""

if commonly =="help" then 
  print(Usage)
elseif  commonly =="all" or commonly ==""  then 
  Is_all=true 
elseif  commonly =="clean"  then 
  Is_clean=true
elseif  commonly =="anim_image"  then 
  Is_anim_image=true
elseif  commonly =="image"  then 
  Is_image=true
elseif  commonly =="clean_push"  then 
  Is_clean_push=true
elseif  commonly =="cp2mod"  then 
  Is_cp2mod =true
else 
  print("not commonly is "..commonly)
  print(Usage)
  os.exit(-1)
end

--------------------------------------------------
--some fn
------------------------------------------------
function HasMod_Tools(mod_tools_dir)
  
  if os.iswindows then 
    local exe = io.open(mod_tools_dir..sep.."autocompiler.exe")
  else --islinux or mac 
    local exe = io.open(mod_tools_dir..sep.."autocompiler")
  end 
  
  if exe then 
    exe:close()
    return true 
  end
end

function RunMod_Tools(mod_tools_dir)
  if HasMod_Tools then 
    local r=os.execute(mod_tools_dir..sep.."autocompiler")
    if r ==0 then 
      return true
    else 
      return nil,"run autocompiler is error,the return is "..r
    end
  else 
     return nil,"run autocompiler is error,not has the autocompiler"
  end
end

function Clean_Log()
  --not log
  return true 
end

function Clean_push()
  --this not-need
  --because using .gitignore file 
  return true 
end

modfile={
  "anim/.*%.zip",
  "bigportraits/.*%.[tex|xml]",
  "code/.*",
  "favicon/.*%.[tex|xml]",
  --"hubris/.*",  is need ?
  "images/.*%.[tex|xml]",
  "levels/.*%.[tex|xml]",
  "lib/.*%.lua",
  


  









