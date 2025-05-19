::mods_hookExactClass("factions/actions/send_beast_roamers_action", function(o)
{
	local create = o.create;
	o.create = function ()
	{
		create();
		local distanceToNextAlly = 10;
		local beast;
		//Basilisks
		beast = function ( _action, _nearTile = null )
		{
			local disallowedTerrain = [];

			for( local i = 0; i < this.Const.World.TerrainType.COUNT; i = ++i )
			{
				if (i == this.Const.World.TerrainType.Forest || i == this.Const.World.TerrainType.SnowyForest || i == this.Const.World.TerrainType.LeaveForest || i == this.Const.World.TerrainType.AutumnForest)
				{
				}
				else
				{
					disallowedTerrain.push(i);
				}
			}

			local tile = _action.getTileToSpawnLocation(10, disallowedTerrain, 7, 50, 1000, 3, 0, _nearTile, 0.2);

			if (tile == null)
			{
				return false;
			}

			if (_action.getDistanceToNextAlly(tile) <= distanceToNextAlly / (_nearTile == null ? 1 : 2))
			{
				return false;
			}

			local distanceToNextSettlement = _action.getDistanceToSettlements(tile);
			local party = _action.getFaction().spawnEntity(tile, "Basilisks", false, this.Const.World.Spawn.JccBasilisk, this.Math.rand(80, 120) * _action.getScaledDifficultyMult() * this.Math.maxf(0.7, this.Math.minf(1.5, distanceToNextSettlement / 14.0)));
			this.logInfo("Spawned Jcc Basilisks");
			party.getSprite("banner").setBrush("banner_beasts_01");
			party.setDescription("A chaotic swarm of basilisks");
			party.setFootprintType(this.Const.World.FootprintsType.Unholds);
			party.setSlowerAtNight(true);
			party.setUsingGlobalVision(false);
			party.setLooting(false);
			local roam = this.new("scripts/ai/world/orders/roam_order");
			roam.setNoTerrainAvailable();
			roam.setTerrain(this.Const.World.TerrainType.Forest, true);
			roam.setTerrain(this.Const.World.TerrainType.SnowyForest, false);
			roam.setTerrain(this.Const.World.TerrainType.LeaveForest, true);
			//roam.setTerrain(this.Const.World.TerrainType.SwampForest, true);
			//roam.setTerrain(this.Const.World.TerrainType.SwampGreen, true);
			roam.setTerrain(this.Const.World.TerrainType.Hills, true);
			local r = this.Math.rand(1, 20);
			if (r == 1)
			{
			roam.setTerrain(this.Const.World.TerrainType.Plains, true);
			}
			else if (r == 2)
			{
			roam.setTerrain(this.Const.World.TerrainType.Plains, true);
			roam.setTerrain(this.Const.World.TerrainType.Farmland, true);
			}
			else if (r == 3)
			{
			roam.setTerrain(this.Const.World.TerrainType.Swamp, true);
			}
			else if (r == 4)
			{
			roam.setTerrain(this.Const.World.TerrainType.AutumnForest, true);
			}
			else if (r == 5)
			{
			roam.setTerrain(this.Const.World.TerrainType.Farmland, true);
			}
			else if (r == 6)
			{
			roam.setTerrain(this.Const.World.TerrainType.Badlands, true);
			}
			if (r == 7)
			{
			roam.setTerrain(this.Const.World.TerrainType.Steppe, true);
			}
			party.getController().addOrder(roam);
			return true;
		};

		this.m.Options.push(beast);
		this.m.BeastsLow.push(beast);

		//dragon
		beast = function ( _action, _nearTile = null )
			{
				if (this.World.getTime().Days < 10 && _nearTile == null)
				{
					return false;
				}

				local isTundraAllowed = this.Math.rand(1, 100) <= 20;
				local disallowedTerrain = [];

				for( local i = 0; i < this.Const.World.TerrainType.COUNT; i = ++i )
				{
					if (i == this.Const.World.TerrainType.Mountains || i == this.Const.World.TerrainType.Tundra || i == this.Const.World.TerrainType.Hills )
					{
					}
					else
					{
						disallowedTerrain.push(i);
					}
				}

				local tile = _action.getTileToSpawnLocation(10, disallowedTerrain, 5, 100, 1000, 3, 0, _nearTile, 0.0);

				if (tile == null)
				{
					return false;
				}

				if (_action.getDistanceToNextAlly(tile) <= distanceToNextAlly / (_nearTile == null ? 1 : 2))
				{
					return false;
				}

				local distanceToNextSettlement = _action.getDistanceToSettlements(tile);
				local party = _action.getFaction().spawnEntity(tile, "Drache", false, this.Const.World.Spawn.JccDragon, this.Math.rand(80, 120) * _action.getScaledDifficultyMult() * this.Math.maxf(0.7, this.Math.minf(1.5, distanceToNextSettlement / 14.0)));
				this.logInfo("Spawned Jcc Dragons");
				party.getSprite("banner").setBrush("banner_beasts_01");
				party.setDescription("Fire-breathing dragons burning all in their path.");
				party.setFootprintType(this.Const.World.FootprintsType.Lindwurms);
				party.setSlowerAtNight(true);
				party.setUsingGlobalVision(false);
				party.setLooting(false);
				local roam = this.new("scripts/ai/world/orders/roam_order");
				roam.setNoTerrainAvailable();
				roam.setTerrain(this.Const.World.TerrainType.Tundra, true);
				roam.setTerrain(this.Const.World.TerrainType.Mountains, true);
				roam.setTerrain(this.Const.World.TerrainType.Hills, true);


				party.getController().addOrder(roam);
				return true;
			};

		this.m.Options.push(beast);
		this.m.BeastsHigh.push(beast);

		//scorp
		if (this.Const.DLC.Desert)
		{
			beast = function ( _action, _nearTile = null )
			{
				local disallowedTerrain = [];

				for( local i = 0; i < this.Const.World.TerrainType.COUNT; i = ++i )
				{
					if (i == this.Const.World.TerrainType.Desert || i == this.Const.World.TerrainType.Oasis || i == this.Const.World.TerrainType.Hills)
					{
					}
					else
					{
						disallowedTerrain.push(i);
					}
				}

				local tile = _action.getTileToSpawnLocation(10, disallowedTerrain, 7, 50, 1000, 3, 0, _nearTile, 0.0, 0.2);

				if (tile == null)
				{
					return false;
				}

				if (_action.getDistanceToNextAlly(tile) <= distanceToNextAlly / (_nearTile == null ? 1 : 2))
				{
					return false;
				}

				local distanceToNextSettlement = _action.getDistanceToSettlements(tile);
				local party = _action.getFaction().spawnEntity(tile, "Scorpions", false, this.Const.World.Spawn.JccScorpions, this.Math.rand(80, 120) * _action.getScaledDifficultyMult() * this.Math.maxf(0.7, this.Math.minf(1.5, distanceToNextSettlement / 14.0)));
				party.getSprite("banner").setBrush("banner_beasts_01");
				party.setDescription("A horde of giant scorpions searching for prey.");
				party.setFootprintType(this.Const.World.FootprintsType.Spiders);
				party.setSlowerAtNight(false);
				party.setUsingGlobalVision(false);
				party.setLooting(false);
				local roam = this.new("scripts/ai/world/orders/roam_order");
				roam.setNoTerrainAvailable();
				roam.setTerrain(this.Const.World.TerrainType.Desert, true);
				roam.setTerrain(this.Const.World.TerrainType.Oasis, true);
				roam.setTerrain(this.Const.World.TerrainType.Steppe, true);
				roam.setTerrain(this.Const.World.TerrainType.Hills, true);
				party.getController().addOrder(roam);
				return true;
			};
			this.m.Options.push(beast);
		}

		//slimes
		beast = function ( _action, _nearTile = null )
		{
			local disallowedTerrain = [];

			for( local i = 0; i < this.Const.World.TerrainType.COUNT; i = ++i )
			{
				if (i == this.Const.World.TerrainType.Forest || i == this.Const.World.TerrainType.LeaveForest || i == this.Const.World.TerrainType.AutumnForest || i == this.Const.World.TerrainType.Plains || i == this.Const.World.TerrainType.Swamp )
				{
				}
				else
				{
					disallowedTerrain.push(i);
				}
			}

			local tile = _action.getTileToSpawnLocation(10, disallowedTerrain, 7, 50, 1000, 3, 0, _nearTile, 0.2);

			if (tile == null)
			{
				return false;
			}

			if (_action.getDistanceToNextAlly(tile) <= distanceToNextAlly / (_nearTile == null ? 1 : 2))
			{
				return false;
			}

			local distanceToNextSettlement = _action.getDistanceToSettlements(tile);
			local party = _action.getFaction().spawnEntity(tile, "Cytoplasms", false, this.Const.World.Spawn.JccCytoplasms, this.Math.rand(80, 120) * _action.getScaledDifficultyMult() * this.Math.maxf(0.7, this.Math.minf(1.5, distanceToNextSettlement / 14.0)));
			party.getSprite("banner").setBrush("banner_beasts_01");
			party.setDescription("A mass of cytoplasms, haphazardly fusing and splitting apart on the search for prey.");
			party.setFootprintType(this.Const.World.FootprintsType.Direwolves);
			party.setSlowerAtNight(false);
			party.setUsingGlobalVision(false);
			party.setLooting(false);
			local roam = this.new("scripts/ai/world/orders/roam_order");
			roam.setNoTerrainAvailable();
			roam.setTerrain(this.Const.World.TerrainType.Forest, true);
			roam.setTerrain(this.Const.World.TerrainType.LeaveForest, true);
			roam.setTerrain(this.Const.World.TerrainType.AutumnForest, true);
			roam.setTerrain(this.Const.World.TerrainType.Plains, true);
			roam.setTerrain(this.Const.World.TerrainType.Swamp, true);
			roam.setTerrain(this.Const.World.TerrainType.Hills, true);
			party.getController().addOrder(roam);
			return true;
		};
		this.m.Options.push(beast);
		this.m.BeastsLow.push(beast);
	}
});
