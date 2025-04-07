this.percht_bow <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.percht_bow";
		this.m.Name = "Gut Piercer";
		this.m.Description = "A greatbow with a massive draw weight, powerful enough to shoot a man\'s head from his shoulders. Unfit for human hands.";
		this.m.Categories = "Bow, Two-Handed";
		this.m.IconLarge = "weapons/ranged/percht_bow_01.png";
		this.m.Icon = "weapons/ranged/percht_bow_01_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.RangedWeapon | this.Const.Items.ItemType.Defensive;
		this.m.EquipSound = this.Const.Sound.ArmorLeatherImpact;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = true;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_percht_bow";
		this.m.Value = 1200;
		this.m.RangeMin = 2;
		this.m.RangeMax = 7;
		this.m.RangeIdeal = 7;
		this.m.StaminaModifier = -18;
		this.m.Condition = 76.0;
		this.m.ConditionMax = 76.0;
		this.m.RegularDamage = 50;
		this.m.RegularDamageMax = 80;
		this.m.ArmorDamageMult = 0.8;
		this.m.DirectDamageMult = 0.35;
		this.m.FatigueOnSkillUse = 5;
	}

	function getAmmoID()
	{
		return "ammo.arrows";
	}

	function getAdditionalRange( _actor )
	{
		return _actor.getCurrentProperties().IsSpecializedInBows ? 1 : 0;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		this.addSkill(this.new("scripts/skills/actives/quick_shot"));
		this.addSkill(this.new("scripts/skills/actives/percht_shot"));
	}

});

