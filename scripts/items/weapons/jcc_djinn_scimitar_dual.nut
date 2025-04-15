this.jcc_djinn_scimitar_dual <- this.inherit("scripts/items/weapons/weapon", {
	m = {},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.jcc_djinn_scimitar";
		this.m.Name = "Tooth and Nail";
		this.m.Description = "";
		this.m.Categories = "Sword, Two-Handed";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.IsDroppedAsLoot = false;
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
		this.m.ArmamentIcon = "icon_djinn_sword_dual";
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

