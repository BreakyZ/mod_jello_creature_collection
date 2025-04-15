this.jcc_djinn_polemace <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.jcc_djinn_polemace";
		this.m.Name = "Polemace";
		this.m.Description = "A long mace that can be used to deliver stunning blows over a distance.";
		this.m.Categories = "Mace, Two-Handed";
		this.m.IconLarge = "weapons/melee/jcc_djinn_mace.png";
		this.m.Icon = "weapons/melee/jcc_djinn_mace_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_djinn_mace";
		this.m.Value = 1100;
		this.m.ShieldDamage = 0;
		this.m.Condition = 53.0;
		this.m.ConditionMax = 53.0;
		this.m.StaminaModifier = -25;
		this.m.RangeMin = 1;
		this.m.RangeMax = 2;
		this.m.RangeIdeal = 2;
		this.m.RegularDamage = 65;
		this.m.RegularDamageMax = 90;
		this.m.ArmorDamageMult = 1.3;
		this.m.DirectDamageMult = 0.4;
		this.m.ChanceToHitHead = 5;
		this.m.FatigueOnSkillUse = 5;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		local skill = this.new("scripts/skills/actives/crumble_skill");
		this.addSkill(skill);
		skill = this.new("scripts/skills/actives/knock_over_skill");
		this.addSkill(skill);
	}

});

