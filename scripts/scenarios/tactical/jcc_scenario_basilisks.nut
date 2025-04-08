this.jcc_scenario_basilisks <- this.inherit("scripts/scenarios/tactical/scenario_template", {
	m = {},
	function generate()
	{
		this.logDebug("ScenarioLineBattle::generate()");
		this.createStash();
		this.initMap();
		this.initEntities();
		this.initStash();
		this.Tactical.Entities.makeEnemiesKnownToAI();
		local clouds = this.Tactical.getWeather().createCloudSettings();
		clouds.Type = this.getconsttable().CloudType.StaticFog;
		clouds.MinClouds = 12;
		clouds.MaxClouds = 18;
		clouds.MinAlpha = 0.25;
		clouds.MaxAlpha = 0.5;
		clouds.MinScale = 2.0;
		clouds.MaxScale = 3.0;
		this.Tactical.getWeather().buildCloudCover(clouds);
		local rain = this.Tactical.getWeather().createRainSettings();
		rain.MinDrops = 150;
		rain.MaxDrops = 150;
		rain.NumSplats = 50;
		rain.MinVelocity = 400.0;
		rain.MaxVelocity = 500.0;
		rain.MinAlpha = 0.75;
		rain.MaxAlpha = 1.0;
		rain.MinScale = 0.75;
		rain.MaxScale = 1.0;
		this.Tactical.getWeather().buildRain(rain);
		this.Tactical.getWeather().setAmbientLightingPreset(6);
		this.Tactical.getCamera().Level = 3;
	}

	function initMap()
	{
		local testMap = this.MapGen.get("tactical.test_hunting_grounds");
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
		local items;
		entity = this.spawnEntity("scripts/entity/tactical/player", 12, 12, 14, 14);
		
		this.World.getPlayerRoster().add(entity);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		items.equip(this.new("scripts/items/helmets/kettle_hat"));
		items.equip(this.new("scripts/items/armor/padded_leather"));
		items.equip(this.new("scripts/items/weapons/pike"));
		items.equip(this.new("scripts/items/accessory/wardog_item"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 12, 12, 13, 13);
		
		this.World.getPlayerRoster().add(entity);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		items.equip(this.new("scripts/items/armor/leather_tunic"));
		items.equip(this.new("scripts/items/weapons/pike"));
		items.equip(this.new("scripts/items/helmets/hood"));
		items.addToBag(this.new("scripts/items/weapons/dagger"));
		items.equip(this.new("scripts/items/accessory/armored_wardog_item"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 11, 11, 14, 14);
		
		this.World.getPlayerRoster().add(entity);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		items.equip(this.new("scripts/items/armor/thick_tunic"));
		items.equip(this.new("scripts/items/weapons/percht_spetum"));
		items.equip(this.new("scripts/items/accessory/armored_wardog_item"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 11, 11, 15, 15);
		
		this.World.getPlayerRoster().add(entity);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		armor = this.new("scripts/items/armor/sackcloth");
		upgrade = this.new("scripts/items/armor_upgrades/direwolf_pelt_upgrade");
		armor.setUpgrade(upgrade);
		items.equip(armor);
		items.equip(this.new("scripts/items/weapons/percht_bow"));
		items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));
		items.addToBag(this.new("scripts/items/weapons/dagger"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 13, 13, 11, 11);
		
		this.World.getPlayerRoster().add(entity);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		items.equip(this.new("scripts/items/helmets/kettle_hat"));
		armor = this.new("scripts/items/armor/lamellar_harness");
		upgrade = this.new("scripts/items/armor_upgrades/direwolf_pelt_upgrade");
		armor.setUpgrade(upgrade);
		items.equip(armor);
		items.equip(this.new("scripts/items/weapons/percht_flail"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 13, 13, 12, 12);
		
		this.World.getPlayerRoster().add(entity);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		items.equip(this.new("scripts/items/helmets/nasal_helmet"));
		items.equip(this.new("scripts/items/armor/padded_leather"));
		items.equip(this.new("scripts/items/weapons/noble_sword"));
		items.equip(this.new("scripts/items/shields/heater_shield"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 13, 13, 13, 13);
		
		this.World.getPlayerRoster().add(entity);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		items.equip(this.new("scripts/items/armor/mail_shirt"));
		items.equip(this.new("scripts/items/weapons/hand_axe"));
		items.equip(this.new("scripts/items/shields/kite_shield"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 13, 13, 14, 14);
		
		this.World.getPlayerRoster().add(entity);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		items.equip(this.new("scripts/items/helmets/hood"));
		items.equip(this.new("scripts/items/armor/mail_shirt"));
		items.equip(this.new("scripts/items/weapons/boar_spear"));
		items.equip(this.new("scripts/items/shields/wooden_shield"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 13, 13, 15, 15);
		
		this.World.getPlayerRoster().add(entity);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		items.equip(this.new("scripts/items/helmets/nasal_helmet"));
		items.equip(this.new("scripts/items/armor/mail_shirt"));
		items.equip(this.new("scripts/items/weapons/warhammer"));
		items.equip(this.new("scripts/items/shields/kite_shield"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 13, 13, 16, 16);
		
		this.World.getPlayerRoster().add(entity);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		items.equip(this.new("scripts/items/helmets/hood"));
		items.equip(this.new("scripts/items/armor/padded_surcoat"));
		items.equip(this.new("scripts/items/weapons/winged_mace"));
		items.equip(this.new("scripts/items/shields/wooden_shield"));
		entity = this.spawnEntity("scripts/entity/tactical/player", 13, 13, 17, 17);
		
		this.World.getPlayerRoster().add(entity);
		entity.setName(this.getRandomPlayerName());
		entity.setScenarioValues();
		items = entity.getItems();
		items.equip(this.new("scripts/items/helmets/mail_coif"));
		items.equip(this.new("scripts/items/armor/coat_of_plates"));
		items.equip(this.new("scripts/items/weapons/greatsword"));
		
		
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_basilisk_drone", 12, 18, 7, 10);
		entity.setFaction(this.Const.Faction.Beasts);
		entity.assignRandomEquipment();

		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_basilisk_drone", 12, 18, 7, 10);
		entity.setFaction(this.Const.Faction.Beasts);
		entity.assignRandomEquipment();

		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_basilisk_drone", 12, 18, 7, 10);
		entity.setFaction(this.Const.Faction.Beasts);
		entity.assignRandomEquipment();

		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_basilisk_drone", 12, 18, 7, 10);
		entity.setFaction(this.Const.Faction.Beasts);
		entity.assignRandomEquipment();

		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_basilisk_sentry", 12, 18, 7, 10);
		entity.setFaction(this.Const.Faction.Beasts);
		entity.assignRandomEquipment();
		entity = this.spawnEntity("scripts/entity/tactical/enemies/jcc_basilisk_sentry", 12, 18, 7, 10);
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
		this.Stash.setLocked(false);
		this.Stash.add(this.new("scripts/items/weapons/dagger"));
		this.Stash.add(this.new("scripts/items/weapons/scramasax"));
		this.Stash.add(this.new("scripts/items/weapons/hatchet"));
		this.Stash.add(this.new("scripts/items/weapons/hatchet"));
		this.Stash.add(this.new("scripts/items/weapons/hand_axe"));
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
		this.Stash.add(this.new("scripts/items/weapons/billhook"));
		this.Stash.add(this.new("scripts/items/weapons/billhook"));
		this.Stash.add(this.new("scripts/items/weapons/billhook"));
		this.Stash.add(this.new("scripts/items/weapons/boar_spear"));
		this.Stash.add(this.new("scripts/items/weapons/boar_spear"));
		this.Stash.add(this.new("scripts/items/weapons/boar_spear"));
		this.Stash.add(this.new("scripts/items/weapons/boar_spear"));
		this.Stash.add(this.new("scripts/items/weapons/boar_spear"));
		this.Stash.add(this.new("scripts/items/weapons/boar_spear"));
		this.Stash.add(this.new("scripts/items/weapons/bludgeon"));
		this.Stash.add(this.new("scripts/items/weapons/bludgeon"));
		this.Stash.add(this.new("scripts/items/weapons/winged_mace"));
		this.Stash.add(this.new("scripts/items/weapons/winged_mace"));
		this.Stash.add(this.new("scripts/items/weapons/winged_mace"));
		this.Stash.add(this.new("scripts/items/weapons/winged_mace"));
		this.Stash.add(this.new("scripts/items/weapons/short_bow"));
		this.Stash.add(this.new("scripts/items/weapons/short_bow"));
		this.Stash.add(this.new("scripts/items/weapons/hunting_bow"));
		this.Stash.add(this.new("scripts/items/weapons/hunting_bow"));
		this.Stash.add(this.new("scripts/items/weapons/crossbow"));
		this.Stash.add(this.new("scripts/items/weapons/crossbow"));
		this.Stash.add(this.new("scripts/items/weapons/crossbow"));
		this.Stash.add(this.new("scripts/items/shields/wooden_shield"));
		this.Stash.add(this.new("scripts/items/shields/wooden_shield"));
		this.Stash.add(this.new("scripts/items/shields/kite_shield"));
		this.Stash.add(this.new("scripts/items/shields/kite_shield"));
		this.Stash.add(this.new("scripts/items/shields/kite_shield"));
		this.Stash.add(this.new("scripts/items/helmets/aketon_cap"));
		this.Stash.add(this.new("scripts/items/helmets/aketon_cap"));
		this.Stash.add(this.new("scripts/items/helmets/aketon_cap"));
		this.Stash.add(this.new("scripts/items/helmets/helmet_with_neckguard"));
		this.Stash.add(this.new("scripts/items/helmets/helmet_with_neckguard"));
		this.Stash.add(this.new("scripts/items/helmets/helmet_with_neckguard"));
		this.Stash.add(this.new("scripts/items/helmets/helmet_with_neckguard"));
		this.Stash.add(this.new("scripts/items/helmets/mail_coif"));
		this.Stash.add(this.new("scripts/items/helmets/mail_coif"));
		this.Stash.add(this.new("scripts/items/helmets/mail_coif"));
		this.Stash.add(this.new("scripts/items/helmets/kettle_hat"));
		this.Stash.add(this.new("scripts/items/helmets/kettle_hat"));
		this.Stash.add(this.new("scripts/items/helmets/kettle_hat"));
		this.Stash.add(this.new("scripts/items/helmets/flat_top_helmet"));
		this.Stash.add(this.new("scripts/items/helmets/flat_top_helmet"));
		this.Stash.add(this.new("scripts/items/helmets/full_helm"));
		this.Stash.add(this.new("scripts/items/helmets/full_helm"));
		this.Stash.add(this.new("scripts/items/armor/padded_surcoat"));
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
	}

});

