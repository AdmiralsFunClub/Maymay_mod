local assets=
{
Asset("ANIM", "anim/rainbowtentacle.zip"),
Asset("ANIM", "anim/swap_rainbowtentacle.zip"),
Asset("ATLAS", "images/inventoryimages/rainbowtentacle.xml"),
Asset("IMAGE", "images/inventoryimages/rainbowtentacle.tex"),
}

prefabs = {}local function fn()

local function OnEquip(inst, owner)
owner.AnimState:OverrideSymbol("swap_object", "swap_rainbowtentacle", "swap_rainbowtentacle")
owner.AnimState:Show("ARM_carry")
owner.AnimState:Hide("ARM_normal")

inst.entity:AddLight()
    inst.Light:Enable(true)
    inst.Light:SetRadius(1)
    inst.Light:SetFalloff(.6)
    inst.Light:SetIntensity(0.9)
    inst.Light:SetColour(49/255,114/255,231/255)
end

local function OnUnequip(inst, owner)
owner.AnimState:Hide("ARM_carry")
owner.AnimState:Show("ARM_normal")
end

local inst = CreateEntity()
local trans = inst.entity:AddTransform()
local anim = inst.entity:AddAnimState()
local sound = inst.entity:AddSoundEmitter()
MakeInventoryPhysics(inst)

anim:SetBank("rainbowtentacle")
anim:SetBuild("rainbowtentacle")
anim:PlayAnimation("idle")

inst:AddComponent("inspectable")
inst:AddComponent("inventoryitem")
inst:AddTag("sharp")
inst:AddTag("mower")

inst:AddComponent("weapon")
inst.components.weapon:SetDamage(59)

inst:AddComponent("tool")
inst.components.tool:SetAction(ACTIONS.CHOP)
inst.components.tool:SetAction(ACTIONS.MINE)

inst:AddComponent("finiteuses")
inst.components.finiteuses:SetMaxUses(TUNING.AXE_USES * 10)
inst.components.finiteuses:SetUses(TUNING.AXE_USES * 10)
inst.components.finiteuses:SetOnFinished(inst.Remove)
inst.components.finiteuses:SetConsumption(ACTIONS.CHOP, 1)
inst.components.finiteuses:SetConsumption(ACTIONS.MINE, 1)
inst.components.finiteuses:SetConsumption(ACTIONS.PICK, 0.4)

inst.entity:AddLight()
    inst.Light:Enable(true)
    inst.Light:SetRadius(1)
    inst.Light:SetFalloff(.6)
    inst.Light:SetIntensity(5)
    inst.Light:SetColour(49/255,114/255,231/255)

MakeHauntableLaunch(inst)

inst.components.inventoryitem.imagename = "rainbowtentacle"
inst.components.inventoryitem.atlasname = "images/inventoryimages/rainbowtentacle.xml"
inst:AddComponent("equippable")
inst.components.equippable:SetOnEquip( OnEquip )
inst.components.equippable:SetOnUnequip( OnUnequip )
return inst

end

return  Prefab("common/inventory/rainbowtentacle", fn, assets, prefabs)
