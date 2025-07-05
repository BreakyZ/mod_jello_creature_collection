this.jcc_djinn <- this.inherit("scripts/entity/tactical/actor", {
	m = { spriteOffset = 0 },
	function create()
	{
		this.m.Type = this.Const.EntityType.JccDjinn;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.JccDjinn.XP;
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
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/jcc_djinn_agent");
		this.m.AIAgent.setActor(this);
	}

	function onDeath( _killer, _skill, _tile, _fatalityType )
	{

		local p = {
			Type = "fire",
			Tooltip = "Fire rages here, melting armor and flesh alike",
			IsPositive = false,
			IsAppliedAtRoundStart = false,
			IsAppliedAtTurnEnd = true,
			IsAppliedOnMovement = false,
			IsAppliedOnEnter = false,
			IsByPlayer = false,
			Timeout = this.Time.getRound() + 2,
			Callback = this.Const.Tactical.Common.onApplyFire,
			function Applicable( _a )
			{
				return true;
			}

		};

		if (_tile.Properties.Effect != null && _tile.Properties.Effect.Type == "fire")
		{
			_tile.Properties.Effect.Timeout = this.Time.getRound() + 3;
		}
		else
		{
	if (_tile.Properties.Effect != null)
					{
						this.Tactical.Entities.removeTileEffect(_tile);
					}

					_tile.Properties.Effect = clone p;
					local particles = [];

					for( local i = 0; i < this.Const.Tactical.FireParticles.len(); i = ++i )
					{
						particles.push(this.Tactical.spawnParticleEffect(true, this.Const.Tactical.FireParticles[i].Brushes, _tile, this.Const.Tactical.FireParticles[i].Delay, this.Const.Tactical.FireParticles[i].Quantity, this.Const.Tactical.FireParticles[i].LifeTimeQuantity, this.Const.Tactical.FireParticles[i].SpawnRate, this.Const.Tactical.FireParticles[i].Stages));
					}

					this.Tactical.Entities.addTileEffect(_tile, _tile.Properties.Effect, particles);
					_tile.clear(this.Const.Tactical.DetailFlag.Scorchmark);
					_tile.spawnDetail("impact_decal", this.Const.Tactical.DetailFlag.Scorchmark, false, true);
		}


		this.m.BloodType = this.Const.BloodType.Ash;
		local flip = this.Math.rand(0, 100) < 50;
		this.m.IsCorpseFlipped = flip;

		if (_tile != null)
		{
			local decal = _tile.spawnDetail("bust_jcc_djinn_dead", this.Const.Tactical.DetailFlag.Corpse, flip, false);
			decal.Scale = 0.9;
			decal.setBrightness(0.9);
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
		if ((_killer == null || _killer.getFaction() == this.Const.Faction.Player || _killer.getFaction() == this.Const.Faction.PlayerAnimals) && this.Math.rand(0, 1) == 1)
		{
			_loot.push(this.new("scripts/items/misc/vampire_dust_item"));
		}

		return this.actor.getLootForTile(_killer, _loot);
	}


	function generateCorpse( _tile, _fatalityType, _killer )
	{
		local corpse = clone this.Const.Corpse;
		corpse.CorpseName = "A Djinni";
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
		b.setValues(this.Const.Tactical.Actor.JccDjinn);

		/*if (!this.Tactical.State.isScenarioMode() && this.World.getTime().Days >= 70)
		{
			b.IsSpecializedInThrowing = true;

			if (this.World.getTime().Days >= 150)
			{
				b.RangedSkill += 5;
			}
		}*/


		if (this.World.getTime().Days >= 150)
		{
			b.MeleeSkill += 5;
		}



		b.IsImmuneToFire = true;
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
		body.setBrush("bust_jcc_djinn_body");
		body.varySaturation(0.05);
		body.varyColor(0.07, 0.07, 0.07);
		local injury_body = this.addSprite("injury_body");
		injury_body.Visible = false;
		injury_body.setBrush("bust_jcc_djinn_body_injury");
		local armRing = this.addSprite("ring");
		armRing.setBrush("bust_jcc_djinn_arm_ring");
		this.addSprite("armor");
		this.addSprite("armor_upgrade_front");
		this.addSprite("armor_upgrade_back");
		local head = this.addSprite("head");
		head.setBrush("bust_jcc_djinn_head_0"+head_variant);
		head.Saturation = body.Saturation;
		head.Color = body.Color;
		local injury = this.addSprite("injury");
		injury.Visible = false;
		injury.setBrush("bust_jcc_djinn_head_0"+head_variant+"_injury");
		this.addSprite("helmet");		
		this.addSprite("helmet_damage");
		this.addDefaultStatusSprites();
		this.getSprite("status_rooted").Scale = 0.55;

		this.m.Skills.add(this.new("scripts/skills/special/double_grip"));
		this.m.Skills.add(this.new("scripts/skills/actives/hand_to_hand"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
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
		this.m.Skills.add(this.new("scripts/skills/racials/jcc_djinn_fire_racial"));
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
		

		this.m.Skills.add(this.new("scripts/skills/actives/krampus_charge"));		
		//this.m.Skills.add(this.new("scripts/skills/actives/krampus_charge_alt"));
		//this.m.Skills.add(this.new("scripts/skills/actives/charge"));
		
		/*
		this.setAlwaysApplySpriteOffset(true);
		this.setSpriteOffset("arms_icon", ::createVec(-7, 0))
		this.m.spriteOffset = -7;*/

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
		local armor;
		local weapon;
		local upgrade;

		r = this.Math.rand(1, 100);

		if(r<=50){

			armor=(this.new("scripts/items/armor/jcc_djinn_heavy_armor"));

		}else if(r<=95){

			armor=(this.new("scripts/items/armor/jcc_djinn_medium_armor"));

		}else{

			armor=(this.new("scripts/items/armor/jcc_djinn_light_armor"));
		}

		if(armor!=null)
		{

			if( this.Math.rand(1, 100)<50){
				upgrade = this.new("scripts/items/armor_upgrades/jcc_djinn_upgrade");
				armor.setUpgrade(upgrade);
			}

			if (!this.Tactical.State.isScenarioMode() && this.World.getTime().Days >= 70)
			{
				if(upgrade==null && this.Math.rand(1, 100)<70){
					upgrade = this.new("scripts/items/armor_upgrades/jcc_djinn_upgrade");
					armor.setUpgrade(upgrade);
				}

				if (this.World.getTime().Days >= 150)
				{
					b.MeleeSkill += 5;
				}
			}

			this.m.Items.equip(armor);	
		}
	
		local helmetChance = 0;

		if (this.World.getTime().Days != null)
		{
			helmetChance = this.World.getTime().Days;

			if (this.World.getTime().Days < 30)
			{
				helmetChance = 0;
			}
		}

		
		if(this.Math.rand(1, 100)<=helmetChance){

			r = this.Math.rand(1, 100);

			if(r<=30){

				this.m.Items.equip(this.new("scripts/items/helmets/jcc_djinn_heavy_helmet"));

			}else if(r<=60){

				this.m.Items.equip(this.new("scripts/items/helmets/jcc_djinn_medium_helmet"));

			}else if(r<=90){

				this.m.Items.equip(this.new("scripts/items/helmets/jcc_djinn_light_helmet"));

			}
		}
		

		if(this.Math.rand(1, 100)<40){
			if(this.Math.rand(1, 100)<50){
				this.m.Items.equip(this.new("scripts/items/weapons/jcc_djinn_hammer"));
			}else{
				this.m.Items.equip(this.new("scripts/items/weapons/jcc_djinn_scimitar"));
			}
			if(this.Math.rand(1, 100)<50){
				this.m.Items.equip(this.new("scripts/items/shields/greenskins/orc_heavy_shield"));
			}
		}
		else if(this.Math.rand(1, 100)<80){
			if(this.Math.rand(1, 100)<50){
				this.m.Items.equip(this.new("scripts/items/weapons/jcc_djinn_bigsword"));
			}else{
				this.m.Items.equip(this.new("scripts/items/weapons/jcc_djinn_polemace"));
			}
		}else{
			
			this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));
			this.m.Items.equip(this.new("scripts/items/weapons/jcc_djinn_scimitar_dual"));
			this.m.Skills.add(this.new("scripts/skills/racials/jcc_djinn_dual_racial"));

		}


	}

	function generateName()
	{
		this.m.Name = this.Const.Strings.JccDjinnNames[this.Math.rand(0, this.Const.Strings.JccDjinnNames.len() - 1)] + " " +this.Const.Strings.JccDjinnTitles[this.Math.rand(0, this.Const.Strings.JccDjinnTitles.len() - 1)] ;
	}

	function makeMiniboss()
	{
		if (!this.actor.makeMiniboss())
		{
			return false;
		}

		this.getSprite("miniboss").setBrush("bust_miniboss");

		if(this.m.Items.getItemAtSlot(this.Const.ItemSlot.Mainhand)!=null){
				this.m.Items.unequip(this.m.Items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
		}
		
		if(this.m.Items.getItemAtSlot(this.Const.ItemSlot.Offhand)!=null){
				this.m.Items.unequip(this.m.Items.getItemAtSlot(this.Const.ItemSlot.Offhand));
		}

		local r = this.Math.rand(1, 3);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/named/named_two_handed_scimitar"));

		}else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/named/named_shamshir"));
		}
		else{
			this.m.Items.equip(this.new("scripts/items/weapons/named/named_polemace"));
		}

		//this.m.Skills.add(this.new("scripts/skills/perks/perk_head_hunter"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_adrenalin"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));

		this.m.Skills.removeByID("racial.djinn_dual");



		this.m.AIAgent = this.new("scripts/ai/tactical/agents/jcc_djinn_champ_agent");
		this.m.AIAgent.setActor(this);


		return true;
	}


	function getIdealRange()
	{
		return 1;
	}
	/*
	function onFactionChanged()
    {
        this.actor.onFactionChanged();
        local flip = this.isAlliedWithPlayer();
        this.getSprite("body").setHorizontalFlipping(flip);
        this.getSprite("injury").setHorizontalFlipping(flip);
        this.getSprite("injury_body").setHorizontalFlipping(flip);
        this.getSprite("head").setHorizontalFlipping(flip);
        this.getSprite("armRing").setHorizontalFlipping(flip);

    }*/

});

