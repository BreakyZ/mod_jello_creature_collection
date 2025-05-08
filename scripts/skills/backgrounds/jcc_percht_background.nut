this.jcc_percht_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {
		HeadArmorBoost = 66,
		HeadDamageTaken = 0,
		BodyArmorBoost = 66,
		BodyDamageTaken = 0
	},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.jcc_percht";
		this.m.Name = "Percht";
		this.m.Icon = "ui/backgrounds/jcc_background_01.png";
		this.m.BackgroundDescription = "Perchts are dark spirits given flesh, with strength and resolve greater than any man\'s.";
		this.m.GoodEnding = "After fulfilling your end of the pact and retiring, %name% supposedly decided to stay in the mercenary life, having discovered a taste for mead and gold as opposed to flesh and blood. The %companyname% has since gained much infamy for the bloodthirsty, horned beast fighting in it\'s ranks. You hope he gets along well with the men.";
		this.m.BadEnding = "You found an out from the pact you had so foolishly struck, and promptly left the men to fend for themselves. %name% is said to have deserted the %companyname%, the company finding itself ambushed by beasts shortly thereafter. Last you heard, a group of beastslayers returned from a hunt with a head matching his description.";
		this.m.HiringCost = 100;
		this.m.DailyCost = 35;
		this.m.Excluded = [
			"trait.weasel",
			"trait.teamplayer",
			"trait.fear_undead",
			"trait.fear_beasts",
			"trait.fear_greenskins",
			"trait.fear_undead",
			"trait.fear_beasts",
			"trait.hate_beasts",
			"trait.clubfooted",
			"trait.short_sighted",
			"trait.insecure",
			"trait.hesitant",
			"trait.craven",
			"trait.fainthearted",
			"trait.dumb",
			"trait.superstitious",
			"trait.asthmatic"
		];
		this.m.Faces = null;
		this.m.Hairs = null;
		this.m.HairColors = null;
		this.m.Beards = null;
		this.m.Bodies = ["bust_percht_body_0"];
		this.m.Level = this.Math.rand(1, 3);
		this.m.IsCombatBackground = true;
	}
	function onCombatStarted()
	{
		this.m.HeadDamageTaken = 0;
		this.m.BodyDamageTaken = 0;
	}

	function onCombatFinished()
	{
		this.m.HeadDamageTaken = 0;
		this.m.BodyDamageTaken = 0;
	}
	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_hitInfo.BodyPart == this.Const.BodyPart.Head)
		{
			if (this.m.HeadDamageTaken >= this.m.HeadArmorBoost)
			{
				return;
			}

			_properties.DamageArmorReduction += this.m.HeadArmorBoost - this.m.HeadDamageTaken;
			this.m.HeadDamageTaken += _hitInfo.DamageArmor;
		}
		else if (_hitInfo.BodyPart == this.Const.BodyPart.Body)
		{
			if (this.m.BodyDamageTaken >= this.m.BodyArmorBoost)
			{
				return;
			}

			_properties.DamageArmorReduction += this.m.BodyArmorBoost - this.m.BodyDamageTaken;
			this.m.BodyDamageTaken += _hitInfo.DamageArmor;
		}
	}
	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 14,
				type = "text",
				icon = "ui/icons/bravery.png",
				text = "[color=" + this.Const.UI.Color.PositiveValue + "]+20[/color] Resolve at morale checks against fear, panic or mind control effects"
			},			
			{
				id = 15,
				type = "text",
				icon = "ui/icons/special.png",
				text = "Unable to equip armor and has access to a unique perk tree"
			},			
			{
				id = 16,
				type = "text",
				icon = "ui/icons/vision.png",
				text = "Unaffected by nighttime"
			}
		];
	}

	function onBuildDescription()
	{
		//return "{%name% appeared one day in %townname%, some say upon request {of the local council | of a local priest}. | %name% has a reputation of showing up where things out of the ordinary happen and being out and about at the darkest part of the night. | Being a quiet and grim man, %name% has the tendency to make other people feel uncomfortable around him, even afraid. | The name of %name% is known in many a village, for he has travelled the land to wherever his talents are needed the most.} {A Witchhunter he calls himself. With his assortment of exotic tools he has a great deal of experience in getting people to confess in agony their sinful liaisons with demons and devils under terrible torture. | He refers to himself as a Witchhunter, but only superstitious fools would believe this and fall for his preposterous tales. | A Witchhunter he calls himself, and he claims to have seen horrors from beyond that would drive a lesser man insane. | After his arrival in %townname%, rumors spread that he was on the hunt for devil worshippers and creatures of the night, but no one knew what the real purpose of his visit was. | In %townname% he killed an elderly woman and was thrown into the dungeon. As it turned out, the woman was responsible for the abduction and death of 3 infants, and so he was set free again. | For nights on end he sat in %townname%\'s pub, silently studying every patron like a bird of prey circling above, his crossbow never far away. It didn\'t sit well with the residents  but they didn\'t dare approach him.} {By now most of the local folks want %name% to be gone rather sooner than later and would happily see him join a travelling mercenary company. | It seems that whatever his mission was is now accomplished and so %name% offers his service as a mercenary. | It is somewhat obvious that %name% is not easily scared and he also knows how to handle a crossbow. Nobody was therefore surprised as he approached a mercenary company that was hiring. | Now, a mercenary company would be just the tool he needed to fulfill his personal quest against the evil from the world beyond. | Most people would be glad to get rid of him.}";
		return "{Young for a percht, %name% has nonetheless been alive since before your birth. | %name% has a reputation of showing up where things out of the ordinary happen and being out and about at the darkest part of the night. | Being a quiet and grim man, %name% has the tendency to make other people feel uncomfortable around him, even afraid. | The name of %name% is known in many a village, for he has travelled the land to wherever his talents are needed the most.} {A Witchhunter he calls himself. With his assortment of exotic tools he has a great deal of experience in getting people to confess in agony their sinful liaisons with demons and devils under terrible torture. | He refers to himself as a Witchhunter, but only superstitious fools would believe this and fall for his preposterous tales. | A Witchhunter he calls himself, and he claims to have seen horrors from beyond that would drive a lesser man insane. | After his arrival in %townname%, rumors spread that he was on the hunt for devil worshippers and creatures of the night, but no one knew what the real purpose of his visit was. | In %townname% he killed an elderly woman and was thrown into the dungeon. As it turned out, the woman was responsible for the abduction and death of 3 infants, and so he was set free again. | For nights on end he sat in %townname%\'s pub, silently studying every patron like a bird of prey circling above, his crossbow never far away. It didn\'t sit well with the residents  but they didn\'t dare approach him.} {By now most of the local folks want %name% to be gone rather sooner than later and would happily see him join a travelling mercenary company. | It seems that whatever his mission was is now accomplished and so %name% offers his service as a mercenary. | It is somewhat obvious that %name% is not easily scared and he also knows how to handle a crossbow. Nobody was therefore surprised as he approached a mercenary company that was hiring. | Now, a mercenary company would be just the tool he needed to fulfill his personal quest against the evil from the world beyond. | Most people would be glad to get rid of him.}";
	}

	function onSetAppearance()
	{
		local actor = this.getContainer().getActor();
		local tattoo_body = actor.getSprite("tattoo_body");
		local tattoo_head = actor.getSprite("tattoo_head");

		/*if (this.Math.rand(1, 100) <= 25)
		{
			local body = actor.getSprite("body");
			tattoo_body.setBrush("scar_02_" + body.getBrush().Name);
			tattoo_body.Visible = true;
		}*/

		if (this.Math.rand(1, 100) <= 25)
		{
			tattoo_head.setBrush("scar_02_head");
			tattoo_head.Visible = true;
		}
	}

	function updateAppearance()
	{
		local actor = this.getContainer().getActor();
		local tattoo_body = actor.getSprite("tattoo_body");

		/*if (tattoo_body.HasBrush)
		{
			local body = actor.getSprite("body");
			tattoo_body.setBrush("scar_02_" + body.getBrush().Name);
		}*/
	}

	function onChangeAttributes()
	{
		local c = {
			Hitpoints = [
				220,
				250
			],
			Bravery = [
				12,
				10
			],
			Stamina = [
				15,
				10
			],
			MeleeSkill = [
				11,
				10
			],
			RangedSkill = [
				9,
				7
			],
			MeleeDefense = [
				6,
				5
			],
			RangedDefense = [
				0,
				-4
			],
			Initiative = [
				4,
				2
			]
		};
		return c;
	}

	function onAdded()
	{
		this.character_background.onAdded();

		local items = this.getContainer().getActor().getItems();
			//ineloquent solution for forcing the item assigned to any of these slots via hotkey to be unassigned and returned to ground or stash. We squish this code later.
			//Note that 'item.unequip();' does not work.

			if (items.getItemAtSlot(this.Const.ItemSlot.Head))
			{
				local item = items.getItemAtSlot(this.Const.ItemSlot.Head);
				item.drop();
			}

			if (items.getItemAtSlot(this.Const.ItemSlot.Body))
			{
				local item = items.getItemAtSlot(this.Const.ItemSlot.Body);
				item.drop();
			}

			items.getData()[this.Const.ItemSlot.Head][0] = -1;
			items.getData()[this.Const.ItemSlot.Body][0] = -1;

		/*if (this.Math.rand(0, 3) == 3)
		{
			local actor = this.getContainer().getActor();
			//actor.setTitle(this.Const.Strings.WitchhunterTitles[this.Math.rand(0, this.Const.Strings.WitchhunterTitles.len() - 1)]);
		}*/
	}

	function onAddEquipment()
	{
		local items = this.getContainer().getActor().getItems();
		local r;
		r = this.Math.rand(0, 8);

		if (r == 0)
		{
			items.equip(this.new("scripts/items/weapons/percht_spetum"));
		}		
		else if(r == 1)
		{
			items.equip(this.new("scripts/items/weapons/greenskins/orc_javelin"));
		}
		else if(r == 2)
		{
			items.equip(this.new("scripts/items/weapons/greenskins/orc_wooden_club"));
		}
		else if(r == 3)
		{
			items.equip(this.new("scripts/items/weapons/greenskins/orc_metal_club"));
		}
		else if(r == 4)
		{
			items.equip(this.new("scripts/items/weapons/percht_flail"));
		}
		else if(r == 5)
		{
			items.equip(this.new("scripts/items/weapons/percht_whip"));
		}
		else if(r == 6)
		{
			items.equip(this.new("scripts/items/weapons/percht_bow"));
			items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));
		}
	}

	function onUpdate( _properties )
	{
		this.character_background.onUpdate(_properties);
		_properties.IsAffectedByNight = false;
		_properties.MoraleCheckBravery[1] += 20;
		_properties.ActionPoints += 1;		
		_properties.Armor[this.Const.BodyPart.Head] += this.Math.max(0.0, this.m.HeadArmorBoost - this.m.HeadDamageTaken);
		_properties.Armor[this.Const.BodyPart.Body] += this.Math.max(0.0, this.m.BodyArmorBoost - this.m.BodyDamageTaken);
		_properties.ArmorMax[this.Const.BodyPart.Head] += this.m.HeadArmorBoost;
		_properties.ArmorMax[this.Const.BodyPart.Body] += this.m.BodyArmorBoost;
	}

});

