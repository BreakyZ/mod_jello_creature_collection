this.cyto_gunk_shot <- this.inherit("scripts/skills/skill", {
	m = {
		AdditionalAccuracy = 0,
		AdditionalHitChance = 0
	},
	function create()
	{
		this.m.ID = "actives.cyto_gunk_shot";
		this.m.Name = "Gunk Shot";
		this.m.Description = "Propel a stone towards a target with your sling. Accuracy drops sharply with distance. Can not be used while engaged in melee.";
		this.m.KilledString = "Pummeled";
		this.m.Icon = "skills/active_12.png";
		this.m.IconDisabled = "skills/active_12_sw.png";
		this.m.Overlay = "active_12";
		this.m.SoundOnUse = [
			"sounds/enemies/cyto_spit_01.wav",
			"sounds/enemies/cyto_spit_02.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/cleave_hit_hitpoints_01.wav",
			"sounds/combat/cleave_hit_hitpoints_02.wav",
			"sounds/combat/cleave_hit_hitpoints_03.wav"
		];
		this.m.SoundOnHitShield = [
			"sounds/enemies/unhold_regenerate_01.wav",
			"sounds/enemies/unhold_regenerate_02.wav"
		];
		/*this.m.SoundOnMiss = [
			"sounds/combat/dlc4/sling_miss_01.wav",
			"sounds/combat/dlc4/sling_miss_02.wav",
			"sounds/combat/dlc4/sling_miss_03.wav",
			"sounds/combat/dlc4/sling_miss_04.wav",
			"sounds/combat/dlc4/sling_miss_05.wav",
			"sounds/combat/dlc4/sling_miss_06.wav"
		];*/
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.Delay = 500;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsRanged = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = true;
		this.m.IsWeaponSkill = true;
		this.m.IsDoingForwardMove = false;
		this.m.InjuriesOnBody = this.Const.Injury.BurningBody;
		this.m.InjuriesOnHead = this.Const.Injury.SlimeHeadInjuries;
		this.m.DirectDamageMult = 0.5;
		this.m.ActionPointCost = 5;
		this.m.FatigueCost = 15;
		this.m.MinRange = 1;
		this.m.MaxRange = 6;
		this.m.MaxLevelDifference = 4;
		this.m.ProjectileType = this.Const.ProjectileType.JccSlimeBall;
		this.m.ProjectileTimeScale = 1.2;
		this.m.IsProjectileRotated = true;
		this.m.ChanceDecapitate = 0;
		this.m.ChanceDisembowel = 0;
		this.m.ChanceSmash = 0;
	}

	function getTooltip()
	{
		local ret = this.getDefaultTooltip();
		ret.extend([
			{
				id = 6,
				type = "text",
				icon = "ui/icons/vision.png",
				text = "Has a range of [color=" + this.Const.UI.Color.PositiveValue + "]" + this.getMaxRange() + "[/color] tiles on even ground, more if shooting downhill"
			}
		]);

		if (this.m.AdditionalAccuracy == 0)
		{
			ret.push({
				id = 7,
				type = "text",
				icon = "ui/icons/hitchance.png",
				text = "Has [color=" + this.Const.UI.Color.NegativeValue + "]" + (-5 + this.m.AdditionalHitChance) + "%[/color] chance to hit per tile of distance"
			});
		}
		else if (this.m.AdditionalAccuracy > 0)
		{
			ret.push({
				id = 7,
				type = "text",
				icon = "ui/icons/hitchance.png",
				text = "Has [color=" + this.Const.UI.Color.PositiveValue + "]+" + this.m.AdditionalAccuracy + "%[/color] chance to hit, and [color=" + this.Const.UI.Color.NegativeValue + "]" + (-10 + this.m.AdditionalHitChance) + "%[/color] per tile of distance"
			});
		}
		else
		{
			ret.push({
				id = 7,
				type = "text",
				icon = "ui/icons/hitchance.png",
				text = "Has [color=" + this.Const.UI.Color.NegativeValue + "]" + this.m.AdditionalAccuracy + "%[/color] chance to hit, and [color=" + this.Const.UI.Color.NegativeValue + "]" + (-10 + this.m.AdditionalHitChance) + "%[/color] per tile of distance"
			});
		}

		ret.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Has a [color=" + this.Const.UI.Color.NegativeValue + "]100%[/color] chance to daze a target on a hit to the head"
		});

		if (this.Tactical.isActive() && this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions()))
		{
			ret.push({
				id = 9,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Can not be used because this character is engaged in melee[/color]"
			});
		}

		return ret;
	}

	function isUsable()
	{
		return this.skill.isUsable() && (!this.Tactical.isActive() || !this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions()));
	}

	/*
	function onAfterUpdate( _properties )
	{
		//this.m.AdditionalAccuracy = this.m.Item.getAdditionalAccuracy();
		//this.m.FatigueCostMult = _properties.IsSpecializedInThrowing ? this.Const.Combat.WeaponSpecFatigueMult : 1.0;
	}*/

	function onUse( _user, _targetTile )
	{
		if (!_user.isHiddenToPlayer() || _targetTile.IsVisibleForPlayer)
		{
			this.getContainer().setBusy(true);
			local tag = {
				Skill = this,
				User = _user,
				TargetTile = _targetTile
			};
			this.Time.scheduleEvent(this.TimeUnit.Virtual, this.m.Delay, this.onPerformAttack, tag);

			if (!_user.isPlayerControlled() && _targetTile.getEntity().isPlayerControlled())
			{
				_user.getTile().addVisibilityForFaction(this.Const.Faction.Player);
			}

			return true;
		}
		else
		{
			return this.attackEntity(_user, _targetTile.getEntity());
		}
	}

	function onPerformAttack( _tag )
	{
		_tag.Skill.getContainer().setBusy(false);
		return _tag.Skill.attackEntity(_tag.User, _tag.TargetTile.getEntity());
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			_properties.RangedSkill += this.m.AdditionalAccuracy;
			_properties.HitChanceAdditionalWithEachTile += -5 + this.m.AdditionalHitChance;
			_properties.DamageRegularMin += 35;
			_properties.DamageRegularMax += 45;
			_properties.DamageArmorMult *= 0.6;
		}
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (_skill == this && _targetEntity.isAlive() && !_targetEntity.isDying())
		{
			local targetTile = _targetEntity.getTile();
			local user = this.getContainer().getActor();

			_targetEntity.getSkills().add(this.new("scripts/skills/effects/lindwurm_acid_effect"));

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
					//this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.RacialEffect * 1.5, _targetEntity.getPos());
				}

				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_targetEntity) + " is poisoned");
			}

			this.spawnIcon("status_effect_54", _targetEntity.getTile());
			local poison = _targetEntity.getSkills().getSkillByID("effects.spider_poison");

			if (poison == null)
			{
				_targetEntity.getSkills().add(this.new("scripts/skills/effects/spider_poison_effect"));
			}
			else
			{
				poison.resetTime();
			}
		}
	}

});

