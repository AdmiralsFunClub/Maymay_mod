local assets =
{
	Asset("ANIM", "anim/formorangegem.zip"),
    Asset("ATLAS", "images/inventoryimages/formorangegem.xml"),
	Asset("IMAGE", "images/inventoryimages/formorangegem.tex"),
}

local prefabs = 
{
	"orangegem",
}

-- Still does nothing. Dunno what it should do...
local function fn(Sim)
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
    MakeInventoryPhysics(inst)

	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
    inst.entity:AddNetwork()
    
	inst:AddTag("formorangegem")
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst.entity:AddLight()
    inst.Light:Enable(true)
    inst.Light:SetRadius(1)
    inst.Light:SetFalloff(.6)
    inst.Light:SetIntensity(0.9)
    inst.Light:SetColour(222/255,164/255,58/255)
	
	inst.entity:SetPristine() 
    
    inst.AnimState:SetBank("formorangegem")
    inst.AnimState:SetBuild("formorangegem")
    inst.AnimState:PlayAnimation("idle", false)
	
    MakeHauntableLaunch(inst)
    inst:AddComponent("inspectable")
	
	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
		
	inst:AddComponent("perishable")
	inst.components.perishable:SetPerishTime(TUNING.PERISH_ONE_DAY)
	inst.components.perishable:StartPerishing()
	inst.components.perishable.onperishreplacement = "orangegem"
	
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "formorangegem"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/formorangegem.xml"
	
    return inst
end

return Prefab( "common/inventory/formorangegem", fn, assets) 