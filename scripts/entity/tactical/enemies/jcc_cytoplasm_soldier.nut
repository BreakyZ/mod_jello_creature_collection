this.jcc_cytoplasm_soldier <- this.inherit("scripts/entity/tactical/actor", {
	m = 
	{
		Size = 1,
		Variant = 1,
		ScaleStartTime = 0,
		Miniboss = false,
		body = null
	},
	function getSize()
	{
		return this.m.Size;
	}
	function create()
	{
		this.m.Type = this.Const.EntityType.JccCytoplasmSoldier;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.JccCytoplasmSoldier.XP;
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
		this.m.SoundPitch = 1.1;
		local onArmorHitSounds = this.getItems().getAppearance().ImpactSound;
		this.m.SoundVolume[this.Const.Sound.ActorEvent.Move] = 0.5;
		onArmorHitSounds[this.Const.BodyPart.Body] = this.m.Sound[this.Const.Sound.ActorEvent.DamageReceived];
		onArmorHitSounds[this.Const.BodyPart.Head] = this.m.Sound[this.Const.Sound.ActorEvent.DamageReceived];
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/cyto_soldier_agent");
		this.m.AIAgent.setActor(this);
	}

	function onDamageReceived( _attacker, _skill, _hitInfo )
	{
		_hitInfo.BodyPart = this.Const.BodyPart.Body;
		return this.actor.onDamageReceived(_attacker, _skill, _hitInfo);
	}

	function onDeath( _killer, _skill, _tile, _fatalityType )
	{

		local flip = this.Math.rand(0, 100) < 50;
		local sprite_body = this.getSprite("body");

		if (_tile != null)
		{
			local decal;
			local skin = this.getSprite("body");
			this.m.IsCorpseFlipped = flip;
			if(this.m.Miniboss)
			{			
				decal = _tile.spawnDetail("bust_cyto_soldier_boss_dead", this.Const.Tactical.DetailFlag.Corpse, flip);
			} else{
				decal = _tile.spawnDetail("bust_cyto_soldier_dead", this.Const.Tactical.DetailFlag.Corpse, flip);
			}
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


	function onInit()
	{
		this.actor.onInit();
		local baseProperties = this.m.BaseProperties;
		baseProperties.setValues(this.Const.Tactical.Actor.JccCytoplasm);
		baseProperties.IsAffectedByNight = false;
		baseProperties.IsImmuneToBleeding = true;
		baseProperties.IsAffectedByInjuries = false;
		this.m.ActionPoints = baseProperties.ActionPoints;
		this.m.Hitpoints = baseProperties.Hitpoints;
		this.m.CurrentProperties = clone baseProperties;
		this.m.ActionPointCosts = this.Const.DefaultMovementAPCost;
		this.m.FatigueCosts = this.Const.DefaultMovementFatigueCost;
		local variant = this.Math.rand(1, 2);

		this.addSprite("socket").setBrush("bust_base_beasts");
		local skullA = this.addSprite("skullA");
		skullA.setBrush("bust_cyto_soldier_skull_0" + variant);

		local rib = this.addSprite("rib");
		rib.setBrush("bust_cyto_soldier_ribs");

		local jaw = this.addSprite("jaw");
		jaw.setBrush("bust_cyto_soldier_jaw");

		this.m.body = this.addSprite("body");
		this.m.body.setBrush("bust_cyto_soldier_body");
		this.m.body.varySaturation(0.25);
		this.m.body.varyColor(0.06, 0.06, 0.06);

		this.addDefaultStatusSprites();
		this.getSprite("status_rooted").Scale = 0.45;
		this.setSpriteOffset("status_rooted", this.createVec(-4, 7));
		this.m.Skills.add(this.new("scripts/skills/racials/cyto_racial"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_pathfinder"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_backstabber"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_hold_out"));
		this.m.Skills.add(this.new("scripts/skills/actives/slime_smack"));
		this.m.Skills.add(this.new("scripts/skills/effects/captain_effect"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_steel_brow"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_crippling_strikes"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_reach_advantage"));


	}

	function onDamageReceived( _attacker, _skill, _hitInfo )
	{
		_hitInfo.BodyPart = this.Const.BodyPart.Head;
		local ret = this.actor.onDamageReceived(_attacker, _skill, _hitInfo);

		return ret;
	}

	

	function assignRandomEquipment()
	{
		local r = this.Math.rand(1, 100);
		local weapon;


		if (r <= 15)
		{
			weapon = this.new("scripts/items/weapons/bardiche");
		}
		else if (r <= 50)
		{
			weapon = this.new("scripts/items/weapons/warbrand");
		}
		else if (r <= 70)
		{
			weapon = this.new("scripts/items/weapons/longsword");
		}
		else
		{
			weapon = this.new("scripts/items/weapons/hooked_blade");
		}

		local helmet = [
				"helmets/jcc_slime_soldier_helmet",
				"helmets/jcc_slime_soldier_helmet_flat",
				"helmets/jcc_slime_soldier_helmet_kettle"
			];
		this.m.Items.equip(this.new("scripts/items/" + helmet[this.Math.rand(0, helmet.len() - 1)]));


		this.m.Items.equip(weapon);
		
	}

	function generateName()
	{
		this.m.Name = this.Const.Strings.JccSlimeNames[this.Math.rand(0, this.Const.Strings.JccPerchtNames.len() - 1)];
	}

	function makeMiniboss()
	{
		if (!this.actor.makeMiniboss())
		{
			return false;
		}

		this.m.Miniboss=true;
		this.getSprite("miniboss").setBrush("bust_miniboss");

		this.m.body.setBrush("bust_cyto_soldier_body_boss");

		this.m.Items.unequip(this.m.Items.getItemAtSlot(this.Const.ItemSlot.Mainhand));

		local r = this.Math.rand(1, 2);

		this.setSpriteOffset("arms_icon", ::createVec(7, 7))

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/jcc_slime_bardiche"));

		}else
		{
			this.m.Items.equip(this.new("scripts/items/weapons/jcc_slime_warbrand"));
		}

		this.m.Skills.add(this.new("scripts/skills/perks/perk_fearsome"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));

		return true;
	}

 
});
