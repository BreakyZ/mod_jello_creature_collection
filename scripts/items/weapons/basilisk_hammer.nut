this.basilisk_hammer <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.basilisk_hammer";
		this.m.Name = "Bec de Basilisk";
		this.m.Description = "A polehammer fashioned after a Basilisk\'s skull-shattering beak. It\'s steel was quenched in Basilisk venom, allowing it to debilitate foes with more than just concussive force.";
		this.m.Categories = "Hammer, Two-Handed";
		this.m.IconLarge = "weapons/melee/becdebasilisk.png";
		this.m.Icon = "weapons/melee/becdebasilisk_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_becdebasilisk";
		this.m.Value = 1500;
		this.m.ShieldDamage = 0;
		this.m.Condition = 84.0;
		this.m.ConditionMax = 84.0;
		this.m.StaminaModifier = -14;
		this.m.RangeMin = 1;
		this.m.RangeMax = 2;
		this.m.RangeIdeal = 2;
		this.m.RegularDamage = 50;
		this.m.RegularDamageMax = 75;
		this.m.ArmorDamageMult = 1.85;
		this.m.DirectDamageMult = 0.55;
		this.m.ChanceToHitHead = 15;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		local skill;
		local skill = this.new("scripts/skills/actives/batter_skill_basilisk");
		this.addSkill(skill);
		//local skill = this.new("scripts/skills/actives/demolish_armor_skill");
		//this.addSkill(skill);
	}

});

