this.jcc_scenario_beastslayers <- this.inherit("scripts/scenarios/tactical/scenario_template", {
	m = {},
	function generate()
	{
		this.logDebug("ScenarioBeastslayers::generate()");
		this.createStash();
		this.initMap();
		this.initEntities();
		this.initStash();
		this.m.Music = this.Const.Music.BeastsTracks;
		local clouds = this.Tactical.getWeather().createCloudSettings();
		this.Tactical.getCamera().Level = 1;
		this.Tactical.CameraDirector.addMoveToTileEvent(0, this.Tactical.getTile(15, 14 - 15 / 2), 1, null, null, 0, 100);
	}

	function initMap()
	{
		local testMap = this.MapGen.get("tactical.steppe");
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
		local entity;
		local armor;
		local items;
		local upgrade;
		local banner;


		entity = this.spawnEntity("scripts/entity/tactical/guests/jcc_perchta_guest", 12, 12, 15, 15);
		this.World.getPlayerRoster().add(entity);
		entity.setFaction(this.Const.Faction.Player);
		entity.assignRandomEquipment();
		entity.generateName();

		entity = this.spawnEntity("scripts/entity/tactical/guests/jcc_basilisk_sentry_guest", 12, 12, 13, 13);
		this.World.getPlayerRoster().add(entity);
		entity.setFaction(this.Const.Faction.Player);
		entity.setName("Basilisk Sentry");

		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_nachtmahr", 11, 11, 13, 13);
		//this.World.getPlayerRoster().add(entity);
		entity.setFaction(this.Const.Faction.PlayerAnimals);


		entity = this.spawnEntity("scripts/entity/tactical/guests/jcc_basilisk_queen_guest", 11, 11, 14, 14);
		this.World.getPlayerRoster().add(entity);
		entity.setFaction(this.Const.Faction.Player);
		entity.setName("Basilisk Queen");

		entity = this.spawnEntity("scripts/entity/tactical/guests/jcc_perchta_guest", 11, 11, 15, 15);
		this.World.getPlayerRoster().add(entity);
		entity.setFaction(this.Const.Faction.Player);
		items = entity.getItems();
		armor = this.new("scripts/items/armor/sackcloth");
		upgrade = this.new("scripts/items/armor_upgrades/direwolf_pelt_upgrade");
		armor.setUpgrade(upgrade);
		items.equip(armor);
		items.equip(this.new("scripts/items/weapons/percht_bow"));
		items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));
		items.addToBag(this.new("scripts/items/weapons/percht_flail"));
		entity.generateName();

		entity = this.spawnEntity("scripts/entity/tactical/guests/jcc_dragon_guest", 9, 9, 14, 14);
		this.World.getPlayerRoster().add(entity);
		entity.setFaction(this.Const.Faction.Player);
		entity.setName("Drache");

		entity = this.spawnEntity("scripts/entity/tactical/guests/jcc_percht_guest", 13, 13, 11, 11);
		this.World.getPlayerRoster().add(entity);
		entity.setFaction(this.Const.Faction.Player);
		entity.makeMiniboss();
		entity.generateName();

		entity = this.spawnEntity("scripts/entity/tactical/guests/jcc_basilisk_drone_guest", 13, 13, 12, 12);
		this.World.getPlayerRoster().add(entity);
		entity.setFaction(this.Const.Faction.Player);
		entity.setName("Basilisk Drone");

		entity = this.spawnEntity("scripts/entity/tactical/guests/jcc_percht_guest", 13, 13, 13, 13);
		this.World.getPlayerRoster().add(entity);
		entity.setFaction(this.Const.Faction.Player);
		items = entity.getItems();
		items.equip(this.new("scripts/items/weapons/percht_axe"));
		items.equip(this.new("scripts/items/accessory/ghoul_trophy_item"));
		entity.generateName();

		entity = this.spawnEntity("scripts/entity/tactical/enemies/schrat", 13, 13, 14, 14);
		entity.assignRandomEquipment();
		entity.setFaction(this.Const.Faction.PlayerAnimals);

		entity = this.spawnEntity("scripts/entity/tactical/guests/jcc_percht_guest", 13, 13, 15, 15);
		this.World.getPlayerRoster().add(entity);
		entity.setFaction(this.Const.Faction.Player);
		entity.assignRandomEquipment();
		entity.generateName();

		entity = this.spawnEntity("scripts/entity/tactical/guests/jcc_basilisk_sentry_guest", 13, 13, 16, 16);
		this.World.getPlayerRoster().add(entity);
		entity.setFaction(this.Const.Faction.Player);
		entity.setName("Basilisk Sentry");

		entity = this.spawnEntity("scripts/entity/tactical/guests/jcc_basilisk_drone_guest", 13, 13, 17, 17);
		this.World.getPlayerRoster().add(entity);
		entity.setFaction(this.Const.Faction.Player);
		entity.setName("Basilisk Drone");

		entity = this.spawnEntity("scripts/entity/tactical/enemies/ghoul", 12, 12, 9, 9);
		entity.setFaction(this.Const.Faction.PlayerAnimals);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/direwolf", 12, 12, 12, 12);
		entity.setFaction(this.Const.Faction.PlayerAnimals);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/direwolf_high", 12, 12, 19, 19);
		entity.setFaction(this.Const.Faction.PlayerAnimals);

		entity = this.spawnEntity("scripts/entity/tactical/enemies/spider", 10, 10, 9, 9);
		entity.setFaction(this.Const.Faction.PlayerAnimals);
		entity = this.spawnEntity("scripts/entity/tactical/enemies/spider", 10, 10, 10, 10);
		entity.setFaction(this.Const.Faction.PlayerAnimals);	
		entity = this.spawnEntity("scripts/entity/tactical/enemies/spider", 10, 10, 19, 19);
		entity.setFaction(this.Const.Faction.PlayerAnimals);			

		{/*
			//entity = this.spawnEntity("scripts/entity/tactical/jcc_basilisk_queen", 10, 10, 15, 15);
			//entity.setFaction(this.Const.Faction.PlayerAnimals);

			entity = this.spawnEntity("scripts/entity/tactical/enemies/ghoul", 12, 12, 9, 9);
			entity.setFaction(this.Const.Faction.PlayerAnimals);
			entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_percht", 12, 12, 11, 11);
			entity.setFaction(this.Const.Faction.PlayerAnimals);
			entity.assignRandomEquipment();
			entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_percht", 11, 11, 13, 13);
			entity.setFaction(this.Const.Faction.PlayerAnimals);
			entity.assignRandomEquipment();
			entity = this.spawnEntity("scripts/entity/tactical/enemies/direwolf", 12, 12, 12, 12);
			entity.setFaction(this.Const.Faction.PlayerAnimals);
			entity = this.spawnEntity("scripts/entity/tactical/enemies/direwolf_high", 12, 12, 14, 14);
			entity.setFaction(this.Const.Faction.PlayerAnimals);
			entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_perchta", 11, 11, 17, 17);
			entity.setFaction(this.Const.Faction.PlayerAnimals);
			entity.assignRandomEquipment();
			entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_basilisk_drone", 11, 11, 11, 11);
			entity.setFaction(this.Const.Faction.PlayerAnimals);
			entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_basilisk_sentry", 11, 11, 16, 16);
			entity.setFaction(this.Const.Faction.PlayerAnimals);*/
		}


		local x;
		x = 19;
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_beastslayer", x, x, 11, 11);
		entity.setFaction(this.Const.Faction.Orcs);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_beastslayer", x, x, 12, 12);
		entity.setFaction(this.Const.Faction.Orcs);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_beastslayer", x, x, 13, 13);
		entity.setFaction(this.Const.Faction.Orcs);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_beastslayer", x, x, 14, 14);
		entity.setFaction(this.Const.Faction.Orcs);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_beastslayer", x, x, 15, 15);
		entity.setFaction(this.Const.Faction.Orcs);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_beastslayer", x, x, 16, 16);
		entity.setFaction(this.Const.Faction.Orcs);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_beastslayer", x, x, 17, 17);
		entity.setFaction(this.Const.Faction.Orcs);
		entity.assignRandomEquipment();

		x = x + 1;
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_beastslayer", x, x, 12, 12);
		entity.setFaction(this.Const.Faction.Orcs);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_beastslayer", x, x, 13, 13);
		entity.setFaction(this.Const.Faction.Orcs);
		entity.assignRandomEquipment();

		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_beastslayer", x, x, 14, 14);
		entity.setFaction(this.Const.Faction.Orcs);
		entity.assignRandomEquipment();
		entity.makeMiniboss();
		entity.generateName();
		
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_beastslayer", x, x, 15, 15);
		entity.setFaction(this.Const.Faction.Orcs);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_beastslayer", x, x, 16, 16);
		entity.setFaction(this.Const.Faction.Orcs);
		entity.assignRandomEquipment();	

		x = x + 1;
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_beastslayer", x, x, 14, 14);
		entity.setFaction(this.Const.Faction.Orcs);
		entity.assignRandomEquipment();
		entity.makeMiniboss();
		entity.generateName();

		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_beastslayer", x, x, 15, 15);
		entity.setFaction(this.Const.Faction.Orcs);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_beastslayer", x, x, 16, 16);
		entity.setFaction(this.Const.Faction.Orcs);
		entity.assignRandomEquipment();

		x = x + 1;
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_wardog", x, x, 11, 11);
		entity.setFaction(this.Const.Faction.Orcs);
		entity.assignRandomEquipment();
		//items = entity.getItems();
		//items.equip(this.new("scripts/items/armor/special/wardog_heavy_armor"));
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_warhound", x, x, 13, 13);
		entity.setFaction(this.Const.Faction.Orcs);
		entity.assignRandomEquipment();
		//items = entity.getItems();
		//items.equip(this.new("scripts/items/armor/special/wardog_heavy_armor"));
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_wardog", x, x, 14, 14);
		entity.setFaction(this.Const.Faction.Orcs);
		entity.assignRandomEquipment();
		//items = entity.getItems();
		//items.equip(this.new("scripts/items/armor/special/wardog_heavy_armor"));
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_warhound", x, x, 15, 15);
		entity.setFaction(this.Const.Faction.Orcs);
		entity.assignRandomEquipment();
		//items = entity.getItems();
		//items.equip(this.new("scripts/items/armor/special/wardog_heavy_armor"));

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

	function initStash()
	{
		this.Stash.clear();
		this.Stash.resize(117);
		this.Stash.setLocked(false);
		this.Stash.add(this.new("scripts/items/weapons/dagger"));
		this.Stash.add(this.new("scripts/items/weapons/scramasax"));
		this.Stash.add(this.new("scripts/items/weapons/javelin"));
		this.Stash.add(this.new("scripts/items/weapons/javelin"));
		this.Stash.add(this.new("scripts/items/weapons/throwing_axe"));
		this.Stash.add(this.new("scripts/items/weapons/throwing_axe"));
		this.Stash.add(this.new("scripts/items/weapons/hatchet"));
		this.Stash.add(this.new("scripts/items/weapons/hatchet"));
		this.Stash.add(this.new("scripts/items/weapons/hand_axe"));
		this.Stash.add(this.new("scripts/items/weapons/hand_axe"));
		this.Stash.add(this.new("scripts/items/weapons/warhammer"));
		this.Stash.add(this.new("scripts/items/weapons/warhammer"));
		this.Stash.add(this.new("scripts/items/weapons/shortsword"));
		this.Stash.add(this.new("scripts/items/weapons/shortsword"));
		this.Stash.add(this.new("scripts/items/weapons/falchion"));
		this.Stash.add(this.new("scripts/items/weapons/falchion"));
		this.Stash.add(this.new("scripts/items/weapons/arming_sword"));
		this.Stash.add(this.new("scripts/items/weapons/arming_sword"));
		this.Stash.add(this.new("scripts/items/weapons/military_cleaver"));
		this.Stash.add(this.new("scripts/items/weapons/military_cleaver"));
		this.Stash.add(this.new("scripts/items/weapons/greatsword"));
		this.Stash.add(this.new("scripts/items/weapons/greatsword"));
		this.Stash.add(this.new("scripts/items/weapons/greatsword"));
		this.Stash.add(this.new("scripts/items/weapons/greatsword"));
		this.Stash.add(this.new("scripts/items/weapons/greataxe"));
		this.Stash.add(this.new("scripts/items/weapons/greataxe"));
		this.Stash.add(this.new("scripts/items/weapons/greataxe"));
		this.Stash.add(this.new("scripts/items/weapons/billhook"));
		this.Stash.add(this.new("scripts/items/weapons/billhook"));
		this.Stash.add(this.new("scripts/items/weapons/billhook"));
		this.Stash.add(this.new("scripts/items/weapons/militia_spear"));
		this.Stash.add(this.new("scripts/items/weapons/militia_spear"));
		this.Stash.add(this.new("scripts/items/weapons/boar_spear"));
		this.Stash.add(this.new("scripts/items/weapons/boar_spear"));
		this.Stash.add(this.new("scripts/items/weapons/boar_spear"));
		this.Stash.add(this.new("scripts/items/weapons/bludgeon"));
		this.Stash.add(this.new("scripts/items/weapons/bludgeon"));
		this.Stash.add(this.new("scripts/items/weapons/winged_mace"));
		this.Stash.add(this.new("scripts/items/weapons/winged_mace"));
		this.Stash.add(this.new("scripts/items/weapons/winged_mace"));
		this.Stash.add(this.new("scripts/items/weapons/winged_mace"));
		this.Stash.add(this.new("scripts/items/weapons/flail"));
		this.Stash.add(this.new("scripts/items/weapons/flail"));
		this.Stash.add(this.new("scripts/items/weapons/flail"));
		this.Stash.add(this.new("scripts/items/weapons/short_bow"));
		this.Stash.add(this.new("scripts/items/weapons/short_bow"));
		this.Stash.add(this.new("scripts/items/weapons/hunting_bow"));
		this.Stash.add(this.new("scripts/items/weapons/hunting_bow"));
		this.Stash.add(this.new("scripts/items/weapons/crossbow"));
		this.Stash.add(this.new("scripts/items/weapons/crossbow"));
		this.Stash.add(this.new("scripts/items/weapons/crossbow"));
		this.Stash.add(this.new("scripts/items/armor/padded_surcoat"));
		this.Stash.add(this.new("scripts/items/armor/gambeson"));
		this.Stash.add(this.new("scripts/items/armor/gambeson"));
		this.Stash.add(this.new("scripts/items/armor/padded_leather"));
		this.Stash.add(this.new("scripts/items/armor/padded_leather"));
		this.Stash.add(this.new("scripts/items/armor/mail_shirt"));
		this.Stash.add(this.new("scripts/items/armor/mail_shirt"));
		this.Stash.add(this.new("scripts/items/armor/mail_shirt"));
		this.Stash.add(this.new("scripts/items/armor/lamellar_harness"));
		this.Stash.add(this.new("scripts/items/armor/coat_of_plates"));
		this.Stash.add(this.new("scripts/items/ammo/quiver_of_arrows"));
		this.Stash.add(this.new("scripts/items/ammo/quiver_of_arrows"));
		this.Stash.add(this.new("scripts/items/ammo/quiver_of_arrows"));
		this.Stash.add(this.new("scripts/items/ammo/quiver_of_arrows"));
		this.Stash.add(this.new("scripts/items/ammo/quiver_of_bolts"));
		this.Stash.add(this.new("scripts/items/ammo/quiver_of_bolts"));
		this.Stash.add(this.new("scripts/items/ammo/quiver_of_bolts"));
		this.Stash.add(this.new("scripts/items/accessory/wardog_item"));
		this.Stash.add(this.new("scripts/items/accessory/wardog_item"));
		this.Stash.add(this.new("scripts/items/accessory/wardog_item"));
		this.Stash.add(this.new("scripts/items/accessory/wardog_item"));
		this.Stash.add(this.new("scripts/items/accessory/wardog_item"));
		this.Stash.add(this.new("scripts/items/accessory/wardog_item"));
	}

});

