this.jcc_djinn_light_armor <- this.inherit("scripts/items/armor/armor", {
	m = {},
	function create()
	{
		this.armor.create();
		this.m.Variant = 1;
		this.updateVariant();
		this.m.ID = "armor.body.jcc_djinn_light_armor";
		this.m.Name = "Looted Platemail";
		this.m.Description = "";
		this.m.IconLarge = "";
		this.m.Icon = "";
		this.m.SlotType = this.Const.ItemSlot.Body;
		this.m.ShowOnCharacter = true;
		this.m.Condition = 40;
		this.m.ConditionMax = 40;
		this.m.StaminaModifier = -3;
	}

	function updateVariant()
	{
		this.m.Sprite = "bust_jcc_djinn_necklace";
		this.m.SpriteDamaged = "bust_jcc_djinn_necklace";
		this.m.SpriteCorpse = "";
	}

});

