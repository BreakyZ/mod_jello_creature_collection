this.perchta_ranged_agent <- this.inherit("scripts/ai/tactical/agents/percht_ranged_agent", {
	m = {},
	function create()
	{
		this.percht_ranged_agent.create();
		//this.m.Properties.BehaviorMult[this.Const.AI.Behavior.ID.CallOfTheWild] = 5.0;
		this.m.Properties.BehaviorMult[this.Const.AI.Behavior.ID.BoostMorale] = 0.75;
	}

	function onAddBehaviors()
	{
		this.percht_ranged_agent.onAddBehaviors();
		//this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_call_of_the_wild"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_boost_morale"));
	}

	function onUpdate()
	{
	}

});

