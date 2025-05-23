this.jcc_dragon_bite_fling_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.jcc_dragon_bite_fling";
		this.m.Name = "Deathroll";
		this.m.Description = "";
		this.m.Icon = "skills/active_111.png";
		this.m.IconDisabled = "skills/active_111_sw.png";
		this.m.Overlay = "active_111";
		this.m.SoundOnUse = [
			"sounds/enemies/lindwurm_gorge_01.wav",
			"sounds/enemies/lindwurm_gorge_02.wav",
			"sounds/enemies/lindwurm_gorge_03.wav"
		];
		this.m.SoundOnHitHitpoints = [
			"sounds/enemies/lindwurm_gorge_hit_01.wav",
			"sounds/enemies/lindwurm_gorge_hit_02.wav",
			"sounds/enemies/lindwurm_gorge_hit_03.wav"
		];
		/*this.m.SoundOnHit = [
			"sounds/enemies/unhold_fling_hit_01.wav",
			"sounds/enemies/unhold_fling_hit_02.wav",
			"sounds/enemies/unhold_fling_hit_03.wav"
		];*/
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.Delay = 750;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsUsingHitchance = true;
		this.m.ActionPointCost = 5;
		this.m.FatigueCost = 20;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
		this.m.DirectDamageMult = 0.35;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			_properties.DamageRegularMin += 80;
			_properties.DamageRegularMax += 100;
			_properties.DamageArmorMult *= 1.5;
		}
	}

	function findTileToKnockBackTo( _userTile, _targetTile )
	{
		local dir = _targetTile.getDirectionTo(_userTile);

		if (_userTile.hasNextTile(dir))
		{
			local flingToTile = _userTile.getNextTile(dir);

			if (flingToTile.IsEmpty && this.Math.abs(flingToTile.Level - _userTile.Level) <= 1)
			{
				return flingToTile;
			}
		}

		local altdir = dir - 1 >= 0 ? dir - 1 : 5;

		if (_userTile.hasNextTile(altdir))
		{
			local flingToTile = _userTile.getNextTile(altdir);

			if (flingToTile.IsEmpty && this.Math.abs(flingToTile.Level - _userTile.Level) <= 1)
			{
				return flingToTile;
			}
		}

		altdir = dir + 1 <= 5 ? dir + 1 : 0;

		if (_userTile.hasNextTile(altdir))
		{
			local flingToTile = _userTile.getNextTile(altdir);

			if (flingToTile.IsEmpty && this.Math.abs(flingToTile.Level - _userTile.Level) <= 1)
			{
				return flingToTile;
			}
		}

		return null;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		return this.skill.onVerifyTarget(_originTile, _targetTile) && !_targetTile.getEntity().getCurrentProperties().IsRooted && !_targetTile.getEntity().getCurrentProperties().IsImmuneToKnockBackAndGrab && this.findTileToKnockBackTo(_originTile, _targetTile) != null;
	}

	function onUse( _user, _targetTile )
	{
		this.getContainer().setBusy(true);
		local tag = {
			Skill = this,
			User = _user,
			TargetTile = _targetTile
		};

		if (!_user.isHiddenToPlayer() || _targetTile.IsVisibleForPlayer)
		{
			if (this.m.SoundOnUse.len() != 0)
			{
				this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.Skill, _user.getPos());
			}

			this.Time.scheduleEvent(this.TimeUnit.Virtual, this.m.Delay, this.onPerformAttack.bindenv(this), tag);

			if (!_user.isPlayerControlled() && _targetTile.getEntity().isPlayerControlled())
			{
				_user.getTile().addVisibilityForFaction(this.Const.Faction.Player);
			}
		}
		else
		{
			this.onPerformAttack(tag);
		}

		return true;
	}

	function onPerformAttack( _tag )
	{
		local _user = _tag.User;
		local _targetTile = _tag.TargetTile;
		local target = _targetTile.getEntity();
		local flingToTile = this.findTileToKnockBackTo(_user.getTile(), _targetTile);

		local success = this.attackEntity(_user, _targetTile.getEntity());

		if(!success){
			return false;
		}

		if (!target.isAlive() || target.isDying())
		{
			return success;
		}

		if (flingToTile == null)
		{
			return false;
		}

		this.applyFatigueDamage(target, 10);

		if (target.getCurrentProperties().IsImmuneToKnockBackAndGrab)
		{
			return false;
		}

		if (!_user.isHiddenToPlayer() && (_targetTile.IsVisibleForPlayer || flingToTile.IsVisibleForPlayer))
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " flings back " + this.Const.UI.getColorizedEntityName(target));
		}

		local skills = target.getSkills();
		skills.removeByID("effects.shieldwall");
		skills.removeByID("effects.spearwall");
		skills.removeByID("effects.riposte");
		target.setCurrentMovementType(this.Const.Tactical.MovementType.Involuntary);
		local damage = this.Math.max(0, this.Math.abs(flingToTile.Level - _targetTile.Level) - 1) * this.Const.Combat.FallingDamage + this.Const.Combat.FallingDamage;

		if (damage == 0)
		{
			this.Tactical.getNavigator().teleport(target, flingToTile, null, null, true);
		}
		else
		{
			local p = this.getContainer().getActor().getCurrentProperties();
			local tag = {
				Attacker = _user,
				Skill = this,
				HitInfo = clone this.Const.Tactical.HitInfo
			};
			tag.HitInfo.DamageRegular = damage;
			tag.HitInfo.DamageFatigue = this.Const.Combat.FatigueReceivedPerHit;
			tag.HitInfo.DamageDirect = 1.0;
			tag.HitInfo.BodyPart = this.Const.BodyPart.Body;
			tag.HitInfo.BodyDamageMult = 1.0;
			tag.HitInfo.FatalityChanceMult = 1.0;

			this.Tactical.getNavigator().teleport(target, flingToTile, this.onKnockedDown, tag, true);
		}

		local tag = {
			TargetTile = _targetTile,
			Actor = _user
		};
		this.Time.scheduleEvent(this.TimeUnit.Virtual, 250, this.onFollow, tag);
		return true;
	}

	function onFollow( _tag )
	{
		if (_tag.TargetTile.IsEmpty)
		{
			_tag.Actor.setCurrentMovementType(this.Const.Tactical.MovementType.Default);
			this.Tactical.getNavigator().teleport(_tag.Actor, _tag.TargetTile, null, null, false);
		}
	}

	function onKnockedDown( _entity, _tag )
	{
		if (_tag.Skill.m.SoundOnHit.len() != 0)
		{
			this.Sound.play(_tag.Skill.m.SoundOnHit[this.Math.rand(0, _tag.Skill.m.SoundOnHit.len() - 1)], this.Const.Sound.Volume.Skill, _entity.getPos());
		}

		if (_tag.HitInfo.DamageRegular != 0)
		{
			_entity.onDamageReceived(_tag.Attacker, _tag.Skill, _tag.HitInfo);
		}
	}

});

