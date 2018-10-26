local assets =
{
	Asset( "ANIM", "anim/miles.zip" ),
	Asset( "ANIM", "anim/ghost_miles_build.zip" ),
}

local skins =
{
	normal_skin = "miles",
	ghost_skin = "ghost_miles_build",
}

local base_prefab = "miles"

local tags = {"MILES", "CHARACTER"}

return CreatePrefabSkin("miles_none",
{
	base_prefab = base_prefab, 
	skins = skins, 
	assets = assets,
	tags = tags,
	
	skip_item_gen = true,
	skip_giftable_gen = true,
})