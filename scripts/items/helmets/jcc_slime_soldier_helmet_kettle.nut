this.jcc_slime_soldier_helmet_kettle <- this.inherit("scripts/items/helmets/helmet", {
	m = {},
	function create()
	{
		this.helmet.create();
		local variants = [
			1,
			4,
			4
		];
		this.m.Variant = variants[this.Math.rand(0, variants.len() - 1)];
		this.updateVariant();
		this.m.ID = "armor.head.jcc_slime_kettle_helmet";
		this.m.Name = "Slimed Kettle Helmet";
		this.m.Description = "";
		this.m.ShowOnCharacter = true;
		this.m.IconLarge = "";
		this.m.Icon = "";
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.Condition = 115;
		this.m.ConditionMax = 115;
		this.m.StaminaModifier = -6;
	}

	function updateVariant()
	{
		this.m.Sprite = "bust_cyto_soldier_helmet_kettle";
		this.m.SpriteDamaged = "bust_cyto_soldier_helmetkettle_damaged";
		this.m.SpriteCorpse = "";
	}

});

