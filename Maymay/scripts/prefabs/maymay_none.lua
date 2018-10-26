local assets =
{
	Asset( "ANIM", "anim/maymay.zip" ),
	Asset( "ANIM", "anim/ghost_maymay_build.zip" ),
}

local skins =
{
	normal_skin = "maymay",
	ghost_skin = "ghost_maymay_build",
}

local base_prefab = "maymay"

local tags = {"MAYMAY", "CHARACTER"}

return CreatePrefabSkin("maymay_none",
{
	base_prefab = base_prefab, 
	skins = skins, 
	assets = assets,
	tags = tags,
	
	skip_item_gen = true,
	skip_giftable_gen = true,
})