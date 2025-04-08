this.jcc_spider_p <- this.inherit("scripts/entity/tactical/enemies/spider", {
	m = {},
	function create()
	{
		this.spider.create();
	}

	function onInit()
	{
		this.spider.onInit();
		this.m.Skills.add(this.new("scripts/skills/effects/captain_effect"));
	}

});
