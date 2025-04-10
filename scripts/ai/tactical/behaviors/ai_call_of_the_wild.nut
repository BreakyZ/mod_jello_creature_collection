this.ai_call_of_the_wild <- this.inherit("scripts/ai/tactical/behavior", {
	m = {
		PossibleSkills = [
			"actives.jcc_krampus_yell"
		],
		Skill = null
	},
	function create()
	{
		this.m.ID = this.Const.AI.Behavior.ID.CallOfTheWild;
		this.m.Order = this.Const.AI.Behavior.Order.CallOfTheWild;
		this.behavior.create();
	}

	function onEvaluate( _entity )
	{
		this.m.Skill = null;
		local score = this.getProperties().BehaviorMult[this.m.ID];

		if (_entity.getActionPoints() < this.Const.Movement.AutoEndTurnBelowAP)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (_entity.getMoraleState() == this.Const.MoraleState.Fleeing)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (!this.getAgent().hasKnownOpponent())
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		if (!this.getAgent().hasKnownAllies())
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local targets = this.queryTargetsInMeleeRange();

		if (targets.len() != 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		local skills = [];

		foreach( skillID in this.m.PossibleSkills )
		{
			local skill = _entity.getSkills().getSkillByID(skillID);

			if (skill != null && skill.isUsable() && skill.isAffordable())
			{
				skills.push(skill);
			}
		}

		if (skills.len() == 0)
		{
			return this.Const.AI.Behavior.Score.Zero;
		}

		this.m.Skill = skills[this.Math.rand(0, skills.len() - 1)];
		local knownAllies = this.Tactical.Entities.getInstancesOfFaction(_entity.getFaction());
		local allies = 0;

		foreach( a in knownAllies )
		{
			if (_entity.getTile().getDistanceTo(a.getTile()) <= 8 && _entity.getSkills().hasSkill("effects.jcc_call_of_the_wild"))
			{
				allies = ++allies;
			}
		}

		if (this.Const.AI.VerboseMode)
		{
			this.logInfo("* " + _entity.getName() + ": Other beasts in range to buff: " + allies);
		}

		if (allies >= 2)
		{
			local scoreMult = this.Math.minf(1.5, allies / 4.0);
			return 60 * scoreMult * score;
		}

		return this.Const.AI.Behavior.Score.Zero;
	}

	function onExecute( _entity )
	{
		if (this.Const.AI.VerboseMode)
		{
			this.logInfo("* " + _entity.getName() + ": Using Call of the Wild!");
		}

		this.m.Skill.use(_entity.getTile());

		if (!_entity.isHiddenToPlayer())
		{
			this.getAgent().declareAction();
		}

		this.m.Skill = null;
		return true;
	}

});

