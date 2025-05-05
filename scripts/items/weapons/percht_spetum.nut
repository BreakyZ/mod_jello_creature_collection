this.percht_spetum <- this.inherit("scripts/items/weapons/weapon", {
	m = {		BleedingSounds = [
			"sounds/combat/rupture_blood_01.wav",
			"sounds/combat/rupture_blood_02.wav",
			"sounds/combat/rupture_blood_03.wav"
		]},
	function create()
	{
		this.weapon.create();
		this.m.ID = "weapon.percht_spetum";
		this.m.Name = "Flesh Prodder";
		this.m.Description = "A heavy tree-limb ending in a wide, two-pronged speartip. The added weight makes it difficult to hold a spearwall.";
		this.m.Categories = "Spear, Two-Handed";
		this.m.IconLarge = "weapons/melee/percht_spetum_01.png";
		this.m.Icon = "weapons/melee/percht_spetum_01_70x70.png";
		this.m.SlotType = this.Const.ItemSlot.Mainhand;
		this.m.BlockedSlotType = this.Const.ItemSlot.Offhand;
		this.m.ItemType = this.Const.Items.ItemType.Weapon | this.Const.Items.ItemType.MeleeWeapon | this.Const.Items.ItemType.TwoHanded | this.Const.Items.ItemType.Defensive;
		this.m.AddGenericSkill = true;
		this.m.ShowQuiver = false;
		this.m.ShowArmamentIcon = true;
		this.m.ArmamentIcon = "icon_percht_spetum_01";
		this.m.Value = 1200;
		this.m.ShieldDamage = 0;
		this.m.Condition = 44.0;
		this.m.ConditionMax = 44.0;
		this.m.StaminaModifier = -22;
		this.m.RangeMin = 1;
		this.m.RangeMax = 2;
		this.m.RangeIdeal = 1;
		this.m.RegularDamage = 60;
		this.m.RegularDamageMax = 85;
		this.m.ArmorDamageMult = 1.1;
		this.m.DirectDamageMult = 0.25;
		this.m.ChanceToHitHead = 5;
		this.m.FatigueOnSkillUse = 5;
	}

	function getTooltip()
	{
		local result = this.weapon.getTooltip();
		result.push({
			id = 8,
			type = "text",
			icon = "ui/icons/damage_received.png",
			text = "Dealing at least "+this.Const.Combat.MinDamageToApplyBleeding+" damage will inflict bleeding"
		});
		return result;
	}

	function onEquip()
	{
		this.weapon.onEquip();
		local prong = this.new("scripts/skills/actives/prong_skill");
		this.addSkill(prong);
		local spearwall = this.new("scripts/skills/actives/spearwall");
		spearwall.m.Icon = "skills/active_124.png";
		spearwall.m.IconDisabled = "skills/active_124_sw.png";
		spearwall.m.Overlay = "active_124";
		spearwall.m.BaseAttackName = prong.getName();
		spearwall.setFatigueCost(spearwall.getFatigueCostRaw() + 5);
		spearwall.m.ActionPointCost = 6;
		this.addSkill(spearwall);
	}

	function onDamageDealt( _target, _skill, _hitInfo )
	{
		if (_target.getCurrentProperties().IsImmuneToBleeding || _hitInfo.DamageInflictedHitpoints <= this.Const.Combat.MinDamageToApplyBleeding || _target.getHitpoints() <= 0)
			return;

		if (!_target.isAlive())
			return;

		if (_target.getFlags().has("undead"))
			return;

		if (!_target.isHiddenToPlayer())
		{
			
			this.Sound.play(this.m.BleedingSounds[this.Math.rand(0, this.m.BleedingSounds.len() - 1)], this.Const.Sound.Volume.Skill, _target.getPos());

			//this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_target) + " is poisoned");
		}

		_target.getSkills().add(this.new("scripts/skills/effects/bleeding_effect"));

	}

	function addResources()
	{
		this.weapon.addResources();

		foreach( r in this.m.BleedingSounds )
		{
			this.Tactical.addResource(r);
		}
	}

});

