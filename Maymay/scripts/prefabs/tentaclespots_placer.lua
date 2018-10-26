
-- This exists only cause the console won't shut up about not being able to find it otherwise.

local assets =
{
    Asset("ANIM", "anim/tentaclespots.zip"),
}

local function fn()
    local inst = CreateEntity()

    inst.entity:AddTransform()
    inst.entity:AddAnimState()
    inst.entity:AddNetwork()

    MakeInventoryPhysics(inst)

    inst.AnimState:SetBank("tentaclespots")
    inst.AnimState:SetBuild("tentaclespots")
    inst.AnimState:PlayAnimation("idle")

    MakeDragonflyBait(inst, 3)

    inst.entity:SetPristine()

    if not TheWorld.ismastersim then
        return inst
    end

    inst:AddComponent("inspectable")
    inst:AddComponent("inventoryitem")
    inst:AddComponent("stackable")
    inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM

    inst:AddComponent("fuel")
    inst.components.fuel.fuelvalue = TUNING.SMALL_FUEL

    MakeSmallBurnable(inst, TUNING.SMALL_BURNTIME)
    MakeSmallPropagator(inst)
    MakeHauntableLaunchAndIgnite(inst)

    return inst
end

return MakePlacer("tentaclespots_placer", "tentaclespots", "tentaclespots", "tentaclespots")