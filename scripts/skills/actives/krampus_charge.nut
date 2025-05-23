this.krampus_charge <- this.inherit("scripts/skills/skill", {
	m = {
		IsSpent = false,
		IsCharging = false
	},
	function create()
	{
		this.m.ID = "actives.krampus_charge";
		this.m.Name = "Flare Blitz";
		this.m.Description = "Charge towards a position, ramming a nearby foe with all your might to damage and stagger them.";
		this.m.Icon = "skills/active_52.png";
		this.m.IconDisabled = "skills/active_52_sw.png";
		this.m.Overlay = "active_52";
		this.m.SoundOnUse = [
			"sounds/enemies/percht_charge01.wav",
			"sounds/enemies/percht_charge02.wav",
			"sounds/enemies/percht_charge03.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/shatter_hit_01.wav",
			"sounds/combat/shatter_hit_02.wav",
			"sounds/combat/shatter_hit_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsTargetingActor = false;
		this.m.IsVisibleTileNeeded = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsUsingActorPitch = true;
		this.m.IsWeaponSkill = true;
		this.m.DirectDamageMult = 0.4;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 25;
		this.m.ChanceDisembowel = 50;
		this.m.MinRange = 1;
		this.m.MaxRange = 2;
		this.m.MaxLevelDifference = 1;
	}

	function getTooltip()
	{
		return this.skill.getDefaultTooltip();
	}

	function isUsable()
	{
		return this.skill.isUsable() && !this.m.IsSpent && !this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions());
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!_targetTile.IsEmpty)
		{
			return false;
		}

		if (this.Math.abs(_targetTile.Level - _originTile.Level) > this.m.MaxLevelDifference)
		{
			return false;
		}

		local myPos = _originTile.Pos;
		local targetPos = _targetTile.Pos;
		local distance = _originTile.getDistanceTo(_targetTile);
		local Dx = (targetPos.X - myPos.X) / distance;
		local Dy = (targetPos.Y - myPos.Y) / distance;

		for( local i = 0; i < distance; i = ++i )
		{
			local x = myPos.X + Dx * i;
			local y = myPos.Y + Dy * i;
			local tileCoords = this.Tactical.worldToTile(this.createVec(x, y));
			local tile = this.Tactical.getTile(tileCoords);

			if (!tile.IsOccupiedByActor && !tile.IsEmpty)
			{
				return false;
			}

			if (tile.hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions()))
			{
				return false;
			}

			if (this.Math.abs(tile.Level - _originTile.Level) > 1)
			{
				return false;
			}
		}

		return true;
	}

	function onTurnStart()
	{
		this.m.IsSpent = false;
	}

	function onUse( _user, _targetTile )
	{
		this.m.IsSpent = true;
		local tag = {
			Skill = this,
			User = _user,
			OldTile = _user.getTile(),
			TargetTile = _targetTile,
			OnRepelled = this.onRepelled
		};

		if (tag.OldTile.IsVisibleForPlayer || _targetTile.IsVisibleForPlayer)
		{
			local myPos = _user.getPos();
			local targetPos = _targetTile.Pos;
			local distance = tag.OldTile.getDistanceTo(_targetTile);
			local Dx = (targetPos.X - myPos.X) / distance;
			local Dy = (targetPos.Y - myPos.Y) / distance;

			for( local i = 0; i < distance; i = ++i )
			{
				local x = myPos.X + Dx * i;
				local y = myPos.Y + Dy * i;
				local tile = this.Tactical.worldToTile(this.createVec(x, y));

				if (this.Tactical.isValidTile(tile.X, tile.Y) && this.Const.Tactical.DustParticles.len() != 0)
				{
					for( local i = 0; i < this.Const.Tactical.DustParticles.len(); i = ++i )
					{
						this.Tactical.spawnParticleEffect(false, this.Const.Tactical.DustParticles[i].Brushes, this.Tactical.getTile(tile), this.Const.Tactical.DustParticles[i].Delay, this.Const.Tactical.DustParticles[i].Quantity * 0.5, this.Const.Tactical.DustParticles[i].LifeTimeQuantity * 0.5, this.Const.Tactical.DustParticles[i].SpawnRate, this.Const.Tactical.DustParticles[i].Stages);
					}
				}
			}
		}

		this.Tactical.getNavigator().teleport(_user, _targetTile, this.onTeleportDone.bindenv(this), tag, false, 2.0);
		return true;
	}

	function onRepelled( _tag )
	{
		this.Tactical.getNavigator().teleport(_tag.User, _tag.TargetTile, null, null, false);
	}

	function onTeleportDone( _entity, _tag )
	{
		local myTile = _entity.getTile();
		local potentialVictims = [];
		local betterThanNothing;
		local ZOC = [];
		local dirToTarget = _tag.OldTile.getDirectionTo(myTile);

		for( local i = 0; i != 6; i = ++i )
		{
			if (!myTile.hasNextTile(i))
			{
			}
			else
			{
				local tile = myTile.getNextTile(i);

				if (!tile.IsOccupiedByActor)
				{
				}
				else
				{
					local actor = tile.getEntity();

					if (actor.isAlliedWith(_entity) || actor.getSkills().hasSkill("effects.staggered"))
					{
					}
					else
					{
						ZOC.push(actor);

						if (betterThanNothing == null)
						{
							betterThanNothing = actor;
						}

						if (actor.getSkills().hasSkill("effects.staggered"))
						{
						}
						else
						{
							potentialVictims.push(actor);
						}
					}
				}
			}
		}

		foreach( actor in ZOC )
		{
			if (!actor.onMovementInZoneOfControl(_entity, true))
			{
				continue;
			}

			if (actor.onAttackOfOpportunity(_entity, true))
			{
				if (_tag.OldTile.IsVisibleForPlayer || myTile.IsVisibleForPlayer)
				{
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_entity) + " charges and is repelled");
				}

				if (!_entity.isAlive() || _entity.isDying())
				{
					return;
				}

				local dir = myTile.getDirectionTo(_tag.OldTile);

				if (myTile.hasNextTile(dir))
				{
					local tile = myTile.getNextTile(dir);

					if (tile.IsEmpty && this.Math.abs(tile.Level - myTile.Level) <= 1 && tile.getDistanceTo(actor.getTile()) > 1)
					{
						_tag.TargetTile = tile;
						this.Time.scheduleEvent(this.TimeUnit.Virtual, 50, _tag.OnRepelled, _tag);
						return;
					}
				}

				for( local i = 0; i != 6; i = ++i )
				{
					if (!myTile.hasNextTile(i))
					{
					}
					else
					{
						local tile = myTile.getNextTile(i);

						if (tile.IsEmpty && this.Math.abs(tile.Level - myTile.Level) <= 1)
						{
							if (tile.getZoneOfControlCountOtherThan(_entity.getAlliedFactions()) != 0)
							{
							}
							else
							{
								_tag.TargetTile = tile;
								this.Time.scheduleEvent(this.TimeUnit.Virtual, 50, _tag.OnRepelled, _tag);
								return;
							}
						}
					}
				}

				_tag.TargetTile = _tag.OldTile;
				this.Time.scheduleEvent(this.TimeUnit.Virtual, 50, _tag.OnRepelled, _tag);
				return;
			}
		}

		if (potentialVictims.len() == 0 && betterThanNothing != null)
		{
			potentialVictims.push(betterThanNothing);
		}

		if (potentialVictims.len() != 0)
		{
			local victim = potentialVictims[this.Math.rand(0, potentialVictims.len() - 1)];

			local success = this.Math.rand(1, 100) <= this.getHitchance(victim);

			if (!success)
			{
				victim.onMissed(this.getContainer().getActor(), this);
			}
			else
			{
				local p = this.getContainer().buildPropertiesForUse(this, victim);
				local hitInfo = clone this.Const.Tactical.HitInfo;
				local damageMult = p.MeleeDamageMult * p.DamageTotalMult;
				local damageRegular = this.Math.rand(p.DamageRegularMin, p.DamageRegularMax) * p.DamageRegularMult * 0.5;
				local damageArmor = this.Math.rand(p.DamageRegularMin, p.DamageRegularMax) * p.DamageArmorMult * 0.5;
				local damageDirect = this.Math.minf(1.0, p.DamageDirectMult * (this.m.DirectDamageMult + p.DamageDirectAdd + p.DamageDirectMeleeAdd));
				hitInfo.DamageRegular = damageRegular * damageMult;
				hitInfo.DamageArmor = damageArmor * damageMult;
				hitInfo.DamageDirect = damageDirect;
				hitInfo.BodyPart = this.Const.BodyPart.Body;
				hitInfo.BodyDamageMult = 1.0;
				hitInfo.FatalityChanceMult = 0.0;
				victim.onDamageReceived(this.getContainer().getActor(), this, hitInfo);

				if (!victim.isAlive() || victim.isDying())
				{
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_entity) + " charges and tramples " + this.Const.UI.getColorizedEntityName(victim));	
					return;
				}
			}

			local chance = 100;

			if (victim.isArmedWithShield())
			{
				local shield = victim.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
				chance = chance - shield.getMeleeDefense();

				if (victim.getSkills().hasSkill("effects.shieldwall"))
				{
					chance = chance - shield.getMeleeDefense();
				}
			}

			if (_tag.Skill.m.SoundOnHit.len() != 0)
			{
				this.Sound.play(_tag.Skill.m.SoundOnHit[this.Math.rand(0, _tag.Skill.m.SoundOnHit.len() - 1)], this.Const.Sound.Volume.Skill, myTile);
			}

			if (!victim.isHiddenToPlayer())
			{
				local layers = this.Const.ShakeCharacterLayers[this.Const.BodyPart.Body];
				this.Tactical.getShaker().shake(victim, myTile, 2);
			}

			if (this.Math.rand(1, 100) <= chance)
			{
				victim.getSkills().add(this.new("scripts/skills/effects/staggered_effect"));

				if (_tag.OldTile.IsVisibleForPlayer || myTile.IsVisibleForPlayer)
				{
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_entity) + " charges and staggers " + this.Const.UI.getColorizedEntityName(victim));
				}

				return;
			}
		}

		if (_tag.OldTile.IsVisibleForPlayer || myTile.IsVisibleForPlayer)
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_entity) + " charges");
		}
	}

	function onAnySkillUsed(_skill, _targetEntity, _properties)
	{
		if (_skill == this)
        {
            _properties.DamageRegularMin = 35;
            _properties.DamageRegularMin = 55;
            _properties.DamageArmorMult = 1.1;
        }
	}
});