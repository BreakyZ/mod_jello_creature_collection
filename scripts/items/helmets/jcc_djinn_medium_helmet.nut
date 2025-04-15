this.jcc_djinn_medium_helmet <- this.inherit("scripts/items/helmets/helmet", {
	m = {},
	function create()
	{
		this.helmet.create();
		this.m.Variant = this.Math.rand(1, 2);
		this.updateVariant();
		this.m.ID = "armor.head.jcc_djinn_medium_helmet";
		this.m.Name = "Looted Lamellar Helmet";
		this.m.Description = "";
		this.m.ShowOnCharacter = true;
		this.m.IconLarge = "";
		this.m.Icon = "";
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.Condition = 105;
		this.m.ConditionMax = 105;
		this.m.StaminaModifier = -5;
	}

	function updateVariant()
	{
		this.m.Sprite = "bust_jcc_djinn_medium_helmet_0"+this.m.Variant;
		this.m.SpriteDamaged = "bust_jcc_djinn_medium_helmet_0"+this.m.Variant+"_damaged";
		this.m.SpriteCorpse = "";
	}

});

