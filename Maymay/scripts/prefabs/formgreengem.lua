local assets =
{
	Asset("ANIM", "anim/formgreengem.zip"),
    Asset("ATLAS", "images/inventoryimages/formgreengem.xml"),
	Asset("IMAGE", "images/inventoryimages/formgreengem.tex"),
}

local prefabs = 
{
	"greengem",
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
    
	inst:AddTag("formgreengem")
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst.entity:AddLight()
    inst.Light:Enable(true)
    inst.Light:SetRadius(1)
    inst.Light:SetFalloff(.6)
    inst.Light:SetIntensity(0.9)
    inst.Light:SetColour(26/255,159/255,0/255)
	
	inst.entity:SetPristine() 
    
    inst.AnimState:SetBank("formgreengem")
    inst.AnimState:SetBuild("formgreengem")
    inst.AnimState:PlayAnimation("idle", false)
	
    MakeHauntableLaunch(inst)
    inst:AddComponent("inspectable")
	
	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
		
	inst:AddComponent("perishable")
	inst.components.perishable:SetPerishTime(TUNING.PERISH_ONE_DAY)
	inst.components.perishable:StartPerishing()
	inst.components.perishable.onperishreplacement = "greengem"
	
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "formgreengem"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/formgreengem.xml"
	
    return inst
end

return Prefab( "common/inventory/formgreengem", fn, assets) 
