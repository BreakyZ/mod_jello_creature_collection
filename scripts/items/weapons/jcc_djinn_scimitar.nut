this.jcc_djinn_scimitar <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.jcc_djinn_scimitar";
		this.m.Name = "Spirit Stealer";
		this.m.Description = "This curved sword features an unusually large blade, severing limbs where other weapons would only cause injury. Too heavy for the average man.";
		this.m.Categories = "Sword, One-Handed";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded;
		this.m.IsDoubleGrippable = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.Value = 1300;
		this.m.Condition = 57.0;
		this.m.ConditionMax = 57.0;
		this.m.StaminaModifier = -16;
		this.m.RegularDamage = 45;
		this.m.RegularDamageMax = 60;
		this.m.ArmorDamageMult = 1.05;
		this.m.DirectDamageMult = 0.2;
		this.m.FatigueOnSkillUse = 5;
		this.m.Variant = this.Math.rand(1, 2);
		updateVariant();
	}

	function updateVariant()
	{
		this.m.IconLarge = "weapons/melee/jcc_djinn_sword_0" + this.m.Variant + ".png";
		this.m.Icon = "weapons/melee/jcc_djinn_sword_0" + this.m.Variant + "_70x70.png";
		this.m.ArmamentIcon = "icon_djinn_sword_0" + this.m.Variant;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		local skill = this.new("scripts/skills/actives/slash");
		skill.m.Icon = "skills/active_172.png";
		skill.m.IconDisabled = "skills/active_172_sw.png";
		skill.m.Overlay = "active_172";
		this.addSkill(skill);
		skill = this.new("scripts/skills/actives/gash_skill");
		this.addSkill(skill);
	}

});

