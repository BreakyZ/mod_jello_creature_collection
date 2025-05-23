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
::Const.AI.Agent.ID.JccGiantScorpTail <- "agent.jcc_giant_scorp_tail";
::Const.AI.Agent.ID.JccScorp <- "agent.jcc_scorp";
::Const.AI.Agent.ID.JccDjinnChamp <- "agent.jcc_djinn_champ";
::Const.AI.Agent.ID.JccDragon <- "agent.jcc_dragon";
::Const.AI.Agent.ID.JccNachtmahr <- "agent.jcc_nachtmahr";
::Const.AI.Agent.ID.JccNoble <- "agent.jcc_noble";

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

::ModJelloCreatureCollection.HooksMod.hook("scripts/ai/tactical/behaviors/ai_alp_teleport", function ( q ) {

	q.m.PossibleSkills.push("actives.jcc_nachtmahr_teleport");
});

::ModJelloCreatureCollection.HooksMod.hook("scripts/ai/tactical/behaviors/ai_horror", function ( q ) {

	q.m.PossibleSkills.push("actives.jcc_nachtmahr_sleep_paralysis");
});


::ModJelloCreatureCollection.HooksMod.hook("scripts/ai/tactical/behaviors/ai_attack_deathblow", function ( q ) {

	q.m.PossibleSkills.push("actives.jcc_scorp_deathblow");
});

::ModJelloCreatureCollection.HooksMod.hook("scripts/ai/tactical/behaviors/ai_boost_morale", function ( q ) {

	q.m.PossibleSkills.push("actives.perchta_whip");
});

::ModJelloCreatureCollection.HooksMod.hook("scripts/ai/tactical/behaviors/ai_attack_split", function ( q ) {

	q.m.PossibleSkills.push("actives.jcc_dragon_firejet");
});

::ModJelloCreatureCollection.HooksMod.hook("scripts/ai/tactical/behaviors/ai_line_breaker", function ( q ) {

	q.m.PossibleSkills.push("actives.jcc_dragon_bite_fling");
});

::ModJelloCreatureCollection.HooksMod.hook("scripts/ai/tactical/behaviors/ai_attack_handgonne", function ( q ) {

	q.m.PossibleSkills.push("actives.jcc_dragon_fire_area");
});

::ModJelloCreatureCollection.HooksMod.hook("scripts/ai/tactical/behaviors/ai_engage_melee", function ( q ) {

	q.m.PossibleSkills.push("actives.krampus_charge");
	q.m.PossibleSkills.push("actives.krampus_charge_alt");
});

::ModJelloCreatureCollection.HooksMod.hook("scripts/ai/tactical/behaviors/ai_attack_throw_net", function ( q ) {

	q.m.PossibleSkills.push("actives.jcc_cyto_engulf");
});

::ModJelloCreatureCollection.HooksMod.hook("scripts/ai/tactical/behaviors/ai_attack_bow", function ( q ) {

	q.m.PossibleSkills.push("actives.percht_shot");
	q.m.PossibleSkills.push("actives.cyto_gunk_shot");
	q.m.PossibleSkills.push("actives.jcc_scorp_throw_spear");
});

::ModJelloCreatureCollection.HooksMod.hook("scripts/ai/tactical/behaviors/ai_attack_default", function ( q ) {

	q.m.PossibleSkills.push("actives.jcc_basilisk_peck");
	q.m.PossibleSkills.push("actives.jcc_basilisk_big_peck");
	q.m.PossibleSkills.push("actives.jcc_basilisk_sentry_inject");
	q.m.PossibleSkills.push("actives.split_man_cursed");
	q.m.PossibleSkills.push("actives.jcc_scorp_prong");
	q.m.PossibleSkills.push("actives.jcc_scorp_cleave");
	q.m.PossibleSkills.push("actives.jcc_scorp_knock_out");
	q.m.PossibleSkills.push("actives.slime_smack");
	q.m.PossibleSkills.push("actives.jcc_scorp_deathblow");
	q.m.PossibleSkills.push("actives.jcc_dragon_bite_fling");
	q.m.PossibleSkills.push("actives.jcc_nachtmahr_claws_skill");
	q.m.PossibleSkills.push("actives.jcc_nightmare");
});

::ModJelloCreatureCollection.HooksMod.hook("scripts/ai/tactical/behaviors/ai_attack_swing", function ( q ) {

	q.m.PossibleSkills.push("actives.jcc_scorp_shatter");
    q.m.PossibleSkills.push("actives.jcc_basilisk_sentry_fowleye");
});

 
::ModJelloCreatureCollection.HooksMod.hook("scripts/ai/tactical/behaviors/ai_attack_throw_net", function ( q ) {

	q.m.PossibleSkills.push("actives.throw_acid_flask");
});
