this.jcc_basilisk_sentry_inject_skill <- this.inherit("scripts/skills/skill", {
	m = {
		DamageArmorMult = 0.75,
	},
	
	function create()
	{
		this.m.ID = "actives.jcc_basilisk_sentry_inject";
		this.m.Name = "Inject"; //check
		this.m.Description = "Inject the target with a cocktail of venoms, halting their fatigue regeneration.";
		this.m.KilledString = "Pecked to death"; //check
		this.m.Icon = "skills/jcc_inject.png";
		this.m.IconDisabled = "skills/jcc_inject_sw.png";
		this.m.Overlay = "jcc_inject";
		this.m.SoundOnUse = [
			"sounds/enemies/dlc6/snake_attack_01.wav",
			"sounds/enemies/dlc6/snake_attack_02.wav",
			"sounds/enemies/dlc6/snake_attack_03.wav",
			"sounds/enemies/dlc6/snake_attack_04.wav"
		];
		this.m.SoundOnHit = [
			"sounds/enemies/dlc6/snake_attack_hit_01.wav",
			"sounds/enemies/dlc6/snake_attack_hit_02.wav",
			"sounds/enemies/dlc6/snake_attack_hit_03.wav",
			"sounds/enemies/dlc6/snake_attack_hit_04.wav"
		];
		this.m.SoundVolume = 1.1;
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		// this.m.IsTooCloseShown = true;
		// this.m.IsWeaponSkill = true;
		this.m.InjuriesOnBody = this.Const.Injury.PiercingBody;
		this.m.InjuriesOnHead = this.Const.Injury.PiercingHead; //check below
		this.m.DirectDamageMult = 0.3; //ignore armour multi.
		this.m.HitChanceBonus = 0;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 20;
		this.m.MinRange = 1;
		this.m.MaxRange = 2;
		this.m.ChanceDecapitate = 0;
		this.m.ChanceDisembowel = 0;
		this.m.ChanceSmash = 0;
	}

		function isUsable()
	{
		local mainhand = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		return (mainhand == null || this.getContainer().hasSkill("effects.disarmed")) && this.skill.isUsable();
	}

	function isHidden()
	{
		local mainhand = this.m.Container.getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);
		return mainhand != null && !this.getContainer().hasSkill("effects.disarmed") || this.skill.isHidden();
	}

	function getExpectedDamage( _target )
	{
		local ret = this.skill.getExpectedDamage(_target);
		ret.HitpointDamage = this.Math.max(10, ret.HitpointDamage);
		ret.TotalDamage = this.Math.max(10, ret.TotalDamage);
		return ret;
	}

	function onUse( _user, _targetTile )
	{
		this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectBash);
		local target = _targetTile.getEntity();
		return this.attackEntity(_user, target);
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			_properties.DamageMinimum = this.Math.max(_properties.DamageMinimum, 10);
			_properties.DamageRegularMin += 50;
			_properties.DamageRegularMax += 70;
			_properties.DamageArmorMult *= this.m.DamageArmorMult; //see top
			
			if (_targetEntity != null && this.getContainer().getActor().getTile().getDistanceTo(_targetEntity.getTile()) == 1) //if attacking adjacent enemy, apply this hitchance malus (polearm base logic)
			{
				_properties.MeleeSkill += -15;
				this.m.HitChanceBonus = -5;
			}
		}
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )//logic to determine poison applying on hit
	{
		if (_skill != this)
		{
			return
		}

		if (_targetEntity.getCurrentProperties().IsImmuneToPoison || _damageInflictedHitpoints <= this.Const.Combat.PoisonEffectMinDamage || _targetEntity.getHitpoints() <= 0)
		{
			return;
		}

		if (!_targetEntity.isAlive())
		{
			return;
		}

		if (_targetEntity.getFlags().has("undead"))
		{
			return;
		}

		if (!_targetEntity.isHiddenToPlayer())
		{
			if (this.m.SoundOnUse.len() != 0)
			{
				this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.RacialEffect * 1.5, _targetEntity.getPos());
			}

			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_targetEntity) + " is poisoned");
		}

		this.spawnIcon("status_effect_54", _targetEntity.getTile());
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

