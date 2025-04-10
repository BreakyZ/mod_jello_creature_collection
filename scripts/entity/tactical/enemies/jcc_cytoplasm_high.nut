this.jcc_cytoplasm_high <- this.inherit("scripts/entity/tactical/enemies/jcc_cytoplasm", {
	m = {},
	function create()
	{
		this.jcc_cytoplasm.create();
	}

	function onInit()
	{
		this.actor.onInit();
		local baseProperties = this.m.BaseProperties;
		baseProperties.setValues(this.Const.Tactical.Actor.JccCytoplasm);
		baseProperties.IsAffectedByNight = false;
		baseProperties.IsImmuneToDisarm = true;
		baseProperties.IsImmuneToBleeding = true;
		baseProperties.IsImmuneToHeadshots = true;
		baseProperties.IsAffectedByInjuries = false;
		this.m.ActionPoints = baseProperties.ActionPoints;
		this.m.Hitpoints = baseProperties.Hitpoints;
		this.m.CurrentProperties = clone baseProperties;
		this.m.ActionPointCosts = this.Const.DefaultMovementAPCost;
		this.m.FatigueCosts = this.Const.DefaultMovementFatigueCost;
		local varia = this.Math.rand(1, 2);

		this.addSprite("socket").setBrush("bust_base_beasts");
		local skullA = this.addSprite("skullA");
		skullA.setBrush("bust_cytoplasm_small_skull_0" + varia);

		local body = this.addSprite("body");
		body.setBrush("bust_cytoplasm_small_body");
		body.varySaturation(0.25);
		body.varyColor(0.06, 0.06, 0.06);

		this.addDefaultStatusSprites();
		this.getSprite("status_rooted").Scale = 0.45;
		this.setSpriteOffset("status_rooted", this.createVec(-4, 7));
		baseProperties.IsImmuneToKnockBackAndGrab = true;
		baseProperties.IsImmuneToStun = true;
		this.m.Skills.add(this.new("scripts/skills/racials/cyto_racial"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_pathfinder"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_backstabber"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_hold_out"));
		this.m.Skills.add(this.new("scripts/skills/actives/slime_smack"));
		this.m.Skills.add(this.new("scripts/skills/actives/merge_cyto_skill"));
		this.m.Skills.add(this.new("scripts/skills/effects/captain_effect"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_captain"));
		this.grow(true);
		this.grow(true);
	}

});
