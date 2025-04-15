this.jcc_djinn_upgrade <- this.inherit("scripts/items/armor_upgrades/armor_upgrade", {
	m = {},
	function create()
	{
		this.armor_upgrade.create();
		this.m.ID = "armor.body.jcc_djinn_upgrade";
	
		this.m.Name = "Serpent Skull";
		this.m.Description = "";
		this.m.ArmorDescription = "";
		
		this.m.Icon = "upgrades/upgrade_basilisk.png";
		this.m.IconLarge = this.m.Icon;
		this.m.OverlayIcon = this.m.Icon; 
		this.m.OverlayIconLarge = "upgrades/inventory_upgrade_basilisk.png"; 
		this.m.SpriteFront = "bust_jcc_djinn_attachment";
		this.m.SpriteBack = null;
		this.m.SpriteDamagedFront = "bust_jcc_djinn_attachment_damaged";
		this.m.SpriteDamagedBack = null;
		this.m.SpriteCorpseFront = null;
		this.m.SpriteCorpseBack = null;

		this.m.Value = 2800;
		this.m.Condition = 30; //normal would be around 20 to 25
		this.m.ConditionMax = 30;
		this.m.StaminaModifier = -3;
	}



	function onUpdateProperties( _properties )
	{
		this.armor_upgrade.onUpdateProperties(_properties);
	}

	function updateVariant()	// Needs to overwrite the base function which would otherwise overwrite Icon and Graphic of this Cloak
	{
	}
});
