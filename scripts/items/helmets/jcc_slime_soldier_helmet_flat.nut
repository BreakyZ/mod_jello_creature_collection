this.jcc_slime_soldier_helmet_flat <- this.inherit("scripts/items/helmets/helmet", {
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
		this.m.ID = "armor.head.jcc_slime_flat_helmet";
		this.m.Name = "Slimed Flat Helmet";
		this.m.Description = "";
		this.m.ShowOnCharacter = true;
		this.m.IconLarge = "";
		this.m.Icon = "";
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.Condition = 125;
		this.m.ConditionMax = 125;
		this.m.StaminaModifier = -7;
	}

	function updateVariant()
	{
		this.m.Sprite = "bust_cyto_soldier_helmet_flat";
		this.m.SpriteDamaged = "bust_cyto_soldier_helmet_flat_damaged";
		this.m.SpriteCorpse = "";
	}

});

