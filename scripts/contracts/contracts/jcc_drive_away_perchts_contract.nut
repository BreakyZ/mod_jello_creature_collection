this.jcc_drive_away_perchts_contract <- this.inherit("scripts/contracts/contract", {
	m = {
		Destination = null,
		Dude = null,
		Reward = 0,
		OriginalReward = 0
	},
	function create()
	{
		this.contract.create();
		this.m.Type = "contract.jcc_drive_away_perchts";
		this.m.Name = "Drive Off Beasts";
		this.m.TimeOut = this.Time.getVirtualTimeF() + this.World.getTime().SecondsPerDay * 7.0;
	}



	function onImportIntro()
	{
		this.importSettlementIntro();
	}

	function start()
	{
		local banditcamp = this.World.FactionManager.getFactionOfType(this.Const.FactionType.Beasts).getNearestSettlement(this.m.Home.getTile());

		/*if(banditcamp.getTypeID() != "location.jcc_djinn_camp"){
			this.Flags.set("IsPerchtCamp", true);
		}
		else{
			this.Flags.set("IsPerchtCamp", false);
		}*/

		this.m.Destination = this.WeakTableRef(banditcamp);
		this.m.Flags.set("DestinationName", banditcamp.getName());
		//this.m.Flags.set("RobberBaronName", this.generateName());
		this.m.Payment.Pool = 550 * this.getPaymentMult() * this.Math.pow(this.getDifficultyMult(), this.Const.World.Assets.ContractRewardPOW) * this.getReputationToPaymentMult();

		if (this.Math.rand(1, 100) <= 33)
		{
			this.m.Payment.Completion = 0.75;
			this.m.Payment.Advance = 0.25;
		}
		else
		{
			this.m.Payment.Completion = 1.0;
		}

		this.contract.start();
	}

	function createStates()
	{
		this.m.States.push({
			ID = "Offer",
			function start()
			{
				this.Contract.m.BulletpointsObjectives = [
					"Drive off Beasts at " + this.Flags.get("DestinationName") + " %direction% of %origin%"
				];

				if (this.Math.rand(1, 100) <= this.Const.Contracts.Settings.IntroChance)
				{
					this.Contract.setScreen("Intro");
				}
				else
				{
					this.Contract.setScreen("Task");
				}
			}

			function end()
			{
				this.World.Assets.addMoney(this.Contract.m.Payment.getInAdvance());
				this.Contract.m.Destination.clearTroops();
				this.Contract.m.Destination.setLastSpawnTimeToNow();

				if (this.Contract.getDifficultyMult() <= 1.15 && !this.Contract.m.Destination.getFlags().get("IsEventLocation"))
				{
					this.Contract.m.Destination.getLoot().clear();
				}

				this.Contract.addUnitsToEntity(this.Contract.m.Destination, this.Const.World.Spawn.JccPercht, 110 * this.Contract.getDifficultyMult() * this.Contract.getScaledDifficultyMult());
				this.Contract.m.Destination.setLootScaleBasedOnResources(110 * this.Contract.getDifficultyMult() * this.Contract.getScaledDifficultyMult());
				this.Contract.m.Destination.setResources(this.Math.min(this.Contract.m.Destination.getResources(), 70 * this.Contract.getDifficultyMult() * this.Contract.getScaledDifficultyMult()));
				this.Contract.m.Destination.setDiscovered(true);
				this.World.uncoverFogOfWar(this.Contract.m.Destination.getTile().Pos, 500.0);

				if (this.World.Assets.getBusinessReputation() >= 500 && this.Contract.getDifficultyMult() >= 0.95 && this.Math.rand(1, 100) <= 20)
				{
					this.Flags.set("IsLindwurmFight", true);

					/*if (this.World.Assets.getBusinessReputation() > 600 && this.Math.rand(1, 100) <= 50)
					{
						this.Flags.set("IsBountyHunterPresent", true);
					}*/
				}
				else if (this.World.Assets.getBusinessReputation() >= 500 && this.Contract.getDifficultyMult() >= 0.95 && this.Math.rand(1, 100) <= 20)
				{
					this.Flags.set("IsHexenFight", true);

					/*if (this.World.Assets.getBusinessReputation() > 600 && this.Math.rand(1, 100) <= 50)
					{
						this.Flags.set("IsBountyHunterPresent", true);
					}*/
				}

				this.Contract.setScreen("Overview");
				this.World.Contracts.setActiveContract(this.Contract);
			}

		});
		this.m.States.push({
			ID = "Running",
			function start()
			{
				if (this.Contract.m.Destination != null && !this.Contract.m.Destination.isNull())
				{
					this.Contract.m.Destination.getSprite("selection").Visible = true;
					this.Contract.m.Destination.setOnCombatWithPlayerCallback(this.onDestinationAttacked.bindenv(this));
				}
			}

			function update()
			{
				if (this.Contract.m.Destination == null || this.Contract.m.Destination.isNull())
				{
					/*if (this.Flags.get("IsRobberBaronDead"))
					{
						this.Contract.setScreen("RobberBaronDead");
						this.World.Contracts.showActiveContract();
					}
					else if (this.Math.rand(1, 100) <= 10)
					{
						this.Contract.setScreen("Survivors1");
						this.World.Contracts.showActiveContract();
					}
					else if (this.Math.rand(1, 100) <= 10 && this.World.getPlayerRoster().getSize() < this.World.Assets.getBrothersMax())
					{
						this.Contract.setScreen("Volunteer1");
						this.World.Contracts.showActiveContract();
					}*/
					if (this.Math.rand(1, 100) <= 10)
					{
						this.Contract.setScreen("Survivors1");
						this.World.Contracts.showActiveContract();
					}

					this.Contract.setState("Return");
				}
			}

			function onDestinationAttacked( _dest, _isPlayerAttacking = true )
			{
				if (this.Flags.get("IsLindwurmFight"))
				{
					if (!this.Flags.get("IsAttackDialogTriggered"))
					{
						this.Flags.set("IsAttackDialogTriggered", true);
						this.Contract.setScreen("AttackLindwurm");
						this.World.Contracts.showActiveContract();
					}
					else
					{
						local properties = this.World.State.getLocalCombatProperties(this.World.State.getPlayer().getPos());
						properties.Music = this.Const.Music.BeastsTracks;
						properties.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Line;
						properties.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Circle;
						properties.Entities.push({
							ID = this.Const.EntityType.Lindwurm,
							Variant = 0,
							Row = 2,
							Script = "scripts/entity/tactical/enemies/lindwurm",
							Faction = this.Const.Faction.Enemy,
							Callback = this.onLindwurmPlaced.bindenv(this)
						});
						properties.EnemyBanners.push(this.Contract.m.Destination.getBanner());
						this.World.Contracts.startScriptedCombat(properties, true, true, true);
					}
				}
				else if (this.Flags.get("IsHexenFight"))
				{
					if (!this.Flags.get("IsAttackDialogTriggered"))
					{
						this.Flags.set("IsAttackDialogTriggered", true);
						this.Contract.setScreen("AttackHexen");
						this.World.Contracts.showActiveContract();
					}
					else
					{
						local properties = this.World.State.getLocalCombatProperties(this.World.State.getPlayer().getPos());
						properties.Music = this.Const.Music.BeastsTracks;
						properties.Entities.push({
							ID = this.Const.EntityType.Hexe,
							Variant = 0,
							Row = 2,
							Script = "scripts/entity/tactical/enemies/hexe",
							Faction = _dest.getFaction(),
							Callback = this.onHexenPlaced.bindenv(this)
						});
						properties.EnemyBanners.push(this.Contract.m.Destination.getBanner());
						this.World.Contracts.startScriptedCombat(properties, true, true, true);
					}
				}
				else
				{
					this.World.Contracts.showCombatDialog();
				}
			}
			
			function onHexenPlaced( _entity, _tag )
			{/*
				_entity.getFlags().set("IsRobberBaron", true);
				_entity.setName(this.Flags.get("RobberBaronName"));*/
			}

			function onLindwurmPlaced( _entity, _tag )
			{/*
				_entity.getFlags().set("IsRobberBaron", true);
				_entity.setName(this.Flags.get("RobberBaronName"));*/
			}

			function onActorKilled( _actor, _killer, _combatID )
			{
				/*if (_actor.getFlags().get("IsRobberBaron") == true)
				{
					this.Flags.set("IsRobberBaronDead", true);
				}*/
			}

		});
		this.m.States.push({
			ID = "Return",
			function start()
			{
				this.Contract.m.BulletpointsObjectives = [
					"Return to " + this.Contract.m.Home.getName()
				];
				this.Contract.m.Home.getSprite("selection").Visible = true;
			}

			function update()
			{
				if (this.Contract.isPlayerAt(this.Contract.m.Home))
				{
					/*if (this.Flags.get("IsRobberBaronDead"))
					{
						this.Contract.setScreen("Success2");
					}
					else
					{
						this.Contract.setScreen("Success1");
					}*/

					this.Contract.setScreen("Success1");

					this.World.Contracts.showActiveContract();
				}

				/*if (this.Flags.get("IsRobberBaronDead") && this.Flags.get("IsBountyHunterPresent") && !this.TempFlags.get("IsBountyHunterTriggered") && this.World.Events.getLastBattleTime() + 7.0 < this.Time.getVirtualTimeF() && this.Math.rand(1, 1000) <= 2)
				{
					this.Contract.setScreen("BountyHunters1");
					this.World.Contracts.showActiveContract();
				}
				else if (this.Flags.get("IsBountyHunterRetreat"))
				{
					this.Contract.setScreen("BountyHunters3");
					this.World.Contracts.showActiveContract();
				}*/
			}

			function onCombatVictory( _combatID )
			{
				/*if (_combatID == "BountyHunters")
				{
					this.Flags.set("IsBountyHunterPresent", false);
				}*/
			}

			function onRetreatedFromCombat( _combatID )
			{
				/*if (_combatID == "BeastSlayers")
				{
					this.Flags.set("IsBountyHunterPresent", false);
					this.Flags.set("IsBountyHunterRetreat", true);
					this.Flags.set("IsRobberBaronDead", false);
				}*/
			}

		});
	}

	function createScreens()
	{
		this.importScreens(this.Const.Contracts.NegotiationDefault);
		this.importScreens(this.Const.Contracts.Overview);
		this.m.Screens.push({
			ID = "Task",
			Title = "Negotiations",
			Text = "[img]gfx/ui/events/event_20.png[/img]{%employer% is listening to the ravings of an old man when you find him.%SPEECH_ON%Horns about ye big I\'m telling ya! A-and eyes glowing like coals! Picked up m\'dog like a loaf of bread and tore him in half!%SPEECH_OFF%Both men turn to look at you, but thankfully only %employer% speaks.%SPEECH_ON%Ah, sellsword, this is %randomname%. He - and many others - have been telling me about sightings of horned men in the woods, near %location% to be precise. If devils have truly come to destroy us, I need a man with a strong sword-arm to send them back to their abyss. Interested?%SPEECH_OFF%The old man pipes up, spit flying as he squeals.%SPEECH_ON%You stick the fuckers for my dog, y\'hear?%SPEECH_OFF% | %employer% is in the process of skinning a deer as you enter the room, the animal looking more like it was mauled than hunted. You nod towards it.%SPEECH_ON%That pelt looks like shite.%SPEECH_OFF%%employer% wipes his hands before turning to you.%SPEECH_ON%Aye, shoddy work for a poacher. If it was a poacher at all, I mean. Didn\'t take any meat neither.%SPEECH_OFF% He begins to cut through the skull plate to remove the antlers, the one part of the carcass that\'s been left untouched.%SPEECH_ON%We found it near %location%, barely knew it for a deer at first, poor thing had been stuck with enough arrows and javelins to die twice over.%SPEECH_OFF%You ask if he wants you to hunt down this poacher of his before he clears out the whole forest. He pauses.%SPEECH_ON%Yes and no. See, a man wouldn\'t risk the noose for a bit of bloodsport. Whatever killed this stag was inhuman, orcs maybe... or something worse. Regardless, I need you to find the culprit and stick them like their quarry.%SPEECH_OFF% | %employer% sits facing the wall, a servant stitching lacerations on his back. Hearing you enter, he turns to speak to you, much to the servant\'s protest.%SPEECH_ON%The other day I lead the town\'s gentlefolk to destroy %location%, a place that\'s said to be a haven for dark spirits, but we were ambushed along the way. Don\'t think many others made it back in one piece... or at all.%SPEECH_OFF% Only half-listening, you marvel at the wounds upon the man\'s back, no man-made weapon or beast\'s claw could cause gashes such as this. %employer% notices your inquisitive stare. %SPEECH_ON%I did not get a good look at them, but they certainly did get me good...%SPEECH_OFF%He attempts to stand, once again drawing the servant\'s ire.%SPEECH_ON%It\'s clear this will take more than a poorly armed mob. Care to get even in my stead?%SPEECH_OFF% | You find %employer% sitting at his table with a decapitated head across from him and a grim expression upon his face. He glances towards you.%SPEECH_ON%This is - or was - %randomname%, a friend and beastslayer of some renown. Men and women have been disappearing around here and he offered to lend us his aid for nary a trifle. He left to investigate %location% a week ago, today however I was met with... this in front of my doorstep. Eyes plucked from their sockets and his nose cut off.%SPEECH_OFF%He stands to gaze outside the window.%SPEECH_ON%I no longer believe this to be the work of simple beasts, something must be leading them. Something with a penchant for sadistic cruelty and derision.%SPEECH_OFF%He now looks towards you, his expression shifting for the first time since you entered.%SPEECH_ON%Will you aid us, sellsword?%SPEECH_OFF%}",
			Image = "",
			List = [],
			ShowEmployer = true,
			ShowDifficulty = true,
			Options = [
				{
					Text = "{How many crowns are we talking about? | What is %townname% prepared to pay for their safety? | Let\'s talk money.}",
					function getResult()
					{
						return "Negotiation";
					}

				},
				{
					Text = "{Not interested. | We have more important matters to settle. | I wish you luck, but we\'ll not be part of this.}",
					function getResult()
					{
						this.World.Contracts.removeContract(this.Contract);
						return 0;
					}

				}
			],
			function start()
			{
			}

		});
		this.m.Screens.push({
			ID = "AttackLindwurm",
			Title = "Before the attack...",
			Text = "[img]gfx/ui/events/event_129.png[/img]{You\'re preparing the men for the assault on %location%, when you hear a roar coming from its premises. Breaking through the underbrush, you see horned men try - and fail - to restrain a Lindwurm! The beast spits and hisses, wresting itself free from its former masters\' control. Taking advantage of the chaos, you order the men to charge.}",
			Image = "",
			List = [],
			Options = [
				{
					Text = "Prepare the attack!",
					function getResult()
					{
						this.Contract.getActiveState().onDestinationAttacked(this.Contract.m.Destination);
						return 0;
					}

				}
			]
		})
		this.m.Screens.push({
			ID = "AttackHexen",
			Title = "Before the attack...",
			Text = "[img]gfx/ui/events/event_106.png[/img]{Closing in on %location%, you are surprised to spot a congregation gathered in between the stone pillars. Two silhouettes stand in the middle. A large, clawed hand grips a small, gnarled one. Only when they turn towards your company do you realize that one of them is a Hexe. It seems you\'ve stumbled upon the conclusion of some dark pact!}",
			Image = "",
			List = [],
			Options = [
				{
					Text = "Prepare the attack!",
					function getResult()
					{
						this.Contract.getActiveState().onDestinationAttacked(this.Contract.m.Destination);
						return 0;
					}

				}
			]
		});/*
		this.m.Screens.push({
			ID = "RobberBaronDead",
			Title = "After the battle...",
			Text = "[img]gfx/ui/events/event_22.png[/img]{The battle finished, you walk over to %robberbaron%\'s slain body and remove his head with two quick thwacks of your sword, the first cutting the meat, the second the bone. You drive a hook through the lip of neckflesh and draw a rope so as to attach it your hip. | With the fighting over, you quickly search for and find %robberbaron%\'s corpse amongst the dead. He still looks mighty mean even as the color leaves his body. He still looks quite  mean when you relieve his head of his body and though you can\'t see his face any longer as you toss his head into a burlap sack, you assume he still looks pretty mean then, too. | %robberbaron% lies dead at your feet. You turn the body over and straighten out the neck, giving your sword a better target. It takes two good cuts to remove the head which you quickly put into a mealsack. | Now that he\'s dead, %robberbaron% suddenly reminds you of a lot of men you used to know. You don\'t settle on the deja vu for long: with a few quick slashes of a sword, you remove the man\'s head before tossing it into a sack. | %robberbaron% put up a good fight and his neck put up another, the sinews and bones not letting his head go easily as you collect your bounty. | You collect %robberbaron%\'s head. %randombrother% points at it as you walk past.%SPEECH_ON%What is that? Is that %robberbaron%\'s...?%SPEECH_OFF%You shake your head.%SPEECH_ON%Naw, that man is dead. This here is just bonus pay.%SPEECH_OFF%}",
			Image = "",
			List = [],
			Options = [
				{
					Text = "We move out!",
					function getResult()
					{
						return 0;
					}

				}
			]
		});
		this.m.Screens.push({
			ID = "BountyHunters1",
			Title = "Along the way...",
			Text = "[img]gfx/ui/events/event_07.png[/img]{Heading back to collect on your contract, a few men step out onto the road. One of them points at the head of %robberbaron%. %SPEECH_ON%We are the highest paid bounty hunters in these parts and I believe you\'re carrying off a bit of our business. Give us that there head and all parties shall get to sleep in their beds tonight.%SPEECH_OFF%You laugh.%SPEECH_ON%You will have to try better than that. %robberbaron%\'s head is worth a lot of crowns, my friend.%SPEECH_OFF%The leader of these supposed bounty hunters laughs right back at you. He lifts up a bulbously weighted sack.%SPEECH_ON%This here is %randomname%, one of the more wanted fellas in these parts. And this...%SPEECH_OFF%He holds up another sack.%SPEECH_ON%Is the head of the man who killed him. Understand? So hand over the bounty and we can all be on our way.%SPEECH_OFF% | A man steps out onto the road, straightens up, and postures toward you.%SPEECH_ON%Hello good sirs. I believe you have the head of %robberbaron% in your midst.%SPEECH_OFF%You nod. The man smiles.%SPEECH_ON%Would you please kindly turn it over to me.%SPEECH_OFF%You laugh and shake your head. The man doesn\'t smile, instead he raises a hand and snaps his fingers. A throng of well-armed men pour out of some nearby bushes, marching onto the road to the tune of heavy metal clinks and clanks. They look like what a man on death row might dream of the night before his reckoning. Their leader flashes a gold-speckled grin.%SPEECH_ON%I\'m not gonna ask you again.%SPEECH_OFF% | While talking to %randombrother%, a loud yell draws your attention. You look up the road to see a mob of men standing in your way. They got all manner of weaponry and armor. Their ringleader steps forward, announcing that they are famed bounty hunters.%SPEECH_ON%We only wish to have the head of %robberbaron%.%SPEECH_OFF%You shrug.%SPEECH_ON%We killed the man, we\'re collecting on his head. Now get out of our way.%SPEECH_OFF%When you take one step forward, the bounty hunters raise their weapons. Their leader takes one step toward you.%SPEECH_ON%There\'s a choice to be made here that could get a lot of good men killed. I know it isn\'t easy, but I do suggest you think it over very carefully.%SPEECH_OFF% | A sharp whistle draws the attention of you and your men. You turn to the side of the road to see a group of men emerging from some bushes. Everyone draws their weapons, but the strangers don\'t move a foot further. Their ringleader steps forward. He\'s got a bandolier of ears going across his chest, a summation of his handiwork.%SPEECH_ON%Hello fellas. We here are bounty hunters, if you couldn\'t tell, and I do believe you have one of our bounties.%SPEECH_OFF%You lift the head of %robberbaron%.%SPEECH_ON%You mean this?%SPEECH_OFF%The ringleader smiles warmly.%SPEECH_ON%Of course. Now if you could please hand it over, that\'d sit pretty well with me and my friends.%SPEECH_OFF%Tapping the hilt of his sword, the man grins.%SPEECH_ON%It\'s only a matter of business. I\'m sure you understand.%SPEECH_OFF%}",
			Image = "",
			List = [],
			Options = [
				{
					Text = "Take the damned head then and leave.",
					function getResult()
					{
						this.Flags.set("IsRobberBaronDead", false);
						this.Flags.set("IsBountyHunterPresent", false);
						this.World.Assets.addBusinessReputation(this.Const.World.Assets.ReputationOnContractPoor);
						return "BountyHunters2";
					}

				},
				{
					Text = "{You\'ll have to pay with blood if you want it so badly. | If you want your head to join this one, go on, take your chances.}",
					function getResult()
					{
						//this.TempFlags.set("IsBountyHunterTriggered", true);
						this.World.Assets.addBusinessReputation(this.Const.World.Assets.ReputationOnContractSuccess);
						local tile = this.World.State.getPlayer().getTile();
						local p = this.Const.Tactical.CombatInfo.getClone();
						p.Music = this.Const.Music.BanditTracks;
						p.TerrainTemplate = this.Const.World.TerrainTacticalTemplate[tile.TacticalType];
						p.Tile = tile;
						p.CombatID = "BountyHunters";
						p.PlayerDeploymentType = this.Const.Tactical.DeploymentType.Line;
						p.EnemyDeploymentType = this.Const.Tactical.DeploymentType.Line;
						this.Const.World.Common.addUnitsToCombat(p.Entities, this.Const.World.Spawn.BountyHunters, 130 * this.Contract.getDifficultyMult() * this.Contract.getScaledDifficultyMult(), this.World.FactionManager.getFactionOfType(this.Const.FactionType.Bandits).getID());
						this.World.Contracts.startScriptedCombat(p, false, true, true);
						return 0;
					}

				}
			]
		});
		this.m.Screens.push({
			ID = "BountyHunters2",
			Title = "Along the way...",
			Text = "[img]gfx/ui/events/event_07.png[/img]You\'ve seen enough bloodshed for today and hand the head over.",
			Image = "",
			List = [],
			Options = [
				{
					Text = "Let\'s move on. We still have payment to collect.",
					function getResult()
					{
						return 0;
					}

				}
			]
		});
		this.m.Screens.push({
			ID = "BountyHunters3",
			Title = "Along the way...",
			Text = "[img]gfx/ui/events/event_07.png[/img]The bounty hunters are too much for the %companyname%! Not wanting your men needlessly killed, you order a hasty retreat. Unfortunately, the head of %robberbaron% was lost in the chaos...",
			Image = "",
			List = [],
			Options = [
				{
					Text = "Oh well. We still have payment to collect.",
					function getResult()
					{
						this.Flags.set("IsBountyHunterRetreat", false);
						return 0;
					}

				}
			]
		});*/
		this.m.Screens.push({
			ID = "Survivors1",
			Title = "After the battle...",
			Text = "[img]gfx/ui/events/event_44.png[/img]{With their dark masters slain, the remaining beasts make for the trees - save for one. A wolf, the runt of the litter perhaps, is staring you down, tilting its head as if to ask how you to intend to deal with it. You can use all the help you can get these days, so you decide to beckon it closer with a sliver of meat. It hungrily snatches it from your hands and guzzles it down before looking up expectantly. Obliging the beast, you throw another piece of meat. When it looks towards you to ask for a third meal you tell it to fuck off and go to leave, the wolf happily prancing by your side. | The battle has all but ended when you spot %randombrother% trying to wrestle his boot from a wolf\'s jaws. The rest of the %companyname% are just about to start placing bets, when the beast wins the tug-of-war and begins to run off. Stopping short of the thicket\'s edge, the wolf turns to look back at your company and - to your surprise - brazenly approaches you, dropping the chewed-out, drool-covered boot in front of your feet.%randombrother% slaps your shoulder with a grin.%SPEECH_ON%Maybe you can teach it to fetch your shoes when we get back.%SPEECH_OFF%Aye, maybe.}",
			Image = "",
			List = [],
			Options = [
				{
					Text = "Welcome to the company.",
					function getResult( _event )
					{
						return 0;
					}
				}
			],
			function start( _event )
			{
				local item = this.new("scripts/items/accessory/wolf_item");
				item.m.Name = "Coal the Wolf";
				this.World.Assets.getStash().add(item);
				this.List.push({
					id = 10,
					icon = "ui/items/" + item.getIcon(),
					text = "You gain " + item.getName()
				});
			}
		});
		/*this.m.Screens.push({
			ID = "Survivors2",
			Title = "After the battle...",
			Text = "[img]gfx/ui/events/event_22.png[/img]{Altruism is for the naive. You have the prisoners slaughtered. | You recall how many times brigands slew hapless merchants. The thought is barely out of your mind when you give the order to have the prisoners executed. They pipe up a brief protest, but it is cut short by swords and spears. | You turn away.%SPEECH_ON%Through their necks. Make it quick.%SPEECH_OFF%The mercenaries follow the order and you soon here the gargling of dying men. It is not quick at all. | You shake your head \'no\'. The prisoners cry out, but the men are already upon them, hacking and slashing and stabbing. The lucky ones are decapitated before they can even realize the immediacy of their own demise. Those with some fight in them suffer to the very end. | Mercy requires time. Time to look over your shoulder. Time to wonder if it was the right decision. You\'ve no time. You\'ve no mercy. The prisoners are executed and that takes little time at all.}",
			Image = "",
			List = [],
			Options = [
				{
					Text = "We have more important things to take care of.",
					function getResult()
					{
						return 0;
					}

				}
			]
		});
		this.m.Screens.push({
			ID = "Survivors3",
			Title = "After the battle...",
			Text = "[img]gfx/ui/events/event_22.png[/img]{There\'s been enough killing and dying today. You let the prisoners go, taking their arms and armor before sending them off. | Clemency for thieves and brigands doesn\'t come often, so when you let the prisoners go they practically kiss your feet as though they were attached to a god. | You think for a time, then nod.%SPEECH_ON%Mercy it is. Take their equipment and cut them loose.%SPEECH_OFF%The prisoners are let go, leaving behind what arms and armor they had with them. | You have the brigands strip to their skivvies - if they even have them - then let the men go. %randombrother% rummages through what equipment is left behind as you watch a group of half-naked men hurry away.}",
			Image = "",
			List = [],
			Options = [
				{
					Text = "We\'re not getting paid for killing them.",
					function getResult()
					{
						return 0;
					}

				}
			]
		});
		this.m.Screens.push({
			ID = "Volunteer1",
			Title = "After the battle...",
			Text = "[img]gfx/ui/events/event_22.png[/img]{Just as the battle ends and things begin to quiet, you hear a man shouting. You move toward the noise to find a prisoner of the brigands. He\'s got ropes over his mouth and hands which you quickly undo. As he catches his breath, he meekly asks if maybe he could join your outfit. | You find a prisoner tied up in the brigands\' camp. Freeing him, he explains that he is from %randomtown%, and was kidnapped by the vagabonds just a few days ago. He asks if maybe he could join your band of mercenaries. | Rummaging what\'s left of the brigands\' camp, you discover a prisoner of theirs. Freeing him, the man sits up and explains that the brigands kidnapped him as he was traveling to %randomtown% in seek of work. You wonder if maybe he could work for you instead... | A man is left behind after the battle. He\'s not a brigand, but in fact a prisoner of theirs. When you ask who he is, he mentions that he is from %randomtown% and that he\'s looking for work. You ask if he can wield a sword. He nods.}",
			Image = "",
			Characters = [],
			List = [],
			Options = [
				{
					Text = "You might as well join us.",
					function getResult()
					{
						return "Volunteer2";
					}

				},
				{
					Text = "Go home.",
					function getResult()
					{
						return "Volunteer3";
					}

				}
			],
			function start()
			{
				local roster = this.World.getTemporaryRoster();
				this.Contract.m.Dude = roster.create("scripts/entity/tactical/player");
				this.Contract.m.Dude.setStartValuesEx(this.Const.CharacterLaborerBackgrounds);

				if (this.Contract.m.Dude.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand) != null)
				{
					this.Contract.m.Dude.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).removeSelf();
				}

				this.Characters.push(this.Contract.m.Dude.getImagePath());
			}

		});
		this.m.Screens.push({
			ID = "Volunteer2",
			Title = "After the battle...",
			Text = "[img]gfx/ui/events/event_22.png[/img]{The man joins your ranks, immersing himself in a crowd of brothers who seem to take to him warmly enough for a group of paid killers. The newly hired states he\'s good with all weapons, but you figure you\'ll be the one to decide what he\'s best with. | The prisoner grins from ear to ear as you wave him in. A few brothers ask what weapons they should give him, but you shrug and figure you\'ll see to yourself what to arm the man with.}",
			Image = "",
			Characters = [],
			List = [],
			Options = [
				{
					Text = "Let\'s see about a weapon for you.",
					function getResult()
					{
						return 0;
					}

				}
			],
			function start()
			{
				this.Characters.push(this.Contract.m.Dude.getImagePath());
				this.World.getPlayerRoster().add(this.Contract.m.Dude);
				this.World.getTemporaryRoster().clear();
				this.Contract.m.Dude.onHired();
				this.Contract.m.Dude = null;
			}

		});
		this.m.Screens.push({
			ID = "Volunteer3",
			Title = "After the battle...",
			Text = "[img]gfx/ui/events/event_22.png[/img]{You shake your head no. The man frowns.%SPEECH_ON%Are you sure? I\'m pretty good with...%SPEECH_OFF%You cut him off.%SPEECH_ON%I\'m sure. Now enjoy your newfound freedom, stranger.%SPEECH_OFF% | You appraise the man and figure he\'s not fit for the life of a sellsword.%SPEECH_ON%We appreciate the offer, stranger, but the mercenary life is a dangerous one. Go home to your family, your work, your home.%SPEECH_OFF% | You\'ve enough men to see you through, although you find yourself tempted to replace %randombrother% just to see the man\'s reaction to a demotion. Instead, you offer the prisoner a handshake and send him on his way. Although disappointed, he does thank you for freeing him.}",
			Image = "",
			Characters = [],
			List = [],
			Options = [
				{
					Text = "Off you go.",
					function getResult()
					{
						return 0;
					}

				}
			],
			function start()
			{
				this.Characters.push(this.Contract.m.Dude.getImagePath());
				this.World.getTemporaryRoster().clear();
				this.Contract.m.Dude = null;
			}

		});*/
		this.m.Screens.push({
			ID = "Success1",
			Title = "On your return...",
			Text = "[img]gfx/ui/events/event_04.png[/img]{%employer% is partaking in a roasted goat when you enter his chambers. You place a bagged head on his table, its horns peeking out from its burlap prison. The man briefly pauses with a mouthful of goat, then nods towards his chamberlain, who stands on duty with a purse of crowns. You ask %employer% if he won\'t look at the head. He swallows, shaking his head.%SPEECH_ON%Hells no, sellsword. I can see that head ain\'t human and I\'d rather not spoil my appetite.%SPEECH_OFF%You shrug.%SPEECH_ON%Aye, fair \'nough%SPEECH_OFF%Taking the purse, you make your leave. | Upon returning to %townname% you relay the details of your hunt. You speak of the various beasts at the clearing and the human remains littering the grass. %employer% solemnly makes note of everything you say. Sighing, he hands over your payment.%SPEECH_ON%Good work, beastslayer. Let us hope that was the end of it.%SPEECH_OFF%You nod, but catch yourself thinking you\'d rather the beasts come back so you can earn another pile of crowns. | When you return, you see that a crowd has formed around a pyre in the town square, %employer% standing next to a bound woman, torch in hand. He\'s addressing the onlookers when he spots you amongst the townsfolk. Cutting his speech short with a stammer, he drops the torch and the pyre goes aflame, cheers erupting from the crowd as he comes to greet you.%SPEECH_ON%We think she was in league with them things, started wailing like a madwoman shortly after you set off. I take it your hunt was successful?%SPEECH_OFF%You pull a head from a burlap sack. Smiling, %employer% raises his voice to be heard over the now screaming captive.%SPEECH_ON%That\'s that then. Good work, mercenary.%SPEECH_OFF%He trades you the head for a hefty purse, and tosses it into the fire by the horns, causing another burst of flames and another cheer. You leave before people think to burn any more of your trophies. | The head you present to %employer% looks eerily still, as though it wasn\'t snarling at you moments before. As he drones on about a job well done and his eternal gratitude, you can feel the world fade around you, until only you and your trophy remain. You\'re being drawn ever closer, the floorboards beneath you turning into an inky void. Inhuman voices drown out your own and you believe to see the Percht\'s eyes slowly open, when %employer% puts his hand on your shoulder, bringing you back into his dusty chambers. Seemingly unaware of the trance he just took you from, he hands you your hard-earned crowns. The purse sits heavy in your hands, grounding you. You go to leave without another word, but pause and glance back at %employer%, your hand already on the door. The head is just a head. Its eyes remain shut and with that, you take your leave.}",
			Image = "",
			Characters = [],
			List = [],
			ShowEmployer = true,
			Options = [
				{
					Text = "Crowns well deserved.",
					function getResult()
					{
						this.World.Assets.addBusinessReputation(this.Const.World.Assets.ReputationOnContractSuccess);
						this.World.Assets.addMoney(this.Contract.m.Payment.getOnCompletion());
						this.World.FactionManager.getFaction(this.Contract.getFaction()).addPlayerRelation(this.Const.World.Assets.RelationCivilianContractSuccess, "Destroyed a brigand encampment");
						this.World.Contracts.finishActiveContract();
						return 0;
					}

				}
			],
			function start()
			{
				this.Contract.m.Reward = this.Contract.m.Payment.getOnCompletion();
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You gain [color=" + this.Const.UI.Color.PositiveEventValue + "]" + this.Contract.m.Reward + "[/color] Crowns"
				});


				this.Contract.m.SituationID = this.Contract.resolveSituation(this.Contract.m.SituationID, this.Contract.m.Home, this.List);
			}

		});
		/*this.m.Screens.push({
			ID = "Success2",
			Title = "On your return...",
			Text = "[img]gfx/ui/events/event_04.png[/img]{You throw the criminal\'s head on %employer%\'s table. With a grin, you point at it.%SPEECH_ON%That\'s %robberbaron%.%SPEECH_OFF%%employer% stands up and unveils the burlap sack covering the trophy. He nods.%SPEECH_ON%Aye, that\'s him alright. I guess you\'ll be getting extra for that.%SPEECH_OFF%You\'re paid a tidy sum of %reward% crowns for killing the brigands as well as destroying the leadership of many nearby syndicates. | %employer% leans back as you enter his room, carrying a head by its hair. Luckily, it is not dripping.%SPEECH_ON%This here is %robberbaron%. Or should I say was?%SPEECH_OFF%Slowly standing, %employer% takes a cursory look.%SPEECH_ON%\'Was\' works... So, not only did you destroy the brigands\' rat hole, but you\'ve brought me the head of their leader. That is some mighty fine work, sellsword, and you\'ll be getting extra for this.%SPEECH_OFF%The man forks over a satchel of %original_reward% crowns and then takes a purse off his own self and pitches it toward you. | You hold %robberbaron%\'s head up, its sloped gaze turning to the ropes of bloodied hair. A slow smile etches across %employer%\'s face.%SPEECH_ON%You know what you\'ve done, sellsword? Do you know how much relief you\'ve brought to these parts just by removing that man\'s head from his shoulders? You\'ll be getting more than what you bargained for! %original_reward% crowns for the original task and...%SPEECH_OFF%The man slides a chunky purse across his table.%SPEECH_ON%A little something for that... extra weight you\'ve been carrying around.%SPEECH_OFF%}",
			Image = "",
			List = [],
			ShowEmployer = true,
			Options = [
				{
					Text = "Crowns well deserved.",
					function getResult()
					{
						this.World.Assets.addBusinessReputation(this.Const.World.Assets.ReputationOnContractSuccess);
						this.World.Assets.addMoney(this.Contract.m.Payment.getOnCompletion() * 2);
						this.World.FactionManager.getFaction(this.Contract.getFaction()).addPlayerRelation(this.Const.World.Assets.RelationCivilianContractSuccess, "Destroyed a brigand encampment");
						this.World.Contracts.finishActiveContract();
						return 0;
					}

				}
			],
			function start()
			{
				this.Contract.m.Reward = this.Contract.m.Payment.getOnCompletion() * 2;
				this.Contract.m.OriginalReward = this.Contract.m.Payment.getOnCompletion();
				this.List.push({
					id = 10,
					icon = "ui/icons/asset_money.png",
					text = "You gain [color=" + this.Const.UI.Color.PositiveEventValue + "]" + this.Contract.m.Reward + "[/color] Crowns"
				});
				this.Contract.m.SituationID = this.Contract.resolveSituation(this.Contract.m.SituationID, this.Contract.m.Home, this.List);
			}

		});*/
	}

	function onPrepareVariables( _vars )
	{
		_vars.push([
			"location",
			this.m.Flags.get("DestinationName")
		]);
		_vars.push([
			"reward",
			this.m.Reward
		]);
		_vars.push([
			"original_reward",
			this.m.OriginalReward
		]);
		_vars.push([
			"totalenemy",
			this.m.Destination != null && !this.m.Destination.isNull() ? this.beautifyNumber(this.m.Destination.getTroops().len()) : 0
		]);
		_vars.push([
			"direction",
			this.m.Destination == null || this.m.Destination.isNull() || !this.m.Destination.isAlive() ? "" : this.Const.Strings.Direction8[this.m.Home.getTile().getDirection8To(this.m.Destination.getTile())]
		]);
	}

	function onHomeSet()
	{
		if (this.m.SituationID == 0)
		{
			this.m.SituationID = this.m.Home.addSituation(this.new("scripts/entity/world/settlements/situations/disappearing_villagers_situation"));
		}
	}

	function onClear()
	{
		if (this.m.IsActive)
		{
			if (this.m.Destination != null && !this.m.Destination.isNull())
			{
				this.m.Destination.getSprite("selection").Visible = false;
				this.m.Destination.setOnCombatWithPlayerCallback(null);
			}

			this.m.Home.getSprite("selection").Visible = false;
		}

		if (this.m.Home != null && !this.m.Home.isNull() && this.m.SituationID != 0)
		{
			local s = this.m.Home.getSituationByInstance(this.m.SituationID);

			if (s != null)
			{
				s.setValidForDays(4);
			}
		}
	}

	function onIsValid()
	{
		if (this.m.IsStarted)
		{
			if (this.m.Destination == null || this.m.Destination.isNull() || !this.m.Destination.isAlive())
			{
				return false;
			}

			return true;
		}
		else
		{
			return true;
		}
	}

	function onSerialize( _out )
	{
		_out.writeI32(0);

		if (this.m.Destination != null && !this.m.Destination.isNull())
		{
			_out.writeU32(this.m.Destination.getID());
		}
		else
		{
			_out.writeU32(0);
		}

		this.contract.onSerialize(_out);
	}

	function onDeserialize( _in )
	{
		_in.readI32();
		local destination = _in.readU32();

		if (destination != 0)
		{
			this.m.Destination = this.WeakTableRef(this.World.getEntityByID(destination));
		}

		this.contract.onDeserialize(_in);
	}

});

