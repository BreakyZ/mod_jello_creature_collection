this.jcc_player_percht_scenario <- this.inherit("scripts/scenarios/world/starting_scenario", {
	m = {},
	function create()
	{
		this.m.ID = "scenario.jcc_player_percht";
		this.m.Name = "Pactsworn";
		this.m.Description = "[p=c][img]gfx/ui/events/jcc_event_01.png[/img][/p][p]A series of bad contracts has left the company destitute and most men corpses. Having had enough of relying on the old gods\' favor, you instead enter a covenant with the dark things that stalk the forests, desperate to rebuild the company with their aid.\n\n[color=#bcad8c]Dire Straits:[/color] Start with two maimed mercenaries with damaged equipment, as well as a Percht.\n[color=#bcad8c]Stalkers:[/color] You move faster, see farther and are harder to spot while in forests.\n[color=#bcad8c]Pactsworn:[/color] Perchts will routinely appear to make demands or join your company... at a price.[/p]";
		this.m.Difficulty = 3;
		this.m.Order = 2104;
		this.m.IsFixedLook = true;
	}

	function isValid()
	{
		return this.Const.DLC.Unhold;
	}

	function onSpawnAssets()
	{
		local roster = this.World.getPlayerRoster();
		local names = [];

		for( local i = 0; i < 2; i = ++i )
		{
			local bro;
			bro = roster.create("scripts/entity/tactical/player");
			bro.m.HireTime = this.Time.getVirtualTimeF();
			bro.worsenMood(1.5, "Most of the company was lost in a rout");
			bro.worsenMood(1.0, "Was forced into a dark pact");

			while (names.find(bro.getNameOnly()) != null)
			{
				bro.setName(this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)]);
			}

			names.push(bro.getNameOnly());
		}

		local percht;
		percht = roster.create("scripts/entity/tactical/player");
		percht.m.HireTime = this.Time.getVirtualTimeF();
		while (names.find(percht.getNameOnly()) != null)
		{
			percht.setName(this.Const.Strings.JccPerchtNames[this.Math.rand(0, this.Const.Strings.JccPerchtNames.len() - 1)]);
		}
		names.push(percht.getNameOnly());

		local bros = roster.getAll();
		bros[0].setStartValuesEx([
			"killer_on_the_run_background"
		]);
		bros[0].getBackground().m.RawDescription = "In the past, you saved %name% the sharpshooter when bounty hunters were after his head. Having lost an eye when the flank collapsed in your company\'s last stand, he claims he stuck around because of a debt of gratitude, but you get the feeling it\'s because noone else would hire him now.";
		bros[0].setPlaceInFormation(3);
		bros[0].addLightInjury();
		bros[0].m.Talents = [];
		bros[0].getBaseProperties().RangedSkill += 17;
		bros[0].m.PerkPoints = 1;
		bros[0].m.LevelUps = 1;
		bros[0].m.Level = 2;		
		bros[0].getSkills().add(this.new("scripts/skills/injury_permanent/missing_eye_injury"));
		local talents = bros[0].getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.MeleeDefense] = 1;
		talents[this.Const.Attributes.RangedSkill] = 3;
		talents[this.Const.Attributes.MeleeSkill] = 2;
		local items = bros[0].getItems();
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Ammo));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Body));
		local a = this.new("scripts/items/armor/leather_scale_armor");
		a.setArmor(this.Math.round(a.getArmorMax() / 3 - 1) / 1.0);		
		local h = this.new("scripts/items/helmets/headscarf");
		h.setArmor(this.Math.round(h.getArmorMax() * 0.66) / 1.0);
		items.equip(a);
		items.equip(h);
		items.equip(this.new("scripts/items/weapons/crossbow"));
		items.equip(this.new("scripts/items/ammo/quiver_of_bolts"));
		items.addToBag(this.new("scripts/items/weapons/pike"));
		bros[1].setStartValuesEx([
			"deserter_background"
		]);
		bros[1].getBackground().m.RawDescription = "%name% has always been the first to charge into battle - and the first to retreat. The standard bearer managed to hold on to his flag in the battle that decimated your company, but not without taking a hefty blow to the head. Whether it\'s his brave deed or the brain damage, he\'s been emboldened ever since.";
		bros[1].setPlaceInFormation(4);
		bros[1].addInjury(this.Const.Injury.Brawl);
		bros[1].addHeavyInjury();
		bros[1].getBaseProperties().Bravery += 15;
		bros[1].m.Talents = [];
		bros[1].m.PerkPoints = 1;
		bros[1].m.LevelUps = 1;
		bros[1].m.Level = 2;
		bros[1].getSkills().add(this.new("scripts/skills/injury_permanent/brain_damage_injury"));			
		bros[1].improveMood(1.0, "Managed to save the company standard");
		local talents = bros[1].getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.Fatigue] = 2;
		talents[this.Const.Attributes.MeleeSkill] = 1;
		talents[this.Const.Attributes.Bravery] = 2;
		local items = bros[1].getItems();
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Ammo));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Head));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Body));
		a = this.new("scripts/items/armor/footman_armor");
		a.setArmor(this.Math.round(a.getArmorMax() / 5 - 1) / 1.0);
		items.equip(a);
		local banner = this.new("scripts/items/tools/player_banner");
		banner.setVariant(this.World.Assets.getBannerID());
		items.equip(banner);


		bros[2].setStartValuesEx([
			"jcc_percht_background"
		]);		
		bros[2].getSkills().add(this.new("scripts/skills/traits/loyal_trait"));
		bros[2].getBackground().m.RawDescription = "%name% is both your reward and punishment, a towering enforcer to send at your foes... and to ensure you do not forget your obligations. He stands silent and ominous, watching you as a hound would a cat, but appears earnest in his loyalty to you.";
		bros[2].setPlaceInFormation(5);
		bros[2].m.Talents = [];
		local talents = bros[2].getTalents();
		talents.resize(this.Const.Attributes.COUNT, 0);
		talents[this.Const.Attributes.MeleeSkill] = 2;
		talents[this.Const.Attributes.RangedSkill] = 2;
		talents[this.Const.Attributes.Hitpoints] = 3;
		local items = bros[2].getItems();
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Mainhand));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Offhand));
		items.unequip(items.getItemAtSlot(this.Const.ItemSlot.Ammo));
		items.equip(this.new("scripts/items/weapons/percht_flail"));


		this.World.Assets.m.BusinessReputation = 200;
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/strange_meat_item"));
		this.World.Assets.getStash().add(this.new("scripts/items/supplies/ground_grains_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/misc/witch_hair_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/misc/werewolf_pelt_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/misc/werewolf_pelt_item"));
		//this.World.Assets.getStash().add(this.new("scripts/items/accessory/night_vision_elixir_item"));
		this.World.Assets.m.Money = this.Math.round(this.World.Assets.m.Money * 0.75);
		this.World.Assets.m.ArmorParts = 0;
		this.World.Assets.m.Medicine = this.World.Assets.m.Medicine / 3;
		this.World.Assets.m.Ammo = this.World.Assets.m.ArmorParts / 2;
	}

	function onSpawnPlayer()
	{
		local spawnTile;
		local settlements = this.World.EntityManager.getSettlements();
		local nearestVillage;
		local navSettings = this.World.getNavigator().createSettings();
		navSettings.ActionPointCosts = this.Const.World.TerrainTypeNavCost_Flat;

		do
		{
			local x = this.Math.rand(5, this.Const.World.Settings.SizeX - 5);
			local y = this.Math.rand(5, this.Const.World.Settings.SizeY - 5);

			if (!this.World.isValidTileSquare(x, y))
			{
			}
			else
			{
				local tile = this.World.getTileSquare(x, y);

				if (tile.IsOccupied)
				{
				}
				else if (tile.Type != this.Const.World.TerrainType.Forest && tile.Type != this.Const.World.TerrainType.SnowyForest && tile.Type != this.Const.World.TerrainType.LeaveForest && tile.Type != this.Const.World.TerrainType.AutumnForest)
				{
				}
				else
				{
					local next = true;

					foreach( s in settlements )
					{
						local d = s.getTile().getDistanceTo(tile);

						if (d > 6 && d < 15)
						{
							local path = this.World.getNavigator().findPath(tile, s.getTile(), navSettings, 0);

							if (!path.isEmpty())
							{
								next = false;
								nearestVillage = s;
								break;
							}
						}
					}

					if (next)
					{
					}
					else
					{
						spawnTile = tile;
						break;
					}
				}
			}
		}
		while (1);

		this.World.State.m.Player = this.World.spawnEntity("scripts/entity/world/player_party", spawnTile.Coords.X, spawnTile.Coords.Y);
		this.World.Assets.updateLook(10);
		this.World.getCamera().setPos(this.World.State.m.Player.getPos());
		local f = nearestVillage.getFactionOfType(this.Const.FactionType.NobleHouse);
		//f.addPlayerRelation(-20.0, "Heard rumors of you poaching in their woods");
		this.Time.scheduleEvent(this.TimeUnit.Real, 1000, function ( _tag )
		{
			this.Music.setTrackList(this.Const.Music.IntroTracks, this.Const.Music.CrossFadeTime);
			this.World.Events.fire("event.rangers_scenario_intro");
		}, null);
	}

	function onInit()
	{
		for( local i = 5; i <= 8; i = ++i )
		{
			this.World.Assets.m.TerrainTypeSpeedMult[i] *= 1.2;
			//this.World.Assets.m.TerrainTypeVisionRadiusMult[i] *= 1.5;
			//this.World.Assets.m.TerrainTypeVisibilityMult[i] *= 0.5;
		}
	}

});

