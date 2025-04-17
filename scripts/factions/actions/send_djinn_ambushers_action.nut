this.send_djinn_ambushers_action <- this.inherit("scripts/factions/faction_action", {
	m = {},
	function create()
	{
		this.m.ID = "send_djinn_ambushers_action";
		this.m.Cooldown = 30.0;
		this.m.IsSettlementsRequired = true;
		this.faction_action.create();
	}

	function onUpdate( _faction )
	{
		local settlements = _faction.getSettlements();

		if (settlements.len() < 7)
		{
			return;
		}

		if (this.World.FactionManager.isCivilWar())
		{
			if (_faction.getUnits().len() >= 6)
			{
				return;
			}
		}
		else if (this.World.FactionManager.isGreaterEvil())
		{
			if (_faction.getUnits().len() >= 3)
			{
				return;
			}
		}
		else if (_faction.getUnits().len() >= 4)
		{
			return;
		}

		local allowed = false;

		foreach( s in _faction.getSettlements() )
		{
			if (s.getResources() == 0)
			{
				continue;
			}

			if (s.getLastSpawnTime() + 300.0 > this.Time.getVirtualTimeF())
			{
				continue;
			}

			allowed = true;
			break;
		}

		if (!allowed)
		{
			return;
		}

		this.m.Score = 10;
	}

	function onClear()
	{
	}

	function onExecute( _faction )
	{
		local settlements = [];

		foreach( s in _faction.getSettlements() )
		{
			if (s.getResources() == 0)
			{
				continue;
			}

			if (s.getLastSpawnTime() + 300.0 > this.Time.getVirtualTimeF())
			{
				continue;
			}

			settlements.push({
				D = s,
				P = 10
			});
		}

		local settlement = this.pickWeightedRandom(settlements);
		settlement.setLastSpawnTimeToNow();
		local mult = this.World.FactionManager.isCivilWar() ? 1.1 : 1.0;
		local party = this.getFaction().spawnEntity(settlement.getTile(), "Bestial Despoilers", false, this.Const.World.Spawn.JccDjinn, this.Math.rand(75, 120) * this.getReputationToDifficultyLightMult() * mult);
		party.getSprite("banner").setBrush(settlement.getBanner());
		party.setDescription("A pack of beasts and their dark masters, hungry for fresh kills.");
		party.setFootprintType(this.Const.World.FootprintsType.Direwolves);
		party.getFlags().set("IsRandomlySpawned", true);
		party.getLoot().Money = this.Math.rand(0, 50);
		party.getLoot().ArmorParts = this.Math.rand(0, 10);
		party.getLoot().Medicine = this.Math.rand(0, 5);
		party.getLoot().Ammo = this.Math.rand(0, 30);

		/*if (this.Math.rand(1, 100) <= 50)
		{
			party.addToInventory("loot/bone_figurines_item");
		}

		if (this.Math.rand(1, 100) <= 50)
		{
			party.addToInventory("loot/bead_necklace_item");
		}*/

		local r = this.Math.rand(2, 3);

		if (r == 2)
		{
			party.addToInventory("supplies/dates_item");
		}
		else
		{
			party.addToInventory("supplies/strange_meat_item");
		}

		local c = party.getController();
		local ambush = this.new("scripts/ai/world/orders/ambush_order");
		local move = this.new("scripts/ai/world/orders/move_order");
		move.setDestination(settlement.getTile());
		local despawn = this.new("scripts/ai/world/orders/despawn_order");
		c.addOrder(ambush);
		c.addOrder(move);
		c.addOrder(despawn);
		return true;
	}

});

