this.jcc_scenario_perchts <- this.inherit("scripts/scenarios/tactical/jcc_base_scenario", {
	m = {},
	function generate()
	{
		this.logDebug("ScenarioPerchts::generate()");
		this.createStash();
		this.initMap();
		this.initEntities();
		this.jcc_base_scenario.initStash();
		this.m.Music = this.Const.Music.BeastsTracks;
		local clouds = this.Tactical.getWeather().createCloudSettings();
		clouds.Type = this.getconsttable().CloudType.Fog;
		clouds.MinClouds = 20;
		clouds.MaxClouds = 20;
		clouds.MinVelocity = 3.0;
		clouds.MaxVelocity = 9.0;	
		clouds.MinAlpha = 0.35;
		clouds.MaxAlpha = 0.45;
		clouds.MinScale = 2.0;
		clouds.MaxScale = 3.0;
		this.Tactical.getWeather().buildCloudCover(clouds);
		this.Tactical.getCamera().Level = 1;
		this.Tactical.CameraDirector.addMoveToTileEvent(0, this.Tactical.getTile(15, 14 - 15 / 2), 1, null, null, 0, 100);
	}

	function initMap()
	{
		local testMap = this.MapGen.get("tactical.forest");
		local minX = testMap.getMinX();
		local minY = testMap.getMinY();
		this.Tactical.resizeScene(minX, minY);
		local roadTile = this.MapGen.get("tactical.tile.moss1");
		local _rect = {
			X = 0,
			Y = 0,
			W = minX,
			H = minY
		};
		local _properties;
		local roadX = _rect.W / 2;
		local roadY = 0;
		local roadEndY = _rect.H - 1;
		local roadYMoved = false;

		while (true)
		{
			roadTile.fill({
				X = roadX,
				Y = roadY,
				W = 1,
				H = 1,
				IsEmpty = false
			}, _properties);
			roadTile.fill({
				X = roadX + 1,
				Y = roadY,
				W = 1,
				H = 1,
				IsEmpty = false
			}, _properties);

			if (roadY == roadEndY)
			{
				break;
			}

			local r = this.Math.rand(0, 100);

			if (!roadYMoved || r < 50)
			{
				roadY = ++roadY;
				roadYMoved = true;
			}
			else if (r < 66 && roadX + 1 < _rect.H - 1)
			{
				roadX = ++roadX;
				roadYMoved = false;
			}
			else if (roadY - 1 >= 1)
			{
				roadX = --roadX;
				roadYMoved = false;
			}
		}

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
		
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_percht", 30, 30, 11, 11);
		entity.setFaction(this.Const.Faction.Beasts);
		entity.assignRandomEquipment();
		entity.makeMiniboss();
		entity.generateName();

		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_percht", 19, 19, 12, 12);
		entity.setFaction(this.Const.Faction.Beasts);
		entity.assignRandomEquipment();

		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_percht", 19, 19, 13, 13);
		entity.setFaction(this.Const.Faction.Beasts);
		entity.assignRandomEquipment();

		entity = this.spawnEntity("scripts/entity/tactical/enemies/direwolf", 19, 19, 14, 14);
		entity.setFaction(this.Const.Faction.Beasts);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/direwolf", 19, 19, 15, 15);
		entity.setFaction(this.Const.Faction.Beasts);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/direwolf", 19, 19, 16, 16);
		entity.setFaction(this.Const.Faction.Beasts);

		entity = this.spawnEntity("scripts/entity/tactical/enemies/direwolf_high", 20, 20, 11, 11);
		entity.setFaction(this.Const.Faction.Beasts);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/direwolf_high", 20, 20, 12, 12);
		entity.setFaction(this.Const.Faction.Beasts);

		entity = this.spawnEntity("scripts/entity/tactical/enemies/schrat", 21, 21, 11, 11);
		entity.setFaction(this.Const.Faction.Beasts);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_perchta", 21, 21, 12, 12);
		entity.setFaction(this.Const.Faction.Beasts);
		entity.assignRandomEquipment();

		entity = this.spawnEntity("scripts/entity/tactical/enemies/spider", 20, 20, 13, 13);
		entity.setFaction(this.Const.Faction.Beasts);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/spider", 20, 20, 14, 14);
		entity.setFaction(this.Const.Faction.Beasts);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/spider", 20, 20, 15, 15);
		entity.setFaction(this.Const.Faction.Beasts);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/spider", 20, 20, 16, 16);
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

