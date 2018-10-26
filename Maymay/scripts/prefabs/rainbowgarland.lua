local assets=
{
Asset("ANIM", "anim/rainbowgarland.zip"),
Asset("ANIM", "anim/swap_rainbowgarland.zip"),

Asset("ATLAS", "images/inventoryimages/rainbowgarland.xml"),
Asset("IMAGE", "images/inventoryimages/rainbowgarland.tex"),
}

local prefabs = 
{
}

local function fn(Sim)

	local function OnEquip(inst, owner)
owner.AnimState:OverrideSymbol("swap_hat", "swap_rainbowgarland", "swap_rainbowgarland")
		owner.AnimState:Show("HAT")
		owner.AnimState:Show("HAT_HAIR")
		owner.AnimState:Hide("HAIR_NOHAT")
		owner.AnimState:Hide("HAIR")
		print('A')
		if owner:HasTag("player") then
			print('B')
			owner.AnimState:Hide("HEAD")
			owner.AnimState:Show("HEAD_HAT")
		end
	end

	local function OnUnequip(inst, owner)
		owner.AnimState:Hide("HAT")
		owner.AnimState:Hide("HAT_HAIR")
		owner.AnimState:Show("HAIR_NOHAT")
		owner.AnimState:Show("HAIR")
		
		if owner:HasTag("player") then
			owner.AnimState:Show("HEAD")
			owner.AnimState:Hide("HEAD_HAT")
		end
	end
	
	local function flower_custom_init(inst)
        inst:AddTag("show_spoilage")
    end

	local inst = CreateEntity()
	local trans = inst.entity:AddTransform()
	local anim = inst.entity:AddAnimState()
	local sound = inst.entity:AddSoundEmitter()
	MakeInventoryPhysics(inst)

	anim:SetBank("rainbowgarland")
	anim:SetBuild("rainbowgarland")
	anim:PlayAnimation("idle")

	inst:AddComponent("inspectable")
	inst:AddComponent("inventoryitem")
	inst:AddComponent("equippable")
		
	inst.components.equippable.dapperness = TUNING.DAPPERNESS_LARGE
	
    inst:AddComponent("perishable")
    inst.components.perishable:SetPerishTime(TUNING.PERISH_SLOW)
    inst.components.perishable:StartPerishing()
    inst.components.perishable:SetOnPerishFn(inst.Remove)

	inst.components.inventoryitem.imagename = "rainbowgarland"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/rainbowgarland.xml"

	inst.components.equippable.equipslot = EQUIPSLOTS.HEAD
	inst.components.equippable:SetOnEquip(OnEquip)
	inst.components.equippable:SetOnUnequip(OnUnequip)

	return inst

end

return  Prefab("common/inventory/rainbowgarland", fn, assets, prefabs)
