this.jcc_direwolf_high_p <- this.inherit("scripts/entity/tactical/enemies/direwolf_high", {
	m = {},
	function create()
	{
		this.direwolf_high.create();
	}

	function onInit()
	{
		this.direwolf_high.onInit();
		this.m.Skills.add(this.new("scripts/skills/effects/captain_effect"));
	}

});
