this.jcc_cytoplasm <- this.inherit("scripts/entity/tactical/actor", {
	m = 
	{
		Size = 1,
		Variant = 1,
		ScaleStartTime = 0,
		BackupFaction = 0,
		BackupWorldParty = null,
		IsShrinking = false,
		IsSpawningOnTile = false
	},
	function getSize()
	{
		return this.m.Size;
	}
	function create()
	{
		this.m.Type = this.Const.EntityType.JccCytoplasm;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.JccCytoplasm.XP;
		this.m.BloodSplatterOffset = this.createVec(0, 0);
		this.m.ConfidentMoraleBrush = "icon_confident_orcs";
		this.actor.create();
		this.m.Sound[this.Const.Sound.ActorEvent.DamageReceived] = [
			"sounds/enemies/cyto_hurt_01.wav",
			"sounds/enemies/cyto_hurt_02.wav",
			"sounds/enemies/cyto_hurt_03.wav",
			"sounds/enemies/cyto_hurt_04.wav"
		];
		this.m.Sound[this.Const.Sound.ActorEvent.Death] = [
			"sounds/enemies/cyto_death_01.wav",
			"sounds/enemies/cyto_death_02.wav",
			"sounds/enemies/cyto_death_03.wav",
			"sounds/enemies/cyto_death_04.wav"
		];
		this.m.Sound[this.Const.Sound.ActorEvent.Flee] = [
			"sounds/enemies/cyto_flee_01.wav",
			"sounds/enemies/cyto_flee_02.wav",
			"sounds/enemies/cyto_flee_03.wav",
			"sounds/enemies/cyto_flee_04.wav"
		];
		this.m.Sound[this.Const.Sound.ActorEvent.Idle] = [
			"sounds/enemies/cyto_idle_01.wav",
			"sounds/enemies/cyto_idle_02.wav",
			"sounds/enemies/cyto_idle_03.wav",
			"sounds/enemies/cyto_idle_04.wav",
			"sounds/enemies/cyto_idle_05.wav",
			"sounds/enemies/cyto_idle_06.wav",
			"sounds/enemies/cyto_idle_07.wav",
			"sounds/enemies/cyto_idle_08.wav",
			"sounds/enemies/cyto_idle_09.wav"
		];
		this.m.Sound[this.Const.Sound.ActorEvent.Move] = [
			"sounds/enemies/cyto_move_01.wav",
			"sounds/enemies/cyto_move_02.wav",
			"sounds/enemies/cyto_move_03.wav",
			"sounds/enemies/cyto_move_04.wav",
			"sounds/enemies/cyto_move_05.wav"
		];
		this.m.Sound[this.Const.Sound.ActorEvent.Other1] = [
			"sounds/enemies/slime_fuse_01.wav",
			"sounds/enemies/slime_fuse_02.wav"
		];
		this.m.SoundPitch = 1.1;
		local onArmorHitSounds = this.getItems().getAppearance().ImpactSound;
		this.m.SoundVolume[this.Const.Sound.ActorEvent.Move] = 0.5;
		onArmorHitSounds[this.Const.BodyPart.Body] = this.m.Sound[this.Const.Sound.ActorEvent.DamageReceived];
		onArmorHitSounds[this.Const.BodyPart.Head] = this.m.Sound[this.Const.Sound.ActorEvent.DamageReceived];
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/cytoplasm_agent");
		this.m.AIAgent.setActor(this);
	}

	function onDamageReceived( _attacker, _skill, _hitInfo )
	{
		_hitInfo.BodyPart = this.Const.BodyPart.Body;
		return this.actor.onDamageReceived(_attacker, _skill, _hitInfo);
	}

	function onDeath( _killer, _skill, _tile, _fatalityType )
	{

		this.m.BackupFaction = this.getFaction();
		this.m.BackupWorldParty = this.m.WorldTroop != null && ("Party" in this.m.WorldTroop) && this.m.WorldTroop.Party != null && !this.m.WorldTroop.Party.isNull() ? this.m.WorldTroop.Party : null;

		if (_tile != null && this.getSize() > 1)
		{
			local freeTiles = [];

			for( local i = 0; i < 6; i = ++i )
			{
				if (!_tile.hasNextTile(i))
				{
				}
				else
				{
					local nextTile = _tile.getNextTile(i);

					if (nextTile.Level > _tile.Level + 1)
					{
					}
					else if (nextTile.IsEmpty)
					{
						freeTiles.push(nextTile);
					}
				}
			}

			if (freeTiles.len() != 0)
			{
				local n = 1;
				while (n >= 0 && freeTiles.len() >= 1)
				{
					local r = this.Math.rand(0, freeTiles.len() - 1);
					local tile = freeTiles[r];
					freeTiles.remove(r);
					local rock = this.Tactical.spawnEntity("scripts/entity/tactical/enemies/jcc_cytoplasm", tile.Coords.X, tile.Coords.Y);
					rock.setFaction(this.getFaction());
					n = --n;
					if (this.getWorldTroop() != null && ("Party" in this.getWorldTroop()) && this.getWorldTroop().Party != null && !this.m.WorldTroop.Party.isNull())
					{
						local e;

						if (this.getSize() == 3)
						{
							e = this.Const.World.Common.addTroop(this.getWorldTroop().Party.get(), {
								Type = this.Const.World.Spawn.Troops.JccCytoplasmMEDIUM
							}, false);
						}
						else
						{
							e = this.Const.World.Common.addTroop(this.getWorldTroop().Party.get(), {
								Type = this.Const.World.Spawn.Troops.JccCytoplasm
							}, false);
						}

						rock.setWorldTroop(e);
					}

					rock.getSprite("body").Color = this.getSprite("body").Color;
					rock.getSprite("body").Saturation = this.getSprite("body").Saturation;

					/*if (tile.IsVisibleForPlayer)
					{
						for( local i = 0; i < this.Const.Tactical.CytoplasmParticles.len(); i = ++i )
						{
							this.Tactical.spawnParticleEffect(false, this.Const.Tactical.CytoplasmParticles[i].Brushes, tile, this.Const.Tactical.CytoplasmParticles[i].Delay, this.Const.Tactical.CytoplasmParticles[i].Quantity, this.Const.Tactical.CytoplasmParticles[i].LifeTimeQuantity, this.Const.Tactical.CytoplasmParticles[i].SpawnRate, this.Const.Tactical.CytoplasmParticles[i].Stages);
						}
					}*/

					if (this.getSize() == 3)
					{
						rock.grow(true);
					}
				}

				if (n > 0)
				{
					this.m.IsSpawningOnTile = true;
				}
			}
			else
			{
				this.m.IsSpawningOnTile = true;
			}
		}
		else
		{
			this.m.IsSpawningOnTile = true;
		}

		local flip = this.Math.rand(0, 100) < 50;
		local sprite_body = this.getSprite("body");

		if (_tile != null)
		{
			local decal;
			local skin = this.getSprite("body");
			this.m.IsCorpseFlipped = flip;
			decal = _tile.spawnDetail("bust_cytoplasm_dead", this.Const.Tactical.DetailFlag.Corpse, flip);
			decal.Color = skin.Color;
			decal.Saturation = skin.Saturation;
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
		if ((_killer == null || _killer.getFaction() == this.Const.Faction.Player || _killer.getFaction() == this.Const.Faction.PlayerAnimals) && this.Math.rand(1, 100) <= 40)
		{
			local n = 0 + this.Math.rand(0, 1) + (!this.Tactical.State.isScenarioMode() && this.Math.rand(1, 100) <= this.World.Assets.getExtraLootChance() ? 1 : 0);

			for( local i = 0; i < n; i = ++i )
			{
				_loot.push(this.new("scripts/items/misc/sulfurous_rocks_item"));
			}

			if (this.Math.rand(1, 100) <= 10)
			{
				_loot.push(this.new("scripts/items/loot/glittering_rock_item"));
			}
		}

		return this.actor.getLootForTile(_killer, _loot);
	}

	function generateCorpse( _tile, _fatalityType, _killer )
	{
		local corpse = clone this.Const.Corpse;
		corpse.CorpseName = "A " + this.getName();
		corpse.Items = this.getItems().prepareItemsForCorpse(_killer);
		corpse.Value = 2.0;
		corpse.IsResurrectable = false;
		corpse.IsConsumable = false;
		corpse.Armor = this.m.BaseProperties.Armor;
		corpse.IsHeadAttached = true;

		if (_tile != null)
		{
			corpse.Tile = _tile;
		}

		return corpse;
	}

	function onAfterDeath( _tile )
	{
		if (!this.m.IsSpawningOnTile)
		{
			return;
		}

		if (this.getSize() == 1)
		{
			return;
		}

		local rock = this.Tactical.spawnEntity("scripts/entity/tactical/enemies/jcc_cytoplasm", _tile.Coords.X, _tile.Coords.Y);
		rock.setFaction(this.m.BackupFaction);

		if (this.m.BackupWorldParty != null)
		{
			local e;

			if (this.getSize() == 3)
			{
				e = this.Const.World.Common.addTroop(this.m.BackupWorldParty.get(), {
					Type = this.Const.World.Spawn.Troops.JccCytoplasmMEDIUM
				}, false);
			}
			else
			{
				e = this.Const.World.Common.addTroop(this.m.BackupWorldParty.get(), {
					Type = this.Const.World.Spawn.Troops.JccCytoplasm
				}, false);
			}

			rock.setWorldTroop(e);
		}

		if (this.getSize() == 3)
		{
			rock.grow(true);
		}
	}

	function onInit()
	{
		this.actor.onInit();
		local baseProperties = this.m.BaseProperties;
		baseProperties.setValues(this.Const.Tactical.Actor.JccCytoplasm);
		baseProperties.IsAffectedByNight = false;
		baseProperties.IsImmuneToDisarm = true;
		baseProperties.IsImmuneToBleeding = true;
		baseProperties.IsImmuneToHeadshots = true;
		baseProperties.IsAffectedByInjuries = false;
		this.m.ActionPoints = baseProperties.ActionPoints;
		this.m.Hitpoints = baseProperties.Hitpoints;
		this.m.CurrentProperties = clone baseProperties;
		this.m.ActionPointCosts = this.Const.DefaultMovementAPCost;
		this.m.FatigueCosts = this.Const.DefaultMovementFatigueCost;
		local varia = this.Math.rand(1, 2);

		this.addSprite("socket").setBrush("bust_base_beasts");
		local skullA = this.addSprite("skullA");
		skullA.setBrush("bust_cytoplasm_small_skull_0" + varia);

		local body = this.addSprite("body");
		body.setBrush("bust_cytoplasm_small_body");
		body.varySaturation(0.25);
		body.varyColor(0.06, 0.06, 0.06);

		this.addDefaultStatusSprites();
		this.getSprite("status_rooted").Scale = 0.45;
		this.setSpriteOffset("status_rooted", this.createVec(-4, 7));
		this.m.Skills.add(this.new("scripts/skills/racials/cyto_racial"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_pathfinder"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_backstabber"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_hold_out"));
		this.m.Skills.add(this.new("scripts/skills/actives/slime_smack"));
		this.m.Skills.add(this.new("scripts/skills/actives/merge_cyto_skill"));
//		this.m.Skills.add(this.new("scripts/skills/effects/perk_captain"));

		this.m.Skills.add(this.new("scripts/skills/effects/captain_effect"));
	}

	function grow( _instant = false )
	{
		if (this.m.Size == 3)
		{
			return;
		}

		if (!_instant && this.m.Sound[this.Const.Sound.ActorEvent.Other1].len() != 0)
		{
			this.Sound.play(this.m.Sound[this.Const.Sound.ActorEvent.Other1][this.Math.rand(0, this.m.Sound[this.Const.Sound.ActorEvent.Other1].len() - 1)], this.Const.Sound.Volume.Actor, this.getPos());
		}

		this.m.Size = this.Math.min(3, this.m.Size + 1);
		this.m.IsShrinking = false;
		local b = this.m.BaseProperties;
		b.IsImmuneToKnockBackAndGrab = false;

		if (this.m.Size == 2)
		{
			this.getSprite("body").setBrush("bust_cytoplasm_medium_body");

			if (!_instant)
			{
				this.setRenderCallbackEnabled(true);
				this.m.ScaleStartTime = this.Time.getVirtualTimeF();
			}

			this.getSprite("status_rooted").Scale = 0.5;
			this.getSprite("status_rooted_back").Scale = 0.5;
			this.setSpriteOffset("status_rooted", this.createVec(-4, 10));
			this.setSpriteOffset("status_rooted_back", this.createVec(-4, 10));

			if (this.m.WorldTroop != null && ("Party" in this.m.WorldTroop) && this.m.WorldTroop.Party != null && !this.m.WorldTroop.Party.isNull())
			{
				this.m.WorldTroop.Script = this.Const.World.Spawn.Troops.JccCytoplasmMEDIUM.Script;
				this.m.WorldTroop.Strength = this.Const.World.Spawn.Troops.JccCytoplasmMEDIUM.Strength;
			}

		}
		else if (this.m.Size == 3)
		{
			this.getSprite("body").setBrush("bust_cytoplasm_high_body");

			if (!_instant)
			{
				this.setRenderCallbackEnabled(true);
				this.m.ScaleStartTime = this.Time.getVirtualTimeF();
			}

			this.getSprite("status_rooted").Scale = 0.6;
			this.getSprite("status_rooted_back").Scale = 0.6;
			this.setSpriteOffset("status_rooted", this.createVec(-7, 14));
			this.setSpriteOffset("status_rooted_back", this.createVec(-7, 14));
			b.IsImmuneToKnockBackAndGrab = true;
			b.IsImmuneToStun = true;

			if (this.m.WorldTroop != null && ("Party" in this.m.WorldTroop) && this.m.WorldTroop.Party != null && !this.m.WorldTroop.Party.isNull())
			{
				this.m.WorldTroop.Script = this.Const.World.Spawn.Troops.JccCytoplasmHIGH.Script;
				this.m.WorldTroop.Strength = this.Const.World.Spawn.Troops.JccCytoplasmHIGH.Strength;
			}

				this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));
				this.m.Skills.add(this.new("scripts/skills/perks/perk_captain"));
		}

		this.m.SoundPitch = 1.2 - this.m.Size * 0.1;
		this.m.Skills.update();
		this.setDirty(true);
	}

	function shrink( _instant = false )
	{
		if (this.m.Size == 1)
		{
			return;
		}

		if (!_instant && this.m.Sound[this.Const.Sound.ActorEvent.Other2].len() != 0)
		{
			this.Sound.play(this.m.Sound[this.Const.Sound.ActorEvent.Other2][this.Math.rand(0, this.m.Sound[this.Const.Sound.ActorEvent.Other2].len() - 1)], this.Const.Sound.Volume.Actor, this.getPos());
		}

		this.m.Size = this.Math.max(1, this.m.Size - 1);
		this.m.IsShrinking = true;
		local b = this.m.BaseProperties;
		b.IsImmuneToKnockBackAndGrab = false;
		b.IsImmuneToStun = false;

		if (this.m.Size == 2)
		{
			this.getSprite("body").setBrush("bust_cytoplasm_medium_body");

			if (!_instant)
			{
				this.setRenderCallbackEnabled(true);
				this.m.ScaleStartTime = this.Time.getVirtualTimeF();
			}

			this.getSprite("status_rooted").Scale = 0.5;
			this.getSprite("status_rooted_back").Scale = 0.5;
			this.setSpriteOffset("status_rooted", this.createVec(-4, 10));
			this.setSpriteOffset("status_rooted_back", this.createVec(-4, 10));

			if (this.m.WorldTroop != null && ("Party" in this.m.WorldTroop) && this.m.WorldTroop.Party != null)
			{
				this.m.WorldTroop.Script = this.Const.World.Spawn.Troops.JccCytoplasmMEDIUM.Script;
				this.m.WorldTroop.Strength = this.Const.World.Spawn.Troops.JccCytoplasmMEDIUM.Strength;
			}
			this.getContainer().removeByID("perk.fearsome");
			this.getContainer().removeByID("perk.captain");

		}
		else if (this.m.Size == 1)
		{
			this.getSprite("body").setBrush("bust_cytoplasm_small_body");

			if (!_instant)
			{
				this.setRenderCallbackEnabled(true);
				this.m.ScaleStartTime = this.Time.getVirtualTimeF();
			}

			this.getSprite("status_rooted").Scale = 0.6;
			this.getSprite("status_rooted_back").Scale = 0.6;
			this.setSpriteOffset("status_rooted", this.createVec(-7, 14));
			this.setSpriteOffset("status_rooted_back", this.createVec(-7, 14));

			if (this.m.WorldTroop != null && ("Party" in this.m.WorldTroop) && this.m.WorldTroop.Party != null)
			{
				this.m.WorldTroop.Script = this.Const.World.Spawn.Troops.JccCytoplasm.Script;
				this.m.WorldTroop.Strength = this.Const.World.Spawn.Troops.JccCytoplasm.Strength;
			}

		}

		this.m.SoundPitch = 1.2 - this.m.Size * 0.1;
		this.m.Skills.update();
		this.setDirty(true);
	}

	function onRender()
	{
		this.actor.onRender();

		if (this.m.IsShrinking)
		{
			if (this.m.Size == 2)
			{
				this.getSprite("body").Scale = this.Math.maxf(1.0, 1.04 - 0.04 * ((this.Time.getVirtualTimeF() - this.m.ScaleStartTime) / 0.3));

				if (this.moveSpriteOffset("body", this.createVec(0, 1), this.createVec(0, 0), 0.3, this.m.ScaleStartTime))
				{
					this.setRenderCallbackEnabled(false);
				}
			}
			else if (this.m.Size == 1)
			{
				this.getSprite("body").Scale = this.Math.maxf(1.0, 1.04 - 0.04 * ((this.Time.getVirtualTimeF() - this.m.ScaleStartTime) / 0.3));

				if (this.moveSpriteOffset("body", this.createVec(0, 1), this.createVec(0, 0), 0.3, this.m.ScaleStartTime))
				{
					this.setRenderCallbackEnabled(false);
				}
			}
		}
		else if (this.m.Size == 2)
		{
			this.getSprite("body").Scale = this.Math.minf(1.0, 0.96 + 0.04 * ((this.Time.getVirtualTimeF() - this.m.ScaleStartTime) / 0.3));

			if (this.moveSpriteOffset("body", this.createVec(0, -1), this.createVec(0, 0), 0.3, this.m.ScaleStartTime))
			{
				this.setRenderCallbackEnabled(false);
			}
		}
		else if (this.m.Size == 3)
		{
			this.getSprite("body").Scale = this.Math.minf(1.0, 0.94 + 0.06 * ((this.Time.getVirtualTimeF() - this.m.ScaleStartTime) / 0.3));

			if (this.moveSpriteOffset("body", this.createVec(0, -1), this.createVec(0, 0), 0.3, this.m.ScaleStartTime))
			{
				this.setRenderCallbackEnabled(false);
			}
		}
	}

	function onMovementStep( _tile, _levelDifference )
	{
		/*for( local i = 0; i < this.Const.Tactical.DustParticles.len(); i = ++i )
		{
			this.Tactical.spawnParticleEffect(false, this.Const.Tactical.DustParticles[i].Brushes, _tile, this.Const.Tactical.DustParticles[i].Delay, this.Const.Tactical.DustParticles[i].Quantity * 0.15 * this.m.Size, this.Const.Tactical.DustParticles[i].LifeTimeQuantity * 0.15 * this.m.Size, this.Const.Tactical.DustParticles[i].SpawnRate, this.Const.Tactical.DustParticles[i].Stages);
		}*/

		return this.actor.onMovementStep(_tile, _levelDifference);
	}

	function onRemovedFromMap()
	{
		this.actor.onRemovedFromMap();

		if (!this.m.IsAlive && this.m.WorldTroop != null && ("Party" in this.m.WorldTroop) && this.m.WorldTroop.Party != null && !this.m.WorldTroop.Party.isNull())
		{
			this.m.WorldTroop.Party.removeTroop(this.m.WorldTroop);
		}
	}

	/*function onFactionChanged()
    {
        this.actor.onFactionChanged();
        local flip = this.isAlliedWithPlayer();
        this.getSprite("body").setHorizontalFlipping(flip);
        this.getSprite("injury").setHorizontalFlipping(flip);
        this.getSprite("armor").setHorizontalFlipping(flip);
        this.getSprite("head").setHorizontalFlipping(flip);
        this.getSprite("helmet").setHorizontalFlipping(flip);
    }*/
 
});
