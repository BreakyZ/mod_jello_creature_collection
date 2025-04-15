this.jcc_djinn_medium_armor <- this.inherit("scripts/items/armor/armor", {
	m = {},
	function create()
	{
		this.armor.create();
		this.m.Variant = 1;
		this.updateVariant();
		this.m.ID = "armor.body.jcc_djinn_medium_armor";
		this.m.Name = "Looted Platemail";
		this.m.Description = "";
		this.m.IconLarge = "";
		this.m.Icon = "";
		this.m.SlotType = this.Const.ItemSlot.Body;
		this.m.ShowOnCharacter = true;
		this.m.ImpactSound = this.Const.Sound.ArmorHalfplateImpact;
		this.m.Condition = 260;
		this.m.ConditionMax = 260;
		this.m.StaminaModifier = -24;
	}

	function updateVariant()
	{
		this.m.Sprite = "bust_jcc_djinn_armor_02";
		this.m.SpriteDamaged = "bust_jcc_djinn_armor_02_damaged";
		this.m.SpriteCorpse = "";
	}

});

