this.jcc_beastslayer <- this.inherit("scripts/entity/tactical/human", {
	m = {
		spawnedWithShield = false
		},
	function create()
	{
		this.m.Type = this.Const.EntityType.JccBeastslayer;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.JccBeastslayer.XP;
		this.human.create();
		this.m.Faces = this.Const.Faces.AllMale;
		this.m.Hairs = this.Const.Hair.AllMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.All;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/jcc_beastslayer_agent");
		this.m.AIAgent.setActor(this);
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.JccBeastslayer);
		b.IsSpecializedInSwords = true;
		b.IsSpecializedInAxes = true;
		b.IsSpecializedInMaces = true;
		b.IsSpecializedInFlails = true;
		b.IsSpecializedInPolearms = true;
		b.IsSpecializedInThrowing = true;
		b.IsSpecializedInHammers = true;
		b.IsSpecializedInSpears = true;
		b.IsSpecializedInCleavers = true;
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.setAppearance();
		this.getSprite("socket").setBrush("bust_base_militia");
		this.m.Skills.add(this.new("scripts/skills/perks/perk_brawny"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_quick_hands"));
		//this.m.Skills.add(this.new("scripts/skills/perks/perk_battle_forged"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_dodge"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_backstabber"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_steel_brow"));
		this.m.Skills.add(this.new("scripts/skills/effects/captain_effect"));

		this.m.Skills.add(this.new("scripts/skills/actives/footwork"));
		this.m.Skills.add(this.new("scripts/skills/actives/recover_skill"));
	}

	function onAppearanceChanged( _appearance, _setDirty = true )
	{
		this.actor.onAppearanceChanged(_appearance, false);
		this.setDirty(true);
	}

	function assignRandomEquipment()
	{
		local r;
		local weapons;

		//weapons
		{
			if (this.Math.rand(1, 100) <= 60)
			{
				weapons = [
					"weapons/warfork",
					"weapons/spetum",
					"weapons/longsword",
					"weapons/hand_axe",
					"weapons/boar_spear",
					"weapons/morning_star",
					"weapons/arming_sword",
					"weapons/scimitar",
					"weapons/scramasax",
					"weapons/two_handed_mace",
					"weapons/two_handed_hammer",
					"weapons/longaxe",
					"weapons/basilisk_hammer",
					"weapons/percht_axe"
					];

				this.m.Items.equip(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));
			}
			else
			{
				this.m.Skills.add(this.new("scripts/skills/actives/fake_drink_night_vision_skill"));
				this.m.Skills.add(this.new("scripts/skills/racial/spider_racial"));

				r = this.Math.rand(0, 2);

					if (r == 0)
					{
						this.m.Items.equip(this.new("scripts/items/weapons/throwing_axe"));
					}
					else if (r == 1)
					{
						this.m.Items.equip(this.new("scripts/items/weapons/throwing_spear"));
					}
					else if (r == 2)
					{
						this.m.Items.equip(this.new("scripts/items/weapons/javelin"));
					}

				r = this.Math.rand(0, 2);

					if (r == 0)
					{
						this.m.Items.addToBag(this.new("scripts/items/weapons/scramasax"));
					}
					else if (r == 1)
					{
						this.m.Items.addToBag(this.new("scripts/items/weapons/boar_spear"));
					}
					else if (r == 2)
					{
						this.m.Items.addToBag(this.new("scripts/items/weapons/arming_sword"));
					}
			}

			if (this.m.Items.getItemAtSlot(this.Const.ItemSlot.Offhand) == null)
			{
				if (this.Math.rand(1, 100) <= 50)
				{

					this.m.Skills.add(this.new("scripts/skills/actives/indomitable"));
					r = this.Math.rand(0, 3);

					if (r == 0)
					{
						this.m.Items.equip(this.new("scripts/items/shields/wooden_shield_old"));
					}
					else if (r == 1)
					{
						this.m.Items.equip(this.new("scripts/items/shields/worn_heater_shield"));
					}
					else if (r == 2)
					{
						this.m.Items.equip(this.new("scripts/items/shields/worn_kite_shield"));
					}
					else
					{					
						this.m.Items.equip(this.new("scripts/items/shields/special/craftable_schrat_shield"));
					}
					this.m.spawnedWithShield = true;
				}
				else
				{
					this.m.Skills.add(this.new("scripts/skills/perks/perk_duelist"));
					r = this.Math.rand(0, 2);

					if (r == 0)
					{
						this.m.Items.equip(this.new("scripts/items/tools/throwing_net"));
					}
					else if (r == 1)
					{
						this.m.Items.equip(this.new("scripts/items/tools/reinforced_throwing_net"));
					}
					else if (r == 2)
					{
						this.m.Items.equip(this.new("scripts/items/tools/acid_flask_item"));
					}
				}
			}

			if (this.Math.rand(1, 100) <= 30){
					r = this.Math.rand(0, 2);

					if (r == 0)
					{
						this.m.Items.addToBag(this.new("scripts/items/tools/throwing_net"));
					}
					else if (r == 1)
					{
						this.m.Items.addToBag(this.new("scripts/items/tools/reinforced_throwing_net"));
					}
					else if (r == 2)
					{
						this.m.Items.addToBag(this.new("scripts/items/tools/acid_flask_item"));
					}
			}
		}

		//armor
		{
			if(this.Math.rand(1, 100) <= 20){
				r = this.Math.rand(1, 2);

				if (r == 1)
				{
					this.m.Items.equip(this.new("scripts/items/armor/werewolf_hide_armor"));
				}
				else
				{
					this.m.Items.equip(this.new("scripts/items/armor/werewolf_mail_armor"));
				}
			} 
			else {
				if (this.Const.DLC.Unhold)
				{
					r = this.Math.rand(1, 7);
					local armor;

					if (r == 1)
					{
						armor = this.new("scripts/items/armor/ragged_dark_surcoat");
					}
					else if (r == 2)
					{
						armor = (this.new("scripts/items/armor/blotched_gambeson"));
					}
					else if (r == 3)
					{
						armor = (this.new("scripts/items/armor/patched_mail_shirt"));
					}
					else if (r == 4)
					{
						armor = (this.new("scripts/items/armor/lamellar_harness"));
					}
					else if (r == 5)
					{
						armor = (this.new("scripts/items/armor/footman_armor"));
					}
					else if (r == 6)
					{
						armor = (this.new("scripts/items/armor/light_scale_armor"));
					}
					else
					{
						armor = (this.new("scripts/items/armor/leather_scale_armor"));
					}

					local upgrades = [
						"scripts/items/armor_upgrades/jcc_basilisk_cloak",
						"scripts/items/armor_upgrades/additional_padding_upgrade",
						"scripts/items/armor_upgrades/bone_platings_upgrade",
						"scripts/items/armor_upgrades/direwolf_pelt_upgrade",
						"scripts/items/armor_upgrades/hyena_fur_upgrade",
						"scripts/items/armor_upgrades/light_padding_replacement_upgrade",
						"scripts/items/armor_upgrades/mail_patch_upgrade",
						"scripts/items/armor_upgrades/unhold_fur_upgrade",
						"scripts/items/armor_upgrades/joint_cover_upgrade",
						"scripts/items/armor_upgrades/protective_runes_upgrade"
					];

					local upgrade = this.new(upgrades[this.Math.rand(1, upgrades.len() - 1)]);

					if(this.m.Items.getItemAtSlot(this.Const.ItemSlot.Mainhand)=="scripts/items/weapons/percht_axe")
					{
						upgrade = "scripts/items/armor_upgrades/protective_runes_upgrade";
					}

					if(this.Math.rand(1, 100) <= 80){
						armor.setUpgrade(upgrade);
					}

					this.m.Items.equip(armor);

				}
			}

			if (this.Math.rand(1, 100) <= 95)
			{
				local helmets = [
					"scripts/items/helmets/greatsword_hat",
					"scripts/items/helmets/feathered_hat",
					"scripts/items/helmets/hunters_hat",
					"scripts/items/helmets/greatsword_faction_helm",
					"scripts/items/helmets/hood",
					"scripts/items/helmets/mail_coif",
					"scripts/items/helmets/reinforced_mail_coif",
					"scripts/items/helmets/headscarf",
					"scripts/items/helmets/kettle_hat",
					"scripts/items/helmets/kettle_hat_with_mail",
					"scripts/items/helmets/barbarians/bear_headpiece",
					"scripts/items/helmets/closed_flat_top_helmet",
					"scripts/items/helmets/barbute_helmet",
					"scripts/items/helmets/bascinet_with_mail"
				];

				this.m.Items.equip(this.new(helmets[this.Math.rand(1, helmets.len() - 1)]));
			}

			if (this.Math.rand(1, 100) <= 30)
			{
				local accessory = [
					"scripts/items/accessory/ghoul_trophy_item",
					"scripts/items/accessory/alp_trophy_item",
					"scripts/items/accessory/hexen_trophy_item",
					"scripts/items/accessory/cat_potion_item",
					"scripts/items/accessory/lionheart_potion_item",					
					"scripts/items/accessory/recovery_potion_item",
					"scripts/items/accessory/iron_will_potion_item",
					"scripts/items/accessory/night_vision_elixir_item",
					"scripts/items/accessory/spider_poison_item",
					"scripts/items/accessory/antidote_item"
				];

				this.m.Items.equip(this.new(accessory[this.Math.rand(1, accessory.len() - 1)]));
			}

		};
	}

	function makeMiniboss()
	{

		if (!this.actor.makeMiniboss())
		{
			return false;
		}

		this.m.Skills.add(this.new("scripts/skills/racial/spider_racial"));

		local weapons;
		local r;

		this.getSprite("miniboss").setBrush("bust_miniboss");
		if(this.m.spawnedWithShield==true){
 			weapons = [
				"weapons/named/named_axe",
				"weapons/named/named_cleaver",
				"weapons/named/named_mace",
				"weapons/named/named_sword",
			];
		}
		else{
			
			this.m.Skills.add(this.new("scripts/skills/perks/perk_duelist"));
			 weapons = [
				"weapons/named/named_axe",
				"weapons/named/named_cleaver",
				"weapons/named/named_greataxe",
				"weapons/named/named_greatsword",
				"weapons/named/named_mace",
				"weapons/named/named_sword",
				"weapons/named/named_two_handed_hammer",
				"weapons/named/named_warbrand"
			];
		}
		

		if (this.Const.DLC.Unhold)
		{
			weapons.extend([
				"weapons/named/named_two_handed_mace",
				"weapons/named/named_two_handed_flail"
			]);
		}

		if (this.Const.DLC.Wildmen)
		{
			weapons.extend([
				"weapons/named/named_bardiche"
			]);
		}

		local armor;
		r = this.Math.rand(1, 7);
					local armor;

					if (r == 1)
					{
						armor = this.new("scripts/items/armor/ragged_dark_surcoat");
					}
					else if (r == 2)
					{
						armor = (this.new("scripts/items/armor/blotched_gambeson"));
					}
					else if (r == 3)
					{
						armor = (this.new("scripts/items/armor/patched_mail_shirt"));
					}
					else if (r == 5)
					{
						armor = (this.new("scripts/items/armor/footman_armor"));
					}
					else if (r == 6)
					{
						armor = (this.new("scripts/items/armor/light_scale_armor"));
					}
					else
					{
						armor = (this.new("scripts/items/armor/leather_scale_armor"));
					}

		armor.setUpgrade(this.new("scripts/items/armor_upgrades/lindwurm_scales_upgrade"));
		this.m.Items.equip(armor);

		r = this.Math.rand(1, 3);


		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/" + weapons[this.Math.rand(0, weapons.len() - 1)]));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/named/lindwurm_helmet"));
		}
		else
		{
			this.m.Items.equip(this.new("scripts/items/armor/named/lindwurm_armor"));
		}

		if(this.m.spawnedWithShield){
			this.m.Items.equip(this.new("scripts/items/shields/special/craftable_lindwurm_shield"));
		}



		this.m.Skills.add(this.new("scripts/skills/perks/perk_relentless"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_nimble"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_lone_wolf"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_captain"));
		return true;
	}

	function generateName()
	{
		this.m.Name = this.Const.Strings.JccBeastslayerNames[this.Math.rand(0, this.Const.Strings.JccBeastslayerNames.len() - 1)] + " " +this.Const.Strings.JccBeastslayerTitles[this.Math.rand(0, this.Const.Strings.JccBeastslayerTitles.len() - 1)] ;
	}

});

