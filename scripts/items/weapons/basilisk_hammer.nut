this.basilisk_hammer <- this.inherit("scripts/items/weapons/weapon", {
	m = {
		SoundOnPoison = [
			"sounds/combat/poison_applied_01.wav",
			"sounds/combat/poison_applied_02.wav"
		]
	},
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
		local skill = this.new("scripts/skills/actives/batter_skill");
		skill.m.Icon = "skills/basilisk_hammer_01.png";
		skill.m.IconDisabled = "skills/basilisk_hammer_01_sw.png";
		skill.m.Overlay = "basilisk_hammer_01";
		this.addSkill(skill);
		local skill = this.new("scripts/skills/actives/demolish_armor_skill");
		this.addSkill(skill);
	}

	function getTooltip()
	{
		local result = this.weapon.getTooltip();
		result.push({
			id = 8,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Dealing at least "+this.Const.Combat.PoisonEffectMinDamage+" damage will inflict Basilisk poison on the target, lowering their resolve and ability to recover fatigue"
		});
		return result;
	}

	function spawnIcon( _brush, _tile )
	{
		if (!_tile.IsVisibleForPlayer)
		{
			return;
		}

		this.Tactical.spawnIconEffect(_brush, _tile, this.Const.Tactical.Settings.SkillIconOffsetX, this.Const.Tactical.Settings.SkillIconOffsetY, this.Const.Tactical.Settings.SkillIconScale, this.Const.Tactical.Settings.SkillIconFadeInDuration, this.Const.Tactical.Settings.SkillIconStayDuration, this.Const.Tactical.Settings.SkillIconFadeOutDuration, this.Const.Tactical.Settings.SkillIconMovement);
	}

	function onDamageDealt( _target, _skill, _hitInfo )
	{
		if (_target.getCurrentProperties().IsImmuneToPoison || _hitInfo.DamageInflictedHitpoints <= this.Const.Combat.PoisonEffectMinDamage || _target.getHitpoints() <= 0)
			return;

		if (!_target.isAlive())
			return;

		if (_target.getFlags().has("undead"))
			return;

		if (!_target.isHiddenToPlayer())
		{
			if (this.m.SoundOnPoison.len() != 0)
			{
				this.Sound.play(this.m.SoundOnPoison[this.Math.rand(0, this.m.SoundOnPoison.len() - 1)], this.Const.Sound.Volume.RacialEffect * 1.5, _target.getPos());
			}

			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_target) + " is poisoned");
		}

		this.spawnIcon("status_effect_54", _target.getTile());
		local poison = ::Legends.Effects.get(_target, ::Legends.Effect.LegendRedbackSpiderPoison);
		local actor = this.getContainer().getActor();

		local poison = _targetEntity.getSkills().getSkillByID("effects.jcc_basilisk_poison");

		if (poison == null)
		{
			_targetEntity.getSkills().add(this.new("scripts/skills/effects/jcc_basilisk_poison_effect"));
		}
		else
		{
			poison.resetTime();
		}
	}

});

