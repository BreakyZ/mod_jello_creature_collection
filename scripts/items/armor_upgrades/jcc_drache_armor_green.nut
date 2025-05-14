this.jcc_drache_armor_green <- this.inherit("scripts/items/armor_upgrades/jcc_drache_armor_red", {
	m = {},
	function create()
	{
		this.jcc_drache_armor_red.create();
		this.m.ID = "armor_upgrade.jcc_drache_armor_green";
	
		this.m.Name = "Dragonscale Mail";
		this.m.Description = "A suit of striking, green dragonscale. It is difficult to pierce and provides great protection against fire.";
		this.m.ArmorDescription = "A suit of striking, red dragonscale has been attached, providing great protection against fire and blade alike.";
		
		this.m.Icon = "upgrades/upgrade_jcc_drache_armor_green.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "upgrades/icon_jcc_drache_armor_green.png"; 
		this.m.OverlayIconLarge = "upgrades/inventory_jcc_drache_armor_green.png"; 
		this.m.SpriteFront = null;
		this.m.SpriteBack = "upgrade_jcc_drache_green_back";
		this.m.SpriteDamagedFront = null;
		this.m.SpriteDamagedBack = "upgrade_jcc_drache_green_back_damaged";
		this.m.SpriteCorpseFront = null;
		this.m.SpriteCorpseBack = "upgrade_jcc_drache_green_back_dead";
	}
	
	function updateVariant()	// Needs to overwrite the base function which would otherwise overwrite Icon and Graphic of this Cloak
	{
	}
});
