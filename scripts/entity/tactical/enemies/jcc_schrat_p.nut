this.jcc_schrat_p <- this.inherit("scripts/entity/tactical/enemies/schrat", {
	m = {},
	function create()
	{
		this.schrat.create();
	}

	function onInit()
	{
		this.schrat.onInit();
		this.m.Skills.add(this.new("scripts/skills/effects/captain_effect"));
	}

});
