::Const.AI.Agent.ID.BasiliskDrone <- "agent.basilisk_drone";
::Const.AI.Agent.ID.BasiliskDroneAggressive <- "agent.basilisk_drone_aggressive";
::Const.AI.Agent.ID.BasiliskSentry <- "agent.basilisk_sentry";
::Const.AI.Agent.ID.Cytoplasm <- "agent.cytoplasm";
::Const.AI.Agent.ID.Percht <- "agent.percht";
::Const.AI.Agent.ID.PerchtRanged <- "agent.percht_ranged";
::Const.AI.Agent.ID.Perchta <- "agent.perchta";
::Const.AI.Agent.ID.PerchtaRanged <- "agent.perchta_ranged";
::Const.AI.Agent.ID.BasiliskQueen <- "agent.basilisk_queen";
::Const.AI.Agent.ID.CytoOoze <- "agent.cyto_ooze";
::Const.AI.Agent.ID.CytoSoldier <- "agent.cyto_soldier";
::Const.AI.Agent.ID.CytoBlack <- "agent.cyto_black";
::Const.AI.Agent.ID.JccBeastslayer <- "agent.jcc_beastslayer";
::Const.AI.Agent.ID.JccDjinn <- "agent.jcc_djinn";
::Const.AI.Agent.ID.JccGiantScorp <- "agent.jcc_giant_scorp";
::Const.AI.Agent.ID.JccScorp <- "agent.jcc_scorp";

local count = ::Const.AI.Behavior.ID.COUNT;
::Const.AI.Behavior.ID.SlimeSmack <- count++;
::Const.AI.Behavior.ID.CallOfTheWild <- count++;
::Const.AI.Behavior.ID.KrampusCharge <- count++;
::Const.AI.Behavior.ID.MergeCyto <- count++;
::Const.AI.Behavior.ID.MoveToMergeCyto <- count++;
::Const.AI.Behavior.ID.COUNT = count;

::Const.AI.Behavior.Order.SlimeSmack <- 28;
::Const.AI.Behavior.Order.CallOfTheWild <- 39;
::Const.AI.Behavior.Order.KrampusCharge <- 4;
::Const.AI.Behavior.Order.MergeCyto <- 100;
::Const.AI.Behavior.Order.MoveToMergeCyto <- 11;

::ModJelloCreatureCollection.HooksMod.hook("scripts/ai/tactical/behaviors/ai_charge", function ( q ) {

	q.m.PossibleSkills.push("actives.krampus_charge");
	q.m.PossibleSkills.push("actives.krampus_charge_alt");
});

::ModJelloCreatureCollection.HooksMod.hook("scripts/ai/tactical/behaviors/ai_attack_deathblow", function ( q ) {

	q.m.PossibleSkills.push("actives.jcc_scorp_deathblow");
});

::ModJelloCreatureCollection.HooksMod.hook("scripts/ai/tactical/behaviors/ai_attack_knock_out", function ( q ) {

	q.m.PossibleSkills.push("actives.jcc_scorp_knock_out");
});

::ModJelloCreatureCollection.HooksMod.hook("scripts/ai/tactical/behaviors/ai_engage_melee", function ( q ) {

	q.m.PossibleSkills.push("actives.krampus_charge");
	q.m.PossibleSkills.push("actives.krampus_charge_alt");
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

 
::ModJelloCreatureCollection.HooksMod.hook("scripts/ai/tactical/behaviors/ai_attack_throw_net", function ( q ) {

	q.m.PossibleSkills.push("actives.throw_acid_flask");
});
