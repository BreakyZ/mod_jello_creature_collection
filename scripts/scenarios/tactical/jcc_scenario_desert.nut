this.jcc_scenario_desert <- this.inherit("scripts/scenarios/tactical/jcc_base_scenario", {
	m = {},
	function generate()
	{
		this.logDebug("ScenarioDesert::generate()");
		this.createStash();
		this.initMap();
		this.initEntities();
		this.jcc_base_scenario.initStash();
		this.m.Music = this.Const.Music.BeastsTracksSouth;
		this.Tactical.getCamera().Level = 1;
		this.Tactical.CameraDirector.addMoveToTileEvent(0, this.Tactical.getTile(15, 14 - 15 / 2), 1, null, null, 0, 100);
	}

	function initMap()
	{
		local testMap = this.MapGen.get("tactical.desert");
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

		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_scorpion");
		entity.setFaction(this.Const.Faction.Beasts);		
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_scorpion");
		entity.setFaction(this.Const.Faction.Beasts);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_scorpion");
		entity.setFaction(this.Const.Faction.Beasts);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_scorpion");
		entity.setFaction(this.Const.Faction.Beasts);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_scorpion");
		entity.setFaction(this.Const.Faction.Beasts);
	
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_giant_scorpion");
		entity.setFaction(this.Const.Faction.Beasts);
		entity.assignRandomEquipment();

		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_djinn");
		entity.setFaction(this.Const.Faction.Beasts);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_djinn");
		entity.setFaction(this.Const.Faction.Beasts);
		entity.assignRandomEquipment();
		entity.generateName();
		entity.makeMiniboss();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_djinn_low");
		entity.setFaction(this.Const.Faction.Beasts);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_djinn_low");
		entity.setFaction(this.Const.Faction.Beasts);
		entity.assignRandomEquipment();
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

