
local assets = {
	Asset("ANIM", "anim/crater_print.zip"),
}

local prefabs = {
	"groundpound_fx",
	"groundpoundring_fx",
}

local function SpawnPrint(inst)
	local footprint = SpawnPrefab("bigcraterprint")
	footprint.Transform:SetPosition(inst:GetPosition():Get())
	footprint.Transform:SetRotation(GetRotation(inst))
end

local function footprint_fn()
	local inst = CreateEntity()
	inst.entity:AddTransform()
	inst.entity:AddAnimState()
	inst.entity:AddSoundEmitter()
	inst.entity:AddNetwork()

	inst.AnimState:SetBank("crater_print")
	inst.AnimState:SetBuild("crater_print")
	inst.AnimState:PlayAnimation("idle")
	inst.AnimState:SetOrientation(ANIM_ORIENTATION.OnGround)
	inst.AnimState:SetLayer(LAYER_BACKGROUND)
	inst.AnimState:SetSortOrder(3)

	inst.Transform:SetRotation(0)

	inst:AddTag("scarytoprey")

	inst.entity:SetPristine()

	if not TheWorld.ismastersim then
		return inst
	end

	inst:AddComponent("colourtweener")
	inst.components.colourtweener:StartTween({0,0,0,0}, 15, function(inst) inst:Remove() end)

	inst.persists = false

	return inst
end

return Prefab("common/bigcraterprint", footprint_fn, assets, prefabs)