::ModJelloCreatureCollection.HooksMod.hook("scripts/ai/tactical/behaviors/ai_move_tail", function ( q )
{
	q.onEvaluate = @(__original) function ( _entity )
	{
		// Function is a generator.
		local score = this.getProperties().BehaviorMult[this.m.ID];
		this.m.TargetTile = null;
		this.m.SelectedSkill = null;
		local time = this.Time.getExactTime();

		if (_entity.getActionPoints() < this.Const.Movement.AutoEndTurnBelowAP)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getCurrentProperties().IsRooted)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (this.getAgent().getIntentions().IsDefendingPosition)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (this.Time.getRound() == this.m.LastRoundUsed)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local skills = [];

		foreach( skillID in this.m.PossibleSkills )
		{
			local skill = _entity.getSkills().getSkillByID(skillID);

			if (skill != null && skill.isUsable() && skill.isAffordable())
			{
				this.m.SelectedSkill = skill;
				break;
			}
		}

		if (this.m.SelectedSkill == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local myTile = _entity.getTile();
		local bodyTile = _entity.getBody().getTile();
		local bestValue = 0.0;
		local myValue = 0.0;
		local bestTile;
		local attackSkill = this.selectSkill(this.m.AttackSkills);
		local targetsInMelee = this.queryTargetsInMeleeRange();

		if (myTile.getDistanceTo(bodyTile) <= this.Const.AI.Behavior.MoveTailMaxDistanceToHead)
		{
			myValue = 1.0 + this.Const.AI.Behavior.MoveTailCurrentTileBonus + this.getBestTarget(_entity, attackSkill, targetsInMelee, myTile).Score;
			bestValue = myValue;
			bestTile = myTile;

			if (targetsInMelee.len() != 0)
			{
				score = score * this.Const.AI.Behavior.MoveTailAlreadyEngagedMult;
			}
		}
		else
		{
			score = score * this.Const.AI.Behavior.MoveTailNearHeadMult;
		}

		local potentialTiles = this.queryDestinationsInRange(bodyTile, 1, this.Const.AI.Behavior.MoveTailMaxDistanceToHead);
		yield null;
		time = this.Time.getExactTime();

		foreach( potentialTile in potentialTiles )
		{
			if (this.isAllottedTimeReached(time))
			{
				yield null;
				time = this.Time.getExactTime();
			}

			local potentialValue = 1.0;
			local targets = this.queryTargetsInMeleeRange(1, 1, 1, potentialTile);

			if (_entity.getType() != this.Const.EntityType.JccGiantScorp)
			{
				if (targets.len() != 0)
				{
					potentialValue = potentialValue + this.getBestTarget(_entity, attackSkill, targets, potentialTile).Score;
				}
			}

			if (potentialValue > bestValue)
			{
				bestValue = potentialValue;
				bestTile = potentialTile;
			}
		}

		if (bestTile == null)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (myValue >= bestValue)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.TargetTile = bestTile;
		this.getAgent().getIntentions().TargetTile = bestTile;
		return this.Const.AI.Behavior.Score.MoveTail * score;
	}
});
