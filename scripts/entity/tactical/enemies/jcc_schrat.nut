this.jcc_schrat <- this.inherit("scripts/entity/tactical/enemies/schrat", {
	m = {},
	function create()
	{
		this.schrat.create();
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/jcc_schrat_agent");
		this.m.AIAgent.setActor(this)
	}

	function onInit()
	{
		this.schrat.onInit();

	}

});
