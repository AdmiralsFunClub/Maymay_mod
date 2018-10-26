local assets =
{
	Asset("ANIM", "anim/formyellowgem.zip"),
    Asset("ATLAS", "images/inventoryimages/formyellowgem.xml"),
	Asset("IMAGE", "images/inventoryimages/formyellowgem.tex"),
}

local prefabs = 
{
	"yellowgem",
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
    
	inst:AddTag("formyellowgem")
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst.entity:AddLight()
    inst.Light:Enable(true)
    inst.Light:SetRadius(1)
    inst.Light:SetFalloff(.6)
    inst.Light:SetIntensity(0.9)
    inst.Light:SetColour(255/255,231/255,10/255)
	
	inst.entity:SetPristine() 
    
    inst.AnimState:SetBank("formyellowgem")
    inst.AnimState:SetBuild("formyellowgem")
    inst.AnimState:PlayAnimation("idle", false)
	
    MakeHauntableLaunch(inst)
    inst:AddComponent("inspectable")
	
	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
		
	inst:AddComponent("perishable")
	inst.components.perishable:SetPerishTime(TUNING.PERISH_ONE_DAY)
	inst.components.perishable:StartPerishing()
	inst.components.perishable.onperishreplacement = "yellowgem"
	
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "formyellowgem"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/formyellowgem.xml"
	
    return inst
end

return Prefab( "common/inventory/formyellowgem", fn, assets) 
