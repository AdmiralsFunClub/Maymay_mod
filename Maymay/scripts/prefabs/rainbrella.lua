local assets={
Asset("ANIM", "anim/rainbrella.zip"),
Asset("ANIM", "anim/swap_rainbrella.zip"),

Asset("ATLAS", "images/inventoryimages/rainbrella.xml"),
Asset("IMAGE", "images/inventoryimages/rainbrella.tex"),
}

prefabs = {}

local function fn()
local function OnEquip(inst, owner)
owner.AnimState:OverrideSymbol("swap_object", "swap_rainbrella", "swap_rainbrella")
owner.AnimState:Show("ARM_carry")
owner.AnimState:Hide("ARM_normal")

owner.DynamicShadow:SetSize(2.2, 1.4)
end

local function OnUnequip(inst, owner)
owner.AnimState:Hide("ARM_carry")
owner.AnimState:Show("ARM_normal")

owner.DynamicShadow:SetSize(1.3, 0.6)
end

local inst = CreateEntity()
local trans = inst.entity:AddTransform()
local anim = inst.entity:AddAnimState()
local sound = inst.entity:AddSoundEmitter()
MakeInventoryPhysics(inst)

anim:SetBank("rainbrella")
anim:SetBuild("rainbrella")
anim:PlayAnimation("idle")

inst:AddTag("nopunch")
inst:AddTag("umbrella")
inst:AddTag("waterproofer")

inst.entity:SetPristine()

	if not TheWorld.ismastersim then
        return inst
    end
	
	inst:AddComponent("waterproofer")
    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    inst:AddComponent("equippable")
	
inst.components.inventoryitem.imagename = "rainbrella"
inst.components.inventoryitem.atlasname = "images/inventoryimages/rainbrella.xml"

inst.components.equippable:SetOnEquip( OnEquip )
inst.components.equippable:SetOnUnequip( OnUnequip )

    inst.components.waterproofer:SetEffectiveness(TUNING.WATERPROOFNESS_HUGE)

    inst.components.equippable:SetOnEquip( OnEquip )
    inst.components.equippable:SetOnUnequip( OnUnequip )
    inst.components.equippable.dapperness = TUNING.DAPPERNESS_LARGE

    inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.LARGE_FUEL


MakeHauntableLaunch(inst)

return inst

end

return  Prefab("common/inventory/rainbrella", fn, assets, prefabs)