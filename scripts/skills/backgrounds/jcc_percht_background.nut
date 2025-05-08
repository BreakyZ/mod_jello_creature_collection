this.jcc_percht_background <- this.inherit("scripts/skills/backgrounds/character_background", {
	m = {},
	function create()
	{
		this.character_background.create();
		this.m.ID = "background.jcc_percht";
		this.m.Name = "Percht";
		this.m.Icon = "ui/backgrounds/background_22.png";
		this.m.BackgroundDescription = "Perchts are dark spirits given flesh, with strength and resolve greater than any man\'s.";
		this.m.GoodEnding = "After fulfilling your end of the pact and retiring, %name% supposedly decided to stay in the mercenary life, having discovered a taste for mead and gold as opposed to flesh and blood. The %companyname% has since gained much infamy for the bloodthirsty, horned beast fighting in it\'s ranks. You hope he gets along well with the men.";
		this.m.BadEnding = "You found an out from the pact you so foolishly struck, and promptly left the men to fend for themselves. %name% is said to have deserted the %companyname%, the company finding itself ambushed by beasts shortly thereafter. Last you heard, a group of beastslayers returned from a hunt with a head matching his description.";
		this.m.HiringCost = 0;
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
		this.m.Faces = [];
		this.m.Hairs = [];
		this.m.HairColors = [];
		this.m.Beards = [];
		this.m.Bodies = [];
		this.m.Level = this.Math.rand(1, 3);
		this.m.IsCombatBackground = true;
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
				4,
				3
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
	}

});

