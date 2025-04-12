local beasts = [
    "schrat",
    "spider",
    "direwolf",
    "direwolf_high",
    "ghoul_medium",
    "ghoul_high",
    "schrat_small"
];
		
foreach (beast in beasts)
{
    ::ModJelloCreatureCollection.HooksMod.hook("scripts/entity/tactical/enemies/" + beast, function ( q ) {
        q.onInit = @(__original) function()
        {
            __original();
            this.m.Skills.add(this.new("scripts/skills/effects/captain_effect"));
        }

        q.onFactionChanged <- function ()
        {
            this.actor.onFactionChanged();
            local flip = this.isAlliedWithPlayer();
            local sprites = [
                "head",
                "head_frenzy",
                "body",
                "body_blood",
                "legs_back", 
                "legs_front",
                "injury",
                "injury_body",
            ];
            foreach (sprite in sprites)
            {
                if (!hasSprite(sprite))
                    continue;
                this.getSprite(sprite).setHorizontalFlipping(flip);
            }
        }
    });
}

local beastsWithFlips = [
    "ghoul"
];
foreach (beast in beastsWithFlips)
{
    ::ModJelloCreatureCollection.HooksMod.hook("scripts/entity/tactical/enemies/" + beast, function ( q ) {
        q.onInit = @(__original) function()
        {
            __original();
            this.m.Skills.add(this.new("scripts/skills/effects/captain_effect"));
        }

        q.onFactionChanged = @(__original) function ()
        {   
            __original();
            this.actor.onFactionChanged();
            local flip = this.isAlliedWithPlayer();
            local sprites = [
                "head",
                "head_frenzy",
                "body",
                "body_blood",
                "legs_back", 
                "legs_front",
                "injury",
                "injury_body",
            ];
            foreach (sprite in sprites)
            {
                if (!hasSprite(sprite))
                    continue;
                this.getSprite(sprite).setHorizontalFlipping(flip);
            }
        }
    });
}
