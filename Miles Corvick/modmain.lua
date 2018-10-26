TUNING.HAT_BEES = 999999999
TUNING.HAT_BEES_ABSORBTION = 1 

PrefabFiles = {
	"miles",
	"miles_none",
	"bigcraterprint",
}

Assets = {
    Asset( "IMAGE", "images/saveslot_portraits/miles.tex" ),
    Asset( "ATLAS", "images/saveslot_portraits/miles.xml" ),

    Asset( "IMAGE", "images/selectscreen_portraits/miles.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/miles.xml" ),
	
    Asset( "IMAGE", "images/selectscreen_portraits/miles_silho.tex" ),
    Asset( "ATLAS", "images/selectscreen_portraits/miles_silho.xml" ),

    Asset( "IMAGE", "bigportraits/miles.tex" ),
    Asset( "ATLAS", "bigportraits/miles.xml" ),
	
	Asset( "IMAGE", "images/map_icons/miles.tex" ),
	Asset( "ATLAS", "images/map_icons/miles.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_miles.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_miles.xml" ),
	
	Asset( "IMAGE", "images/avatars/avatar_ghost_miles.tex" ),
    Asset( "ATLAS", "images/avatars/avatar_ghost_miles.xml" ),
	
	Asset( "IMAGE", "images/avatars/self_inspect_miles.tex" ),
    Asset( "ATLAS", "images/avatars/self_inspect_miles.xml" ),
	
	Asset( "IMAGE", "images/names_miles.tex" ),
    Asset( "ATLAS", "images/names_miles.xml" ),
	
    Asset( "IMAGE", "bigportraits/miles_none.tex" ),
    Asset( "ATLAS", "bigportraits/miles_none.xml" ),
}

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS

-- The character select screen lines
STRINGS.CHARACTER_TITLES.miles = "The Bird Man"
STRINGS.CHARACTER_NAMES.miles = "Miles"
STRINGS.CHARACTER_DESCRIPTIONS.miles = "*Powerful punches!\n*Friend to bees!\n*Is a bird!"
STRINGS.CHARACTER_QUOTES.miles = "\"I am good to Bahamut,\nBahamut is good to me...\""

-- Custom speech strings
STRINGS.CHARACTERS.MILES = require "speech_miles"

-- The character's name as appears in-game 
STRINGS.NAMES.MILES = "Miles"

AddMinimapAtlas("images/map_icons/miles.xml")

-- Add mod character to mod character list. Also specify a gender. Possible genders are MALE, FEMALE, ROBOT, NEUTRAL, and PLURAL.
AddModCharacter("miles", "MALE")

--Thanks goes to w00tyd00d on the forum for these next functions!
function BeePostInit(inst)
	inst:AddTag("smallbee")
end
AddPrefabPostInit("bee", BeePostInit)
AddPrefabPostInit("killerbee", BeePostInit)
AddPrefabPostInit("beeguard", BeePostInit)

function CombatCompPostInit(comp)
	local old_SetTarget = comp.SetTarget

	comp.SetTarget = function(self, target)
		if self.inst:HasTag("smallbee") and (target and (target:HasTag("companion") or target.components.inventory and target.components.inventory:EquipHasTag("happybees"))) then
			target = nil
		end
		old_SetTarget(self, target)
	end
end

AddComponentPostInit("combat", CombatCompPostInit)

function WaspHivePostInit(inst)
	local function new_onnear(inst, target)
	    if inst.components.childspawner ~= nil and not
	    	(target.components.inventory and target.components.inventory:EquipHasTag("happybees")) then
	        inst.components.childspawner:ReleaseAllChildren(target, "killerbee")
	    end
	end

	local function new_onhitbyplayer(inst, attacker, damage)
	    if inst.components.childspawner ~= nil and not
	    	(attacker.components.inventory and attacker.components.inventory:EquipHasTag("happybees")) then
	        inst.components.childspawner:ReleaseAllChildren(attacker, "killerbee")
	    end
	    if not inst.components.health:IsDead() then
	        inst.SoundEmitter:PlaySound("dontstarve/bee/beehive_hit")
	        inst.AnimState:PlayAnimation("cocoon_small_hit")
	        inst.AnimState:PushAnimation("cocoon_small", true)
	    end
	end
	
	if GLOBAL.TheWorld.ismastersim then
		inst.components.playerprox:SetOnPlayerNear(new_onnear)
		inst.components.combat:SetOnHit(new_onhitbyplayer)
	end
end
AddPrefabPostInit("wasphive", WaspHivePostInit)

local require = GLOBAL.require
local STRINGS = GLOBAL.STRINGS
--

