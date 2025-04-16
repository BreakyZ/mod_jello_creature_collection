this.jcc_giant_scorp_shield <- this.inherit("scripts/items/shields/shield", {
	m = {},
	function create()
	{
		this.shield.create();
		this.m.ID = "shield.jcc_scorp_shield";
		this.m.Name = "Giant Claw";
		this.m.Description = "";
		this.m.AddGenericSkill = true;
		this.m.ShowOnCharacter = true;
		this.m.IsDroppedAsLoot = false;
		this.m.Variant = 1;
		this.updateVariant();
		this.m.Value = 0;
		this.m.MeleeDefense = 20;
		this.m.RangedDefense = 20;
		this.m.StaminaModifier = 0;
		this.m.Condition = 76;
		this.m.ConditionMax = 76;
	}

	function updateVariant()
	{
		this.m.Sprite = "bust_jcc_giant_scorp_shield_0" + this.m.Variant;
		this.m.SpriteDamaged = "bust_jcc_giant_scorp_shield_0" + this.m.Variant + "_damaged";
		this.m.ShieldDecal = "bust_jcc_giant_scorp_shield_0" + this.m.Variant + "_destroyed";
		this.m.IconLarge = "";
		this.m.Icon = "";
	}

});

