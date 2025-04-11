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
			party.getSprite("banner").setBrush("banner_beasts_01");
			party.setDescription("A chaotic swarm of Basilisks");
			party.setFootprintType(this.Const.World.FootprintsType.Basilisks);
			party.setSlowerAtNight(true);
			party.setUsingGlobalVision(false);
			party.setLooting(false);
			local roam = this.new("scripts/ai/world/orders/roam_order");
			roam.setNoTerrainAvailable();
			roam.setTerrain(this.Const.World.TerrainType.Forest, true);
			roam.setTerrain(this.Const.World.TerrainType.SnowyForest, false);
			roam.setTerrain(this.Const.World.TerrainType.LeaveForest, true);
			roam.setTerrain(this.Const.World.TerrainType.SwampForest, true);
			roam.setTerrain(this.Const.World.TerrainType.SwampGreen, true);
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

	}
});
