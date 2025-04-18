this.jcc_cyto_engulf_skill <- this.inherit("scripts/skills/skill", {
	m = {
		Mode = 0,
		LastRoundApplied = 0,
		SpriteScaleBackup = 1.0,
		OnRemoveCallback = null,
		OnRemoveCallbackData = null,
		ParentID = null
	},
	function setOnRemoveCallback( _c, _d )
	{
		this.m.OnRemoveCallback = _c;
		this.m.OnRemoveCallbackData = _d;
	}

	function setMode( _f )
	{
		this.m.Mode = _f;
	}

	function setParentID( _p )
	{
		this.m.ParentID = _p;
	}
	function create()
	{
		this.m.ID = "actives.jcc_cyto_engulf_skill";
		this.m.Name = "Engulf";
		this.m.Description = "";
		this.m.Icon = "skills/active_147.png";
		this.m.Overlay = "active_147";
		this.m.SoundOnUse = [
			"sounds/enemies/dlc2/tentacle_disappear_01.wav",
			"sounds/enemies/dlc2/tentacle_disappear_02.wav",
			"sounds/enemies/dlc2/tentacle_disappear_03.wav",
			"sounds/enemies/dlc2/tentacle_disappear_04.wav",
			"sounds/enemies/dlc2/tentacle_disappear_05.wav"
		];
		this.m.SoundOnHit = [
			"sounds/enemies/slime_smack_01.wav",
			"sounds/enemies/slime_smack_02.wav"
		];
		this.m.SoundOnHitHitpoints = [
			"sounds/enemies/dlc2/krake_break_free_fail_01.wav",
			"sounds/enemies/dlc2/krake_break_free_fail_02.wav",
			"sounds/enemies/dlc2/krake_break_free_fail_03.wav",
			"sounds/enemies/dlc2/krake_break_free_fail_04.wav",
			"sounds/enemies/dlc2/krake_break_free_fail_05.wav"
		];
		this.m.SoundOnHitArmor = [
			"sounds/enemies/dlc2/krake_break_free_success_01.wav",
			"sounds/enemies/dlc2/krake_break_free_success_02.wav",
			"sounds/enemies/dlc2/krake_break_free_success_03.wav",
			"sounds/enemies/dlc2/krake_break_free_success_04.wav",
			"sounds/enemies/dlc2/krake_break_free_success_05.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 10;
		this.m.MinRange = 1;
		this.m.MaxRange = 2;
	}

	function isUsable()
	{
		return this.skill.isUsable();
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		if (_targetTile.getEntity().getCurrentProperties().IsRooted || _targetTile.getEntity().getCurrentProperties().IsImmuneToRoot)
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		_user.sinkIntoGround(0.75);
		_user.getSkills().setBusy(true);
		_user.m.IsAbleToDie = false;
		this.Time.scheduleEvent(this.TimeUnit.Real, 800, this.onNetSpawn.bindenv(this), {
			User = _user,
			Skill = this,
			TargetEntity = _targetTile.getEntity(),
			LoseHitpoints = true
		});
		
		return true;
	}

	function onNetSpawn( _data )
	{
		if (_data.Skill.m.SoundOnHit.len() != 0)
		{
			this.Sound.play(_data.Skill.m.SoundOnHit[this.Math.rand(0, _data.Skill.m.SoundOnHit.len() - 1)], this.Const.Sound.Volume.Skill, _data.TargetEntity.getPos());
		}

		local ensnare = this.new("scripts/skills/effects/jcc_cyto_engulf_effect");
		//ensnare.setMode(_data.User.getMode());
		//ensnare.setParentID(_data.User.getParent() != null && !_data.User.getParent().isNull() ? _data.User.getParent().getID() : null);
		ensnare.setOnRemoveCallback(function ( _data )
		{
			local targetTile = _data.TargetEntity.getTile();
			local tile;
			local n = _data.User.m.BloodType;

			for( local i = 0; i < this.Const.Tactical.BloodEffects[n].len(); i = ++i )
			{
				this.Tactical.spawnParticleEffect(false, this.Const.Tactical.BloodEffects[n][i].Brushes, targetTile, this.Const.Tactical.BloodEffects[n][i].Delay, this.Const.Tactical.BloodEffects[n][i].Quantity, this.Const.Tactical.BloodEffects[n][i].LifeTimeQuantity, this.Const.Tactical.BloodEffects[n][i].SpawnRate, this.Const.Tactical.BloodEffects[n][i].Stages);
			}

			//if (_data.User.getParent() != null)
			//{
				for( local i = 0; i < 6; i = ++i )
				{
					if (!targetTile.hasNextTile(i))
					{
					}
					else
					{
						local t = targetTile.getNextTile(i);

						if (t.IsEmpty)
						{
							tile = t;
							break;
						}
					}
				}

				if (tile == null)
				{
					local mapSize = this.Tactical.getMapSize();

					for( local attempts = 0; attempts < 500; attempts = ++attempts )
					{
						local x = this.Math.rand(5, mapSize.X - 5);
						local y = this.Math.rand(5, mapSize.Y - 5);
						local t = this.Tactical.getTileSquare(x, y);

						if (t.IsEmpty)
						{
							tile = t;
							break;
						}
					}
				}

				if (tile != null)
				{
					this.Tactical.addEntityToMap(_data.User, tile.Coords.X, tile.Coords.Y);

					if (_data.LoseHitpoints)
					{
						_data.User.setHitpoints(this.Math.max(25, _data.User.getHitpoints() - this.Math.rand(15, 30)));
						_data.User.spawnBloodDecals(targetTile);
					}

					_data.User.m.IsAbleToDie = true;
					_data.User.setDirty(true);
					_data.User.riseFromGround(0.1);
				}
			//}
		}, _data);
		_data.TargetEntity.getSkills().add(ensnare);
		local breakFree = this.new("scripts/skills/actives/break_free_skill");
		breakFree.m.Icon = "skills/active_148.png";
		breakFree.m.IconDisabled = "skills/active_148_sw.png";
		breakFree.m.Overlay = "active_148";
		breakFree.m.SoundOnUse = _data.Skill.m.SoundOnHitHitpoints;
		breakFree.setDecal(this.Const.BloodDecals[this.Const.BloodType.Red][this.Math.rand(0, this.Const.BloodDecals[this.Const.BloodType.Red].len() - 1)]);
		breakFree.setChanceBonus(0);
		_data.TargetEntity.getSkills().add(breakFree);
		_data.TargetEntity.raiseRootsFromGround("cyto_black_engulf","cyto_black_engulf");
		_data.User.getSkills().setBusy(false);
		_data.User.removeFromMap();
	}

});

