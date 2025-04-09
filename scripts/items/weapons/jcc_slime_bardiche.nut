this.jcc_slime_bardiche <- this.inherit("scripts/items/weapons/named/named_weapon", {
	m = {},
	function create()
	{
		this.named_weapon.create();
		this.m.Variant = this.Math.rand(1, 2);
		this.updateVariant();
		this.m.ID = "weapon.jcc_slime_bardiche";
		this.m.NameList = this.Const.Strings.AxeNames;
		this.m.Description = "This once ornate bardiche has been corroded by acidic slime, but remains in a usable state.";
		this.m.Categories = "Axe, Two-Handed";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Named | this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded;
		this.m.IsAgainstShields = true;
		this.m.IsAoE = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.Value = 4600;
		this.m.ShieldDamage = 24;
		this.m.Condition = 42.0;
		this.m.ConditionMax = 42.0;
		this.m.StaminaModifier = -19;
		this.m.RegularDamage = 70;
		this.m.RegularDamageMax = 95;
		this.m.ArmorDamageMult = 1.45;
		this.m.DirectDamageMult = 0.4;
		this.m.ChanceToHitHead = 0;
		this.randomizeValues();
	}

	function updateVariant()
	{
		this.m.IconLarge = "weapons/melee/slimebardiche.png";
		this.m.Icon = "weapons/melee/slimebardiche7070.png";
		this.m.ArmamentIcon = "icon_slime_bardiche";
		//this.m.IconLarge = "weapons/melee/bardiche_01_named_0" + this.m.Variant + ".png";
		//this.m.Icon = "weapons/melee/bardiche_01_named_0" + this.m.Variant + "_70x70.png";
		//this.m.ArmamentIcon = "icon_bardiche_01_named_0" + this.m.Variant;
	}

	function onEquip()
	{
		this.named_weapon.onEquip();
		local skillToAdd = this.new("scripts/skills/actives/split_man");
		skillToAdd.m.Icon = "skills/active_168.png";
		skillToAdd.m.IconDisabled = "skills/active_168_sw.png";
		skillToAdd.m.Overlay = "active_168";
		this.addSkill(skillToAdd);
		skillToAdd = this.new("scripts/skills/actives/split_axe");
		this.addSkill(skillToAdd);
		skillToAdd = this.new("scripts/skills/actives/split_shield");
		skillToAdd.setApplyAxeMastery(true);
		skillToAdd.setFatigueCost(skillToAdd.getFatigueCostRaw() + 5);
		this.addSkill(skillToAdd);
	}

});

