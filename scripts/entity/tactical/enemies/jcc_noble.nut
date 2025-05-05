this.jcc_noble <- this.inherit("scripts/entity/tactical/human", {
		m = {
		Properties = [],
		Titles = []
	},
	function getProperties()
	{
		return this.m.Properties;
	}

	function getTitles()
	{
		return this.m.Titles;
	}
	function create()
	{
		this.m.Type = this.Const.EntityType.JccNoble;
		this.m.BloodType = this.Const.BloodType.Red;
		this.m.XP = this.Const.Tactical.Actor.JccNoble.XP;
		this.human.create();
		this.m.Faces = this.Const.Faces.SmartMale;
		this.m.Hairs = this.Const.Hair.CommonMale;
		this.m.HairColors = this.Const.HairColors.All;
		this.m.Beards = this.Const.Beards.Tidy;
		this.m.AIAgent = this.new("scripts/ai/tactical/agents/jcc_noble_agent");
		this.m.AIAgent.setActor(this);
	}

	function onDeath( _killer, _skill, _tile, _fatalityType )
	{
		local item = this.m.Items.getItemAtSlot(this.Const.ItemSlot.Head); 

		if(item!=null){
			if(item.getID() == "armor.head.noble_headgear"){
				this.m.Items.unequip(this.m.Items.getItemAtSlot(this.Const.ItemSlot.Head));
			}
		}
		
				local appearance = this.getItems().getAppearance();
		local flip = this.Math.rand(0, 100) < 50;
		this.m.IsCorpseFlipped = flip;

		if (_tile != null)
		{
			local sprite_body = this.getSprite("body");
			local sprite_head = this.getSprite("head");
			local sprite_hair = this.getSprite("hair");
			local sprite_beard = this.getSprite("beard");
			local sprite_beard_top = this.getSprite("beard_top");
			//local sprite_surcoat = this.getSprite("surcoat");
			local sprite_accessory = this.getSprite("accessory");
			local sprite_accessory_special = this.getSprite("accessory_special");
			local sprite_body_tattoo = this.getSprite("tattoo_body");
			local sprite_head_tattoo = this.getSprite("tattoo_head");
			local decal = _tile.spawnDetail(sprite_body.getBrush().Name + "_dead", this.Const.Tactical.DetailFlag.Corpse, flip, false, this.Const.Combat.HumanCorpseOffset);
			decal.Color = sprite_head.Color;
			decal.Saturation = sprite_head.Saturation;
			decal.Scale = 0.9;
			decal.setBrightness(0.9);

			if (sprite_body_tattoo.HasBrush && this.doesBrushExist(sprite_body_tattoo.getBrush().Name + "_dead"))
			{
				local decal = _tile.spawnDetail(sprite_body_tattoo.getBrush().Name + "_dead", this.Const.Tactical.DetailFlag.Corpse, flip, false, this.Const.Combat.HumanCorpseOffset);
				decal.Color = sprite_head.Color;
				decal.Saturation = sprite_head.Saturation;
				decal.Scale = 0.9;
				decal.setBrightness(0.9);
			}

			if (appearance.CorpseArmor != "")
			{
				decal = _tile.spawnDetail(appearance.CorpseArmor, this.Const.Tactical.DetailFlag.Corpse, flip, false, this.Const.Combat.HumanCorpseOffset);
				decal.Scale = 0.9;
				decal.setBrightness(0.9);
			}

			/*if (this.m.Surcoat != null)
			{
				decal = _tile.spawnDetail("surcoat_" + (this.m.Surcoat < 10 ? "0" + this.m.Surcoat : this.m.Surcoat) + "_dead", this.Const.Tactical.DetailFlag.Corpse, flip, false, this.Const.Combat.HumanCorpseOffset);
				decal.Scale = 0.9;
				decal.setBrightness(0.9);
			}*/

			if (appearance.CorpseArmorUpgradeBack != "")
			{
				decal = _tile.spawnDetail(appearance.CorpseArmorUpgradeBack, this.Const.Tactical.DetailFlag.Corpse, flip, false, this.Const.Combat.HumanCorpseOffset);
				decal.Scale = 0.9;
				decal.setBrightness(0.9);
			}

			if (sprite_accessory.HasBrush && this.doesBrushExist(sprite_accessory.getBrush().Name + "_dead"))
			{
				decal = _tile.spawnDetail(sprite_accessory.getBrush().Name + "_dead", this.Const.Tactical.DetailFlag.Corpse, flip, false, this.Const.Combat.HumanCorpseOffset);
				decal.Scale = 0.9;
				decal.setBrightness(0.9);
			}

			if (sprite_accessory_special.HasBrush && this.doesBrushExist(sprite_accessory_special.getBrush().Name + "_dead"))
			{
				decal = _tile.spawnDetail(sprite_accessory_special.getBrush().Name + "_dead", this.Const.Tactical.DetailFlag.Corpse, flip, false, this.Const.Combat.HumanCorpseOffset);
				decal.Scale = 0.9;
				decal.setBrightness(0.9);
			}

			if (_fatalityType == this.Const.FatalityType.None && (!_skill || _skill.getProjectileType() == this.Const.ProjectileType.None) && this.Math.rand(1, 100) <= 33)
			{
				decal = _tile.spawnDetail("dead_body_splatter", this.Const.Tactical.DetailFlag.Corpse, flip, false, this.Const.Combat.HumanCorpseOffset);
				decal.Alpha = 160;
			}

			if (_fatalityType == this.Const.FatalityType.Disemboweled)
			{
				decal = _tile.spawnDetail("bust_body_guts_0" + this.Math.rand(1, 3), this.Const.Tactical.DetailFlag.Corpse, flip, false, this.Const.Combat.HumanCorpseOffset);
				decal.Scale = 0.9;
			}
			else if (_skill && _skill.getProjectileType() == this.Const.ProjectileType.Arrow)
			{
				if (appearance.CorpseArmor != "")
				{
					decal = _tile.spawnDetail(appearance.CorpseArmor + "_arrows", this.Const.Tactical.DetailFlag.Corpse, flip, false, this.Const.Combat.HumanCorpseOffset);
				}
				else
				{
					decal = _tile.spawnDetail(appearance.Corpse + "_arrows", this.Const.Tactical.DetailFlag.Corpse, flip, false, this.Const.Combat.HumanCorpseOffset);
				}

				decal.Scale = 0.9;
			}
			else if (_skill && _skill.getProjectileType() == this.Const.ProjectileType.Javelin)
			{
				if (appearance.CorpseArmor != "")
				{
					decal = _tile.spawnDetail(appearance.CorpseArmor + "_javelin", this.Const.Tactical.DetailFlag.Corpse, flip, false, this.Const.Combat.HumanCorpseOffset);
				}
				else
				{
					decal = _tile.spawnDetail(appearance.Corpse + "_javelin", this.Const.Tactical.DetailFlag.Corpse, flip, false, this.Const.Combat.HumanCorpseOffset);
				}

				decal.Scale = 0.9;
			}

			if (_fatalityType != this.Const.FatalityType.Decapitated)
			{
				if (!appearance.HideCorpseHead)
				{
					local decal = _tile.spawnDetail(sprite_head.getBrush().Name + "_dead", this.Const.Tactical.DetailFlag.Corpse, flip, false, this.Const.Combat.HumanCorpseOffset);
					decal.Color = sprite_head.Color;
					decal.Saturation = sprite_head.Saturation;
					decal.Scale = 0.9;
					decal.setBrightness(0.9);
				}

				if (sprite_head_tattoo.HasBrush && this.doesBrushExist(sprite_head_tattoo.getBrush().Name + "_dead"))
				{
					local decal = _tile.spawnDetail(sprite_head_tattoo.getBrush().Name + "_dead", this.Const.Tactical.DetailFlag.Corpse, flip, false, this.Const.Combat.HumanCorpseOffset);
					decal.Color = sprite_head.Color;
					decal.Saturation = sprite_head.Saturation;
					decal.Scale = 0.9;
					decal.setBrightness(0.9);
				}

				if (!appearance.HideBeard && !appearance.HideCorpseHead && sprite_beard.HasBrush)
				{
					local decal = _tile.spawnDetail(sprite_beard.getBrush().Name + "_dead", this.Const.Tactical.DetailFlag.Corpse, flip, false, this.Const.Combat.HumanCorpseOffset);
					decal.Color = sprite_beard.Color;
					decal.Saturation = sprite_beard.Saturation;
					decal.Scale = 0.9;
					decal.setBrightness(0.9);

					if (sprite_beard_top.HasBrush)
					{
						local decal = _tile.spawnDetail(sprite_beard_top.getBrush().Name + "_dead", this.Const.Tactical.DetailFlag.Corpse, flip, false, this.Const.Combat.HumanCorpseOffset);
						decal.Color = sprite_beard.Color;
						decal.Saturation = sprite_beard.Saturation;
						decal.Scale = 0.9;
						decal.setBrightness(0.9);
					}
				}

				if (!appearance.HideHair && !appearance.HideCorpseHead && sprite_hair.HasBrush)
				{
					local decal = _tile.spawnDetail(sprite_hair.getBrush().Name + "_dead", this.Const.Tactical.DetailFlag.Corpse, flip, false, this.Const.Combat.HumanCorpseOffset);
					decal.Color = sprite_hair.Color;
					decal.Saturation = sprite_hair.Saturation;
					decal.Scale = 0.9;
					decal.setBrightness(0.9);
				}

				if (_fatalityType == this.Const.FatalityType.Smashed)
				{
					decal = _tile.spawnDetail("bust_head_smashed_01", this.Const.Tactical.DetailFlag.Corpse, flip, false, this.Const.Combat.HumanCorpseOffset);
					decal.Scale = 0.9;
				}
				else if (appearance.HelmetCorpse != "")
				{
					local decal = _tile.spawnDetail(this.getItems().getAppearance().HelmetCorpse, this.Const.Tactical.DetailFlag.Corpse, flip, false, this.Const.Combat.HumanCorpseOffset);
					decal.Scale = 0.9;
					decal.setBrightness(0.9);
				}
			}
			else if (_fatalityType == this.Const.FatalityType.Decapitated)
			{
				local layers = [];

				if (!appearance.HideCorpseHead)
				{
					layers.push(sprite_head.getBrush().Name + "_dead");
				}

				if (!appearance.HideCorpseHead && sprite_head_tattoo.HasBrush && this.doesBrushExist(sprite_head_tattoo.getBrush().Name + "_dead"))
				{
					layers.push(sprite_head_tattoo.getBrush().Name + "_dead");
				}

				if (!appearance.HideBeard && sprite_beard.HasBrush)
				{
					layers.push(sprite_beard.getBrush().Name + "_dead");
				}

				if (!appearance.HideHair && sprite_hair.HasBrush)
				{
					layers.push(sprite_hair.getBrush().Name + "_dead");
				}

				if (appearance.HelmetCorpse.len() != 0)
				{
					layers.push(appearance.HelmetCorpse);
				}

				if (!appearance.HideBeard && sprite_beard_top.HasBrush)
				{
					layers.push(sprite_beard_top.getBrush().Name + "_dead");
				}

				local decap = this.Tactical.spawnHeadEffect(this.getTile(), layers, this.createVec(0, 0), -90.0, "bust_head_dead_bloodpool");
				local idx = 0;

				if (!appearance.HideCorpseHead)
				{
					decap[idx].Color = sprite_head.Color;
					decap[idx].Saturation = sprite_head.Saturation;
					decap[idx].Scale = 0.9;
					decap[idx].setBrightness(0.9);
					idx = ++idx;
				}

				if (!appearance.HideCorpseHead && sprite_head_tattoo.HasBrush && this.doesBrushExist(sprite_head_tattoo.getBrush().Name + "_dead"))
				{
					decap[idx].Scale = 0.9;
					decap[idx].setBrightness(0.9);
					idx = ++idx;
				}

				if (!appearance.HideBeard && sprite_beard.HasBrush)
				{
					decap[idx].Color = sprite_beard.Color;
					decap[idx].Saturation = sprite_beard.Saturation;
					decap[idx].Scale = 0.9;
					decap[idx].setBrightness(0.9);
					idx = ++idx;
				}

				if (!appearance.HideHair && sprite_hair.HasBrush)
				{
					decap[idx].Color = sprite_hair.Color;
					decap[idx].Saturation = sprite_hair.Saturation;
					decap[idx].Scale = 0.9;
					decap[idx].setBrightness(0.9);
					idx = ++idx;
				}

				if (appearance.HelmetCorpse.len() != 0)
				{
					decap[idx].Scale = 0.9;
					decap[idx].setBrightness(0.9);
					idx = ++idx;
				}

				if (!appearance.HideBeard && sprite_beard_top.HasBrush)
				{
					decap[idx].Color = sprite_beard.Color;
					decap[idx].Saturation = sprite_beard.Saturation;
					decap[idx].Scale = 0.9;
					decap[idx].setBrightness(0.9);
				}
			}

			if (appearance.CorpseArmorUpgradeFront != "")
			{
				decal = _tile.spawnDetail(appearance.CorpseArmorUpgradeFront, this.Const.Tactical.DetailFlag.Corpse, flip, false, this.Const.Combat.HumanCorpseOffset);
				decal.Scale = 0.9;
				decal.setBrightness(0.9);
			}

			this.spawnTerrainDropdownEffect(_tile);
			this.spawnFlies(_tile);
		}

		local deathLoot = this.getItems().getDroppableLoot(_killer);
		local tileLoot = this.getLootForTile(_killer, deathLoot);

		if (_fatalityType != this.Const.FatalityType.Unconscious)
		{
			this.dropLoot(_tile, tileLoot, !flip);
		}

		local corpse = this.generateCorpse(_tile, _fatalityType, _killer);

		if (_tile == null)
		{
			this.Tactical.Entities.addUnplacedCorpse(corpse);
		}
		else
		{
			_tile.Properties.set("Corpse", corpse);
			this.Tactical.Entities.addCorpse(_tile);
		}

		this.actor.onDeath(_killer, _skill, _tile, _fatalityType);
	}

	function onInit()
	{
		this.human.onInit();
		local b = this.m.BaseProperties;
		b.setValues(this.Const.Tactical.Actor.JccNoble);		
		b.IsSpecializedInSwords = true;
		b.IsSpecializedInDaggers = true;
		this.m.ActionPoints = b.ActionPoints;
		this.m.Hitpoints = b.Hitpoints;
		this.m.CurrentProperties = clone b;
		this.setAppearance();
		this.getSprite("socket").setBrush("bust_base_military");
		//this.m.Skills.add(this.new("scripts/skills/perks/perk_fast_adaption"));		
		this.m.Skills.add(this.new("scripts/skills/perks/perk_nimble"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_backstabber"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_anticipation"));
		this.m.Skills.add(this.new("scripts/skills/actives/rotation"));
		this.m.Skills.add(this.new("scripts/skills/actives/recover_skill"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_nine_lives"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_steel_brow"));
		this.m.Skills.add(this.new("scripts/skills/actives/rally_the_troops"));
		this.m.Skills.add(this.new("scripts/skills/perks/perk_captain"));


		if(this.Tactical.State.isScenarioMode()){
			this.m.Name = this.Const.Strings.NobleTitles[this.Math.rand(0, this.Const.Strings.NobleTitles.len() - 1)] + " " + this.Const.Strings.CharacterNames[this.Math.rand(0, this.Const.Strings.CharacterNames.len() - 1)];
		}

	}

	function assignRandomEquipment()
	{
		local r;
		r = this.Math.rand(1, 6);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/dagger"));
		}
		else if(r == 2){
			this.m.Items.equip(this.new("scripts/items/weapons/rondel_dagger"));
		}		
		else if(r == 3){
			this.m.Items.equip(this.new("scripts/items/weapons/arming_sword"));
		}
		else if(r == 4){
			this.m.Items.equip(this.new("scripts/items/weapons/noble_sword"));
		}

		if(!this.Tactical.State.isScenarioMode()){

			this.m.Surcoat = this.World.FactionManager.getFaction(this.getFaction()).getBanner();
			local surcoat = "surcoat_" + (this.m.Surcoat < 10 ? "0" + this.m.Surcoat : this.m.Surcoat);
			r = this.Math.rand(1, 7);
			local withDetails = true;
			local alwaysWithDetails = false;
			local withHelmet = true;

			if (r == 1)
			{
				this.m.Items.equip(this.new("scripts/items/armor/noble_tunic"));
				alwaysWithDetails = true;
			}
			else if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/armor/coat_of_plates"));
				withDetails = false;
				withHelmet = false;

				if (this.Math.rand(1, 100) <= 75)
				{
					this.getSprite("surcoat").setBrush(surcoat);
				}

				if (this.Math.rand(1, 100) <= 25)
				{
					local h = this.new("scripts/items/helmets/greatsword_faction_helm");
					h.setVariant(this.World.FactionManager.getFaction(this.getFaction()).getBanner());
					this.m.Items.equip(h);
				}

				if (this.Math.rand(1, 100) <= 33)
				{
					local variants = [
						"02",
						"10"
					];
					this.getSprite("surcoat").setBrush("bust_body_noble_" + variants[this.Math.rand(0, variants.len() - 1)]);
				}
			}
			else if (r == 3)
			{
				this.m.Items.equip(this.new("scripts/items/armor/coat_of_scales"));
				withDetails = false;
				withHelmet = false;

				if (this.Math.rand(1, 100) <= 75)
				{
					this.getSprite("surcoat").setBrush(surcoat);
				}

				if (this.Math.rand(1, 100) <= 25)
				{
					local h = this.new("scripts/items/helmets/greatsword_faction_helm");
					h.setVariant(this.World.FactionManager.getFaction(this.getFaction()).getBanner());
					this.m.Items.equip(h);
				}

				if (this.Math.rand(1, 100) <= 33)
				{
					local variants = [
						"02",
						"10"
					];
					this.getSprite("surcoat").setBrush("bust_body_noble_" + variants[this.Math.rand(0, variants.len() - 1)]);
				}
			}
			else
			{
				this.m.Items.equip(this.new("scripts/items/armor/noble_tunic"));
				alwaysWithDetails = true;
			}

			if (withDetails && (alwaysWithDetails || this.Math.rand(1, 100) <= 50))
			{
				local variants = [
					"01",
					"02",
					"03",
					"06",
					"09",
					"10"
				];
				this.getSprite("surcoat").setBrush("bust_body_noble_" + variants[this.Math.rand(0, variants.len() - 1)]);
			}

			if (withHelmet && this.Math.rand(1, 100) <= 50)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/noble_headgear"));
			}
		}
		else

		{


			local surcoat;
			r = this.Math.rand(1, 7);
			local withDetails = true;
			local alwaysWithDetails = false;
			local withHelmet = true;

			if (r == 1)
			{
				this.m.Items.equip(this.new("scripts/items/armor/noble_tunic"));
				alwaysWithDetails = true;
			}
			else if (r == 2)
			{
				this.m.Items.equip(this.new("scripts/items/armor/coat_of_plates"));
				withDetails = false;
				withHelmet = false;



				if (this.Math.rand(1, 100) <= 25)
				{
					local h = this.new("scripts/items/helmets/greatsword_faction_helm");
					h.setVariant(this.Math.rand(1,9));
					this.m.Items.equip(h);
				}

				if (this.Math.rand(1, 100) <= 75)
				{
					local variants = [
						"02",
						"10"
					];
					this.getSprite("surcoat").setBrush("bust_body_noble_" + variants[this.Math.rand(0, variants.len() - 1)]);
				}
			}
			else if (r == 3)
			{
				this.m.Items.equip(this.new("scripts/items/armor/coat_of_scales"));
				withDetails = false;
				withHelmet = false;



				if (this.Math.rand(1, 100) <= 25)
				{
					local h = this.new("scripts/items/helmets/greatsword_faction_helm");
					h.setVariant(this.Math.rand(1,9));
					this.m.Items.equip(h);
				}

				if (this.Math.rand(1, 100) <= 75)
				{
					local variants = [
						"02",
						"10"
					];
					this.getSprite("surcoat").setBrush("bust_body_noble_" + variants[this.Math.rand(0, variants.len() - 1)]);
				}
			}
			else
			{
				this.m.Items.equip(this.new("scripts/items/armor/noble_tunic"));
				alwaysWithDetails = true;
			}

			if (withDetails && (alwaysWithDetails || this.Math.rand(1, 100) <= 50))
			{
				local variants = [
					"01",
					"02",
					"03",
					"06",
					"09",
					"10"
				];
				this.getSprite("surcoat").setBrush("bust_body_noble_" + variants[this.Math.rand(0, variants.len() - 1)]);
			}

			if (withHelmet && this.Math.rand(1, 100) <= 50)
			{
				this.m.Items.equip(this.new("scripts/items/helmets/noble_headgear"));
			}
		}
	}

});

