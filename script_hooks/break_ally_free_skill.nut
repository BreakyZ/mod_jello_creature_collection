::ModJelloCreatureCollection.HooksMod.hook("scripts/skills/actives/break_ally_free_skill", function ( q ) {

	q.isHidden = @(__original) function ()
	{
		local actor = this.getContainer().getActor();

		if (this.Tactical.isActive() && actor.isPlacedOnMap())
		{
			local myTile = actor.getTile();

			for( local i = 0; i < 6; i = ++i )
			{
				if (!myTile.hasNextTile(i))
				{
				}
				else
				{
					local tile = myTile.getNextTile(i);

					if (this.Math.abs(tile.Level - myTile.Level) <= 1 && tile.IsOccupiedByActor && tile.getEntity().isAlliedWith(actor))
					{
						local entity = tile.getEntity();

						if (entity.getSkills().hasSkill("effects.jcc_cyto_engulf"))
						{
							this.m.Icon = "skills/active_157.png"; // we don't have an icon yet
							this.m.IconDisabled = "skills/active_157_sw.png"; // we don't have an icon yet
							return false;
						}
					}
				}
			}
		}

		return __original();
	}

	q.onVerifyTarget = @(__original) function ( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		local target = _targetTile.getEntity();

		if (!this.m.Container.getActor().isAlliedWith(target))
		{
			return false;
		}

		if (target.getSkills().hasSkill("effects.jcc_cyto_engulf"))
		{
			return true;
		}

		return __original( _originTile, _targetTile );
	}

	q.onUse = @(__original) function ( _user, _targetTile )
	{
		local target = _targetTile.getEntity();

		if (target.getSkills().hasSkill("effects.net"))
		{
			this.spawnIcon("status_effect_99", _targetTile); // no effect icon yet
		}

		return __original(_user, _targetTile);
	}
});