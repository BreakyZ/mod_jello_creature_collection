this.jcc_direwolf_p <- this.inherit("scripts/entity/tactical/enemies/direwolf", {
	m = {},
	function create()
	{
		this.direwolf.create();
	}

	function onInit()
	{
		this.direwolf.onInit();
		this.m.Skills.add(this.new("scripts/skills/effects/captain_effect"));
	}

});
