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
-- anim            only build anim 
-- image           only build image 
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
mod_tools_dir=string.gsub("../../../bin/tool/mod_tools","/",sep)

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
elseif  commonly =="anim"  then 
  Is_anim=true
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

function HasMod_Tools(mod_tools_dir)
  local exe = io.open(mod_tools_dir..sep.."autocompiler.exe")
  if exe then 
    exe:close()
    return true 
  end
end







