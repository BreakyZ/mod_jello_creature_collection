this.jcc_percht <- this.inherit("scripts/entity/tactical/actor", {
	m = { spriteOffset = 0 },
	function create()
	{
		this.m.Type = this.Const.EntityType.JccPercht;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.JccPercht.XP;
		this.m.BloodSplatterOffset = this.createVec(0, 0);
		this.m.DecapitateSplatterOffset = this.createVec(25, -25);
		this.m.ConfidentMoraleBrush = "icon_confident_orcs";
		this.actor.create();
		this.m.Sound[this.Const.Sound.ActorEvent.Death] = [
			"sounds/enemies/percht_death01.wav",
			"sounds/enemies/percht_death02.wav",
			"sounds/enemies/percht_death03.wav",
			"sounds/enemies/percht_death04.wav"
		];
		this.m.Sound[this.Const.Sound.ActorEvent.Flee] = [
			"sounds/enemies/percht_flee01.wav",
			"sounds/enemies/percht_flee02.wav"
		];
		this.m.Sound[this.Const.Sound.ActorEvent.DamageReceived] = [
			"sounds/enemies/percht_hurt01.wav",
			"sounds/enemies/percht_hurt02.wav",
			"sounds/enemies/percht_hurt03.wav",
			"sounds/enemies/percht_hurt04.wav",
			"sounds/enemies/percht_hurt05.wav",
		];
		this.m.Sound[this.Const.Sound.ActorEvent.Idle] = [
			"sounds/enemies/percht_idle01.wav",
			"sounds/enemies/percht_idle02.wav",
			"sounds/enemies/percht_idle03.wav",
			"sounds/enemies/percht_idle04.wav",
			"sounds/enemies/percht_idle05.wav",
			"sounds/enemies/percht_idle06.wav",
			"sounds/enemies/percht_idle07.wav",
			"sounds/enemies/percht_idle08.wav",
			"sounds/enemies/percht_idle09.wav",
			"sounds/enemies/percht_idle10.wav",
			"sounds/enemies/percht_idle11.wav",
			"sounds/enemies/percht_idle12.wav"
		];
		this.m.Sound[this.Const.Sound.ActorEvent.Move] = [
			"sounds/enemies/percht_move01.wav",
			"sounds/enemies/percht_move02.wav",
			"sounds/enemies/percht_move03.wav",
			"sounds/enemies/percht_move04.wav"
		];
		this.m.SoundPitch = 1.0;
		this.m.SoundVolume[this.Const.Sound.ActorEvent.Death] = 1.7;
		this.m.SoundVolume[this.Const.Sound.ActorEvent.DamageReceived] = 1.7;
		this.m.SoundVolume[this.Const.Sound.ActorEvent.Idle] = 4;
		this.m.SoundVolume[this.Const.Sound.ActorEvent.Move] = 2;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/percht_agent");
		this.m.AIAgent.setActor(this);
	}

	function onDeath( _killer, _skill, _tile, _fatalityType )
	{
		local flip = this.Math.rand(1, 100) < 50;

		if (_tile != null)
		{
			this.m.IsCorpseFlipped = flip;
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

				if (appearance.HelmetCorpse != "")
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

				local decap = this.Tactical.spawnHeadEffect(this.getTile(), layers, this.createVec(-50, 30), 180.0, "bust_percht_head_02_dead_bloodpool");
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
				if (appearance.CorpseArmor != "")
				{
					decal = _tile.spawnDetail(appearance.CorpseArmor + "_guts", this.Const.Tactical.DetailFlag.Corpse, flip);
				}
				else
				{
					decal = _tile.spawnDetail("bust_percht_dead_guts", this.Const.Tactical.DetailFlag.Corpse, flip);
				}

				decal.Scale = 0.9;
			}
			else if (_skill && _skill.getProjectileType() == this.Const.ProjectileType.Arrow)
			{
				if (appearance.CorpseArmor != "")
				{
					decal = _tile.spawnDetail(appearance.CorpseArmor + "_arrows", this.Const.Tactical.DetailFlag.Corpse, flip);
				}
				else
				{
					decal = _tile.spawnDetail("bust_percht_body_02_dead_arrows", this.Const.Tactical.DetailFlag.Corpse, flip);
				}

				decal.Scale = 0.9;
			}
			else if (_skill && _skill.getProjectileType() == this.Const.ProjectileType.Javelin)
			{
				if (appearance.CorpseArmor != "")
				{
					decal = _tile.spawnDetail(appearance.CorpseArmor + "_javelin", this.Const.Tactical.DetailFlag.Corpse, flip);
				}
				else
				{
					decal = _tile.spawnDetail("bust_percht_body_02_dead_javelin", this.Const.Tactical.DetailFlag.Corpse, flip);
				}

				decal.Scale = 0.9;
			}

			this.spawnTerrainDropdownEffect(_tile);
		}

		local deathLoot = this.getItems().getDroppableLoot(_killer);
		local tileLoot = this.getLootForTile(_killer, deathLoot);
		this.dropLoot(_tile, tileLoot, !flip);
		local corpse = this.generateCorpse(_tile, _fatalityType, _killer);

		if (_tile == null)
		{
			this.Tactical.Entities.addUnplacedCorpse(corpse);
		}
		else
		{
			_tile.Properties.set("Corpse", corpse);
			this.Tactical.Entities.addCorpse(_tile);
		}

		this.actor.onDeath(_killer, _skill, _tile, _fatalityType);
	}


	function getLootForTile( _killer, _loot )
	{
		if (_killer == null || _killer.getFaction() == this.Const.Faction.Player || _killer.getFaction() == this.Const.Faction.PlayerAnimals)
		{
			local n = 1 + (!this.Tactical.State.isScenarioMode() && this.Math.rand(1, 100) <= this.World.Assets.getExtraLootChance() ? 1 : 0);

			for( local i = 0; i < n; i = ++i )
			{
				local r = this.Math.rand(1, 100);
				local loot;

				if (r <= 40)
				{
					loot = this.new("scripts/items/misc/jcc_krampus_coal_item");
				}
				else if (r <= 80)
				{
					loot = this.new("scripts/items/misc/jcc_krampus_scalp_item");
				}
				else
				{
					loot = this.new("scripts/items/misc/jcc_krampus_tongue_item");
				}

				_loot.push(loot);
			}

			if (this.Math.rand(1, 100) <= 20)
			{
				local loot = this.new("scripts/items/loot/jcc_krampus_bell_item");
				_loot.push(loot);
			}
		}

		return this.actor.getLootForTile(_killer, _loot);
	}


	function generateCorpse( _tile, _fatalityType, _killer )
	{
		local corpse = clone this.Const.Corpse;
		corpse.CorpseName = "A Percht";
		corpse.IsResurrectable = false;
		corpse.IsConsumable = true;
		corpse.Items = this.getItems().prepareItemsForCorpse(_killer);
		corpse.IsHeadAttached = _fatalityType != this.Const.FatalityType.Decapitated;

		if (_tile != null)
		{
			corpse.Tile = _tile;
		}

		return corpse;
	}

	function onInit()
	{
		this.actor.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.JccPercht);

		if (!this.Tactical.State.isScenarioMode() && this.World.getTime().Days >= 70)
		{
			b.IsSpecializedInThrowing = true;

			if (this.World.getTime().Days >= 150)
			{
				b.RangedSkill += 5;
				b.DamageTotalMult += 0.1;
			}
		}


		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.m.ActionPointCosts = this.Const.DefaultMovementAPCost;
		this.m.FatigueCosts = this.Const.DefaultMovementFatigueCost;
		//this.m.Items.getAppearance().Body = "bust_orc_01_body";
		this.addSprite("socket").setBrush("bust_base_beasts");
		local body_variant = this.Math.rand(1, 2);
		local head_variant = this.Math.rand(1, 3);
		local body = this.addSprite("body");
		body.setBrush("bust_percht_body_0"+body_variant);
		body.varySaturation(0.05);
		body.varyColor(0.07, 0.07, 0.07);
		local injury_body = this.addSprite("injury_body");
		injury_body.Visible = false;
		injury_body.setBrush("bust_percht_body_0"+body_variant+"_injured");
		this.addSprite("armor");
		local head = this.addSprite("head");
		head.setBrush("bust_percht_head_0"+head_variant);
		head.Saturation = body.Saturation;
		head.Color = body.Color;
		local injury = this.addSprite("injury");
		injury.Visible = false;
		injury.setBrush("bust_percht_head_0"+head_variant+"_injured");
		this.addSprite("helmet");
		this.addDefaultStatusSprites();
		this.getSprite("status_rooted").Scale = 0.55;
		this.m.Skills.add(this.new("scripts/skills/special/double_grip"));
		this.m.Skills.add(this.new("scripts/skills/actives/hand_to_hand"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_pathfinder"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_steel_brow"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_berserk"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
		this.m.Skills.add(this.new("scripts/skills/actives/rotation"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_flow"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_duelist"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_hold_out"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_captain"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_coup_de_grace"));
		this.m.Skills.add(this.new("scripts/skills/effects/captain_effect"));
		b.IsSpecializedInSwords = true;
		b.IsSpecializedInAxes = true;
		b.IsSpecializedInMaces = true;
		b.IsSpecializedInFlails = true;
		b.IsSpecializedInPolearms = true;
		b.IsSpecializedInHammers = true;
		b.IsSpecializedInSpears = true;
		b.IsSpecializedInCleavers = true;
		b.IsSpecializedInDaggers = true;
		b.IsAffectedByNight = false;

		//b.IsSpecializedInBows = true;
		

		//this.m.Skills.add(this.new("scripts/skills/actives/krampus_charge"));		
		this.m.Skills.add(this.new("scripts/skills/actives/krampus_charge_alt"));
		//this.m.Skills.add(this.new("scripts/skills/actives/charge"));
		this.setAlwaysApplySpriteOffset(true);
		this.setSpriteOffset("arms_icon", ::createVec(-7, 0))
		this.m.spriteOffset = -7;

		if (this.Const.DLC.Unhold)
		{
			this.m.Skills.add(this.new("scripts/skills/actives/wake_ally_skill"));
		}

	}

	function onFinish()
	{
		this.actor.onFinish();
	}

	function assignRandomEquipment()
	{
		local r;
		local weapon;
		local rng = 45;


		if (this.Math.rand(1, 100) <= 75)
		{
			if (this.World.getTime().Days >= 35)
			{
				rng=65;
			}
			if (this.Math.rand(1, 100) <= rng)
			{
				this.m.Items.addToBag(this.new("scripts/items/weapons/greenskins/orc_javelin"));
			}
			if (this.World.getTime().Days >= 60)
			{
						local r = this.Math.rand(1, 2);
						if (r == 1)
						{
							weapon = this.new("scripts/items/weapons/percht_flail");
						}
						else if (r == 2)
						{
							weapon = this.new("scripts/items/weapons/percht_spetum");
							this.setSpriteOffset("arms_icon", ::createVec(0, 0))
							this.m.spriteOffset = -0;
							//this.m.Skills.removeByID("actives.krampus_charge_alt");
						}
			}else{
				if (this.Math.rand(1, 100) <= 70)
					{
						local r = this.Math.rand(1, 2);

						if (r == 1)
						{
							weapon = this.new("scripts/items/weapons/percht_flail");
						}
						else if (r == 2)
						{
							weapon = this.new("scripts/items/weapons/percht_spetum");
							this.setSpriteOffset("arms_icon", ::createVec(0, 0))
							this.m.spriteOffset = -0;
							//this.m.Skills.removeByID("actives.krampus_charge_alt");
						}
					}
					else
					{
						local r = this.Math.rand(1, 2);

						if (r == 1)
						{
							weapon = this.new("scripts/items/weapons/greenskins/orc_wooden_club");
						}
						else if (r == 2)
						{
							weapon = this.new("scripts/items/weapons/greenskins/orc_metal_club");
						}
					}
			}
			

			if (weapon == null)
			{
				weapon = this.new("scripts/items/weapons/greenskins/orc_wooden_club");
			}

			if (this.m.Items.hasEmptySlot(this.Const.ItemSlot.Mainhand))
			{
				this.m.Items.equip(weapon);
			}
			else
			{
				this.m.Items.addToBag(weapon);
			}
		}
		else
		{
			this.m.Items.equip(this.new("scripts/items/weapons/percht_bow"));
			this.m.Items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));
			
			this.m.AIAgent = this.new("scripts/ai/tactical/agents/percht_ranged_agent");
			this.m.AIAgent.setActor(this);
			local b = this.m.BaseProperties;
			b.setValues(this.Const.Tactical.Actor.JccPercht);
			b.RangedSkill += 5;
			

			local r = this.Math.rand(1, 2);

			if (r == 1)
			{
				this.m.Items.addToBag(this.new("scripts/items/weapons/greenskins/orc_wooden_club"));

			}
			else if (r == 2)
			{
				this.m.Items.addToBag(this.new("scripts/items/weapons/greenskins/orc_metal_club"));

			}
		}



	}

	function generateName()
	{
		this.m.Name = this.Const.Strings.JccPerchtNames[this.Math.rand(0, this.Const.Strings.JccPerchtNames.len() - 1)] + " " +this.Const.Strings.JccPerchtTitles[this.Math.rand(0, this.Const.Strings.JccPerchtTitles.len() - 1)] ;
	}

	function makeMiniboss()
	{
		if (!this.actor.makeMiniboss())
		{
			return false;
		}

		this.getSprite("miniboss").setBrush("bust_miniboss");

		this.m.Items.unequip(this.m.Items.getItemAtSlot(this.Const.ItemSlot.Mainhand));

		local r = this.Math.rand(1, 4);

		this.setSpriteOffset("arms_icon", ::createVec(-7, 0))
		this.m.spriteOffset = -7;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/percht_agent");
		this.m.AIAgent.setActor(this);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/named/named_three_headed_flail"));

		}else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/named/named_flail"));
		}else if (r == 3)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/named/named_javelin"));
			this.m.Items.addToBag(this.new("scripts/items/weapons/percht_flail"));
		}else
		{
			this.m.Items.equip(this.new("scripts/items/weapons/named/named_throwing_axe"));
			this.m.Items.addToBag(this.new("scripts/items/weapons/percht_flail"));

		}

		this.m.Skills.add(this.new("scripts/skills/perks/perk_head_hunter"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fast_adaption"));
		this.m.Skills.add(this.new("scripts/skills/actives/krampus_charge_alt"));

		return true;
	}function onFactionChanged()
    {
        this.actor.onFactionChanged();
        local flip = this.isAlliedWithPlayer();
        this.getSprite("body").setHorizontalFlipping(flip);
        this.getSprite("injury").setHorizontalFlipping(flip);
        this.getSprite("injury_body").setHorizontalFlipping(flip);
        this.getSprite("armor").setHorizontalFlipping(flip);
        this.getSprite("head").setHorizontalFlipping(flip);
        this.getSprite("helmet").setHorizontalFlipping(flip);

        if(flip){
        this.setSpriteOffset("arms_icon", ::createVec(this.m.spriteOffset*-1, 0)); }
    }

});

