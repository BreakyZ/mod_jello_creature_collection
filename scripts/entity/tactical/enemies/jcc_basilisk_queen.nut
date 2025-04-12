this.jcc_basilisk_queen <- this.inherit("scripts/entity/tactical/actor", {
	m = {},
	function create()
	{
		this.m.Type = this.Const.EntityType.JccBasiliskQueen;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.JccBasiliskQueen.XP;
		this.m.BloodSplatterOffset = this.createVec(0, 0);
		this.m.DecapitateSplatterOffset = this.createVec(40, -20);
		this.m.DecapitateBloodAmount = 3.0;
		this.m.ConfidentMoraleBrush = "icon_confident_orcs";
		this.actor.create();
		this.m.ExcludedInjuries = [
			"injury.fractured_hand",
			"injury.crushed_finger",
			"injury.smashed_hand",
			"injury.broken_arm",
			"injury.split_hand",
			"injury.pierced_hand",
			"injury.injured_knee_cap",
			"injury.split_nose",
			"injury.ripped_ear",
			"injury.sprained_ankle",
			"injury.burnt_hands"
		];
		this.m.Sound[this.Const.Sound.ActorEvent.Death] = [ //credit to wellington for all sounds
			"sounds/enemies/Basilisk_death01.wav",
			"sounds/enemies/Basilisk_death02.wav",
			"sounds/enemies/Basilisk_death03.wav"
		];
		this.m.Sound[this.Const.Sound.ActorEvent.Flee] = [ //i've spelt this with a capital B as thats what the files are right now. I can't seem to change the file names on git so im changing them here otherwise this whole process crashes on start when this entity is involved. We should change B to lowercase for all .wav files at a later date - Luft, 24/10/23. Fuck me.
			"sounds/enemies/Basilisk_flee01.wav",
			"sounds/enemies/Basilisk_flee02.wav",
			"sounds/enemies/Basilisk_flee03.wav"
		];
		this.m.Sound[this.Const.Sound.ActorEvent.DamageReceived] = [
			"sounds/enemies/Basilisk_hurt01.wav",
			"sounds/enemies/Basilisk_hurt02.wav",
			"sounds/enemies/Basilisk_hurt03.wav",
			"sounds/enemies/Basilisk_hurt04.wav",
			"sounds/enemies/Basilisk_hurt05.wav",
			"sounds/enemies/Basilisk_hurt06.wav"
		];
		this.m.Sound[this.Const.Sound.ActorEvent.Idle] = [
			"sounds/enemies/Basilisk_idle01.wav",
			"sounds/enemies/Basilisk_idle02.wav",
			"sounds/enemies/Basilisk_idle03.wav",
			"sounds/enemies/Basilisk_idle04.wav",
			"sounds/enemies/Basilisk_idle05.wav",
			"sounds/enemies/Basilisk_idle06.wav",
			"sounds/enemies/Basilisk_idle07.wav",
			"sounds/enemies/Basilisk_idle08.wav",
			"sounds/enemies/Basilisk_idle09.wav",
			"sounds/enemies/Basilisk_idle10.wav"
		];
		this.m.Sound[this.Const.Sound.ActorEvent.Move] = [
			"sounds/enemies/Basilisk_fatigue01.wav",
			"sounds/enemies/Basilisk_fatigue02.wav",
			"sounds/enemies/Basilisk_fatigue03.wav"
		];

		this.m.SoundPitch = this.Math.rand(0.6, 0.9);
		this.m.SoundVolumeOverall = 1.45;

		this.m.AIAgent = this.new("scripts/ai/tactical/agents/jcc_basilisk_queen_agent");
		this.m.AIAgent.setActor(this);

	}

	function playSound( _type, _volume, _pitch = 1.0 )
	{
		if (_type == this.Const.Sound.ActorEvent.Move && this.Math.rand(1, 100) <= 50)
		{
			return;
		}

		this.actor.playSound(_type, _volume, _pitch);
	}

	function onDeath( _killer, _skill, _tile, _fatalityType )
	{
		local flip = this.Math.rand(1, 100) < 50;

		if (_tile != null)
		{
			this.m.IsCorpseFlipped = flip;
			this.spawnBloodPool(_tile, 1);
			local decal;
			local appearance = this.getItems().getAppearance();
			local sprite_body = this.getSprite("body");
			local sprite_head = this.getSprite("head");
			decal = _tile.spawnDetail(sprite_body.getBrush().Name + "_dead", this.Const.Tactical.DetailFlag.Corpse, flip);
			decal.Color = sprite_body.Color;
			decal.Saturation = sprite_body.Saturation;
			decal.Scale = 0.9;
			decal.setBrightness(0.9);

			if (appearance.CorpseArmor != "")
			{
				decal = _tile.spawnDetail(appearance.CorpseArmor, this.Const.Tactical.DetailFlag.Corpse, flip);
				decal.Scale = 0.9;
				decal.setBrightness(0.9);
			}

			if (_fatalityType != this.Const.FatalityType.Decapitated)
			{
				if (!appearance.HideCorpseHead)
				{
					decal = _tile.spawnDetail(sprite_head.getBrush().Name + "_dead", this.Const.Tactical.DetailFlag.Corpse, flip);
					decal.Color = sprite_head.Color;
					decal.Saturation = sprite_head.Saturation;
					decal.Scale = 0.9;
					decal.setBrightness(0.9);
				}

				if (appearance.HelmetCorpse.len() != 0)
				{
					decal = _tile.spawnDetail(appearance.HelmetCorpse, this.Const.Tactical.DetailFlag.Corpse, flip);
					decal.Scale = 0.9;
					decal.setBrightness(0.9);
				}
			}
			else if (_fatalityType == this.Const.FatalityType.Decapitated)
			{
				local layers = [];

				if (!appearance.HideCorpseHead)
				{
					layers.push(sprite_head.getBrush().Name + "_dead");
				}

				if (appearance.HelmetCorpse.len() != 0)
				{
					layers.push(appearance.HelmetCorpse);
				}

				local decap = this.Tactical.spawnHeadEffect(this.getTile(), layers, this.createVec(-75, 50), 90.0, sprite_head.getBrush().Name + "_dead_bloodpool");
				local idx = 0;

				if (!appearance.HideCorpseHead)
				{
					decap[idx].Color = sprite_head.Color;
					decap[idx].Saturation = sprite_head.Saturation;
					decap[idx].Scale = 0.9;
					decap[idx].setBrightness(0.9);
					idx = ++idx;
				}

				if (appearance.HelmetCorpse.len() != 0)
				{
					decap[idx].Scale = 0.9;
					decap[idx].setBrightness(0.9);
					idx = ++idx;
				}
			}

			if (_fatalityType == this.Const.FatalityType.Disemboweled)
			{
				decal = _tile.spawnDetail("bust_unhold_guts", this.Const.Tactical.DetailFlag.Corpse, flip);
				decal.Scale = 0.9;
			}
			else if (_skill && _skill.getProjectileType() == this.Const.ProjectileType.Arrow)
			{
				decal = _tile.spawnDetail(sprite_body.getBrush().Name + "_dead_arrows", this.Const.Tactical.DetailFlag.Corpse, flip);
				decal.Scale = 0.9;
			}
			else if (_skill && _skill.getProjectileType() == this.Const.ProjectileType.Javelin)
			{
				decal = _tile.spawnDetail(sprite_body.getBrush().Name + "_dead_javelin", this.Const.Tactical.DetailFlag.Corpse, flip);
				decal.Scale = 0.9;
			}

			this.spawnTerrainDropdownEffect(_tile);
			local corpse = clone this.Const.Corpse;
			corpse.CorpseName = "A Basilisk Queen";
			corpse.Tile = _tile;
			corpse.IsResurrectable = false;
			corpse.IsConsumable = true;
			corpse.Items = this.getItems();
			corpse.IsHeadAttached = _fatalityType != this.Const.FatalityType.Decapitated;
			_tile.Properties.set("Corpse", corpse);
			this.Tactical.Entities.addCorpse(_tile);
		}

		if (_killer == null || _killer.getFaction() == this.Const.Faction.Player || _killer.getFaction() == this.Const.Faction.PlayerAnimals)
		{
			local n = 1 + (!this.Tactical.State.isScenarioMode() && this.Math.rand(1, 100) <= this.World.Assets.getExtraLootChance() ? 1 : 0);

			for( local i = 0; i < n; i = ++i )
			{
				local r = this.Math.rand(1, 100);
				local loot;

				if (r <= 40)
				{
					loot = this.new("scripts/items/misc/jcc_basilisk_egg_item");
				}
				else if (r <= 80)
				{
					loot = this.new("scripts/items/misc/jcc_basilisk_eye_item");
				}
				loot = this.new("scripts/items/loot/jcc_basilisk_crown_item");
				if (loot != null)
				{
					loot.drop(_tile);
				}
			}

			if (this.Math.rand(1, 100) <= 66)
			{
				local loot = this.new("scripts/items/supplies/strange_meat_item");
				loot.drop(_tile);
			}
		}

		this.actor.onDeath(_killer, _skill, _tile, _fatalityType);
	}

	function onInit()
	{
		this.actor.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.JccBasiliskQueen); 
		b.IsImmuneToDisarm = true;
		b.IsImmuneToPoison = true;

		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.m.ActionPointCosts = this.Const.DefaultMovementAPCost;
		this.m.FatigueCosts = this.Const.DefaultMovementFatigueCost;
		this.m.Items.getAppearance().Body = "bust_basilisk_queen_body"; //credit to Wellington for all drone sprites and ideas
		this.addSprite("socket").setBrush("bust_base_beasts");
		local body = this.addSprite("body");
		body.setBrush("bust_basilisk_queen_body");
		body.varySaturation(0.1);
		body.varyColor(0.09, 0.09, 0.09);
		this.addSprite("armor");
		local head = this.addSprite("head");
		head.setBrush("bust_basilisk_queen_head");
		head.Saturation = body.Saturation;
		head.Color = body.Color;
		local injury_body = this.addSprite("injury");
		injury_body.Visible = false;
		injury_body.setBrush("bust_basilisk_queen_injury");
		this.addSprite("helmet");
		this.addDefaultStatusSprites();
		this.getSprite("status_rooted").Scale = 0.65;
		this.setSpriteOffset("status_rooted", this.createVec(-10, 16));
		this.setSpriteOffset("status_stunned", this.createVec(0, 10));
		this.setSpriteOffset("arrow", this.createVec(0, 10));		

		this.m.Skills.add(this.new("scripts/skills/actives/jcc_basilisk_peck_skill"));
		// this.m.Skills.add(this.new("scripts/skills/perks/perk_jcc_second_wind"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
		//this.m.Skills.add(this.new("scripts/skills/perks/perk_pathfinder"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_berserk"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_steel_brow"));		
		this.m.Skills.add(this.new("scripts/skills/perks/perk_battering_ram"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_stalwart"));
		b.Threat += 5;

		this.m.Skills.add(this.new("scripts/skills/perks/perk_captain"));
		this.m.Skills.add(this.new("scripts/skills/effects/captain_effect"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_lone_wolf"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fast_adaption"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));

		this.m.Skills.add(this.new("scripts/skills/actives/jcc_basilisk_big_peck_skill"));
		this.m.Skills.add(this.new("scripts/skills/actives/miasma_skill"));

		if (!this.Tactical.State.isScenarioMode() && this.World.getTime().Days >= 35)
		{
			b.MeleeDefense += 5;
			b.RangedDefense += 5;
			this.m.Skills.add(this.new("scripts/skills/perks/perk_head_hunter"));
		}

	}

	function assignRandomEquipment()
	{
	}function onFactionChanged()
    {
        this.actor.onFactionChanged();
        local flip = this.isAlliedWithPlayer();
        this.getSprite("body").setHorizontalFlipping(flip);
        this.getSprite("injury").setHorizontalFlipping(flip);
        this.getSprite("armor").setHorizontalFlipping(flip);
        this.getSprite("head").setHorizontalFlipping(flip);
        this.getSprite("helmet").setHorizontalFlipping(flip);
    }

});

