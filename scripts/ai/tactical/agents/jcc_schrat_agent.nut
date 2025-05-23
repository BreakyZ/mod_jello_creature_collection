this.jcc_schrat_agent <- this.inherit("scripts/ai/tactical/agent", {
	m = {},
	function create()
	{
		this.agent.create();
		this.m.ID = this.Const.AI.Agent.ID.JccSchrat;
		this.m.Properties.BehaviorMult[this.Const.AI.Behavior.ID.Retreat] = 0.25;
		this.m.Properties.BehaviorMult[this.Const.AI.Behavior.ID.Shieldwall] = 4.0;
		this.m.Properties.TargetPriorityHitchanceMult = 0.25;
		this.m.Properties.TargetPriorityHitpointsMult = 0.25;
		this.m.Properties.TargetPriorityRandomMult = 0.25;
		this.m.Properties.TargetPriorityDamageMult = 0.25;
		this.m.Properties.TargetPriorityFleeingMult = 0.6;
		this.m.Properties.TargetPriorityHittingAlliesMult = 1.0;
		this.m.Properties.TargetPriorityFinishOpponentMult = 3.0;
		this.m.Properties.TargetPriorityCounterSkillsMult = 0.5;
		this.m.Properties.TargetPriorityArmorMult = 1.0;
		this.m.Properties.TargetPriorityAoEMult = 6.0;
		this.m.Properties.OverallDefensivenessMult = 0.0;
		this.m.Properties.OverallFormationMult = 0.2;
		this.m.Properties.OverallMagnetismMult = 0.0;
		this.m.Properties.EngageTargetMultipleOpponentsMult = 2.0;
		this.m.Properties.EngageTargetAlreadyBeingEngagedMult = 1.1;
		this.m.Properties.EngageTargetArmedWithRangedWeaponMult = 0.25;
		this.m.Properties.EngageRangeMin = 1;
		this.m.Properties.EngageRangeMax = 1;
		this.m.Properties.EngageRangeIdeal = 1;
		this.m.Properties.EngageEnemiesInLinePreference = 3;
		this.m.Properties.PreferCarefulEngage = false;
	}

	function onAddBehaviors()
	{
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_flee"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_retreat"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_engage_melee"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_break_free"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_defend_shieldwall"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_split"));
		this.getBehavior(this.Const.AI.Behavior.ID.Split).m.MinTargets = 1;
		this.getBehavior(this.Const.AI.Behavior.ID.Split).m.Length = 3;
	}

	function onUpdate()
	{
	}

});

