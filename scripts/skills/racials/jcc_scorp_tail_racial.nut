this.jcc_scorp_tail_racial <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "racial.scorp_tail";
		this.m.Name = "Poison";
		this.m.Description = "TODO";
		this.m.Icon = "";
		this.m.SoundOnUse = [
			"sounds/enemies/dlc2/giant_spider_poison_01.wav",
			"sounds/enemies/dlc2/giant_spider_poison_02.wav"
		];
		this.m.Type = this.Const.SkillType.Racial | this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (!_targetEntity.isAlive())
		{
			return;
		}

		if (_targetEntity.getCurrentProperties().IsImmuneToPoison || _damageInflictedHitpoints < this.Const.Combat.PoisonEffectMinDamage || _targetEntity.getHitpoints() <= 0)
		{
			return;
		}

		if (_targetEntity.getFlags().has("undead"))
		{
			return;
		}

		if(_skill.getID()!="actives.jcc_scorp_prong" && _skill.getID()!="actives.jcc_scorp_deathblow" && _skill.getID()!="actives.jcc_scorp_throw_spear" ){
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
		local poison = _targetEntity.getSkills().getSkillByID("effects.spider_poison");

		if (poison == null)
		{
			local effect = this.new("scripts/skills/effects/spider_poison_effect");
			_targetEntity.getSkills().add(effect);
		}
		else
		{
			poison.resetTime();
		}
	}

	function onUpdate( _properties )
	{
		local num = this.Tactical.Entities.getInstancesOfFaction(this.getContainer().getActor().getFaction()).len();
		_properties.Bravery += (num - 1) * 3;

		local actor = this.getContainer().getActor();

		if (actor.isArmedWithShield())
		{
			//_properties.MeleeDefense += 20;
			//_properties.RangedDefense += 20;
			_properties.DamageReceivedTotalMult *= 0.7;
		}
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_targetEntity.getSkills().hasSkill("effects.web"))
		{
			_properties.DamageDirectMult *= 2.0;
		}
	}

		function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_skill == null)
		{
			return;
		}

		if (_skill.getID() == "actives.jcc_scorp_shatter")
		{
			_properties.DamageReceivedRegularMult *= 0.0;
		}
	}

});

