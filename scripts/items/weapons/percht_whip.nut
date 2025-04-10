this.percht_whip <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.percht_whip";
		this.m.Name = "Manacle Whip";
		this.m.Description = "A brutish chain entwined with a barbed cord, crusted in the hair and dried gore of it's latest victim. Exhausting for the average man.";
		this.m.Categories = "Cleaver, One-Handed";
		this.m.IconLarge = "weapons/melee/percht_whip_01.png";
		this.m.Icon = "weapons/melee/percht_whip_70x70_01.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.OneHanded;
		this.m.IsDoubleGrippable = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_percht_whip";
		this.m.RangeMin = 1;
		this.m.RangeMax = 3;
		this.m.RangeIdeal = 3;
		this.m.Value = 450;
		this.m.Condition = 53;
		this.m.ConditionMax = 53;
		this.m.StaminaModifier = -12;
		this.m.RegularDamage = 20;
		this.m.RegularDamageMax = 40;
		this.m.ArmorDamageMult = 0.55;
		this.m.DirectDamageMult = 0.1;
		this.m.FatigueOnSkillUse = 5;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		local skill = this.new("scripts/skills/actives/whip_skill");
		skill.m.Icon = "skills/active_171.png";
		skill.m.IconDisabled = "skills/active_171_sw.png";
		skill.m.Overlay = "active_171";
		this.addSkill(skill);
		local skill = this.new("scripts/skills/actives/disarm_skill");
		this.addSkill(skill);
	}

});

