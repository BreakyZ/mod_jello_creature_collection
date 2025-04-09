this.percht_axe <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.percht_axe";
		this.m.Name = "Devil Axe";
		this.m.Description = "A massive axe possessed by things not of this world. Just as likely to turn it\'s heft upon the wielder\'s neck as the target\'s.";
		this.m.Categories = "Axe, Two-Handed";
		this.m.IconLarge = "weapons/melee/jcc_devilaxe.png";
		this.m.Icon = "weapons/melee/jcc_devilaxe_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded;
		this.m.IsAoE = true;
		this.m.IsAgainstShields = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_jcc_devilaxe";
		this.m.Value = 1666;
		this.m.ShieldDamage = 42;
		this.m.Condition = 66.0;
		this.m.ConditionMax = 66.0;
		this.m.StaminaModifier = -22;
		this.m.RegularDamage = 95;
		this.m.RegularDamageMax = 125;
		this.m.ArmorDamageMult = 1.6;
		this.m.DirectDamageMult = 0.4;
		this.m.ChanceToHitHead = 15;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		local skill;
		skill = this.new("scripts/skills/actives/split_man_cursed");
		this.addSkill(skill);
		skill = this.new("scripts/skills/actives/krampus_charge");
		this.addSkill(skill);
		skill = this.new("scripts/skills/actives/split_shield");
		this.addSkill(skill);
	}

	function onUpdateProperties( _properties )
	{
		this.weapon.onUpdateProperties(_properties);
	}

});

