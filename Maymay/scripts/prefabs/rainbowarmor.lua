local assets= {
Asset("ANIM", "anim/rainbowarmor.zip"),
Asset("ANIM", "anim/swap_rainbowarmor.zip"),

Asset("ATLAS", "images/inventoryimages/rainbowarmor.xml"),
Asset("IMAGE", "images/inventoryimages/rainbowarmor.tex"),
}

local function OnBlocked(owner) 
    owner.SoundEmitter:PlaySound("dontstarve/wilson/hit_marble")
end

local function onequip(inst, owner) 
    owner.AnimState:OverrideSymbol("swap_body", "swap_rainbowarmor", "swap_rainbowarmor")
    inst:ListenForEvent("blocked", OnBlocked, owner)
	inst:ListenForEvent("attacked", OnBlocked, owner)
end

local function onunequip(inst, owner) 
    owner.AnimState:ClearOverrideSymbol("swap_body")
    inst:RemoveEventCallback("blocked", OnBlocked, owner)
	inst:ListenForEvent("attacked", OnBlocked, owner)
end

local function fn()
    local inst = CreateEntity()
    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("rainbowarmor")
    inst.AnimState:SetBuild("rainbowarmor")
    inst.AnimState:PlayAnimation("anim")

    inst:AddTag("marble")

    inst.foleysound = "dontstarve/movement/foley/jewlery"

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")

    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "rainbowarmor"
    inst.components.inventoryitem.atlasname = "images/inventoryimages/rainbowarmor.xml"

    inst:AddComponent("armor")
    inst.components.armor:InitCondition(TUNING.ARMORMARBLE, TUNING.ARMORMARBLE_ABSORPTION)

    inst:AddComponent("equippable")
    inst.components.equippable.equipslot = EQUIPSLOTS.BODY

    inst.components.equippable:SetOnEquip(onequip)
    inst.components.equippable:SetOnUnequip(onunequip)

    MakeHauntableLaunch(inst)

    return inst
end

return Prefab("rainbowarmor", fn, assets)
