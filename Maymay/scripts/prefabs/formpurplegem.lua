local assets =
{
	Asset("ANIM", "anim/formpurplegem.zip"),
    Asset("ATLAS", "images/inventoryimages/formpurplegem.xml"),
	Asset("IMAGE", "images/inventoryimages/formpurplegem.tex"),
}

local prefabs = 
{
	"purplegem",
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
    
	inst:AddTag("formpurplegem")
	
    if not TheWorld.ismastersim then
        return inst
    end
	
	inst.entity:AddLight()
    inst.Light:Enable(true)
    inst.Light:SetRadius(1)
    inst.Light:SetFalloff(.6)
    inst.Light:SetIntensity(0.9)
    inst.Light:SetColour(154/255,49/255,231/255)
	
	inst.entity:SetPristine() 
    
    inst.AnimState:SetBank("formpurplegem")
    inst.AnimState:SetBuild("formpurplegem")
    inst.AnimState:PlayAnimation("idle", false)
	
    MakeHauntableLaunch(inst)
    inst:AddComponent("inspectable")
	
	inst:AddComponent("stackable")
	inst.components.stackable.maxsize = TUNING.STACK_SIZE_SMALLITEM
		
	inst:AddComponent("perishable")
	inst.components.perishable:SetPerishTime(TUNING.PERISH_ONE_DAY)
	inst.components.perishable:StartPerishing()
	inst.components.perishable.onperishreplacement = "purplegem"
	
    inst:AddComponent("inventoryitem")
	inst.components.inventoryitem.imagename = "formpurplegem"
	inst.components.inventoryitem.atlasname = "images/inventoryimages/formpurplegem.xml"
	
    return inst
end

return Prefab( "common/inventory/formpurplegem", fn, assets) 
