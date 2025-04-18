this.jcc_giant_scorp_agent <- this.inherit("scripts/ai/tactical/agent", {
	m = {},
	function create()
	{
		this.agent.create();
		this.m.ID = this.Const.AI.Agent.ID.JccGiantScorp;
		this.m.Properties.TargetPriorityHitchanceMult = 0.5;
		this.m.Properties.TargetPriorityHitpointsMult = 1.0;
		this.m.Properties.TargetPriorityRandomMult = 1.0;
		this.m.Properties.TargetPriorityDamageMult = 1.25;
		this.m.Properties.TargetPriorityFleeingMult = 0.5;
		this.m.Properties.TargetPriorityHittingAlliesMult = 0.25;
		this.m.Properties.TargetPriorityCounterSkillsMult = 0.75;
		this.m.Properties.OverallDefensivenessMult = 1.0;
		this.m.Properties.OverallFormationMult = 0.0;
		this.m.Properties.OverallMagnetismMult = 0.0;
		this.m.Properties.EngageTargetAlreadyBeingEngagedMult = 2.0;
		this.m.Properties.EngageLockDownTargetMult = 2.0;
		this.m.Properties.EngageTargetArmedWithRangedWeaponMult = 1.0;
		this.m.Properties.EngageTargetMultipleOpponentsMult = 1.0;
		this.m.Properties.PreferCarefulEngage = false;
		this.m.Properties.EngageRangeMin = 1;
		this.m.Properties.EngageRangeMax = 1;
		this.m.Properties.EngageRangeIdeal = 1;
		this.m.Properties.PreferWait = false;
	}

	function onAddBehaviors()
	{
		//this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_roam"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_flee"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_retreat"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_engage_melee"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_defend_knock_back"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_break_free"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_default"));
	}

});

