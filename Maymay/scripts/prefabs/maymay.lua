local easing = require("easing")
local MakePlayerCharacter = require "prefabs/player_common"


local assets = {
    Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
	Asset( "ANIM", "anim/pandamaymay.zip" ),
}
local prefabs = {
	"redgem",
	"bluegem",
	"purplegem",
	"orangegem",
	"greengem",
	"yellowgem",
	"hotgem",
	"coldgem",
	"allgem",
}

-- Custom starting items
local start_inv = {
}

local function onbecameghost(inst)
	-- Remove speed modifier when becoming a ghost
   inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "maymay_speed_mod")
end

-- When loading or spawning the character
local function onload(inst)
    inst:ListenForEvent("ms_respawnedfromghost", onbecamehuman)
    inst:ListenForEvent("ms_becameghost", onbecameghost)

    if inst:HasTag("playerghost") then
        onbecameghost(inst)
    else
        onbecamehuman(inst)
    end
end

-- Lookup table, if the prefab is a valid key, then the value is true
local IsFoodGem = {
	purplegem = true,
	bluegem = true,
	redgem = true,
	orangegem = true,
	yellowgem = true,
	greengem = true,
	tunacan = true,
	baconeggs = true,
	cave_banana = true,
	cave_banana_cooked = true,
	bananapop = true,
	batwing = true,
	batwing_cooked = true,
	berries = true,
	berries_cooked = true,
	acorn = true,
	acorn_cooked = true,
	bisque = true,
	butter = true,
	butterflymuffin = true,
	butterflywings = true,
	cactus_meat = true,
	cactus_meat_cooked = true,
	cactus_flower = true,
	california_roll = true,
	carrot = true,
	carrot_cooked = true,
	caviar = true,
	ceviche = true,
	coconut = true,
	coffee = true,
	coffeebeans = true,
	coffeebeans_cooked = true,
	corn = true,
	corn_cooked = true,
	carrot_seeds = true,
	corn_seeds = true,
	dragonfruit_seeds = true,
	durian_seeds = true,
	eggplant_seeds = true,
	pomegranate_seeds = true,
	pumpkin_seeds = true,
	watermelon_seeds = true,
	sweet_potato_seeds = true,
	deerclops_eyeball = true,
	doydoyegg = true,
	doydoyegg_cooked = true,
	dragonfruit = true,
	dragonfruit_cooked = true,
	dragonpie = true,
	dragoonheart = true,
	drumstick = true,
	drumstick_cooked = true,
	durian = true,
	durian_cooked = true,
	bird_egg = true,
	bird_egg_cooked = true,
	eggplant = true,
	eggplant_cooked = true,
	goatmilk = true,
	fish = true,
	fish_cooked = true,
	fish_raw_small = true,
	fish_raw_small_cooked = true,
	fishtacos = true,
	fishsticks = true,
	jammypreserves = true,
	flowersalad = true,
	freshfruitcrepes = true,
	froglegs = true,
	froglegs_cooked = true,
	frogglebunwich = true,
	fruitmedley = true,
	glommerfuel = true,
	wormlight = true,
	guacamole = true,
	minotaurhorn = true,
	honey = true,
	honeyham = true,
	honeynuggets = true,
	ice = true,
	icecream = true,
	jellypop = true,
	jellybean = true,
	meat_dried = true,
	berries_juicy = true,
	berries_juicy_cooked = true,
	kabobs = true,
	trunk_summer = true,
	trunk_cooked = true,
	plantmeat = true,
	plantmeat_cooked = true,
	wormlight_lesser = true,
	cutlichen = true,
	lightbulb = true,
	limpets = true,
	limpets_cooked = true,
	mandrake = true,
	mandrakesoup = true,
	meatballs = true,
	meat = true,
	cookedmeat = true,
	bonestew = true,
	watermelonicle = true,
	monstermeat_dried = true,
	monsterlasagna = true,
	monstermeat = true,
	cookedmonstermeat = true,
	monstertartare = true,
	smallmeat = true,
	cookedsmallmeat = true,
	red_cap = true,
	red_cap_cooked = true,
	green_cap = true,
	green_cap_cooked = true,
	blue_cap = true,
	blue_cap_cooked = true,
	petals = true,
	perogies = true,
	pomegranate = true,
	pomegranate_cooked = true,
	powcake = true,
	pumpkin = true,
	pumpkin_cooked = true,
	pumpkincookie = true,
	ratatouille = true,
	fish_raw = true,
	fish_med_cooked = true,
	royal_jelly = true,
	seafoodgumbo = true,
	seeds = true,
	seeds_cooked = true,
	smallmeat_dried = true,
	stuffedeggplant = true,
	sweet_potato = true,
	sweet_potato_cooked = true,
	sweetpotatosouffle = true,
	taffy = true,
	tallbirdegg = true,
	tallbirdegg_cooked = true,
	trailmix = true,
	turkeydinner = true,
	waffles = true,
	watermelon = true,
	watermelon_cooked = true,
	winter_food1 = true,
	winter_food2 = true,
	winter_food3 = true,
	winter_food4 = true,
	winter_food5 = true,
	winter_food6 = true,
	winter_food7 = true,
	winter_food8 = true,
	winter_food9 = true,
	halloweencandy_1 = true,
	halloweencandy_2 = true,
	halloweencandy_3 = true,
	halloweencandy_4 = true,
	halloweencandy_5 = true,
	halloweencandy_6 = true,
	halloweencandy_7 = true,
	halloweencandy_8 = true,
	halloweencandy_9 = true,
	halloweencandy_10 = true,
	halloweencandy_11 = true,
}

-- Different effects per gem
-- All gems give by default, 10 health, and 5 hunger
-- The effects here are extra
local function oneat(inst, food)
	if food.prefab == "redgem" then
		inst.components.health:DoDelta(40)
	elseif food.prefab == "orangegem" then
		inst.components.temperature:DoDelta(TUNING.HOT_FOOD_BONUS_TEMP)
	elseif food.prefab == "yellowgem" then
		inst.components.moisture:SetMoistureLevel(0)
	elseif food.prefab == "greengem" then
		inst.components.hunger:DoDelta(40)
	elseif food.prefab == "bluegem" then
		inst.components.temperature:DoDelta(TUNING.COLD_FOOD_BONUS_TEMP)
	elseif food.prefab == "purplegem" then
		inst.components.sanity:DoDelta(40)
	end
end

local function GemEater(inst)
	-- To eat all elementals (including gems)
	local eater = inst.components.eater
	table.insert(eater.preferseating, FOODTYPE.ELEMENTAL)
	table.insert(eater.caneat, FOODTYPE.ELEMENTAL)
	eater.inst:AddTag(FOODTYPE.ELEMENTAL.."_eater")
	-- To refuse elementals that are not gems
	local _TestFood = eater.TestFood
	eater.TestFood = function(self, food, testvalues)
		return _TestFood(self, food, testvalues) and IsFoodGem[food.prefab]
	end
	-- To react on the eating
	eater:SetOnEatFn(oneat)
end


-- This initializes for both the server and client. Tags can be added here.
local common_postinit = function(inst) 
	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "maymay.tex" )
	inst:AddTag("cheery")
	inst:AddTag("normal")
	inst:AddTag("rainbow")
end

-- Wetness Debuff function
local function onmoisturedelta(inst)
	if inst.components.moisture:IsWet() then -- If the character is wet
		inst.components.sanity.dapperness = TUNING.DAPPERNESS_HUGE*-1 -- Drain sanity
	--else -- If the character is not wet
		--inst.components.sanity.dapperness = 0 -- Reset the sanity drain to 0
	end
end

-- Speed function
local function UpdateSpeed(inst, phase)
    local mult = 1
    if phase == "day" then
        mult = 1.5
    elseif phase == "dusk" then
        mult = 1.25
    elseif phase == "night" then
        mult = 1.1
	elseif phase == "fullmoon" then
        mult = 2
    end
    inst.components.locomotor:SetExternalSpeedMultiplier(inst, "phase_speed", mult)
end

--Transforming
local function updatestats(inst)
   
	if inst:HasTag("playerghost") or
        inst.components.health:IsDead() then
        return
	end
  
	if TheWorld.state.isday  or TheWorld.state.iscaveday
		then  
			-- DAY STUFF
			inst.AnimState:SetBuild("maymay")
									
			-- Sanity Aura
			inst:AddComponent("sanityaura")
			inst.components.sanityaura.aura = (TUNING.SANITYAURA_MED)
			
			inst.components.sanity.dapperness = TUNING.DAPPERNESS_MED
			
			-- Gets hurt more by cold
			inst.components.temperature.hurtrate = 2
			
			-- Damage multiplier
			inst.components.combat.damagemultiplier = 1
			inst.components.combat:SetDefaultDamage(42)
			inst.components.combat.min_attack_period = 0.5
			
			-- Hunger rate
			inst.components.hunger.hungerrate = 1 * TUNING.WILSON_HUNGER_RATE
			
			
			
	elseif TheWorld.state.isdusk or TheWorld.state.iscavedusk 
		then
			-- DUSK STUFF
			inst.AnimState:SetBuild("maymay")
						
			-- Sanity Aura
			inst:AddComponent("sanityaura")
			inst.components.sanityaura.aura = (TUNING.SANITYAURA_SMALL)
			
			inst.components.sanity.dapperness = TUNING.DAPPERNESS_SMALL
			
			-- Gets hurt more by cold
			inst.components.temperature.hurtrate = 3
			
			-- Damage multiplier
			inst.components.combat.damagemultiplier = 1
			inst.components.combat:SetDefaultDamage(32)
			inst.components.combat.min_attack_period = 0.5
			
			-- Hunger rate
			inst.components.hunger.hungerrate = 1.25 * TUNING.WILSON_HUNGER_RATE
			
			
	elseif TheWorld.state.isnight or TheWorld.state.iscavenight 
		then
			if TheWorld.state.isfullmoon then 
			
			-- PANDA STUFF
			inst.components.talker:Say ("I'm da cutest!")
			inst.AnimState:SetBuild("pandamaymay")
			
			-- Speed
			inst.components.locomotor.walkspeed = (TUNING.WILSON_WALK_SPEED * 1.75)
			inst.components.locomotor.runspeed = (TUNING.WILSON_RUN_SPEED * 1.75)
			
			-- Sanity Aura
			inst:AddComponent("sanityaura")
			inst.components.sanityaura.aura = (TUNING.SANITYAURA_HUGE)
			
			inst.components.sanity.dapperness = TUNING.DAPPERNESS_HUGE
			
			-- Gets hurt more by cold
			inst.components.temperature.hurtrate = 1
			
			-- Damage multiplier
			inst.components.combat.damagemultiplier = 2
			inst.components.combat:SetDefaultDamage(52)
			inst.components.combat.min_attack_period = 0.5
			
			-- Hunger rate
			inst.components.hunger.hungerrate = 1 * TUNING.WILSON_HUNGER_RATE
			
	else
		-- NIGHT STUFF
		inst.AnimState:SetBuild("maymay")
		
		-- Sanity Aura
		inst:AddComponent("sanityaura")
		inst.components.sanityaura.aura = (TUNING.SANITYAURA_TINY)
		
		inst.components.sanity.dapperness = TUNING.DAPPERNESS_TINY
			
		-- Gets hurt more by cold
		inst.components.temperature.hurtrate = 4
			
		-- Damage multiplier
		inst.components.combat.damagemultiplier = 1
		inst.components.combat:SetDefaultDamage(22)
		inst.components.combat.min_attack_period = 0.5
			
		-- Hunger rate
		inst.components.hunger.hungerrate = 1.1 * TUNING.WILSON_HUNGER_RATE
		
	end
	end
end 


-- This initializes for the server only. Components are added here.
local master_postinit = function(inst)
	-- choose which sounds this character will play
	inst.soundsname = "wendy"
		
	--Reader
	inst:AddComponent("reader")
	
	-- Stats
			inst.components.health:SetMaxHealth(150)
			inst.components.hunger:SetMax(150)
			inst.components.sanity:SetMax(200)
		
	-- Emote for Sanity
    inst:ListenForEvent("emote", function(inst, data)
        if inst:HasTag("cheery") then
            inst.components.sanity:DoDelta(20)
            inst.components.hunger:DoDelta(-15)

            for k, v in pairs(AllPlayers) do
                if v ~= inst and v:IsNear(inst, 16) and v.components.sanity then
                    v.components.sanity:DoDelta(15)
                end
            end
        end
    end)
	
	--Watching the state of the world
	inst:WatchWorldState("startday", function() updatestats(inst) end , TheWorld)
	inst:WatchWorldState("startdusk", function() updatestats(inst) end , TheWorld)
    inst:WatchWorldState("startnight", function() updatestats(inst) end , TheWorld)
	inst:WatchWorldState("startcaveday", function() updatestats(inst) end , TheWorld)
	inst:WatchWorldState("startcavedusk", function() updatestats(inst) end , TheWorld)
    inst:WatchWorldState("startcavenight", function() updatestats(inst) end , TheWorld)
    updatestats(inst)
  	
	GemEater(inst)
	
	inst:WatchWorldState("phase", UpdateSpeed)
	UpdateSpeed(inst, TheWorld.state.phase)
	
	inst:ListenForEvent("moisturedelta", onmoisturedelta)
		
	inst:AddTag("rainbow_builder")
	inst:AddTag("swampbro")
end

return MakePlayerCharacter("maymay", prefabs, assets, common_postinit, master_postinit, start_inv)
