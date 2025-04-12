this.jcc_scenario_perchts <- this.inherit("scripts/scenarios/tactical/scenario_template", {
	m = {},
	function generate()
	{
		this.logDebug("ScenarioPerchts::generate()");
		this.createStash();
		this.initMap();
		this.initEntities();
		this.initStash();
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
		local entity;
		local armor;
		local items;
		local upgrade;
		local banner;

		//player units
		{

			banner = this.new("scripts/items/tools/player_banner");
			banner.m.Variant = 1;
			banner.updateVariant();

			entity = this.spawnEntity("scripts/entity/tactical/player", 12, 12, 15, 15);
			this.World.getPlayerRoster().add(entity);
			entity.setName(this.getRandomPlayerName());
			entity.setScenarioValues();
			items = entity.getItems();
			items.equip(this.new("scripts/items/helmets/kettle_hat"));
			items.equip(this.new("scripts/items/armor/padded_leather"));
			items.equip(banner);
			items.equip(this.new("scripts/items/accessory/hexen_trophy_item"));
			
			entity = this.spawnEntity("scripts/entity/tactical/player", 12, 12, 13, 13);
			this.World.getPlayerRoster().add(entity);
			entity.setName(this.getRandomPlayerName());
			entity.setScenarioValues();
			items = entity.getItems();
			armor = this.new("scripts/items/armor/sellsword_armor");
			armor.setUpgrade(this.new("scripts/items/armor_upgrades/jcc_basilisk_cloak"));
			items.equip(armor);
			items.equip(this.new("scripts/items/weapons/basilisk_hammer"));
			items.equip(this.new("scripts/items/helmets/hood"));
			items.equip(this.new("scripts/items/accessory/jcc_basilisk_trophy_item"));
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
			armor = this.new("scripts/items/armor/lamellar_harness");
			upgrade = this.new("scripts/items/armor_upgrades/protective_runes_upgrade");
			items.equip(this.new("scripts/items/helmets/kettle_hat_with_mail"));
			armor.setUpgrade(upgrade);
			items.equip(armor);
			items.equip(this.new("scripts/items/weapons/percht_axe"));
			items.equip(this.new("scripts/items/accessory/ghoul_trophy_item"));
			
			entity = this.spawnEntity("scripts/entity/tactical/player", 13, 13, 14, 14);
			this.World.getPlayerRoster().add(entity);
			entity.setName(this.getRandomPlayerName());
			entity.setScenarioValues();
			items = entity.getItems();
			items.equip(this.new("scripts/items/helmets/hood"));
			items.equip(this.new("scripts/items/armor/mail_shirt"));
			items.equip(this.new("scripts/items/weapons/jcc_slime_warbrand"));
			
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
			items.equip(this.new("scripts/items/weapons/percht_whip"));
			items.equip(this.new("scripts/items/shields/wooden_shield"));
			
			entity = this.spawnEntity("scripts/entity/tactical/player", 13, 13, 17, 17);
			this.World.getPlayerRoster().add(entity);
			entity.setName(this.getRandomPlayerName());
			entity.setScenarioValues();
			items = entity.getItems();
			items.equip(this.new("scripts/items/helmets/mail_coif"));
			items.equip(this.new("scripts/items/armor/coat_of_plates"));
			items.equip(this.new("scripts/items/weapons/jcc_slime_bardiche"));
		}
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
		this.Stash.add(this.new("scripts/items/shields/wooden_shield"));
		this.Stash.add(this.new("scripts/items/shields/wooden_shield"));
		this.Stash.add(this.new("scripts/items/shields/kite_shield"));
		this.Stash.add(this.new("scripts/items/shields/kite_shield"));
		this.Stash.add(this.new("scripts/items/shields/kite_shield"));
		this.Stash.add(this.new("scripts/items/helmets/hood"));
		this.Stash.add(this.new("scripts/items/helmets/aketon_cap"));
		this.Stash.add(this.new("scripts/items/helmets/full_aketon_cap"));
		this.Stash.add(this.new("scripts/items/helmets/nasal_helmet"));
		this.Stash.add(this.new("scripts/items/helmets/padded_nasal_helmet"));
		this.Stash.add(this.new("scripts/items/helmets/nasal_helmet_with_mail"));
		this.Stash.add(this.new("scripts/items/helmets/mail_coif"));
		this.Stash.add(this.new("scripts/items/helmets/closed_mail_coif"));
		this.Stash.add(this.new("scripts/items/helmets/reinforced_mail_coif"));
		this.Stash.add(this.new("scripts/items/helmets/kettle_hat"));
		this.Stash.add(this.new("scripts/items/helmets/padded_kettle_hat"));
		this.Stash.add(this.new("scripts/items/helmets/kettle_hat_with_mail"));
		this.Stash.add(this.new("scripts/items/helmets/flat_top_helmet"));
		this.Stash.add(this.new("scripts/items/helmets/flat_top_with_mail"));
		this.Stash.add(this.new("scripts/items/helmets/full_helm"));
		this.Stash.add(this.new("scripts/items/helmets/full_helm"));
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

