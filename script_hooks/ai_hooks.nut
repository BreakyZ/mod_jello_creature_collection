::Const.AI.Agent.ID.BasiliskDrone <- "agent.basilisk_drone";
::Const.AI.Agent.ID.BasiliskDroneAggressive <- "agent.basilisk_drone_aggressive";
::Const.AI.Agent.ID.BasiliskSentry <- "agent.basilisk_sentry";
::Const.AI.Agent.ID.Cytoplasm <- "agent.cytoplasm";
::Const.AI.Agent.ID.Percht <- "agent.percht";
::Const.AI.Agent.ID.PerchtRanged <- "agent.percht_ranged";

::ModJelloCreatureCollection.HooksMod.hook("scripts/ai/tactical/behaviors/ai_charge", function ( q ) {

    q.m.PossibleSkills.push("actives.krampus_charge");
});

::ModJelloCreatureCollection.HooksMod.hook("scripts/ai/tactical/behaviors/ai_attack_bow", function ( q ) {

    q.m.PossibleSkills.push("actives.percht_shot");
});