this.jcc_djinn_heavy_helmet <- this.inherit("scripts/items/helmets/helmet", {
	m = {},
	function create()
	{
		this.helmet.create();
		this.m.Variant = this.Math.rand(1, 2);
		this.updateVariant();
		this.m.ID = "armor.head.jcc_djinn_heavy_helmet";
		this.m.Name = "Looted Turban Helmet";
		this.m.Description = "";
		this.m.ShowOnCharacter = true;
		this.m.IconLarge = "";
		this.m.Icon = "";
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.Condition = 290;
		this.m.ConditionMax = 290;
		this.m.StaminaModifier = -20;
	}

	function updateVariant()
	{
		this.m.Sprite = "bust_jcc_djinn_heavy_helmet";
		this.m.SpriteDamaged = "bust_jcc_djinn_heavy_helmet_damaged";
		this.m.SpriteCorpse = "";
	}

});

