PrefabFiles = {
	"maymay",
	"maymay_none",
	"formredgem",
	"formorangegem",
	"formyellowgem",
	"formgreengem",
	"formbluegem",
	"formpurplegem",
	"rainbowtentacle",
	"hotgem",
	"coldgem",
	"allgem",
	"rainbowgarland",
	"rainbrella",
	"tentaclespots_placer",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/maymay.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/maymay.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/maymay.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/maymay.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/maymay_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/maymay_silho.xml" ),

    Asset( "IMAGE", "bigportraits/maymay.tex" ),
    Asset( "ATLAS", "bigportraits/maymay.xml" ),
	
	Asset( "IMAGE", "images/map_icons/maymay.tex" ),
	Asset( "ATLAS", "images/map_icons/maymay.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_maymay.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_maymay.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_maymay.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_maymay.xml" ),
	
	Asset( "IMAGE", "images/avatars/self_inspect_maymay.tex" ),
    Asset( "ATLAS", "images/avatars/self_inspect_maymay.xml" ),
	
	Asset( "IMAGE", "images/names_maymay.tex" ),
    Asset( "ATLAS", "images/names_maymay.xml" ),
	
    Asset( "IMAGE", "bigportraits/maymay_none.tex" ),
    Asset( "ATLAS", "bigportraits/maymay_none.xml" ),
	
	Asset( "IMAGE", "images/inventoryimages/formredgem.tex" ),
	Asset( "ATLAS", "images/inventoryimages/formredgem.xml" ),
	Asset( "IMAGE", "images/inventoryimages/formorangegem.tex" ),
	Asset( "ATLAS", "images/inventoryimages/formorangegem.xml" ),
	Asset( "IMAGE", "images/inventoryimages/formyellowgem.tex" ),
	Asset( "ATLAS", "images/inventoryimages/formyellowgem.xml" ),
	Asset( "IMAGE", "images/inventoryimages/formgreengem.tex" ),
	Asset( "ATLAS", "images/inventoryimages/formgreengem.xml" ),
	Asset( "IMAGE", "images/inventoryimages/formbluegem.tex" ),
	Asset( "ATLAS", "images/inventoryimages/formbluegem.xml" ),
	Asset( "IMAGE", "images/inventoryimages/formpurplegem.tex" ),
	Asset( "ATLAS", "images/inventoryimages/formpurplegem.xml" ),
	
	Asset( "IMAGE", "images/recipe_tab.tex" ),
	Asset( "ATLAS", "images/recipe_tab.xml" ),
}



local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
local resolvefilepath = GLOBAL.resolvefilepath



--Custom items
AddRecipe("formredgem", {GLOBAL.Ingredient("red_cap", 3), GLOBAL.Ingredient("killerbee", 3), GLOBAL.Ingredient("charcoal", 3)}, GLOBAL.RECIPETABS.REFINE, GLOBAL.TECH.SCIENCE_ONE, nil, nil, nil, nil, "rainbow_builder", "images/inventoryimages/formredgem.xml", "formredgem.tex" )

STRINGS.RECIPE_DESC.FORMREDGEM = "Burns with fire!" 
GLOBAL.STRINGS.NAMES.FORMREDGEM = "Crystallizing Red"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.FORMREDGEM = "Fiery gems."


AddRecipe("formyellowgem", {GLOBAL.Ingredient("green_cap", 3), GLOBAL.Ingredient("livinglog", 3), GLOBAL.Ingredient("honey", 3)}, GLOBAL.RECIPETABS.REFINE, GLOBAL.TECH.SCIENCE_ONE, nil, nil, nil, nil, "rainbow_builder", "images/inventoryimages/formyellowgem.xml", "formyellowgem.tex" )

STRINGS.RECIPE_DESC.FORMYELLOWGEM = "Reminds me of my chipmunk!"
GLOBAL.STRINGS.NAMES.FORMYELLOWGEM = "Crystallizing Yellow"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.FORMYELLOWGEM = "Is it daylight?"


AddRecipe("formbluegem", {GLOBAL.Ingredient("blue_cap", 3), GLOBAL.Ingredient("nightmarefuel", 3), GLOBAL.Ingredient("lightbulb", 3)}, GLOBAL.RECIPETABS.REFINE, GLOBAL.TECH.SCIENCE_ONE, nil, nil, nil, nil, "rainbow_builder", "images/inventoryimages/formbluegem.xml", "formbluegem.tex" )

STRINGS.RECIPE_DESC.FORMBLUEGEM = "So boo-tee-ful."
GLOBAL.STRINGS.NAMES.FORMBLUEGEM = "Crystallizing Blue"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.FORMBLUEGEM = "The power of ice."



AddRecipe("orangegem", {GLOBAL.Ingredient("redgem", 1), GLOBAL.Ingredient("yellowgem", 1)}, GLOBAL.RECIPETABS.REFINE, GLOBAL.TECH.SCIENCE_ONE, nil, nil, nil, nil, "rainbow_builder")
AddRecipe("greengem", {GLOBAL.Ingredient("yellowgem", 1), GLOBAL.Ingredient("bluegem", 1)}, GLOBAL.RECIPETABS.REFINE, GLOBAL.TECH.SCIENCE_ONE, nil, nil, nil, nil, "rainbow_builder")
AddRecipe("purplegem", {GLOBAL.Ingredient("bluegem", 1), GLOBAL.Ingredient("redgem", 1)}, GLOBAL.RECIPETABS.REFINE, GLOBAL.TECH.SCIENCE_ONE, nil, nil, nil, nil, "rainbow_builder")




AddRecipe("hotgem", {GLOBAL.Ingredient("redgem", 1), GLOBAL.Ingredient("orangegem", 1), GLOBAL.Ingredient("yellowgem", 1)}, GLOBAL.RECIPETABS.REFINE, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "rainbow_builder", "images/inventoryimages/hotgem.xml", "hotgem.tex" )

GLOBAL.STRINGS.NAMES.HOTGEM = "Hot Gem"
STRINGS.RECIPE_DESC.HOTGEM = "A red-orange-yellow gem combo!"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.HOTGEM = "A combination of all the hot-colored gems!"


AddRecipe("coldgem", {GLOBAL.Ingredient("greengem", 1), GLOBAL.Ingredient("bluegem", 1), GLOBAL.Ingredient("purplegem", 1)}, GLOBAL.RECIPETABS.REFINE, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "rainbow_builder", "images/inventoryimages/coldgem.xml", "coldgem.tex" )

GLOBAL.STRINGS.NAMES.COLDGEM = "Cold Gem"
STRINGS.RECIPE_DESC.COLDGEM = "A green-blue-purple gem combo!"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.COLDGEM = "A combination of all the cool-colored gems!"


AddRecipe("allgem", {GLOBAL.Ingredient("hotgem", 1, "images/inventoryimages/hotgem.xml"), GLOBAL.Ingredient("coldgem", 1, "images/inventoryimages/coldgem.xml")}, GLOBAL.RECIPETABS.REFINE, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "rainbow_builder", "images/inventoryimages/allgem.xml", "allgem.tex" )

GLOBAL.STRINGS.NAMES.ALLGEM = "Rainbow Gem"
STRINGS.RECIPE_DESC.ALLGEM = "All the gems!!"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.ALLGEM = "A combination of every gem!"


AddRecipe("rainbowgarland", {GLOBAL.Ingredient("hotgem", 1, "images/inventoryimages/hotgem.xml"), GLOBAL.Ingredient("coldgem", 1, "images/inventoryimages/coldgem.xml"), GLOBAL.Ingredient("flowerhat", 1)}, GLOBAL.RECIPETABS.DRESS, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "rainbow_builder", "images/inventoryimages/rainbowgarland.xml", "rainbowgarland.tex" )

GLOBAL.STRINGS.NAMES.RAINBOWGARLAND = "Rainbow Garland"
STRINGS.RECIPE_DESC.RAINBOWGARLAND = "A rainbow of flowers to wear!"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.RAINBOWGARLAND = "Beautiful rainbow flowers!"


AddRecipe("rainbrella", {GLOBAL.Ingredient("allgem", 1, "images/inventoryimages/allgem.xml"), GLOBAL.Ingredient("petals", 4), GLOBAL.Ingredient("twigs", 4)}, GLOBAL.RECIPETABS.SURVIVAL, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "rainbow_builder", "images/inventoryimages/rainbrella.xml", "rainbrella.tex" )

GLOBAL.STRINGS.NAMES.RAINBRELLA = "Rainbow 'Brella"
STRINGS.RECIPE_DESC.RAINBRELLA = "A pretty parasol!"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.RAINBRELLA = "Don't let me get wet!"


AddRecipe("rainbowtentacle", {GLOBAL.Ingredient("allgem", 1, "images/inventoryimages/allgem.xml"), GLOBAL.Ingredient("tentaclespots", 3)}, GLOBAL.RECIPETABS.TOOLS, GLOBAL.TECH.SCIENCE_TWO, nil, nil, nil, nil, "rainbow_builder", "images/inventoryimages/rainbowtentacle.xml", "rainbowtentacle.tex" )

GLOBAL.STRINGS.NAMES.RAINBOWTENTACLE = "Rainbow Tentacle"
STRINGS.RECIPE_DESC.RAINBOWTENTACLE = "It can chop, mine, and mow!"
GLOBAL.STRINGS.CHARACTERS.GENERIC.DESCRIBE.RAINBOWTENTACLE = "It can do anything!"







	
-- The character select screen lines
STRINGS.CHARACTER_TITLES.maymay = "Da Ultimate Tako"
STRINGS.CHARACTER_NAMES.maymay = "Maymay"
STRINGS.CHARACTER_DESCRIPTIONS.maymay = "*Can make gems and rainbow items!\n*Makes everyone happy!\n*Don't get her cold or wet!!"
STRINGS.CHARACTER_QUOTES.maymay = "\"It's-a me, Maymay!\""

-- Custom speech strings
STRINGS.CHARACTERS.MAYMAY = require "speech_maymay"

-- The character's name as appears in-game 
STRINGS.NAMES.MAYMAY = "Maymay"

AddMinimapAtlas("images/map_icons/maymay.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("maymay", "FEMALE")



local RECIPETABS = GLOBAL.RECIPETABS
local Recipe = GLOBAL.Recipe
local GIngredient = GLOBAL.Ingredient
local TECH = GLOBAL.TECH

local FRAMES = GLOBAL.FRAMES
local ACTIONS = GLOBAL.ACTIONS
local State = GLOBAL.State
local EventHandler = GLOBAL.EventHandler
local ActionHandler = GLOBAL.ActionHandler
local TimeEvent = GLOBAL.TimeEvent
local EQUIPSLOTS = GLOBAL.EQUIPSLOTS

-- Plantable tentacles.
local function GiveSpotsBack(pt) -- Something removes the item outside of the ondeploy method for some reason, so I gotta give the player spots back if their plant fails. Lame and hacky.
	local spots = GLOBAL.SpawnPrefab("tentaclespots")
	spots.Transform:SetPosition(pt:Get())
	spots.components.inventoryitem:OnDropped()
end
local function PlantableSpots(inst, pt, deployer)
	if deployer:HasTag("swampbro") then
		local tenta = GLOBAL.SpawnPrefab("tentacle")
		tenta.Transform:SetPosition(pt:Get())
		tenta.sg:GoToState("attack_post")
			
		deployer.SoundEmitter:PlaySound("dontstarve_DLC001/common/HUD_wet_close")
		inst:Remove()
				
	elseif deployer.components.talker ~= nil then
		deployer.components.talker:Say(GLOBAL.GetString(deployer, "ACTIONFAIL_GENERIC"))
		GiveSpotsBack(pt)
	end
end
AddPrefabPostInit("tentaclespots", function(inst)
	if GLOBAL.TheWorld.ismastersim then
		inst:AddComponent("deployable")
		inst.components.deployable:SetDeployMode(GLOBAL.DEPLOYMODE.PLANT)
		inst.components.deployable.ondeploy = PlantableSpots
	end
end)

-- Override tentacle's targeting so they won't target us unless provoked
local function retargetfn_Reg(inst) 
    return GLOBAL.FindEntity(
        inst,
        TUNING.TENTACLE_ATTACK_DIST,
        function(guy) 
            return guy.prefab ~= inst.prefab
                and guy.entity:IsVisible()
                and not guy.components.health:IsDead()
                and (guy.components.combat.target == inst or
                    guy:HasTag("character") or
                    guy:HasTag("monster") or
                    guy:HasTag("animal"))
        end,
        { "_combat", "_health" },
        { "prey", "swampbro" })
end

-- Override tenatcle arm's targeting so they won't target us... ever, apparently.
local function retargetfn_Arm(inst)
    return GLOBAL.FindEntity(inst, TUNING.TENTACLE_PILLAR_ARM_ATTACK_DIST, function(guy) 
        if not guy.components.health:IsDead() then
            return (not (guy.prefab == inst.prefab))
        end
    end,
    {"_combat","_health"},-- see entityscript.lua
    {"prey", "swampbro"},
    {"character","monster","animal"}
    )
end


local cooldowntime = 9
local starttime = 3
local endtime = 12
--as default 

local picking_rate = GetModConfigData("picking_rate")
------------------------------------------------------设置采集速率

if (picking_rate == "crazy") then
	
	cooldowntime = 1
	starttime = 0
	endtime = 1
	
elseif (picking_rate == "veryfast") then
	
	cooldowntime = 3
	starttime = 2
	endtime = 6
	
elseif (picking_rate == "fast") then
	
	cooldowntime = 6
	starttime = 3
	endtime = 9
	
elseif (picking_rate == "normal") then
	
	cooldowntime = 8
	starttime = 3
	endtime = 12
	
elseif (picking_rate == "slow") then
	
	cooldowntime = 11
	starttime = 4
	endtime = 15
	
end




GLOBAL.STRINGS.ACTIONS.MOWDOWN = "Mow Down" --Appears in the game.

MOWDOWN = GLOBAL.Action(1)
MOWDOWN.id = "MOWDOWN"                                               
MOWDOWN.str = GLOBAL.STRINGS.ACTIONS.MOWDOWN
MOWDOWN.fn = function(act)

--[[
local test 
if act and act.doer and act.doer.components and act.doer.components.inventory then 
	test =  act.doer.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS):HasTag("mower")
end

if test then
	print "pass"
	else print "no pass"
	end
]]

    if act.target.components.pickable  then
        act.target.components.pickable:Pick(act.doer)
        return true
    end
end
 ---------------------------------------test



--AddAction(MOWDOWN)        貌似会出现-dst published 文件夹下，preview里面 bugreport1 上面的问题 
--（可能会关系到componentactions.lua  components\playactionpicker.lua 以及 components\playcontroller.lua




local mowAtDown= State({
    name = "mowdown",
    tags = { "doing", "busy" },

    onenter = function(inst)
		local equip = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)		--

		--inst.sg.statemem.action = inst:GetBufferedAction()
		--ismower = inst:HasTag("mower")    --test
		inst.components.locomotor:Stop()

		
		local cooldown = cooldowntime*FRAMES
						
		if  equip:HasTag("mower")  then
			inst.AnimState:PlayAnimation("atk")								--因为尚未做动画，所以先用攻击动画
			inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_weapon")
			--inst.AnimState:PlayAnimation("mowdown")
		end

		inst.sg:SetTimeout(cooldown)  --
    end,



    timeline =
    {		
	GLOBAL.TimeEvent(starttime*GLOBAL.FRAMES, function( inst ) --???              ---can find in  stategraph.lua -------jia l
		inst.sg:RemoveStateTag("busy")
		end),

		GLOBAL.TimeEvent(cooldowntime*GLOBAL.FRAMES, function( inst ) --Go to next object
		inst:PerformBufferedAction()  
		end),

	GLOBAL.TimeEvent(endtime*GLOBAL.FRAMES, function( inst ) --Go to next object
		inst.sg:RemoveStateTag("doing")
		inst.sg:AddStateTag("idle")

		end),
	},


----no use
--[[
 timeline =
        {
            ----------------------------------------------
            TimeEvent(2 * FRAMES, function(inst) 
                    inst:PerformBufferedAction() 
            end),

            TimeEvent(4 * FRAMES, function(inst)         
                    inst.sg:RemoveStateTag("busy")
            end),

            TimeEvent(10 * FRAMES, function(inst)
                if  inst.components.playercontroller ~= nil and
                    inst.components.playercontroller:IsAnyOfControlsPressed(
                        CONTROL_PRIMARY,
                        CONTROL_ACTION,
                        CONTROL_CONTROLLER_ACTION) and
                    inst.sg.statemem.action ~= nil and
                    inst.sg.statemem.action:IsValid() and
                    inst.sg.statemem.action.target ~= nil and
                    inst.sg.statemem.action.target.components.pickable ~= nil and
                    inst.sg.statemem.action.target.components.pickable and
                    inst.sg.statemem.action.target:IsActionValid(inst.sg.statemem.action.action) then
                    inst:ClearBufferedAction()
                    inst:PushBufferedAction(inst.sg.statemem.action)
                end 
            end),

            TimeEvent(14 * FRAMES, function(inst)
                    inst.sg:RemoveStateTag("doing")
                	--	inst.sg:AddStateTag("idle")
            end),
        },
]]

	ontimeout = function(inst)               --动作结束，（也谓之超时）时执行
	--inst:PerformBufferedAction()      
	end,
	
-------------------test end-------

    events =
    {
   		--  EventHandler("unequip", function(inst) inst.sg:GoToState("idle") end),  --test
  		  EventHandler("animover", function(inst)
  		   if inst.AnimState:AnimDone() then 
  		   	inst.sg:GoToState("idle") 
  		   	end
  		   end )
    },
	
-------------test
--[[
    onexit = 
    function(inst)
		if inst.bufferedaction == inst.sg.statemem.action then
            inst:ClearBufferedAction()
        end
        inst.sg.statemem.action = nil
    end,
 ----------------test end  
]]
})


-----------------------以下这部分多参照 SGwilson_client.lua  中对应的动作和内容             
--ps：当有configure时， 要对 cooldown（10） 和 timeline里的 4（starttime） 14（endtime）进行设置.  一般cooldown代表完成动作，4为前摇时间，14 为带后摇的完成时间
local mowAtDown_client= State({
    name = "mowdown",
    tags = { "doing", "busy" },

    onenter = function(inst)
		local equip = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)		--

		--inst.sg.statemem.action = inst:GetBufferedAction()
		--ismower = inst:HasTag("mower")    --test
		inst.components.locomotor:Stop()

		local cooldown = cooldowntime * FRAMES	--client里的cooldown 基本用不到，都是随着主（非client）的cooldown，包括下面的大部分内容都会跟随主（非client）的设置执行

		if  equip:HasTag("mower")  then
			inst.AnimState:PlayAnimation("atk")								--因为尚未做动画，所以先用攻击动画
			inst.SoundEmitter:PlaySound("dontstarve/wilson/attack_weapon")
			--inst.AnimState:PlayAnimation("mowdown")
		end

 inst:PerformPreviewBufferedAction()   ---------在client里是关键， 有这一句才能保证客户端的角色动作会执行inst:PerformBufferedAction()
 --（无论这个xxx_client 的函数里有没有inst:PerformBufferedAction()，   inst:PerformPreviewBufferedAction()  必须要有）
		inst.sg:SetTimeout(cooldown)  --
    end,



    timeline =
    {		
	GLOBAL.TimeEvent(starttime* GLOBAL.FRAMES, function( inst ) --???              ---can find in  stategraph.lua -------jia l
		inst.sg:RemoveStateTag("busy")
		end),
			GLOBAL.TimeEvent(cooldowntime*GLOBAL.FRAMES, function( inst ) --Go to next object
		inst:PerformBufferedAction()  
		end),
	GLOBAL.TimeEvent(endtime * GLOBAL.FRAMES, function( inst ) --Go to next object
		inst.sg:RemoveStateTag("doing")
		inst.sg:AddStateTag("idle")
		end),
	},
	
--[[
        onupdate = function(inst)
            if inst:HasTag("working") then
                if inst.entity:FlattenMovementPrediction() then
                    inst.sg:GoToState("idle", "noanim")
                end
            elseif inst.bufferedaction == nil then
                inst.sg:GoToState("idle")
            end
        end,
        ]]

        ontimeout = function(inst)
        	--inst:PerformBufferedAction()  
         --   inst:ClearBufferedAction()
           -- inst.sg:GoToState("idle")
        end,
    
    events =
    {
   		-- EventHandler("unequip", function(inst) inst.sg:GoToState("idle") end),  --test
  		  EventHandler("animover", function(inst)
  		   if inst.AnimState:AnimDone() then 
  		   	inst.sg:GoToState("idle") 
  		   	end
  		   end )
    },

})







AddStategraphState("wilson", mowAtDown)

----对应上面的Addaction（） ,如果不添加action，这部分应该也是无用的
--[[
AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.MOWDOWN, function(inst, action)
																					local tool = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
																					return (tool:HasTag("mower") and "mowdown")  
																				end
																		)
)
]]


AddStategraphState("wilson_client", mowAtDown_client)

--[[
AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.MOWDOWN, function(inst, action)
																					local tool = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)																
																					return (tool:HasTag("mower") and "mowdown")  
																			end
																		)
)
]]
-----------------------(貌似ACTIONS.MOWDOWN并不会执行，而是执行的ACTIONS.PICK,所以scythe.lua里的 consumption 要用 ACTIONS.PICK)--------------

---------------------------------------------------------
--local SGWils = require "stategraphs/SGwilson"
--local SGWils_client = require "stategraphs/SGwilson_client"
--local OriginalDestStatePICK
--[[
for k, v in pairs(SGWils.actionhandlers) do
	if SGWils.actionhandlers[k]["action"]["id"] == "PICK" then	
		OriginalDestStatePICK = SGWils.actionhandlers[k]["deststate"]
	end
end
]]
local function NewPICK(inst, action)
	local tool 
	if inst and inst.components and inst.components.inventory then
		tool = inst.components.inventory:GetEquippedItem(EQUIPSLOTS.HANDS) 
	else tool = nil
	end 

	if action.target.components.pickable ~= nil then

		if tool and tool:HasTag("mower")  and ((action.target.prefab == "grass") or (action.target.prefab == "sapling") or (action.target.prefab == "reeds")) then                               --新加的部分来实现在符合条件时调用镰刀的pick动作
			return "mowdown"

		elseif action.target.components.pickable.quickpick then
			return "doshortaction"
		else 
			return "dolongaction"
		end
	else 

	return nil
	end
end


local function NewPICK_client(inst, action)
	local tool 
	if inst and inst.replica and inst.replica.inventory then
		tool = inst.replica.inventory:GetEquippedItem(EQUIPSLOTS.HANDS)
	else tool = nil
	end 
--[[
if  tool and tool:HasTag("mower")  and ((action.target.prefab == "grass") or (action.target.prefab == "sapling") or (action.target.prefab == "reeds"))  then
	print ( "1")
else
	print "no 1"
end
if action.target.prefab == "grass" then
	print ("2")
else
	print "no 2"
end
if  tool:HasTag("mower") then
	print "3"
else
	print "3"
end
]]
		if tool and tool:HasTag("mower")  and ((action.target.prefab == "grass") or (action.target.prefab == "sapling") or (action.target.prefab == "reeds")) then                               --新加的部分来实现在符合条件时调用镰刀的pick动作
			return "mowdown"

		elseif action.target:HasTag("quickpick") then
			return "doshortaction"
		else 
			return "dolongaction"
		end
	
end


AddStategraphActionHandler("wilson", ActionHandler(ACTIONS.PICK, NewPICK))             --改写SGwilson中 actionhandlers{}中的ACTIONS.PICK 的函数为 NewPICK
GLOBAL.package.loaded["stategraphs/SGwilson"] = nil 


AddStategraphActionHandler("wilson_client", ActionHandler(ACTIONS.PICK, NewPICK_client))
GLOBAL.package.loaded["stategraphs/SGwilson_client"] = nil


