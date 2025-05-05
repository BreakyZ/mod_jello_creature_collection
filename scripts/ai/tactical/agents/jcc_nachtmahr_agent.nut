this.jcc_nachtmahr_agent <- this.inherit("scripts/ai/tactical/agent", {
	m = {Cooldown = 0},
	function create()
	{
		this.agent.create();
		this.m.ID = this.Const.AI.Agent.ID.JccNachtmahr;
		this.m.Properties.BehaviorMult[this.Const.AI.Behavior.ID.AttackDefault] = 1.0;
		this.m.Properties.BehaviorMult[this.Const.AI.Behavior.ID.Horror] = 2.0;
		this.m.Properties.BehaviorMult[this.Const.AI.Behavior.ID.EngageMelee] = 0.65;
		//this.m.Properties.TargetPriorityHitchanceMult = 0.0;
		this.m.Properties.TargetPriorityHitpointsMult = 0.05;
		this.m.Properties.TargetPriorityRandomMult = 0.85;
		this.m.Properties.TargetPriorityDamageMult = 0.25;
		this.m.Properties.TargetPriorityFleeingMult = 1.0;
		this.m.Properties.TargetPriorityHittingAlliesMult = 0.1;
		this.m.Properties.TargetPriorityArmorMult = 0.25;
		this.m.Properties.OverallFormationMult = 0.5;
		this.m.Properties.EngageWhenAlreadyEngagedMult = 0.0;
		this.m.Properties.EngageTargetMultipleOpponentsMult = 0.5;
		this.m.Properties.EngageOnGoodTerrainBonusMult = 1.0;
		this.m.Properties.EngageOnBadTerrainPenaltyMult = 1.0;
		this.m.Properties.EngageAgainstSpearwallMult = 1.0;
		this.m.Properties.EngageAgainstSpearwallWithShieldwallMult = 0.0;
		this.m.Properties.EngageTargetArmedWithRangedWeaponMult = 1.0;
		this.m.Properties.EngageTargetAlreadyBeingEngagedMult = 0.5;
		this.m.Properties.EngageLockDownTargetMult = 1.0;
		this.m.Properties.OverallDefensivenessMult = 0.5;
		this.m.Properties.TargetPriorityCounterSkillsMult = 2.0;
		this.m.Properties.PreferWait = true;
		this.m.Properties.PreferCarefulEngage = true;
		this.m.Properties.TargetPriorityBraveryMult = 0.4;
		this.m.Properties.OverallHideMult = 2.0;
		this.m.Properties.TargetPriorityFinishOpponentMult = 0.5;

	}

	function onAddBehaviors()
	{
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_retreat"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_engage_melee"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_attack_default"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_alp_teleport"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_roam"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_horror"));
		//this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_sleep"));
	}

	function setCooldown( _i ){
		this.m.Cooldown = _i;
	}

	function getCooldown(){
		return this.m.Cooldown;
	}

	function onUpdate()
	{
		if(this.m.Cooldown==0){
			this.m.Properties.EngageRangeMin = 2;
			this.m.Properties.EngageRangeMax = 3;
			this.m.Properties.EngageRangeIdeal = this.Math.rand(2,3);
		}else{
			this.m.Properties.EngageRangeMin = 1;
			this.m.Properties.EngageRangeMax = 1;
			this.m.Properties.EngageRangeIdeal = 1;
		}

		if(this.m.Actor.getActionPoints()<3){
			this.m.Properties.PreferWait = true;
		}
		else
		{
			this.m.Properties.PreferWait = false;	
		}
	}

});

