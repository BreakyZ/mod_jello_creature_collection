this.perchta_agent <- this.inherit("scripts/ai/tactical/agents/percht_agent", {
	m = {},
	function create()
	{
		this.percht_agent.create();
		this.m.Properties.BehaviorMult[this.Const.AI.Behavior.ID.CallOfTheWild] = 5.0;
	}

	function onAddBehaviors()
	{
		this.percht_agent.onAddBehaviors();
		//this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_call_of_the_wild"));
		this.addBehavior(this.new("scripts/ai/tactical/behaviors/ai_boost_morale"));
	}

	function onUpdate()
	{
	}

});

