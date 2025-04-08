local beasts = [
    "schrat",
    "spider",
    "direwolf",
    "direwolf_high"
];
		
foreach (beast in beasts)
{
    ::ModJelloCreatureCollection.HooksMod.hook("scripts/entity/tactical/enemies/" + beast, function ( q ) {
        q.onInit = @(__original) function()
        {
            __original();
            this.m.Skills.add(this.new("scripts/skills/effects/captain_effect"));
        }
    });
}
