
::ModJelloCreatureCollection.HooksMod.hook("scripts/ai/tactical/behaviors/ai_charge", function ( q ) {

    q.m.PossibleSkills.push("actives.krampus_charge");
});