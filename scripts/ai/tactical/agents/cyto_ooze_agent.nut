this.cyto_ooze_agent <- this.inherit("scripts/ai/tactical/agent", {
	m = {},
	function create()
	{
		this.agent.create();
		this.m.ID = this.Const.AI.Agent.ID.CytoOoze;
		this.m.Properties.BehaviorMult[this.Const.AI.Behavior.ID.Defend] = 1.0;
		this.m.Properties.BehaviorMult[this.Const.AI.Behavior.ID.EngageMelee] = 1.0;
		this.m.Properties.IsRangedUnit = true;
		this.m.Properties.TargetPriorityHitchanceMult = 0.6;
		this.m.Properties.TargetPriorityHitpointsMult = 0.2;

		this.m.Properties.TargetPriorityRandomMult = 0.0;
		this.m.Properties.TargetPriorityDamageMult = 0.2;
		this.m.Properties.TargetPriorityFleeingMult = 0.5;
		this.m.Properties.TargetPriorityHittingAlliesMult = 0.1;
		this.m.Properties.TargetPriorityFinishOpponentMult = 3.0;
		this.m.Properties.TargetPriorityCounterSkillsMult = 0.5;
		this.m.Properties.TargetPriorityArmorMult = 0.5;
		this.m.Properties.OverallHideMult = 0.75;
		this.m.Properties.EngageTargetMultipleOpponentsMult = 1.35;
		this.m.Properties.EngageTargetArmedWithRangedWeaponMult = 1.5;
		//this.m.Properties.EngageRangeMin = 3;
		//this.m.Properties.EngageRangeMax = 7;
		//this.m.Properties.EngageRangeIdeal = 6;

		this.m.Properties.TargetPriorityMoraleMult = 1.0;
		this.m.Properties.TargetPriorityBraveryMult = 1.0;
		this.m.Properties.OverallDefensivenessMult = 0.0;
		this.m.Properties.OverallFormationMult = 1.35;
		this.m.Properties.OverallMagnetismMult = 1.35;

		this.m.Properties.EngageTargetAlreadyBeingEngagedMult = 0.75;
		this.m.Properties.EngageFlankingMult = 1.25;
	}

	function onAddBehaviors()
	{
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_flee"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_retreat"));	
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_engage_melee"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_engage_ranged"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_bow"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_default"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_slime_smack"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_gruesome_feast"));
	}

	function onUpdate()
	{

	}

});

