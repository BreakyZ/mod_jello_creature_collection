this.jcc_basilisk_cloak <- this.inherit("scripts/items/armor_upgrades/armor_upgrade", {
	m = {},
	function create()
	{
		this.armor_upgrade.create();
		this.m.ID = "armor.body.jcc_basilisk_cloak";
	
		this.m.Name = "Basilisk Cloak";
		this.m.Description = "A cloak made from feathers of a Basilisk. The weave offers exceptional padding and protects the midsection and mouth from poison.";
		this.m.ArmorDescription = "A cloak of Basilisk feathers has been attached, offering exceptional padding and protecting the midsection and mouth from poison.";
		
		this.m.Icon = "upgrades/upgrade_basilisk.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon; 
		this.m.OverlayIconLarge = "upgrades/inventory_upgrade_basilisk.png"; 
		this.m.SpriteFront = null;
		this.m.SpriteBack = "upgrade_basilisk_back";
		this.m.SpriteDamagedFront = null;
		this.m.SpriteDamagedBack = "upgrade_basilisk_back_damaged";
		this.m.SpriteCorpseFront = null;
		this.m.SpriteCorpseBack = "upgrade_basilisk_back_dead";

		this.m.Value = 2800;
		this.m.Condition = 30; //normal would be around 20 to 25
		this.m.ConditionMax = 30;
		this.m.StaminaModifier = -3;
	}

	function getTooltip()
	{
		local result = this.armor_upgrade.getTooltip();
		result.push({
			id = 15,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Unaffected by poison"
		});
		return result;
	}

	function onArmorTooltip( _result )
	{
		_result.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Unaffected by poison"
		});
	}

	function onUpdateProperties( _properties )
	{
		this.armor_upgrade.onUpdateProperties(_properties);
		_properties.IsImmuneToPoison = true;
	}

	function updateVariant()	// Needs to overwrite the base function which would otherwise overwrite Icon and Graphic of this Cloak
	{
	}
});
