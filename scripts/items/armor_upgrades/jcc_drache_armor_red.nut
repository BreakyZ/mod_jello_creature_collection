this.jcc_drache_armor_red <- this.inherit("scripts/items/armor_upgrades/armor_upgrade", {
	m = {},
	function create()
	{
		this.armor_upgrade.create();
		this.m.ID = "armor_upgrade.jcc_drache_armor_red";
	
		this.m.Name = "Dragonscale Mail";
		this.m.Description = "A suit of striking, red dragonscale. It is difficult to pierce and provides great protection against fire.";
		this.m.ArmorDescription = "A suit of striking, red dragonscale has been attached, providing great protection against fire and blade alike.";
		
		this.m.Icon = "upgrades/upgrade_jcc_drache_armor_red.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = "upgrades/icon_jcc_drache_armor_red.png"; 
		this.m.OverlayIconLarge = "upgrades/inventory_jcc_drache_armor_red.png"; 
		this.m.SpriteFront = null;
		this.m.SpriteBack = "upgrade_jcc_drache_red_back";
		this.m.SpriteDamagedFront = null;
		this.m.SpriteDamagedBack = "upgrade_jcc_drache_red_back_damaged";
		this.m.SpriteCorpseFront = null;
		this.m.SpriteCorpseBack = "upgrade_jcc_drache_red_back_dead";

		this.m.Value = 800;
		this.m.ConditionModifier = 70;
		this.m.StaminaModifier = 4;
	}

	function getTooltip()
	{
		local result = this.armor_upgrade.getTooltip();
		result.push({
			id = 15,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Unaffected by fire"
		});
		return result;
	}

	function onArmorTooltip( _result )
	{
		_result.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Unaffected by fire"
		});
	}

	function onUpdateProperties( _properties )
	{
		this.armor_upgrade.onUpdateProperties(_properties);
		_properties.IsImmuneToFire = true;
	}

});
