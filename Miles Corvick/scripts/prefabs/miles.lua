
local MakePlayerCharacter = require "prefabs/player_common"


local assets = {
    Asset("SCRIPT", "scripts/prefabs/player_common.lua"),
}
local prefabs = {
	"killerbee",
}

-- Custom starting items
local start_inv = {
"beebox_blueprint",
"bee",
"bee",
"bee",
"bee",
"bee",
"bee",
"bee",
"bee",
"butterfly",
"butterfly",
"butterfly",
"butterfly",
"butterfly",
"butterfly",
"butterfly",
"butterfly",
"butterfly",
"butterfly",
"honeycomb",
"honeycomb",
"boards",
"boards",
"boards",
"boards",
}

-- When the character is revived from human
local function onbecamehuman(inst)
	-- Set speed when reviving from ghost (optional)
	inst.components.locomotor:SetExternalSpeedMultiplier(inst, "miles_speed_mod", 1.5)
end

local function onbecameghost(inst)
	-- Remove speed modifier when becoming a ghost
   inst.components.locomotor:RemoveExternalSpeedMultiplier(inst, "miles_speed_mod")
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


-- This initializes for both the server and client. Tags can be added here.
local common_postinit = function(inst) 
	-- Minimap icon
	inst.MiniMapEntity:SetIcon( "miles.tex" )
	
	inst:AddTag("happybees")
	inst:AddTag( "beefalo" )
	inst:AddTag( "insect")
end

-- Bee Immunity
local function beeimmunity(inst, amount, overtime, cause, ignore_invincible, afflicter, ignore_absorb)
    return afflicter ~= nil and afflicter:HasTag("smallbee")
end

-- This initializes for the server only. Components are added here.
local master_postinit = function(inst)
	-- choose which sounds this character will play
	inst.soundsname = "willow"
	
	-- Uncomment if "wathgrithr"(Wigfrid) or "webber" voice is used
    --inst.talker_path_override = "dontstarve_DLC001/characters/"
	
	-- Stats	
	inst.components.health:SetMaxHealth(200)
	inst.components.hunger:SetMax(125)
	inst.components.sanity:SetMax(175)
	
	-- Bee Immunity
	inst.components.health.redirect = beeimmunity
	
		-- Damage multiplier (optional)
    inst.components.combat.damagemultiplier = 1
	inst.components.combat:SetDefaultDamage(50)
	inst.components.combat:SetAttackPeriod(0.5)
	inst.components.combat:SetAreaDamage(10, 1)
	
	-- Hunger rate (optional)
	inst.components.hunger.hungerrate = 1 * TUNING.WILSON_HUNGER_RATE
	
	local function OnHit(inst, attacker, damage) 
		if inst.components.childspawner ~= nil then
			inst.components.childspawner:ReleaseAllChildren(attacker, "killerbee")
			inst.components.childspawner.childname = "killerbee"
			inst.components.childspawner:SetMaxChildren(10)
			inst.components.childspawner.emergencychildname = "killerbee"
			inst.components.childspawner.emergencychildrenperplayer = 1
			inst.components.childspawner:SetMaxEmergencyChildren(10)
			inst.components.childspawner:SetEmergencyRadius(TUNING.WASPHIVE_EMERGENCY_RADIUS)
   			end
	end
	
	-- Punch
	inst:ListenForEvent("onattackother", function(inst, data)
		if data.target ~= nil and data.weapon == nil then
			local pos = data.target:GetPosition()
			local fx = SpawnPrefab("bigcraterprint")
			local fxx = SpawnPrefab("groundpound_fx")
			local fxxx = SpawnPrefab("groundpoundring_fx")
			fx.Transform:SetPosition(pos.x, pos.y, pos.z)
			fxx.Transform:SetPosition(pos.x, pos.y, pos.z)
			fxxx.Transform:SetPosition(pos.x, pos.y, pos.z)
			
			for i, v in ipairs(AllPlayers) do
				v:ShakeCamera(CAMERASHAKE.FULL, .7, .02, .3, inst, 40)
			end
		end
	end)
	
	inst.OnLoad = onload
    inst.OnNewSpawn = onload
	
end

return MakePlayerCharacter("miles", prefabs, assets, common_postinit, master_postinit, start_inv)
