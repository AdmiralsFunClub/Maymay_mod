local assets=
{
Asset("ANIM", "anim/hotgem.zip"),

Asset("ATLAS", "images/inventoryimages/hotgem.xml"),
Asset("IMAGE", "images/inventoryimages/hotgem.tex"),
}

prefabs = {}local function fn()

local inst = CreateEntity()
local trans = inst.entity:AddTransform()
local anim = inst.entity:AddAnimState()
local sound = inst.entity:AddSoundEmitter()
MakeInventoryPhysics(inst)

anim:SetBank("hotgem")
anim:SetBuild("hotgem")
anim:PlayAnimation("idle")

inst:AddComponent("inspectable")
inst:AddComponent("inventoryitem")

MakeHauntableLaunch(inst)

inst.components.inventoryitem.imagename = "hotgem"
inst.components.inventoryitem.atlasname = "images/inventoryimages/hotgem.xml"

return inst

end

return  Prefab("common/inventory/hotgem", fn, assets, prefabs)