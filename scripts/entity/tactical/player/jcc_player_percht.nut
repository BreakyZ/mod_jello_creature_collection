this.jcc_player_percht <- this.inherit("scripts/entity/tactical/player", {
	m = {
		spriteOffset=7,		
		Bodies = ["bust_percht_body_0"],
		Faces = ["bust_percht_head_0"],
		Body = 0,
		Head = 0
	}

	function create(){

		this.player.create();

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
		this.m.Sound[this.Const.Sound.ActorEvent.NoDamageReceived] = [
			"sounds/enemies/percht_hurt01.wav",
			"sounds/enemies/percht_hurt02.wav",
			"sounds/enemies/percht_hurt03.wav",
			"sounds/enemies/percht_hurt04.wav",
			"sounds/enemies/percht_hurt05.wav",
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
		this.m.Sound[this.Const.Sound.ActorEvent.Fatigue]=this.m.Sound[this.Const.Sound.ActorEvent.Move];
		this.m.SoundPitch = 1.0;
		this.m.SoundVolume[this.Const.Sound.ActorEvent.Death] = 1.7;
		this.m.SoundVolume[this.Const.Sound.ActorEvent.DamageReceived] = 1.7;
		this.m.SoundVolume[this.Const.Sound.ActorEvent.NoDamageReceived] = 1.0;
		this.m.SoundVolume[this.Const.Sound.ActorEvent.Idle] = 4;
		this.m.SoundVolume[this.Const.Sound.ActorEvent.Move] = 2;
		this.m.ConfidentMoraleBrush = "icon_confident_orcs";
		this.getFlags().remove("human");
		this.getFlags().add("jccPlayerPercht");
	}

	function onCombatFinished(){
		this.player.onCombatFinished();
		this.m.spriteOffset = 7;        
		this.setSpriteOffset("permanent_injury_1", this.createVec(9, -2));
		this.setSpriteOffset("permanent_injury_3", this.createVec(9, -5));
		this.setSpriteOffset("permanent_injury_2", this.createVec(9, -2));
		this.setSpriteOffset("permanent_injury_4", this.createVec(9, -2));		
		this.setSpriteOffset("arms_icon", ::createVec(this.m.spriteOffset, 0))
	}

	function onDeath( _killer, _skill, _tile, _fatalityType )
	{
		if (!this.Tactical.State.isScenarioMode() && _fatalityType != this.Const.FatalityType.Unconscious)
		{
			if (this.getLevel() >= 11 && this.World.Assets.isIronman())
			{
				this.updateAchievement("ToughFarewell", 1, 1);
			}
			else
			{
				this.updateAchievement("BloodyToll", 1, 1);
			}

			if (_killer != null && this.isKindOf(_killer, "player") && _killer.getSkills().hasSkill("effects.charmed"))
			{
				this.updateAchievement("NothingPersonal", 1, 1);
			}
		}

		local flip = this.Math.rand(0, 100) < 50;
		this.m.IsCorpseFlipped = flip;
		local isResurrectable = _fatalityType == this.Const.FatalityType.None || _fatalityType == this.Const.FatalityType.Disemboweled;
		local appearance = this.getItems().getAppearance();
		local sprite_body = this.getSprite("body");
		local sprite_head = this.getSprite("head");
		//local sprite_hair = this.getSprite("hair");
		//local sprite_beard = this.getSprite("beard");
		//local sprite_beard_top = this.getSprite("beard_top");
		//local tattoo_body = this.getSprite("tattoo_body");
		local tattoo_head = this.getSprite("tattoo_head");
		local sprite_surcoat = this.getSprite("surcoat");
		local sprite_accessory = this.getSprite("accessory");

		if (!this.isGuest())
		{
			local stub = this.Tactical.getCasualtyRoster().create("scripts/entity/tactical/player_corpse_stub");
			stub.setOriginalID(this.getID());
			stub.setName(this.getNameOnly());
			stub.setTitle(this.getTitle());
			stub.setCombatStats(this.m.CombatStats);
			stub.setLifetimeStats(this.m.LifetimeStats);
			stub.m.DaysWithCompany = this.getDaysWithCompany();
			stub.m.Level = this.getLevel();
			stub.m.DailyCost = this.getDailyCost();
			stub.addSprite("blood_1").setBrush(this.Const.BloodPoolDecals[this.Const.BloodType.Red][this.Math.rand(0, this.Const.BloodPoolDecals[this.Const.BloodType.Red].len() - 1)]);
			stub.addSprite("blood_2").setBrush(this.Const.BloodDecals[this.Const.BloodType.Red][this.Math.rand(0, this.Const.BloodDecals[this.Const.BloodType.Red].len() - 1)]);
			stub.setSpriteOffset("blood_1", this.createVec(0, -15));
			stub.setSpriteOffset("blood_2", this.createVec(0, -30));

			if (_fatalityType == this.Const.FatalityType.Devoured)
			{
				for( local i = 0; i != this.Const.CorpsePart.len(); i = ++i )
				{
					stub.addSprite("stuff_" + i).setBrush(this.Const.CorpsePart[i]);
				}
			}
			else
			{
				local decal = stub.addSprite("body");
				decal.setBrush(sprite_body.getBrush().Name + "_dead");
				decal.Color = sprite_head.Color;
				decal.Saturation = sprite_head.Saturation;

				/*if (tattoo_body.HasBrush)
				{
					decal = stub.addSprite("tattoo_body");
					decal.setBrush(tattoo_body.getBrush().Name + "_dead");
					decal.Color = tattoo_body.Color;
					decal.Saturation = tattoo_body.Saturation;
				}*/

				if (appearance.CorpseArmor != "")
				{
					decal = stub.addSprite("armor");
					decal.setBrush(appearance.CorpseArmor);
				}

				if (sprite_surcoat.HasBrush)
				{
					decal = stub.addSprite("surcoat");
					decal.setBrush("surcoat_" + (this.m.Surcoat < 10 ? "0" + this.m.Surcoat : this.m.Surcoat) + "_dead");
				}

				if (appearance.CorpseArmorUpgradeBack != "")
				{
					decal = stub.addSprite("upgrade_back");
					decal.setBrush(appearance.CorpseArmorUpgradeBack);
				}

				if (sprite_accessory.HasBrush)
				{
					decal = stub.addSprite("accessory");
					decal.setBrush(sprite_accessory.getBrush().Name + "_dead");
				}

				if (_fatalityType == this.Const.FatalityType.Disemboweled)
				{
					stub.addSprite("guts").setBrush("bust_body_guts_01");
				}
				else if (_skill && _skill.getProjectileType() == this.Const.ProjectileType.Arrow)
				{
					if (appearance.CorpseArmor != "")
					{
						stub.addSprite("arrows").setBrush(appearance.CorpseArmor + "_arrows");
					}
					else
					{
						stub.addSprite("arrows").setBrush(appearance.Corpse + "_arrows");
					}
				}
				else if (_skill && _skill.getProjectileType() == this.Const.ProjectileType.Javelin)
				{
					if (appearance.CorpseArmor != "")
					{
						stub.addSprite("arrows").setBrush(appearance.CorpseArmor + "_javelin");
					}
					else
					{
						stub.addSprite("arrows").setBrush(appearance.Corpse + "_javelin");
					}
				}

				if (_fatalityType != this.Const.FatalityType.Decapitated)
				{
					if (!appearance.HideCorpseHead)
					{
						decal = stub.addSprite("head");
						decal.setBrush(sprite_head.getBrush().Name + "_dead");
						decal.Color = sprite_head.Color;
						decal.Saturation = sprite_head.Saturation;

						if (tattoo_head.HasBrush)
						{
							decal = stub.addSprite("tattoo_head");
							decal.setBrush(this.getSprite("tattoo_head").getBrush().Name + "_dead");
							decal.Color = tattoo_head.Color;
							decal.Saturation = tattoo_head.Saturation;
						}
					}

					if (_fatalityType == this.Const.FatalityType.Smashed)
					{
						//stub.addSprite("smashed").setBrush("bust_head_smashed_01");
					}
					else if (appearance.HelmetCorpse != "")
					{
						decal = stub.addSprite("helmet");
						decal.setBrush(this.getItems().getAppearance().HelmetCorpse);
					}
				}

				if (appearance.CorpseArmorUpgradeFront != "")
				{
					decal = stub.addSprite("upgrade_front");
					decal.setBrush(appearance.CorpseArmorUpgradeFront);
				}
			}
		}

		//this.human.onDeath(_killer, _skill, _tile, _fatalityType);
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
		local tileLoot = this.actor.getLootForTile(_killer, deathLoot);
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

		if (_tile != null)
		{
			local corpse = _tile.Properties.get("Corpse");
			corpse.IsPlayer = true;
			corpse.Value = 10.0;
		}

		if (!this.m.IsGuest && !this.Tactical.State.isScenarioMode())
		{
			this.World.Assets.addScore(-5 * this.getLevel());
		}

		if (!this.m.IsGuest && !this.Tactical.State.isScenarioMode() && _fatalityType != this.Const.FatalityType.Unconscious && (_skill != null && _killer != null || _fatalityType == this.Const.FatalityType.Devoured || _fatalityType == this.Const.FatalityType.Kraken))
		{
			this.World.Statistics.addFallen(this.getObituaryInfo(_skill, _killer, _fatalityType));
		}
	}

	function generateCorpse( _tile, _fatalityType, _killer )
	{
		local corpse = clone this.Const.Corpse;
		corpse.Faction = this.getFaction();
		corpse.CorpseName = this.getName();
		corpse.IsResurrectable = false;
		corpse.IsConsumable = _fatalityType != this.Const.FatalityType.Unconscious;
		corpse.Items = this.getItems().prepareItemsForCorpse(_killer);
		corpse.IsHeadAttached = _fatalityType != this.Const.FatalityType.Decapitated;

		if (_tile != null)
		{
			corpse.Tile = _tile;
		}

		return corpse;
	}	

	function onOtherActorDeath( _killer, _victim, _skill )
	{
		if (!this.m.IsAlive || this.m.IsDying)
		{
			return;
		}

		if (!this.isGuest() && _victim.getFaction() == this.getFaction() && ("getBackground" in _victim) && _victim.getBackground().getID() != "background.jcc_percht")
		{
			return;
		}
		this.player.onOtherActorDeath( _killer, _victim, _skill );
	}

	function onInit(){
		this.player.onInit();
		this.m.Body = this.Math.rand(1,2);
		this.m.Head = this.Math.rand(1,3);
		//this.m.ActionPoints = 10;
		this.m.ActionPointCosts = this.Const.DefaultMovementAPCost;
		this.m.FatigueCosts = this.Const.DefaultMovementFatigueCost;
		local app = this.getItems().getAppearance();
		app.Quiver = this.Const.Items.Default.PlayerQuiver;
		//app.Body = "bust_orc_01_body";
		//app.Corpse = "bust_orc_01_body_dead";
		app.Body = "";
		app.Corpse = "";

		local body = this.getSprite("body");
		body.setBrush("bust_percht_body_0" + this.m.Body);	
		body.varySaturation(0.05);
		body.varyColor(0.07, 0.07, 0.07);

		local injury_body = this.getSprite("injury_body");
		injury_body.Visible = false;
		injury_body.setBrush("bust_percht_body_0" + this.m.Body + "_injured");

		local head = this.getSprite("head");
		head.setBrush("bust_percht_head_0" + this.m.Head);	
		head.Saturation = body.Saturation;
		head.Color = body.Color;

		local closed_eyes = this.getSprite("closed_eyes");
		closed_eyes.setBrush("");
		closed_eyes.Visible = false;

		local injury_head = this.getSprite("injury");
		injury_head.Visible = false;
		injury_head.setBrush("bust_percht_head_0" + this.m.Head + "_injured");


		this.setDiscovered(true);
		this.setSpriteOffset("permanent_injury_1", this.createVec(9, -2));
		this.setSpriteOffset("permanent_injury_3", this.createVec(9, -5));
		this.setSpriteOffset("permanent_injury_2", this.createVec(9, -2));
		this.setSpriteOffset("permanent_injury_4", this.createVec(9, -2));		
		this.setSpriteOffset("arms_icon", ::createVec(this.m.spriteOffset, 0))

	}

	function onFactionChanged()
    {
        this.actor.onFactionChanged();
        local flip = !this.isAlliedWithPlayer();
		this.getSprite("background").setHorizontalFlipping(flip);
		this.getSprite("quiver").setHorizontalFlipping(flip);
		this.getSprite("body").setHorizontalFlipping(!flip);
		//this.getSprite("tattoo_body").setHorizontalFlipping(flip);
		this.getSprite("injury_body").setHorizontalFlipping(!flip);
		//this.getSprite("armor").setHorizontalFlipping(flip);
		this.getSprite("surcoat").setHorizontalFlipping(flip);
		this.getSprite("armor_upgrade_back").setHorizontalFlipping(flip);
		this.getSprite("armor_upgrade_front").setHorizontalFlipping(flip);
		this.getSprite("shaft").setHorizontalFlipping(flip);
		this.getSprite("head").setHorizontalFlipping(!flip);
		//this.getSprite("closed_eyes").setHorizontalFlipping(flip);
		//this.getSprite("eye_rings").setHorizontalFlipping(flip);
		this.getSprite("tattoo_head").setHorizontalFlipping(flip);
		this.getSprite("injury").setHorizontalFlipping(!flip);
		//this.getSprite("beard").setHorizontalFlipping(flip);
		//this.getSprite("hair").setHorizontalFlipping(flip);
		//this.getSprite("helmet").setHorizontalFlipping(flip);
		//this.getSprite("helmet_damage").setHorizontalFlipping(flip);
		//this.getSprite("beard_top").setHorizontalFlipping(flip);
		this.getSprite("body_blood").setHorizontalFlipping(flip);
		this.getSprite("accessory").setHorizontalFlipping(flip);
		this.getSprite("accessory_special").setHorizontalFlipping(flip);
		//this.getSprite("dirt").setHorizontalFlipping(flip);
		this.getSprite("permanent_injury_1").setHorizontalFlipping(flip);
		this.getSprite("permanent_injury_2").setHorizontalFlipping(flip);
		this.getSprite("permanent_injury_3").setHorizontalFlipping(flip);
		this.getSprite("permanent_injury_4").setHorizontalFlipping(flip);
		this.getSprite("bandage_1").setHorizontalFlipping(flip);
		this.getSprite("bandage_2").setHorizontalFlipping(flip);
		this.getSprite("bandage_3").setHorizontalFlipping(flip);

        //if(flip){
        //this.setSpriteOffset("arms_icon", ::createVec(this.m.spriteOffset*-1, 0)); }
        this.setSpriteOffset("arms_icon", ::createVec(this.m.spriteOffset, 0));		
        this.setSpriteOffset("permanent_injury_1", this.createVec(9, -2));
		this.setSpriteOffset("permanent_injury_3", this.createVec(9, -5));
		this.setSpriteOffset("permanent_injury_2", this.createVec(9, -2));
		this.setSpriteOffset("permanent_injury_4", this.createVec(9, -2));		
		this.setAlwaysApplySpriteOffset(true);
    }

    function onSerialize( _out )
	{
		this.player.onSerialize( _out );	
		_out.writeU8(this.m.Body);
		_out.writeU8(this.m.Head);
		_out.writeU8(this.m.spriteOffset);
	}

	function onDeserialize( _in )
	{
		this.player.onDeserialize( _in );
		this.m.Body = _in.readU8();
		this.m.Head = _in.readU8();
		this.m.spriteOffset = _in.readU8();
	}

});