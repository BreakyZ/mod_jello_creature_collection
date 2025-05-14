this.jcc_scenario_slimes <- this.inherit("scripts/scenarios/tactical/jcc_base_scenario", {
	m = {},
	function generate()
	{
		this.logDebug("ScenarioSlimes::generate()");
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
		local testMap = this.MapGen.get("tactical.plains");
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

		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_cytoplasm");
		entity.setFaction(this.Const.Faction.Beasts);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_cytoplasm");
		entity.setFaction(this.Const.Faction.Beasts);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_cytoplasm");
		entity.setFaction(this.Const.Faction.Beasts);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_cytoplasm");
		entity.setFaction(this.Const.Faction.Beasts);

		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_cytoplasm_medium");
		entity.setFaction(this.Const.Faction.Beasts);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_cytoplasm_medium");
		entity.setFaction(this.Const.Faction.Beasts);

		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_cytoplasm_high");
		entity.setFaction(this.Const.Faction.Beasts);

		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_cytoplasm_ooze");
		entity.setFaction(this.Const.Faction.Beasts);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_cytoplasm_ooze");		
		entity.setFaction(this.Const.Faction.Beasts);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_cytoplasm_ooze");
		entity.setFaction(this.Const.Faction.Beasts);

		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_cytoplasm_soldier");
		entity.setFaction(this.Const.Faction.Beasts);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_cytoplasm_soldier");
		entity.setFaction(this.Const.Faction.Beasts);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_cytoplasm_soldier");
		entity.assignRandomEquipment();
		entity.setFaction(this.Const.Faction.Beasts);
		entity.makeMiniboss();
		entity.generateName();

		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_cytoplasm_black");
		entity.setFaction(this.Const.Faction.Beasts);

		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_cytoplasm_black");
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

