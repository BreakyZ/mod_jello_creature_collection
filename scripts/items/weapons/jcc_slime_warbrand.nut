this.jcc_slime_warbrand <- this.inherit("scripts/items/weapons/named/named_weapon", {
	m = {},
	function create()
	{
		this.named_weapon.create();
		this.m.Variant = this.Math.rand(1, 3);
		this.updateVariant();
		this.m.ID = "weapon.jcc_slime_warbrand";
		this.m.NameList = this.Const.Strings.WarbrandNames;
		this.m.Description = "Years of exposure to the acidic bowels of a cytoplasm have left this longsword with only half a guard and just one sharp edge. Can be used both for quick slashes and sweeping strikes.";
		this.m.Categories = "Sword, Two-Handed";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Named | this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded;
		this.m.IsAgainstShields = false;
		this.m.IsAoE = true;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.Value = 4000;
		this.m.ShieldDamage = 0;
		this.m.Condition = 44.0;
		this.m.ConditionMax = 44.0;
		this.m.StaminaModifier = -10;
		this.m.RegularDamage = 45;
		this.m.RegularDamageMax = 65;
		this.m.ArmorDamageMult = 1.05;
		this.m.DirectDamageMult = 0.2;
		this.m.ChanceToHitHead = 5;
		this.randomizeValues();
	}

	function getTooltip()
	{
		local result = this.weapon.getTooltip();
		result.push({
			id = 8,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Dealing damage will cover the target in slime, reducing their initiative and increasing AP cost when moving"
		});
		return result;
	}

	function onDamageDealt( _target, _skill, _hitInfo )
	{
		if (!_target.isDying() && _target.isAlive())
		{
			local effect = this.new("scripts/skills/effects/jcc_slimed_effect");
			_target.getSkills().add(effect);
		}
	}

	function updateVariant()
	{
		this.m.IconLarge = "weapons/melee/slimesword.png";
		this.m.Icon = "weapons/melee/slimesword7070.png";
		this.m.ArmamentIcon = "icon_slime_greatsword";
	}

	function onEquip()
	{
		this.named_weapon.onEquip();
		local slash = this.new("scripts/skills/actives/slash");
		slash.m.FatigueCost = 13;
		this.addSkill(slash);
		this.addSkill(this.new("scripts/skills/actives/split"));
		this.addSkill(this.new("scripts/skills/actives/swing"));
	}

});

