this.jcc_giant_scorpion <- this.inherit("scripts/entity/tactical/actor", {
	m = {
		Tail = null,		
		Size = 1.0,
		DistortTargetA = null,
		DistortTargetPrevA = this.createVec(0, 0),
		DistortTargetB = null,
		DistortTargetPrevB = this.createVec(0, 0),
		DistortTargetC = null,
		DistortTargetPrevC = this.createVec(0, 0),
		DistortAnimationStartTimeA = 0,
		IsFlipping = false
	},
	function getIdealRange()
	{
		return 2;
	}

	function getTail()
	{
		return this.m.Tail;
	}

	function create()
	{
		this.m.Type = this.Const.EntityType.JccGiantScorp;
		this.m.BloodType = this.Const.BloodType.Green;
		this.m.XP = this.Const.Tactical.Actor.JccGiantScorp.XP;
		this.m.BloodSplatterOffset = this.createVec(0, 0);
		this.m.DecapitateSplatterOffset = this.createVec(-30, -15);
		this.m.DecapitateBloodAmount = 2.0;
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
		//this.getFlags().add("body_immune_to_acid");
		//this.getFlags().add("head_immune_to_acid");
		//this.getFlags().add("lindwurm");
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/jcc_giant_scorp_agent");
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
	function onRender()
	{
		this.actor.onRender();

		if (this.m.DistortTargetA == null)
		{
			this.m.DistortTargetA = this.m.IsFlipping ? this.createVec(0, 1.0 * this.m.Size) : this.createVec(0, -1.0 * this.m.Size);
			this.m.DistortTargetB = !this.m.IsFlipping ? this.createVec(-0.5 * this.m.Size, 0) : this.createVec(0.5 * this.m.Size, 0);
			this.m.DistortTargetC = !this.m.IsFlipping ? this.createVec(0.5 * this.m.Size, 0) : this.createVec(-0.5 * this.m.Size, 0);
			this.m.DistortAnimationStartTimeA = this.Time.getVirtualTimeF() - this.Math.rand(10, 100) * 0.01;
		}

		this.moveSpriteOffset("legs_back", this.m.DistortTargetPrevB, this.m.DistortTargetB, 1.0, this.m.DistortAnimationStartTimeA);
		this.moveSpriteOffset("legs_front", this.m.DistortTargetPrevC, this.m.DistortTargetC, 1.0, this.m.DistortAnimationStartTimeA);
		this.moveSpriteOffset("body", this.m.DistortTargetPrevA, this.m.DistortTargetA, 1.0, this.m.DistortAnimationStartTimeA);
		this.moveSpriteOffset("injury", this.m.DistortTargetPrevA, this.m.DistortTargetA, 1.0, this.m.DistortAnimationStartTimeA);

		if (this.moveSpriteOffset("head", this.m.DistortTargetPrevA, this.m.DistortTargetA, 1.0, this.m.DistortAnimationStartTimeA))
		{
			this.m.DistortAnimationStartTimeA = this.Time.getVirtualTimeF();
			this.m.DistortTargetPrevA = this.m.DistortTargetA;
			this.m.DistortTargetA = this.m.IsFlipping ? this.createVec(0, 1.0 * this.m.Size) : this.createVec(0, -1.0 * this.m.Size);
			this.m.DistortTargetPrevB = this.m.DistortTargetB;
			this.m.DistortTargetB = !this.m.IsFlipping ? this.createVec(-0.5 * this.m.Size, 0) : this.createVec(0.5 * this.m.Size, 0);
			this.m.DistortTargetPrevC = this.m.DistortTargetC;
			this.m.DistortTargetC = !this.m.IsFlipping ? this.createVec(0.5 * this.m.Size, 0) : this.createVec(-0.5 * this.m.Size, 0);
			this.m.IsFlipping = !this.m.IsFlipping;
		}
	}
	function onDeath( _killer, _skill, _tile, _fatalityType )
	{
		local flip = this.Math.rand(0, 100) < 50;

		if (_tile != null)
		{
			local decal;
			this.m.IsCorpseFlipped = flip;
			local body = this.getSprite("body");
			local head = this.getSprite("head");
			decal = _tile.spawnDetail("bust_lindwurm_body_01_dead", this.Const.Tactical.DetailFlag.Corpse, flip);
			decal.Color = body.Color;
			decal.Saturation = body.Saturation;
			decal.Scale = 0.95;

			if (_fatalityType != this.Const.FatalityType.Decapitated)
			{
				decal = _tile.spawnDetail("bust_lindwurm_head_01_dead", this.Const.Tactical.DetailFlag.Corpse, flip);
				decal.Color = head.Color;
				decal.Saturation = head.Saturation;
				decal.Scale = 0.95;
			}
			else if (_fatalityType == this.Const.FatalityType.Decapitated)
			{
				local layers = [
					head.getBrush().Name + "_dead"
				];
				local decap = this.Tactical.spawnHeadEffect(this.getTile(), layers, this.createVec(0, 0), 0.0, "bust_lindwurm_head_01_bloodpool");
				decap[0].Color = head.Color;
				decap[0].Saturation = head.Saturation;
				decap[0].Scale = 0.95;
			}

			if (_skill && _skill.getProjectileType() == this.Const.ProjectileType.Arrow)
			{
				decal = _tile.spawnDetail("bust_lindwurm_body_01_dead_arrows", this.Const.Tactical.DetailFlag.Corpse, flip);
				decal.Scale = 0.95;
			}
			else if (_skill && _skill.getProjectileType() == this.Const.ProjectileType.Javelin)
			{
				decal = _tile.spawnDetail("bust_lindwurm_body_01_dead_javelin", this.Const.Tactical.DetailFlag.Corpse, flip);
				decal.Scale = 0.95;
			}

			this.spawnTerrainDropdownEffect(_tile);
			this.spawnFlies(_tile);
		}

		local tileLoot = this.getLootForTile(_killer, []);
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

	function assignRandomEquipment()
	{
			this.m.Items.equip(this.new("scripts/items/shields/jcc_giant_scorp_shield"));

	}

	function getLootForTile( _killer, _loot )
	{
		if (_killer == null || _killer.getFaction() == this.Const.Faction.Player || _killer.getFaction() == this.Const.Faction.PlayerAnimals)
		{
			local n = 1 + (!this.Tactical.State.isScenarioMode() && this.Math.rand(1, 100) <= this.World.Assets.getExtraLootChance() ? 1 : 0);

			for( local i = 0; i < n; i = ++i )
			{
				if (this.Const.DLC.Unhold)
				{
					local r = this.Math.rand(1, 100);
					local loot;

					if (r <= 35)
					{
						loot = this.new("scripts/items/misc/lindwurm_blood_item");
					}
					else if (r <= 70)
					{
						loot = this.new("scripts/items/misc/lindwurm_scales_item");
					}
					else
					{
						loot = this.new("scripts/items/misc/lindwurm_bones_item");
					}

					_loot.push(loot);
				}
				else
				{
					_loot.push(this.new("scripts/items/tools/acid_flask_item"));
				}
			}

			if (!this.Const.DLC.Unhold || this.Math.rand(1, 100) <= 33)
			{
				_loot.push(this.new("scripts/items/loot/lindwurm_hoard_item"));
			}
		}

		return this.actor.getLootForTile(_killer, _loot);
	}

	function generateCorpse( _tile, _fatalityType, _killer )
	{
		local corpse = clone this.Const.Corpse;
		corpse.CorpseName = "A Lindwurm";
		corpse.Items = this.getItems();
		corpse.IsHeadAttached = _fatalityType != this.Const.FatalityType.Decapitated;

		if (_tile != null)
		{
			corpse.Tile = _tile;
		}

		return corpse;
	}

	function kill( _killer = null, _skill = null, _fatalityType = this.Const.FatalityType.None, _silent = false )
	{
		this.m.IsDying = true;

		if (this.m.Tail != null && !this.m.Tail.isNull() && this.m.Tail.isAlive())
		{
			this.m.Tail.kill(_killer, _skill, _fatalityType, _silent);
			this.m.Tail = null;
		}

		this.actor.kill(_killer, _skill, _fatalityType, _silent);
	}

	function updateOverlay()
	{
		this.actor.updateOverlay();

		if (this.m.Tail != null && !this.m.Tail.isNull() && this.m.Tail.isAlive())
		{
			this.m.Tail.updateOverlay();
		}
	}

	function setFaction( _f )
	{
		this.actor.setFaction(_f);

		if (this.m.Tail != null && !this.m.Tail.isNull() && this.m.Tail.isAlive())
		{
			this.m.Tail.setFaction(_f);
		}
	}

	function checkMorale( _change, _difficulty, _type = this.Const.MoraleCheckType.Default, _showIconBeforeMoraleIcon = "", _noNewLine = false )
	{
		this.actor.checkMorale(_change, _difficulty, _type, _showIconBeforeMoraleIcon, _noNewLine);

		if (this.m.Tail != null && !this.m.Tail.isNull() && this.m.Tail.isAlive())
		{
			this.m.Tail.setMoraleState(this.getMoraleState());
		}
	}

	function retreat()
	{
		if (this.m.Tail != null && !this.m.Tail.isNull() && this.m.Tail.isAlive())
		{
			this.m.Tail.m.IsAlive = false;
			this.m.Tail.die();
			this.m.Tail = null;
		}

		this.actor.retreat();
	}

	function onInit()
	{
		this.actor.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.JccGiantScorp);
		this.setRenderCallbackEnabled(true);
		b.IsAffectedByNight = false;
		b.IsImmuneToKnockBackAndGrab = true;
		b.IsImmuneToStun = true;
		b.IsMovable = false;
		b.IsImmuneToRoot = true;
		b.IsImmuneToDisarm = true;


		if (!this.Tactical.State.isScenarioMode() && this.World.getTime().Days >= 170)
		{
			b.MeleeSkill += 10;
			b.DamageTotalMult += 0.1;
		}

		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.m.ActionPointCosts = this.Const.DefaultMovementAPCost;
		this.m.FatigueCosts = this.Const.DefaultMovementFatigueCost;
		this.addSprite("socket").setBrush("bust_base_beasts");
		local legs_back = this.addSprite("legs_back");
		legs_back.setBrush("bust_giant_scorp_legs_back");
		local body = this.addSprite("body");
		body.setBrush("bust_giant_scorp_body");

		if (this.Math.rand(0, 100) < 90)
		{
			body.varySaturation(0.2);
		}

		if (this.Math.rand(0, 100) < 90)
		{
			body.varyColor(0.08, 0.08, 0.08);
		}

		local legs_front = this.addSprite("legs_front");
		legs_front.setBrush("bust_giant_scorp_legs_front");
		legs_front.Color = body.Color;
		legs_front.Saturation = body.Saturation;
		legs_back.Color = body.Color;
		legs_back.Saturation = body.Saturation;
		local head = this.addSprite("head");
		head.setBrush("bust_giant_scorp_head_0" + this.Math.rand(1, 1));
		head.Color = body.Color;
		head.Saturation = body.Saturation;
		local injury = this.addSprite("injury");
		injury.Visible = false;
		injury.setBrush("bust_giant_scorp_injury");
		this.addDefaultStatusSprites();
		this.getSprite("status_rooted").Scale = 0.63;
		this.setSpriteOffset("status_rooted", this.createVec(0, 15));
		this.setSpriteOffset("status_stunned", this.createVec(-5, 30));
		this.setSpriteOffset("arrow", this.createVec(-5, 30));
		this.setAlwaysApplySpriteOffset(true);
		this.setSpriteOffset("shield_icon", ::createVec(-160, 0));

		this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_captain"));
		this.m.Skills.add(this.new("scripts/skills/effects/captain_effect"));

		this.m.Skills.add(this.new("scripts/skills/racial/spider_racial"));
		this.m.Skills.add(this.new("scripts/skills/actives/knock_back"));
		this.m.Skills.add(this.new("scripts/skills/actives/jcc_scorp_cleave_skill"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_pathfinder"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_hold_out"));
		//this.m.Skills.add(this.new("scripts/skills/racial/lindwurm_racial"));
		//this.m.Skills.add(this.new("scripts/skills/perks/perk_reach_advantage"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_underdog"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));

		if (this.m.Tail == null)
		{
			local myTile = this.getTile();
			local spawnTile;

			if (myTile.hasNextTile(this.Const.Direction.NE) && myTile.getNextTile(this.Const.Direction.NE).IsEmpty)
			{
				spawnTile = myTile.getNextTile(this.Const.Direction.NE);
			}
			else if (myTile.hasNextTile(this.Const.Direction.SE) && myTile.getNextTile(this.Const.Direction.SE).IsEmpty)
			{
				spawnTile = myTile.getNextTile(this.Const.Direction.SE);
			}
			else
			{
				for( local i = 0; i < 6; i = ++i )
				{
					if (!myTile.hasNextTile(i))
					{
					}
					else if (myTile.getNextTile(i).IsEmpty)
					{
						spawnTile = myTile.getNextTile(i);
						break;
					}
				}
			}

			if (spawnTile != null)
			{
				this.m.Tail = this.WeakTableRef(this.Tactical.spawnEntity("scripts/entity/tactical/enemies/jcc_giant_scorpion_tail", spawnTile.Coords.X, spawnTile.Coords.Y, this.getID()));
				this.m.Tail.m.Body = this.WeakTableRef(this);
				this.m.Tail.getSprite("body").Color = body.Color;
				this.m.Tail.getSprite("body").Saturation = body.Saturation;
			}
		}
	}

	function onMovementFinish( _tile )
	{
		this.actor.onMovementFinish(_tile);

		if (this.m.Tail != null && !this.m.Tail.isNull() && this.m.Tail.isAlive())
		{
			this.Tactical.TurnSequenceBar.moveEntityToFront(this.m.Tail.getID());
		}
	}

});

