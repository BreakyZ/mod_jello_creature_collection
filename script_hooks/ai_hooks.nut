::Const.AI.Agent.ID.BasiliskDrone <- "agent.basilisk_drone";
::Const.AI.Agent.ID.BasiliskDroneAggressive <- "agent.basilisk_drone_aggressive";
::Const.AI.Agent.ID.BasiliskSentry <- "agent.basilisk_sentry";
::Const.AI.Agent.ID.Cytoplasm <- "agent.cytoplasm";
::Const.AI.Agent.ID.Percht <- "agent.percht";
::Const.AI.Agent.ID.PerchtRanged <- "agent.percht_ranged";
::Const.AI.Agent.ID.BasiliskQueen <- "agent.basilisk_queen";
::Const.AI.Agent.ID.CytoOoze <- "agent.cyto_ooze";
::Const.AI.Agent.ID.CytoSoldier <- "agent.cyto_soldier";
::Const.AI.Agent.ID.CytoBlack <- "agent.cyto_black";

::ModJelloCreatureCollection.HooksMod.hook("scripts/ai/tactical/behaviors/ai_charge", function ( q ) {

	q.m.PossibleSkills.push("actives.krampus_charge");
});

::ModJelloCreatureCollection.HooksMod.hook("scripts/ai/tactical/behaviors/ai_engage_melee", function ( q ) {

	q.m.PossibleSkills.push("actives.krampus_charge");
});

::ModJelloCreatureCollection.HooksMod.hook("scripts/ai/tactical/behaviors/ai_attack_throw_net", function ( q ) {

	q.m.PossibleSkills.push("actives.jcc_cyto_engulf_skill");
});

::ModJelloCreatureCollection.HooksMod.hook("scripts/ai/tactical/behaviors/ai_attack_bow", function ( q ) {

	q.m.PossibleSkills.push("actives.percht_shot");
	q.m.PossibleSkills.push("actives.cyto_gunk_shot");
});

::ModJelloCreatureCollection.HooksMod.hook("scripts/ai/tactical/behaviors/ai_attack_default", function ( q ) {

	q.m.PossibleSkills.push("actives.jcc_basilisk_peck");
	q.m.PossibleSkills.push("actives.jcc_basilisk_big_peck");
    q.m.PossibleSkills.push("actives.jcc_basilisk_sentry_fowleye");
	q.m.PossibleSkills.push("actives.jcc_basilisk_sentry_inject");
	q.m.PossibleSkills.push("actives.split_man_cursed");
});

 
