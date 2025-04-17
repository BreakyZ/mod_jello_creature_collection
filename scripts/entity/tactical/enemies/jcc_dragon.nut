this.jcc_dragon <- this.inherit("scripts/entity/tactical/actor", {
	m = {body_variant=null,
		Size = 1.0,},
	function create()
	{
		this.m.Type = this.Const.EntityType.JccDragon;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.JccDragon.XP;
		this.m.BloodSplatterOffset = this.createVec(0, 0);
		this.m.DecapitateSplatterOffset = this.createVec(40, -20);
		this.m.DecapitateBloodAmount = 3.0;
		this.m.ConfidentMoraleBrush = "icon_confident_orcs";
		this.actor.create();
		this.m.Sound[this.Const.Sound.ActorEvent.DamageReceived] = [
			"sounds/enemies/lindwurm_hurt_01.wav",
			"sounds/enemies/lindwurm_hurt_02.wav",
			"sounds/enemies/lindwurm_hurt_03.wav",
			"sounds/enemies/lindwurm_hurt_04.wav"
		];
		this.m.Sound[this.Const.Sound.ActorEvent.Death] = [
			"sounds/enemies/lindwurm_death_01.wav",
			"sounds/enemies/lindwurm_death_02.wav",
			"sounds/enemies/lindwurm_death_03.wav",
			"sounds/enemies/lindwurm_death_04.wav"
		];
		this.m.Sound[this.Const.Sound.ActorEvent.Flee] = [
			"sounds/enemies/lindwurm_flee_01.wav",
			"sounds/enemies/lindwurm_flee_02.wav",
			"sounds/enemies/lindwurm_flee_03.wav",
			"sounds/enemies/lindwurm_flee_04.wav"
		];
		this.m.Sound[this.Const.Sound.ActorEvent.Idle] = [
			"sounds/enemies/lindwurm_idle_01.wav",
			"sounds/enemies/lindwurm_idle_02.wav",
			"sounds/enemies/lindwurm_idle_03.wav",
			"sounds/enemies/lindwurm_idle_04.wav",
			"sounds/enemies/lindwurm_idle_05.wav",
			"sounds/enemies/lindwurm_idle_06.wav",
			"sounds/enemies/lindwurm_idle_07.wav",
			"sounds/enemies/lindwurm_idle_08.wav",
			"sounds/enemies/lindwurm_idle_09.wav",
			"sounds/enemies/lindwurm_idle_10.wav",
			"sounds/enemies/lindwurm_idle_11.wav"
		];
		this.m.Sound[this.Const.Sound.ActorEvent.Move] = this.m.Sound[this.Const.Sound.ActorEvent.Idle];
		this.m.SoundVolume[this.Const.Sound.ActorEvent.DamageReceived] = 1.5;
		this.m.SoundVolume[this.Const.Sound.ActorEvent.Death] = 1.5;
		this.m.SoundVolume[this.Const.Sound.ActorEvent.Flee] = 1.5;
		this.m.SoundVolume[this.Const.Sound.ActorEvent.Idle] = 2.0;
		this.m.SoundVolume[this.Const.Sound.ActorEvent.Move] = 1.5;
		this.m.SoundPitch = this.Math.rand(95, 105) * 0.01;

		this.m.AIAgent = this.new("scripts/ai/tactical/agents/jcc_dragon_agent");
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
			corpse.CorpseName = "A Drache";
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

	function getOverlayImage()
	{
		if(this.m.body_variant==null){
			return "jcc_dragon_01_orientation"
		}
		return "jcc_dragon_0"+this.m.body_variant+"_orientation";
	}

	function onInit()
	{
		this.actor.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.JccDragon); 
		b.IsImmuneToDisarm = true;
		//b.IsImmuneToPoison = true;
		b.IsImmuneToFire = true;

		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.m.ActionPointCosts = this.Const.DefaultMovementAPCost;
		this.m.FatigueCosts = this.Const.DefaultMovementFatigueCost;
		this.m.Items.getAppearance().Body = "bust_jcc_dragon_body_01"; //credit to Wellington for all drone sprites and ideas
		this.addSprite("socket").setBrush("bust_base_beasts");


		this.m.body_variant = this.Math.rand(1,3);

		if(this.Math.rand(1,100)<55){
			this.m.body_variant=1;
		}

		local body = this.addSprite("body");
		body.setBrush("bust_jcc_dragon_body_0"+this.m.body_variant);
		body.varySaturation(0.1);
		body.varyColor(0.09, 0.09, 0.09);
		this.addSprite("armor");
		local head = this.addSprite("head");
		head.setBrush("bust_jcc_dragon_head_0"+this.m.body_variant);
		head.Saturation = body.Saturation;

		head.Saturation = body.Saturation;
		head.Color = body.Color;
		local injury_body = this.addSprite("injury");
		injury_body.Visible = false;
		injury_body.setBrush("bust_jcc_dragon_injured");
		this.addSprite("helmet");
		this.addDefaultStatusSprites();
		this.getSprite("status_rooted").Scale = 0.65;
		this.setSpriteOffset("status_rooted", this.createVec(-10, 16));
		this.setSpriteOffset("status_stunned", this.createVec(0, 10));
		this.setSpriteOffset("arrow", this.createVec(0, 10));		

		// this.m.Skills.add(this.new("scripts/skills/perks/perk_jcc_second_wind"));
		//this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));
		//this.m.Skills.add(this.new("scripts/skills/perks/perk_steel_brow"));

		this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_berserk"));

		this.m.Skills.add(this.new("scripts/skills/perks/perk_battering_ram"));
		//this.m.Skills.add(this.new("scripts/skills/perks/perk_stalwart"));

		b.Threat += 5;

		this.m.Skills.add(this.new("scripts/skills/perks/perk_fast_adaption"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));

		this.m.Skills.add(this.new("scripts/skills/actives/jcc_dragon_fire_area_skill"));
		this.m.Skills.add(this.new("scripts/skills/actives/jcc_dragon_bite_fling_skill"));
		this.m.Skills.add(this.new("scripts/skills/actives/jcc_dragon_firejet_skill"));
		this.m.Skills.add(this.new("scripts/skills/actives/jcc_dragon_zoc_claws_skill"));


		this.setSize(this.Math.rand(90, 100) * 0.01);

		if (!this.Tactical.State.isScenarioMode() && this.World.getTime().Days >= 35)
		{
			b.MeleeDefense += 5;
			b.RangedDefense += 5;
			//this.m.Skills.add(this.new("scripts/skills/perks/perk_head_hunter"));
		}

	}

		function setSize( _s )
	{
		this.m.Size = _s;
		this.m.DecapitateBloodAmount = _s * 0.75;
		this.getSprite("body").Scale = _s;
		this.getSprite("head").Scale = _s;
		this.getSprite("injury").Scale = _s;
		this.getSprite("status_rooted").Scale = _s * 0.65;
		this.getSprite("status_rooted_back").Scale = _s * 0.65;
		local offset = this.createVec(0, -10.0 * (1.0 - _s));
		this.setSpriteOffset("body", offset);
		this.setSpriteOffset("head", offset);
		this.setSpriteOffset("injury", offset);
		this.setSpriteOffset("status_rooted", this.createVec(7, 10 - 10.0 * (1.0 - _s)));
		this.setSpriteOffset("status_rooted_back", this.createVec(7, 10 - 10.0 * (1.0 - _s)));
	}


	function assignRandomEquipment()
	{
	}

	function onFactionChanged()
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

