local assets=
{
Asset("ANIM", "anim/allgem.zip"),

Asset("ATLAS", "images/inventoryimages/allgem.xml"),
Asset("IMAGE", "images/inventoryimages/allgem.tex"),
}

prefabs = {}

local function fn()

	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
	local sound = inst.entity:AddSoundEmitter()
	MakeInventoryPhysics(inst)

	anim:SetBank("allgem")
	anim:SetBuild("allgem")
	anim:PlayAnimation("idle")

	inst:AddComponent("inspectable")
	inst:AddComponent("inventoryitem")
	
	MakeHauntableLaunch(inst)

	inst.components.inventoryitem.imagename = "allgem"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/allgem.xml"

	return inst

end

return  Prefab("common/inventory/allgem", fn, assets, prefabs)