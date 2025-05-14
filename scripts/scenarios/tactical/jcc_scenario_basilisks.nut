this.jcc_scenario_basilisks <- this.inherit("scripts/scenarios/tactical/jcc_base_scenario", {
	m = {},
	function generate()
	{
		this.logDebug("ScenarioBasilisks::generate()");
		this.createStash();
		this.initMap();
		this.initEntities();
		this.jcc_base_scenario.initStash();
		this.m.Music = this.Const.Music.BeastsTracks;
		this.Tactical.getCamera().Level = 1;
		this.Tactical.CameraDirector.addMoveToTileEvent(0, this.Tactical.getTile(15, 14 - 15 / 2), 1, null, null, 0, 100);
	}

	function initMap()
	{
		local testMap = this.MapGen.get("tactical.autumn");
		local minX = testMap.getMinX();
		local minY = testMap.getMinY();
		this.Tactical.resizeScene(minX, minY);
		testMap.fill({
			X = 0,
			Y = 0,
			W = minX,
			H = minY
		}, null);
	}

	function initEntities()
	{
		this.jcc_base_scenario.initEntities();
		local entity;

		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_basilisk_drone");
		entity.setFaction(this.Const.Faction.Beasts);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_basilisk_sentry");
		entity.setFaction(this.Const.Faction.Beasts);		
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_basilisk_drone");
		entity.setFaction(this.Const.Faction.Beasts);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_basilisk_sentry");
		entity.setFaction(this.Const.Faction.Beasts);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_basilisk_drone");
		entity.setFaction(this.Const.Faction.Beasts);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_basilisk_sentry");
		entity.setFaction(this.Const.Faction.Beasts);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_basilisk_queen", 20, 20, 16, 16);
		entity.setFaction(this.Const.Faction.Beasts);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_basilisk_drone");
		entity.setFaction(this.Const.Faction.Beasts);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_basilisk_drone");
		entity.setFaction(this.Const.Faction.Beasts);
	}

	function spawnEntity( _script, _minX = 10, _maxX = 28, _minY = 3, _maxY = 28 )
	{
		local x = 0;
		local y = 0;
		local n = 0;

		while (1)
		{
			x = this.Math.rand(_minX, _maxX);
			y = this.Math.rand(_minY, _maxY) - x / 2;

			if (this.Tactical.getTile(x, y).IsOccupiedByActor)
			{
				continue;
			}

			this.Tactical.getTile(x, y).removeObject();

			if (this.Tactical.getTile(x, y).IsEmpty)
			{
				break;
			}
		}

		return this.Tactical.spawnEntity(_script, x, y);
	}


});

