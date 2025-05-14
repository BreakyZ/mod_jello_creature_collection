this.cytoplasm_agent <- this.inherit("scripts/ai/tactical/agent", {
	m = {},
	function create()
	{
		this.agent.create();
		this.m.ID = this.Const.AI.Agent.ID.Cytoplasm;
		this.m.Properties.TargetPriorityHitchanceMult = 0.5;
		this.m.Properties.TargetPriorityHitpointsMult = 0.25;
		this.m.Properties.TargetPriorityRandomMult = 0.0;
		this.m.Properties.TargetPriorityDamageMult = 0.25;
		this.m.Properties.TargetPriorityFleeingMult = 2.0;
		this.m.Properties.TargetPriorityHittingAlliesMult = 1.0;
		this.m.Properties.TargetPriorityFinishOpponentMult = 3.0;
		this.m.Properties.TargetPriorityCounterSkillsMult = 1.0;
		this.m.Properties.TargetPriorityArmorMult = 1.0;
		//this.m.Properties.TargetPriorityMoraleMult = 1.0;
		//this.m.Properties.TargetPriorityBraveryMult = 1.0;
		this.m.Properties.OverallDefensivenessMult = 0.1;
		this.m.Properties.OverallFormationMult = 1.35;
		this.m.Properties.OverallMagnetismMult = 1.35;
		this.m.Properties.EngageAgainstSpearwallMult = 1.25;
		this.m.Properties.EngageTargetAlreadyBeingEngagedMult = 0.75;
		this.m.Properties.EngageFlankingMult = 1.25;
		this.m.Properties.EngageRangeMin = 1;
		this.m.Properties.EngageRangeMax = 1;
		this.m.Properties.EngageRangeIdeal = 1;
		this.m.Properties.PreferCarefulEngage = true;
	}

	function onAddBehaviors()
	{
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_defend"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_flee"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_retreat"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_engage_melee"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_move_to_merge_cyto"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_merge_cyto"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_default"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_slime_smack"));
	}

	function onUpdate()
	{

		if(this.getActor().getSize()>=3)
		{
			this.m.Properties.PreferCarefulEngage = false;
		}
	}

});

