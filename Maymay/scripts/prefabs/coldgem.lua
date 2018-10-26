local assets=
{
Asset("ANIM", "anim/coldgem.zip"),

Asset("ATLAS", "images/inventoryimages/coldgem.xml"),
Asset("IMAGE", "images/inventoryimages/coldgem.tex"),
}

prefabs = {}local function fn()

local inst = CreateEntity()
local trans = inst.entity:AddTransform()
local anim = inst.entity:AddAnimState()
local sound = inst.entity:AddSoundEmitter()
MakeInventoryPhysics(inst)

anim:SetBank("coldgem")
anim:SetBuild("coldgem")
anim:PlayAnimation("idle")

inst:AddComponent("inspectable")
inst:AddComponent("inventoryitem")

MakeHauntableLaunch(inst)

inst.components.inventoryitem.imagename = "coldgem"
inst.components.inventoryitem.atlasname = "images/inventoryimages/coldgem.xml"

return inst

end

return  Prefab("common/inventory/coldgem", fn, assets, prefabs)