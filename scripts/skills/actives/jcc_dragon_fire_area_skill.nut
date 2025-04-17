this.jcc_dragon_fire_area_skill <- this.inherit("scripts/skills/skill", {
	m = {
		AdditionalAccuracy = 0,
		AdditionalHitChance = 0,
		SoundOnFire = []
	},

	function create()
	{
		this.m.ID = "actives.jcc_dragon_fire_area";
		this.m.Name = "Fire Breath";
		this.m.Description = "";
		this.m.Icon = "skills/active_203.png";
		this.m.IconDisabled = "skills/active_203_sw.png";
		this.m.Overlay = "active_203";
		this.m.SoundOnFire = [
			"sounds/combat/dlc6/fire_gonne_01.wav",
			"sounds/combat/dlc6/fire_gonne_02.wav",
			"sounds/combat/dlc6/fire_gonne_03.wav",
			"sounds/combat/dlc6/fire_gonne_04.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/dlc6/fire_gonne_hit_01.wav",
			"sounds/combat/dlc6/fire_gonne_hit_02.wav",
			"sounds/combat/dlc6/fire_gonne_hit_03.wav",
			"sounds/combat/dlc6/fire_gonne_hit_04.wav"
		];
		this.m.SoundOnHitDelay = 0;
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.Delay = 750;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsRanged = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = false;
		this.m.IsWeaponSkill = false;
		this.m.IsUsingHitchance = true;
		this.m.IsDoingForwardMove = false;
		this.m.IsTargetingActor = false;
		this.m.IsAOE = true;
		this.m.InjuriesOnBody = this.Const.Injury.BurningBody;
		this.m.InjuriesOnHead = this.Const.Injury.BurningHead;
		this.m.DirectDamageMult = 0.3;
		this.m.ActionPointCost = 5;
		this.m.FatigueCost = 15;
		this.m.MinRange = 2;
		this.m.MaxRange = 2;
		this.m.MaxRangeBonus = 1;
		this.m.MaxLevelDifference = 4;
	}

	function isUsable()
	{
		return this.skill.isUsable() && !this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions());
	}

	function applyEffectToTargets( _tag )
	{
		local user = _tag.User;
		local targets = _tag.Targets;
		local attackSkill = user.getCurrentProperties().getRangedSkill();

		foreach( t in targets )
		{
			if (!t.IsOccupiedByActor || !t.getEntity().isAttackable())
			{
				continue;
			}

			local target = t.getEntity();
			local success = this.attackEntity(user, target, false);

			if (success && target.isAlive() && !target.isDying() && t.IsVisibleForPlayer)
			{
				if (user.getPos().X <= target.getPos().X)
				{
					for( local i = 0; i < this.Const.Tactical.BurnParticles.len(); i = ++i )
					{
						local effect = this.Const.Tactical.BurnParticles[i];
						this.Tactical.spawnParticleEffect(false, effect.Brushes, t, effect.Delay, effect.Quantity, effect.LifeTimeQuantity, effect.SpawnRate, effect.Stages, this.createVec(0, 0));
					}
				}
				else
				{
					for( local i = 0; i < this.Const.Tactical.BurnParticles.len(); i = ++i )
					{
						local effect = this.Const.Tactical.BurnParticles[i];
						this.Tactical.spawnParticleEffect(false, effect.Brushes, t, effect.Delay, effect.Quantity, effect.LifeTimeQuantity, effect.SpawnRate, effect.Stages, this.createVec(0, 0));
					}
				}
			}
		}
	}

	function getAffectedTiles( _targetTile )
	{
		local ret = [
			_targetTile
		];
		local ownTile = this.m.Container.getActor().getTile();
		local dir = ownTile.getDirectionTo(_targetTile);

		if (_targetTile.hasNextTile(dir))
		{
			local forwardTile = _targetTile.getNextTile(dir);

			if (this.Math.abs(forwardTile.Level - ownTile.Level) <= this.m.MaxLevelDifference)
			{
				ret.push(forwardTile);
			}
		}

		local left = dir - 1 < 0 ? 5 : dir - 1;

		if (_targetTile.hasNextTile(left))
		{
			local forwardTile = _targetTile.getNextTile(left);

			if (this.Math.abs(forwardTile.Level - ownTile.Level) <= this.m.MaxLevelDifference)
			{
				ret.push(forwardTile);
			}

			if (forwardTile.hasNextTile(dir))
			{
				forwardTile = forwardTile.getNextTile(dir);

				if (this.Math.abs(forwardTile.Level - ownTile.Level) <= this.m.MaxLevelDifference)
				{
					ret.push(forwardTile);
				}
			}
		}

		local right = dir + 1 > 5 ? 0 : dir + 1;

		if (_targetTile.hasNextTile(right))
		{
			local forwardTile = _targetTile.getNextTile(right);

			if (this.Math.abs(forwardTile.Level - ownTile.Level) <= this.m.MaxLevelDifference)
			{
				ret.push(forwardTile);
			}

			if (forwardTile.hasNextTile(dir))
			{
				forwardTile = forwardTile.getNextTile(dir);

				if (this.Math.abs(forwardTile.Level - ownTile.Level) <= this.m.MaxLevelDifference)
				{
					ret.push(forwardTile);
				}
			}
		}

		return ret;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{

			_properties.DamageRegularMin += 60;
			_properties.DamageRegularMax += 85;
			_properties.DamageArmorMult *= 1.3;

			_properties.RangedSkill += 10 + this.m.AdditionalAccuracy;
			_properties.HitChanceAdditionalWithEachTile += -10 + this.m.AdditionalHitChance;
		}
	}

	function onTargetSelected( _targetTile )
	{
		local affectedTiles = this.getAffectedTiles(_targetTile);

		foreach( t in affectedTiles )
		{
			this.Tactical.getHighlighter().addOverlayIcon(this.Const.Tactical.Settings.AreaOfEffectIcon, t, t.Pos.X, t.Pos.Y);
		}
	}

	function onUse( _user, _targetTile )
	{
		this.Sound.play(this.m.SoundOnFire[this.Math.rand(0, this.m.SoundOnFire.len() - 1)], this.Const.Sound.Volume.Skill * this.m.SoundVolume, _user.getPos());
		local tag = {
			Skill = this,
			User = _user,
			TargetTile = _targetTile
		};
		this.Time.scheduleEvent(this.TimeUnit.Virtual, 500, this.onDelayedEffect.bindenv(this), tag);
		return true;
	}

	function onDelayedEffect( _tag )
	{
		local user = _tag.User;
		local targetTile = _tag.TargetTile;
		local myTile = user.getTile();
		local dir = myTile.getDirectionTo(targetTile);

		if (myTile.IsVisibleForPlayer)
		{
			if (user.isAlliedWithPlayer())
			{
				for( local i = 0; i < this.Const.Tactical.FireLanceRightParticles.len(); i = ++i )
				{
					local effect = this.Const.Tactical.FireLanceRightParticles[i];
					this.Tactical.spawnParticleEffect(false, effect.Brushes, myTile, effect.Delay, effect.Quantity, effect.LifeTimeQuantity, effect.SpawnRate, effect.Stages, this.createVec(0, 0));
				}
			}
			else
			{
				for( local i = 0; i < this.Const.Tactical.FireLanceLeftParticles.len(); i = ++i )
				{
					local effect = this.Const.Tactical.FireLanceLeftParticles[i];
					this.Tactical.spawnParticleEffect(false, effect.Brushes, myTile, effect.Delay, effect.Quantity, effect.LifeTimeQuantity, effect.SpawnRate, effect.Stages, this.createVec(0, 0));
				}
			}
		}

		local affectedTiles = this.getAffectedTiles(targetTile);
		this.Sound.play(this.m.SoundOnHit[this.Math.rand(0, this.m.SoundOnHit.len() - 1)], 1.0, user.getPos());
		local tag = {
			Skill = _tag.Skill,
			User = user,
			Targets = affectedTiles
		};

		//burn area
		local p = {
			Type = "fire",
			Tooltip = "Fire rages here, melting armor and flesh alike",
			IsPositive = false,
			IsAppliedAtRoundStart = false,
			IsAppliedAtTurnEnd = true,
			IsAppliedOnMovement = false,
			IsAppliedOnEnter = false,
			IsByPlayer = _tag.User.isPlayerControlled(),
			Timeout = this.Time.getRound() + 2,
			Callback = this.Const.Tactical.Common.onApplyFire,
			function Applicable( _a )
			{
				return true;
			}

		};

		foreach( tile in affectedTiles )
		{
			if (tile.Subtype != this.Const.Tactical.TerrainSubtype.Snow && tile.Subtype != this.Const.Tactical.TerrainSubtype.LightSnow && tile.Type != this.Const.Tactical.TerrainType.ShallowWater && tile.Type != this.Const.Tactical.TerrainType.DeepWater)
			{
				if (tile.Properties.Effect != null && tile.Properties.Effect.Type == "fire")
				{
					tile.Properties.Effect.Timeout = this.Time.getRound() + 2;
				}
				else
				{
					if (tile.Properties.Effect != null)
					{
						this.Tactical.Entities.removeTileEffect(tile);
					}

					tile.Properties.Effect = clone p;
					local particles = [];

					for( local i = 0; i < this.Const.Tactical.FireParticles.len(); i = ++i )
					{
						particles.push(this.Tactical.spawnParticleEffect(true, this.Const.Tactical.FireParticles[i].Brushes, tile, this.Const.Tactical.FireParticles[i].Delay, this.Const.Tactical.FireParticles[i].Quantity, this.Const.Tactical.FireParticles[i].LifeTimeQuantity, this.Const.Tactical.FireParticles[i].SpawnRate, this.Const.Tactical.FireParticles[i].Stages));
					}

					this.Tactical.Entities.addTileEffect(tile, tile.Properties.Effect, particles);
					tile.clear(this.Const.Tactical.DetailFlag.Scorchmark);
					tile.spawnDetail("impact_decal", this.Const.Tactical.DetailFlag.Scorchmark, false, true);
				}
			}

			/*if (tile.IsOccupiedByActor)
			{
				this.Const.Tactical.Common.onApplyFire(tile, tile.getEntity());
			}*/
		}
		//

		this.Time.scheduleEvent(this.TimeUnit.Virtual, 200, this.applyEffectToTargets.bindenv(this), tag);
		return true;
	}

	

});

