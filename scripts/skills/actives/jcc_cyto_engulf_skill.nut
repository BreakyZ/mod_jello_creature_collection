this.jcc_cyto_engulf_skill <- this.inherit("scripts/skills/actives/kraken_ensnare_skill", {
	m = {},
	function create()
	{
		this.kraken_ensnare_skill.create();
		this.m.ID = "actives.jcc_cyto_engulf";
		this.m.Name = "Engulf";
		this.m.SoundOnHit = [
			"sounds/enemies/slime_smack_01.wav",
			"sounds/enemies/slime_smack_02.wav"
		];
		this.m.ActionPointCost = 4;
	}

	function onNetSpawn( _data )
	{
		if (_data.Skill.m.SoundOnHit.len() != 0)
		{
			this.Sound.play(_data.Skill.m.SoundOnHit[this.Math.rand(0, _data.Skill.m.SoundOnHit.len() - 1)], this.Const.Sound.Volume.Skill, _data.TargetEntity.getPos());
		}

		local ensnare = this.new("scripts/skills/effects/jcc_cyto_engulf_effect");
		ensnare.setMode(_data.User.getMode());
		ensnare.setOnRemoveCallback(function ( _data )
		{
			local targetTile = _data.TargetEntity.getTile();
			local tile;
			local n = _data.User.m.BloodType;

			for( local i = 0; i < this.Const.Tactical.BloodEffects[n].len(); i = ++i )
			{
				this.Tactical.spawnParticleEffect(false, this.Const.Tactical.BloodEffects[n][i].Brushes, targetTile, this.Const.Tactical.BloodEffects[n][i].Delay, this.Const.Tactical.BloodEffects[n][i].Quantity, this.Const.Tactical.BloodEffects[n][i].LifeTimeQuantity, this.Const.Tactical.BloodEffects[n][i].SpawnRate, this.Const.Tactical.BloodEffects[n][i].Stages);
			}

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
		_data.TargetEntity.raiseRootsFromGround("cyto_black_engulf", "cyto_black_engulf");
		_data.User.getSkills().setBusy(false);
		_data.User.removeFromMap();
	}

});

