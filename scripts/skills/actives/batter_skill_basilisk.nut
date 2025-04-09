this.batter_skill_basilisk <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.batter_basilisk";
		this.m.Name = "Batter";
		this.m.Description = "A strike that can cover the distance of 2 tiles. Its effect can be felt through the thickest of armor. Can apply Basilisk poison.";
		this.m.KilledString = "Hammered to death";
		this.m.Icon = "skills/basilisk_hammer_01.png";
		this.m.IconDisabled = "skills/basilisk_hammer_01_sw.png";
		this.m.Overlay = "basilisk_hammer_01";
		this.m.SoundOnUse = [
			"sounds/combat/hammer_strike_01.wav",
			"sounds/combat/hammer_strike_02.wav",
			"sounds/combat/hammer_strike_03.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/hammer_strike_hit_01.wav",
			"sounds/combat/hammer_strike_hit_02.wav",
			"sounds/combat/hammer_strike_hit_03.wav"
		];
		this.m.SoundVolume = 1.1;
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsTooCloseShown = true;
		this.m.IsWeaponSkill = true;
		this.m.InjuriesOnBody = this.Const.Injury.BluntBody;
		this.m.InjuriesOnHead = this.Const.Injury.BluntHead;
		this.m.DirectDamageMult = 0.5;
		this.m.HitChanceBonus = 0;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 15;
		this.m.MinRange = 1;
		this.m.MaxRange = 2;
		this.m.ChanceDecapitate = 0;
		this.m.ChanceDisembowel = 0;
		this.m.ChanceSmash = 50;
	}

	function getTooltip()
	{
		local ret = this.getDefaultTooltip();
		ret.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Always inflicts at least [color=" + this.Const.UI.Color.DamageValue + "]" + 10 + "[/color] damage to hitpoints, regardless of armor"
		});
		ret.push({
			id = 7,
			type = "text",
			icon = "ui/icons/vision.png",
			text = "Has a range of [color=" + this.Const.UI.Color.PositiveValue + "]2" + "[/color] tiles"
		});

		if (!this.getContainer().getActor().getCurrentProperties().IsSpecializedInHammers)
		{
			ret.push({
				id = 6,
				type = "text",
				icon = "ui/icons/hitchance.png",
				text = "Has [color=" + this.Const.UI.Color.NegativeValue + "]-15%[/color] chance to hit targets directly adjacent because the weapon is too unwieldy"
			});
		}
			ret.push({
				id = 8,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Dealing at least "+this.Const.Combat.PoisonEffectMinDamage+" damage will inflict Basilisk poison on the target, lowering their resolve and ability to recover fatigue"
			});
		

		return ret;
	}

	function getExpectedDamage( _target )
	{
		local ret = this.skill.getExpectedDamage(_target);
		ret.HitpointDamage = this.Math.max(10, ret.HitpointDamage);
		ret.TotalDamage = this.Math.max(10, ret.TotalDamage);
		return ret;
	}

	function onAfterUpdate( _properties )
	{
		this.m.FatigueCostMult = _properties.IsSpecializedInHammers ? this.Const.Combat.WeaponSpecFatigueMult : 1.0;
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

			if (_targetEntity != null && !this.getContainer().getActor().getCurrentProperties().IsSpecializedInHammers && this.getContainer().getActor().getTile().getDistanceTo(_targetEntity.getTile()) == 1)
			{
				_properties.MeleeSkill += -15;
				this.m.HitChanceBonus = -15;
			}
			else
			{
				this.m.HitChanceBonus = 0;
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

