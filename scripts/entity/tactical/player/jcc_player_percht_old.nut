this.jcc_player_percht_old <- this.inherit("scripts/entity/tactical/actor", {
	m = {
		spriteOffset=0,
		Level = 1,
		PerkPoints = 0,
		PerkPointsSpent = 0,
		LevelUps = 0,
		Mood = 3.0,
		MoodChanges = [],
		LastDrinkTime = 0,
		PlaceInFormation = 255,
		Background = null,
		HiringCost = 0,
		HireTime = 0.0,
		IsTryoutDone = false,
		IsGuest = false,
		Attributes = [],
		Talents = [],
		CombatStats = {
			DamageDealtHitpoints = 0,
			DamageDealtArmor = 0,
			DamageReceivedHitpoints = 0,
			DamageReceivedArmor = 0,
			Kills = 0,
			XPGained = 0
		},
		LifetimeStats = {
			Kills = 0,
			Battles = 0,
			BattlesWithoutMe = 0,
			MostPowerfulVanquished = "",
			MostPowerfulVanquishedXP = 0,
			MostPowerfulVanquishedType = 0,
			FavoriteWeapon = "",
			FavoriteWeaponUses = 0,
			CurrentWeaponUses = 0
		},		
		Bodies = ["bust_percht_body_0"],
		Faces = ["bust_percht_head_0"],
		Hairs = null,
		HairColors = null,
		Beards = null,
		BeardChance = 0,
		Body = 0,
		Head = 0,
		Surcoat = null,
		Ethnicity = 0,
		Gender = 0,
		VoiceSet = 0,
		IsEyesClosed = false,
		NextBlinkTime = 0.0
	},

	function onDamageReceived( _attacker, _skill, _hitInfo )
	{
		if (_hitInfo.DamageRegular == 0 && _hitInfo.DamageArmor == 0)
		{
			return 0;
		}

		if (this.m.Surcoat != null && this.getSprite("surcoat").HasBrush)
		{
			this.getSprite("surcoat").setBrush("surcoat_" + (this.m.Surcoat < 10 ? "0" + this.m.Surcoat : this.m.Surcoat) + "_damaged");
		}

		this.actor.onDamageReceived(_attacker, _skill, _hitInfo);
	}

	function getEthnicity()
	{
		return this.m.Ethnicity;
	}

	function setEyesClosed( _f )
	{
		this.m.IsEyesClosed = _f;
	}

	function setName( _value )
	{
		this.m.Name = _value;

		if (this.m.Background != null)
		{
			this.m.Background.buildDescription(true);
		}
	}

	function getTitle()
	{
		return this.m.Title;
	}

	function setTitle( _value )
	{
		this.m.Title = _value;

		if (this.m.Background != null)
		{
			this.m.Background.buildDescription(true);
		}
	}

	function getXP()
	{
		return this.m.XP;
	}

	function getXPValue()
	{
		return 100 + (this.m.Level - 1) * 30;
	}

	function getLevel()
	{
		return this.m.Level;
	}

	function getPerkPoints()
	{
		return this.m.PerkPoints;
	}

	function setPerkPoints( _value )
	{
		this.m.PerkPoints = _value;
	}

	function getPerkPointsSpent()
	{
		return this.m.PerkPointsSpent;
	}

	function getLevelUps()
	{
		return this.m.LevelUps;
	}

	function getTalents()
	{
		return this.m.Talents;
	}

	function getCombatStats()
	{
		return this.m.CombatStats;
	}

	function getLifetimeStats()
	{
		return this.m.LifetimeStats;
	}

	function getPlaceInFormation()
	{
		return this.m.PlaceInFormation;
	}

	function setPlaceInFormation( _p )
	{
		this.m.PlaceInFormation = _p;
	}

	function getHiringCost()
	{
		return this.m.HiringCost;
	}

	function getTryoutCost()
	{
		return this.Math.ceil(this.Math.max(10, this.Math.min(this.m.HiringCost - 25, 25 + this.m.HiringCost * 0.1) * this.World.Assets.m.TryoutPriceMult));
	}

	function getDailyCost()
	{
		return this.Math.max(0, this.m.CurrentProperties.DailyWage * this.m.CurrentProperties.DailyWageMult * (("State" in this.World) && this.World.State != null ? this.World.Assets.m.DailyWageMult : 1.0));
	}

	function getDailyFood()
	{
		return this.Math.maxf(0.0, this.m.CurrentProperties.DailyFood);
	}

	function getBackground()
	{
		return this.m.Background;
	}

	function getHireTime()
	{
		return this.m.HireTime;
	}

	function getLastDrinkTime()
	{
		return this.m.LastDrinkTime;
	}

	function setLastDrinkTime( _t )
	{
		this.m.LastDrinkTime = _t;
	}

	function setGuest( _f )
	{
		this.m.IsGuest = _f;
	}

	function isLeveled()
	{
		return (this.m.PerkPoints != 0 || this.m.LevelUps != 0) && !this.m.IsGuest;
	}

	function isGuest()
	{
		return this.m.IsGuest;
	}

	function isTryoutDone()
	{
		return this.m.IsTryoutDone;
	}

	function setTryoutDone( _t )
	{
		this.m.IsTryoutDone = _t;
	}

	function getMood()
	{
		return this.m.Mood;
	}

	function getMoodState()
	{
		return this.Math.floor(this.m.Mood);
	}

	function getMoodChanges()
	{
		return this.m.MoodChanges;
	}

	function improveMood( _a = 1.0, _reason = "" )
	{
		this.m.Mood = this.Math.minf(this.m.Mood + _a, this.Const.MoodState.len() - 0.05);

		if (_reason != "")
		{
			local time = 0.0;

			if (("State" in this.World) && this.World.State != null && this.World.State.getCombatStartTime() != 0)
			{
				time = this.World.State.getCombatStartTime();
			}
			else
			{
				time = this.Time.getVirtualTimeF();
			}

			if (this.m.MoodChanges.len() >= 1 && this.m.MoodChanges[0].Text == _reason)
			{
				this.m.MoodChanges[0].Time = time;
			}
			else
			{
				if (this.m.MoodChanges.len() >= 5)
				{
					this.m.MoodChanges.remove(this.m.MoodChanges.len() - 1);
				}

				this.m.MoodChanges.insert(0, {
					Positive = true,
					Text = _reason,
					Time = time
				});
			}
		}

		this.getSkills().update();
	}

	function worsenMood( _a = 1.0, _reason = "" )
	{
		this.m.Mood = this.Math.maxf(this.m.Mood - _a, 0.0);

		if (_reason != "")
		{
			local time = 0.0;

			if (("State" in this.World) && this.World.State != null && this.World.State.getCombatStartTime() != 0)
			{
				time = this.World.State.getCombatStartTime();
			}
			else
			{
				time = this.Time.getVirtualTimeF();
			}

			if (this.m.MoodChanges.len() >= 1 && this.m.MoodChanges[0].Text == _reason)
			{
				this.m.MoodChanges[0].Time = time;
			}
			else
			{
				if (this.m.MoodChanges.len() >= 5)
				{
					this.m.MoodChanges.remove(this.m.MoodChanges.len() - 1);
				}

				this.m.MoodChanges.insert(0, {
					Positive = false,
					Text = _reason,
					Time = time
				});
			}
		}

		this.getSkills().update();
	}

	function recoverMood()
	{
		if (this.m.MoodChanges.len() != 0 && this.m.MoodChanges[this.m.MoodChanges.len() - 1].Time + this.Const.MoodChange.Timeout < this.Time.getVirtualTimeF())
		{
			this.m.MoodChanges.remove(this.m.MoodChanges.len() - 1);
		}

		if (this.m.Mood < 3.1500001)
		{
			local mult = this.getSkills().hasSkill("trait.optimist") ? this.Const.MoodChange.OptimistMult : 1.0;
			local diff = this.Math.maxf(this.Const.MoodChange.RecoveryPerHour, (3.1500001 - this.m.Mood) * this.Const.MoodChange.RelativeRecoveryPerHour);
			this.m.Mood = this.Math.minf(3.1500001, this.m.Mood + diff * mult * this.Const.MoodChange.CheckIntervalHours);
			this.getSkills().update();
		}
		else if (this.m.Mood > 3.1500001)
		{
			local mult = this.getSkills().hasSkill("trait.pessimist") ? this.Const.MoodChange.PessimistMult : 1.0;
			local diff = this.Math.maxf(this.Const.MoodChange.RecoveryPerHour, (this.m.Mood - 3.1500001) * this.Const.MoodChange.RelativeRecoveryPerHour);
			this.m.Mood = this.Math.maxf(3.1500001, this.m.Mood - diff * mult * this.Const.MoodChange.CheckIntervalHours);
			this.getSkills().update();
		}
	}

	function getHiringTraits()
	{
		local ret = [];

		if (!this.m.IsTryoutDone)
		{
			return ret;
		}

		foreach( s in this.m.Skills.m.Skills )
		{
			if (s.getType() == this.Const.SkillType.Trait)
			{
				ret.push({
					id = s.getID(),
					icon = s.getIconColored()
				});
			}
		}

		return ret;
	}

	function getDaysWithCompany()
	{
		local time;

		if (("State" in this.World) && this.World.State != null && this.World.State.getCombatStartTime() != 0)
		{
			time = this.Math.round((this.World.State.getCombatStartTime() - this.m.HireTime) / this.World.getTime().SecondsPerDay);
		}
		else
		{
			time = this.Math.round((this.Time.getVirtualTimeF() - this.m.HireTime) / this.World.getTime().SecondsPerDay);
		}

		return time;
	}

	function getTooltip( _targetedWithSkill = null )
	{
		if (!this.isPlacedOnMap() || !this.isAlive() || this.isDying())
		{
			return [];
		}

		local turnsToGo = this.Tactical.TurnSequenceBar.getTurnsUntilActive(this.getID());
		local tooltip = [
			{
				id = 1,
				type = "title",
				text = this.getName(),
				icon = "ui/tooltips/height_" + this.getTile().Level + ".png"
			}
		];

		if (!this.isPlayerControlled() && _targetedWithSkill != null && this.isKindOf(_targetedWithSkill, "skill"))
		{
			local tile = this.getTile();

			if (tile.IsVisibleForEntity && _targetedWithSkill.isUsableOn(this.getTile()))
			{
				tooltip.push({
					id = 3,
					type = "headerText",
					icon = "ui/icons/hitchance.png",
					text = "[color=" + this.Const.UI.Color.PositiveValue + "]" + _targetedWithSkill.getHitchance(this) + "%[/color] chance to hit",
					children = _targetedWithSkill.getHitFactors(tile)
				});
			}
		}

		tooltip.extend([
			{
				id = 2,
				type = "text",
				icon = "ui/icons/initiative.png",
				text = this.Tactical.TurnSequenceBar.getActiveEntity() == this ? "Acting right now!" : this.m.IsTurnDone || turnsToGo == null ? "Turn done" : "Acts in " + turnsToGo + (turnsToGo > 1 ? " turns" : " turn")
			},
			{
				id = 3,
				type = "progressbar",
				icon = "ui/icons/armor_head.png",
				value = this.getArmor(this.Const.BodyPart.Head),
				valueMax = this.getArmorMax(this.Const.BodyPart.Head),
				text = "" + this.getArmor(this.Const.BodyPart.Head) + " / " + this.getArmorMax(this.Const.BodyPart.Head) + "",
				style = "armor-head-slim"
			},
			{
				id = 4,
				type = "progressbar",
				icon = "ui/icons/armor_body.png",
				value = this.getArmor(this.Const.BodyPart.Body),
				valueMax = this.getArmorMax(this.Const.BodyPart.Body),
				text = "" + this.getArmor(this.Const.BodyPart.Body) + " / " + this.getArmorMax(this.Const.BodyPart.Body) + "",
				style = "armor-body-slim"
			},
			{
				id = 5,
				type = "progressbar",
				icon = "ui/icons/health.png",
				value = this.getHitpoints(),
				valueMax = this.getHitpointsMax(),
				text = "" + this.getHitpoints() + " / " + this.getHitpointsMax() + "",
				style = "hitpoints-slim"
			},
			{
				id = 6,
				type = "progressbar",
				icon = "ui/icons/morale.png",
				value = this.getMoraleState(),
				valueMax = this.Const.MoraleState.COUNT - 1,
				text = this.Const.MoraleStateName[this.getMoraleState()],
				style = "morale-slim"
			},
			{
				id = 7,
				type = "progressbar",
				icon = "ui/icons/fatigue.png",
				value = this.getFatigue(),
				valueMax = this.getFatigueMax(),
				text = "" + this.getFatigue() + " / " + this.getFatigueMax() + "",
				style = "fatigue-slim"
			}
		]);
		local result = [];
		local statusEffects = this.getSkills().query(this.Const.SkillType.StatusEffect | this.Const.SkillType.TemporaryInjury, false, true);

		foreach( i, statusEffect in statusEffects )
		{
			tooltip.push({
				id = 100 + i,
				type = "text",
				icon = statusEffect.getIcon(),
				text = statusEffect.getName()
			});
		}

		return tooltip;
	}

	function getRosterTooltip()
	{
		local tooltip = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			}
		];
		local time = this.getDaysWithCompany();
		local text;

		if (!this.isGuest())
		{
			if (this.m.Background != null && this.m.Background.getID() == "background.companion")
			{
				text = "With the company from the very beginning.";
			}
			else if (time > 1)
			{
				text = "With the company for " + time + " days.";
			}
			else
			{
				text = "Has just joined the company.";
			}

			if (this.m.LifetimeStats.Battles != 0)
			{
				if (this.m.LifetimeStats.Battles == 1)
				{
					text = text + (" Took part in " + this.m.LifetimeStats.Battles + " battle");
				}
				else
				{
					text = text + (" Took part in " + this.m.LifetimeStats.Battles + " battles");
				}

				if (this.m.LifetimeStats.Kills == 1)
				{
					text = text + (" and has " + this.m.LifetimeStats.Kills + " kill.");
				}
				else if (this.m.LifetimeStats.Kills > 1)
				{
					text = text + (" and has " + this.m.LifetimeStats.Kills + " kills.");
				}
				else
				{
					text = text + ".";
				}

				if (this.m.LifetimeStats.MostPowerfulVanquished != "")
				{
					text = text + (" The most powerful opponent he vanquished was " + this.m.LifetimeStats.MostPowerfulVanquished + ".");
				}
			}

			tooltip.push({
				id = 2,
				type = "description",
				text = text
			});
			tooltip.push({
				id = 5,
				type = "text",
				icon = "ui/icons/xp_received.png",
				text = "Level " + this.m.Level
			});

			if (this.getDailyCost() != 0)
			{
				tooltip.push({
					id = 3,
					type = "text",
					icon = "ui/icons/asset_daily_money.png",
					text = "Paid [img]gfx/ui/tooltips/money.png[/img]" + this.getDailyCost() + " daily"
				});
			}

			tooltip.push({
				id = 4,
				type = "text",
				icon = this.Const.MoodStateIcon[this.getMoodState()],
				text = this.Const.MoodStateName[this.getMoodState()]
			});

			if (this.m.PlaceInFormation <= 17)
			{
				tooltip.push({
					id = 6,
					type = "hint",
					icon = "ui/icons/stat_screen_dmg_dealt.png",
					text = "In the fighting line"
				});
			}
			else
			{
				tooltip.push({
					id = 6,
					type = "hint",
					icon = "ui/icons/camp.png",
					text = "In reserve"
				});
			}
		}

		local injuries = this.getSkills().query(this.Const.SkillType.Injury | this.Const.SkillType.SemiInjury);

		foreach( injury in injuries )
		{
			if (injury.isType(this.Const.SkillType.TemporaryInjury))
			{
				local ht = injury.getHealingTime();

				if (ht.Min != ht.Max)
				{
					tooltip.push({
						id = 90,
						type = "text",
						icon = injury.getIcon(),
						text = injury.getName() + " (" + ht.Min + "-" + ht.Max + " days)"
					});
				}
				else if (ht.Min > 1)
				{
					tooltip.push({
						id = 90,
						type = "text",
						icon = injury.getIcon(),
						text = injury.getName() + " (" + ht.Min + " days)"
					});
				}
				else
				{
					tooltip.push({
						id = 90,
						type = "text",
						icon = injury.getIcon(),
						text = injury.getName() + " (" + ht.Min + " day)"
					});
				}
			}
			else
			{
				tooltip.push({
					id = 90,
					type = "text",
					icon = injury.getIcon(),
					text = injury.getName()
				});
			}
		}

		if (this.getHitpoints() < this.getHitpointsMax())
		{
			local ht = this.Math.ceil((this.getHitpointsMax() - this.getHitpoints()) / ((this.Const.World.Assets.HitpointsPerHour + this.World.Assets.m.AdditionalHitpointsPerHour) * (("State" in this.World) && this.World.State != null ? this.World.Assets.m.HitpointsPerHourMult : 1.0)) / 24.0);

			if (ht > 1)
			{
				tooltip.push({
					id = 133,
					type = "text",
					icon = "ui/icons/days_wounded.png",
					text = "Light Wounds (" + ht + " days)"
				});
			}
			else
			{
				tooltip.push({
					id = 133,
					type = "text",
					icon = "ui/icons/days_wounded.png",
					text = "Light Wounds (" + ht + " day)"
				});
			}
		}

		return tooltip;
	}

	function getOverlayImage()
	{
		if (("State" in this.World) && this.World.State != null)
		{
			return this.World.Assets.getBanner();
		}
		else
		{
			return "banner_06";
		}
	}

	function getImagePath( _ignoreLayers = [] )
	{
		local result = "tacticalentity(" + this.m.ContentID + "," + this.getID() + ",socket,miniboss,arrow";

		for( local i = 0; i < _ignoreLayers.len(); i = ++i )
		{
			result = result + ("," + _ignoreLayers[i]);
		}

		result = result + ")";
		return result;
	}

	function getDaysWounded()
	{
		if (("State" in this.Tactical) && this.Tactical.State != null && this.Tactical.State.isScenarioMode())
		{
			return 0;
		}

		if (this.getHitpoints() < this.getHitpointsMax())
		{
			return this.Math.ceil((this.getHitpointsMax() - this.getHitpoints()) / ((this.Const.World.Assets.HitpointsPerHour + this.World.Assets.m.AdditionalHitpointsPerHour) * this.World.Assets.m.HitpointsPerHourMult) / 24.0);
		}
		else
		{
			return 0;
		}
	}

	function onUpdateInjuryLayer()
	{
		if (!this.hasSprite("injury"))
		{
			return;
		}

		local injury = this.getSprite("injury");
		local injury_body = this.getSprite("injury_body");
		local p = this.m.Hitpoints / this.getHitpointsMax();

		if (p > 0.67)
		{
			//this.setDirty(this.m.IsDirty || injury.Visible || injury_body.Visible);
			injury.Visible = false;
			injury_body.Visible = false;
		}
		else
		{
			//this.setDirty(this.m.IsDirty || !injury.Visible || !injury_body.Visible);
			injury.Visible = true;
			injury_body.Visible = true;

			if (p > 0.33)
			{
				injury.setBrush("bust_head_injured_01");
			}
			else
			{
				injury.setBrush("bust_head_injured_02");
			}

			if (p > 0.4)
			{
				injury_body.Visible = false;
			}
			else
			{
				injury_body.Visible = true;
				injury_body.setBrush(this.getSprite("body").getBrush().Name + "_injured");
			}
		}
	}

	function create()
	{
		this.m.IsControlledByPlayer = true;
		this.m.IsGeneratingKillName = false;
		this.m.Type = this.Const.EntityType.Player;
		this.m.BloodType = this.Const.BloodType.Red;

		//this.human.create();
		this.actor.create();
		this.m.Sound[this.Const.Sound.ActorEvent.Death] = [
			"sounds/enemies/percht_death01.wav",
			"sounds/enemies/percht_death02.wav",
			"sounds/enemies/percht_death03.wav",
			"sounds/enemies/percht_death04.wav"
		];
		this.m.Sound[this.Const.Sound.ActorEvent.Flee] = [
			"sounds/enemies/percht_flee01.wav",
			"sounds/enemies/percht_flee02.wav"
		];
		this.m.Sound[this.Const.Sound.ActorEvent.NoDamageReceived] = [
			"sounds/enemies/percht_hurt01.wav",
			"sounds/enemies/percht_hurt02.wav",
			"sounds/enemies/percht_hurt03.wav",
			"sounds/enemies/percht_hurt04.wav",
			"sounds/enemies/percht_hurt05.wav",
		];
		this.m.Sound[this.Const.Sound.ActorEvent.DamageReceived] = [
			"sounds/enemies/percht_hurt01.wav",
			"sounds/enemies/percht_hurt02.wav",
			"sounds/enemies/percht_hurt03.wav",
			"sounds/enemies/percht_hurt04.wav",
			"sounds/enemies/percht_hurt05.wav",
		];
		this.m.Sound[this.Const.Sound.ActorEvent.Idle] = [
			"sounds/enemies/percht_idle01.wav",
			"sounds/enemies/percht_idle02.wav",
			"sounds/enemies/percht_idle03.wav",
			"sounds/enemies/percht_idle04.wav",
			"sounds/enemies/percht_idle05.wav",
			"sounds/enemies/percht_idle06.wav",
			"sounds/enemies/percht_idle07.wav",
			"sounds/enemies/percht_idle08.wav",
			"sounds/enemies/percht_idle09.wav",
			"sounds/enemies/percht_idle10.wav",
			"sounds/enemies/percht_idle11.wav",
			"sounds/enemies/percht_idle12.wav"
		];
		this.m.Sound[this.Const.Sound.ActorEvent.Move] = [
			"sounds/enemies/percht_move01.wav",
			"sounds/enemies/percht_move02.wav",
			"sounds/enemies/percht_move03.wav",
			"sounds/enemies/percht_move04.wav"
		];
		this.m.Sound[this.Const.Sound.ActorEvent.Fatigue]=this.m.Sound[this.Const.Sound.ActorEvent.Move];
		this.m.SoundPitch = 1.0;
		this.m.SoundVolume[this.Const.Sound.ActorEvent.Death] = 1.7;
		this.m.SoundVolume[this.Const.Sound.ActorEvent.DamageReceived] = 1.7;
		this.m.SoundVolume[this.Const.Sound.ActorEvent.Idle] = 4;
		this.m.SoundVolume[this.Const.Sound.ActorEvent.Move] = 2;
		this.m.ConfidentMoraleBrush = "icon_confident_orcs";

		this.getFlags().add("human");
		this.getFlags().add("jccPlayerPercht");
		this.getFlags().set("PotionLastUsed", 0.0);
		this.getFlags().set("PotionsUsed", 0);
		this.m.AIAgent = this.new("scripts/ai/tactical/player_agent");
		this.m.AIAgent.setActor(this);
	}

	function onHired()
	{
		this.m.HireTime = this.Time.getVirtualTimeF();

		if (this.getBackground().getID() != "background.slave")
		{
			this.improveMood(1.5, "Joined a mercenary company");
		}

		if (("State" in this.World) && this.World.State != null && this.World.Assets.getOrigin() != null)
		{
			this.World.Assets.getOrigin().onHired(this);
		}

		if (this.World.getPlayerRoster().getSize() >= 12)
		{
			this.updateAchievement("AFullCompany", 1, 1);
		}

		if (this.World.getPlayerRoster().getSize() >= 20)
		{
			this.updateAchievement("PowerInNumbers", 1, 1);
		}

		if (this.World.getPlayerRoster().getSize() == 25 && this.World.Assets.getOrigin().getID() == "scenario.militia")
		{
			this.updateAchievement("HumanWave", 1, 1);
		}


	}

	function onCombatStart()
	{
		this.m.MaxEnemiesThisTurn = 1;
		this.m.CombatStats.DamageReceivedHitpoints = 0;
		this.m.CombatStats.DamageReceivedArmor = 0;
		this.m.CombatStats.DamageDealtHitpoints = 0;
		this.m.CombatStats.DamageDealtArmor = 0;
		this.m.CombatStats.Kills = 0;
		this.m.CombatStats.XPGained = 0;
		this.m.Skills.onCombatStarted();
		this.m.Items.onCombatStarted();
		this.m.Skills.update();
		this.getAIAgent().getProperties().BehaviorMult[this.Const.AI.Behavior.ID.Retreat] = 0.0;
	}

	function onBeforeCombatResult()
	{
		this.onCombatFinished();
		this.m.LifetimeStats.Battles += 1;
		this.getAIAgent().getProperties().BehaviorMult[this.Const.AI.Behavior.ID.Retreat] = 0.0;
		this.getAIAgent().setUseHeat(false);
	}

	function onCombatFinished()
	{
		this.actor.resetRenderEffects();
		this.setAlwaysApplySpriteOffset(true);
		this.m.spriteOffset = 7;        
		this.setSpriteOffset("permanent_injury_1", this.createVec(9, -2));
		this.setSpriteOffset("permanent_injury_3", this.createVec(9, -5));
		this.setSpriteOffset("permanent_injury_2", this.createVec(9, -2));
		this.setSpriteOffset("permanent_injury_4", this.createVec(9, -2));		
		this.setSpriteOffset("arms_icon", ::createVec(this.m.spriteOffset, 0))
		this.m.IsAlive = true;
		this.m.IsDying = false;
		this.m.IsAbleToDie = true;
		this.m.Hitpoints = this.Math.max(1, this.m.Hitpoints);
		this.m.MaxEnemiesThisTurn = 1;

		if (this.m.MoraleState != this.Const.MoraleState.Ignore)
		{
			this.setMoraleState(this.Const.MoraleState.Steady);
		}

		this.resetBloodied(false);
		//this.getSprite("dirt").Visible = false;
		this.getFlags().set("Devoured", false);
		this.getFlags().set("Charmed", false);
		this.getFlags().set("Sleeping", false);
		this.getFlags().set("Nightmare", false);
		this.m.Fatigue = 0;
		this.m.ActionPoints = 0;
		this.m.Items.onCombatFinished();
		this.m.Skills.onCombatFinished();

		if (this.m.IsAlive)
		{
			this.updateLevel();
			this.updateInjuryVisuals(false);
			//this.setDirty(true);
		}
	}

	function isReallyKilled( _fatalityType )
	{
		if (_fatalityType != this.Const.FatalityType.None)
		{
			return true;
		}

		if (this.Tactical.State.isScenarioMode())
		{
			return true;
		}

		if (this.Tactical.State.isAutoRetreat())
		{
			return true;
		}

		if (this.isGuest())
		{
			return true;
		}

		if (this.Math.rand(1, 100) <= this.Const.Combat.SurviveWithInjuryChance * this.m.CurrentProperties.SurviveWithInjuryChanceMult || this.World.Assets.m.IsSurvivalGuaranteed && !this.m.Skills.hasSkillOfType(this.Const.SkillType.PermanentInjury) && (this.World.Assets.getOrigin().getID() != "scenario.manhunters" || this.getBackground().getID() != "background.slave"))
		{
			local potential = [];
			local injuries = this.Const.Injury.Permanent;
			local numPermInjuries = 0;

			foreach( inj in injuries )
			{
				if (!this.m.Skills.hasSkill(inj.ID))
				{
					potential.push(inj);
				}
				else
				{
					numPermInjuries = ++numPermInjuries;
				}
			}

			if (potential.len() != 0)
			{
				local skill = this.new("scripts/skills/" + potential[this.Math.rand(0, potential.len() - 1)].Script);
				this.m.Skills.add(skill);
				this.Tactical.getSurvivorRoster().add(this);
				this.m.IsDying = false;
				this.worsenMood(this.Const.MoodChange.PermanentInjury, "Suffered a permanent injury");
				this.updateAchievement("ScarsForLife", 1, 1);

				if (numPermInjuries + 1 >= 3)
				{
					this.updateAchievement("HardToKill", 1, 1);
				}

				return false;
			}
		}

		return true;
	}

	function onOtherActorDeath( _killer, _victim, _skill )
	{
		if (!this.m.IsAlive || this.m.IsDying)
		{
			return;
		}

		if (!this.isGuest() && _victim.getFaction() == this.getFaction() && ("getBackground" in _victim) && _victim.getBackground().getID() == "background.jcc_percht" && this.getBackground().getID() != "background.jcc_percht")
		{
			return;
		}

		this.actor.onOtherActorDeath(_killer, _victim, _skill);
	}

	function kill( _killer = null, _skill = null, _fatalityType = this.Const.FatalityType.None, _silent = false )
	{
		if (!this.Tactical.State.isScenarioMode() && this.World.Assets.m.IsSurvivalGuaranteed && _fatalityType != this.Const.FatalityType.Kraken && _fatalityType != this.Const.FatalityType.Devoured && !this.m.Skills.hasSkillOfType(this.Const.SkillType.PermanentInjury) && (this.World.Assets.getOrigin().getID() != "scenario.manhunters" || this.getBackground() != null && this.getBackground().getID() != "background.slave"))
		{
			_fatalityType = this.Const.FatalityType.None;
		}

		this.actor.kill(_killer, _skill, _fatalityType, _silent);
	}

	function onDeath( _killer, _skill, _tile, _fatalityType )
	{
		if (!this.Tactical.State.isScenarioMode() && _fatalityType != this.Const.FatalityType.Unconscious)
		{
			if (this.getLevel() >= 11 && this.World.Assets.isIronman())
			{
				this.updateAchievement("ToughFarewell", 1, 1);
			}
			else
			{
				this.updateAchievement("BloodyToll", 1, 1);
			}

			if (_killer != null && this.isKindOf(_killer, "player") && _killer.getSkills().hasSkill("effects.charmed"))
			{
				this.updateAchievement("NothingPersonal", 1, 1);
			}
		}

		local flip = this.Math.rand(0, 100) < 50;
		this.m.IsCorpseFlipped = flip;
		local isResurrectable = _fatalityType == this.Const.FatalityType.None || _fatalityType == this.Const.FatalityType.Disemboweled;
		local appearance = this.getItems().getAppearance();
		local sprite_body = this.getSprite("body");
		local sprite_head = this.getSprite("head");
		//local sprite_hair = this.getSprite("hair");
		//local sprite_beard = this.getSprite("beard");
		//local sprite_beard_top = this.getSprite("beard_top");
		//local tattoo_body = this.getSprite("tattoo_body");
		local tattoo_head = this.getSprite("tattoo_head");
		local sprite_surcoat = this.getSprite("surcoat");
		local sprite_accessory = this.getSprite("accessory");

		if (!this.isGuest())
		{
			local stub = this.Tactical.getCasualtyRoster().create("scripts/entity/tactical/player_corpse_stub");
			stub.setOriginalID(this.getID());
			stub.setName(this.getNameOnly());
			stub.setTitle(this.getTitle());
			stub.setCombatStats(this.m.CombatStats);
			stub.setLifetimeStats(this.m.LifetimeStats);
			stub.m.DaysWithCompany = this.getDaysWithCompany();
			stub.m.Level = this.getLevel();
			stub.m.DailyCost = this.getDailyCost();
			stub.addSprite("blood_1").setBrush(this.Const.BloodPoolDecals[this.Const.BloodType.Red][this.Math.rand(0, this.Const.BloodPoolDecals[this.Const.BloodType.Red].len() - 1)]);
			stub.addSprite("blood_2").setBrush(this.Const.BloodDecals[this.Const.BloodType.Red][this.Math.rand(0, this.Const.BloodDecals[this.Const.BloodType.Red].len() - 1)]);
			stub.setSpriteOffset("blood_1", this.createVec(0, -15));
			stub.setSpriteOffset("blood_2", this.createVec(0, -30));

			if (_fatalityType == this.Const.FatalityType.Devoured)
			{
				for( local i = 0; i != this.Const.CorpsePart.len(); i = ++i )
				{
					stub.addSprite("stuff_" + i).setBrush(this.Const.CorpsePart[i]);
				}
			}
			else
			{
				local decal = stub.addSprite("body");
				decal.setBrush(sprite_body.getBrush().Name + "_dead");
				decal.Color = sprite_head.Color;
				decal.Saturation = sprite_head.Saturation;

				/*if (tattoo_body.HasBrush)
				{
					decal = stub.addSprite("tattoo_body");
					decal.setBrush(tattoo_body.getBrush().Name + "_dead");
					decal.Color = tattoo_body.Color;
					decal.Saturation = tattoo_body.Saturation;
				}*/

				if (appearance.CorpseArmor != "")
				{
					decal = stub.addSprite("armor");
					decal.setBrush(appearance.CorpseArmor);
				}

				if (sprite_surcoat.HasBrush)
				{
					decal = stub.addSprite("surcoat");
					decal.setBrush("surcoat_" + (this.m.Surcoat < 10 ? "0" + this.m.Surcoat : this.m.Surcoat) + "_dead");
				}

				if (appearance.CorpseArmorUpgradeBack != "")
				{
					decal = stub.addSprite("upgrade_back");
					decal.setBrush(appearance.CorpseArmorUpgradeBack);
				}

				if (sprite_accessory.HasBrush)
				{
					decal = stub.addSprite("accessory");
					decal.setBrush(sprite_accessory.getBrush().Name + "_dead");
				}

				if (_fatalityType == this.Const.FatalityType.Disemboweled)
				{
					stub.addSprite("guts").setBrush("bust_body_guts_01");
				}
				else if (_skill && _skill.getProjectileType() == this.Const.ProjectileType.Arrow)
				{
					if (appearance.CorpseArmor != "")
					{
						stub.addSprite("arrows").setBrush(appearance.CorpseArmor + "_arrows");
					}
					else
					{
						stub.addSprite("arrows").setBrush(appearance.Corpse + "_arrows");
					}
				}
				else if (_skill && _skill.getProjectileType() == this.Const.ProjectileType.Javelin)
				{
					if (appearance.CorpseArmor != "")
					{
						stub.addSprite("arrows").setBrush(appearance.CorpseArmor + "_javelin");
					}
					else
					{
						stub.addSprite("arrows").setBrush(appearance.Corpse + "_javelin");
					}
				}

				if (_fatalityType != this.Const.FatalityType.Decapitated)
				{
					if (!appearance.HideCorpseHead)
					{
						decal = stub.addSprite("head");
						decal.setBrush(sprite_head.getBrush().Name + "_dead");
						decal.Color = sprite_head.Color;
						decal.Saturation = sprite_head.Saturation;

						if (tattoo_head.HasBrush)
						{
							decal = stub.addSprite("tattoo_head");
							decal.setBrush(this.getSprite("tattoo_head").getBrush().Name + "_dead");
							decal.Color = tattoo_head.Color;
							decal.Saturation = tattoo_head.Saturation;
						}
					}

					if (_fatalityType == this.Const.FatalityType.Smashed)
					{
						stub.addSprite("smashed").setBrush("bust_head_smashed_01");
					}
					else if (appearance.HelmetCorpse != "")
					{
						decal = stub.addSprite("helmet");
						decal.setBrush(this.getItems().getAppearance().HelmetCorpse);
					}
				}

				if (appearance.CorpseArmorUpgradeFront != "")
				{
					decal = stub.addSprite("upgrade_front");
					decal.setBrush(appearance.CorpseArmorUpgradeFront);
				}
			}
		}

		//this.human.onDeath(_killer, _skill, _tile, _fatalityType);
		local flip = this.Math.rand(1, 100) < 50;

		if (_tile != null)
		{
			this.m.IsCorpseFlipped = flip;
			local decal;
			local appearance = this.getItems().getAppearance();
			local sprite_body = this.getSprite("body");
			local sprite_head = this.getSprite("head");
			decal = _tile.spawnDetail(sprite_body.getBrush().Name + "_dead", this.Const.Tactical.DetailFlag.Corpse, flip);
			decal.Color = sprite_body.Color;
			decal.Saturation = sprite_body.Saturation;
			decal.Scale = 0.9;
			decal.setBrightness(0.9);

			if (appearance.CorpseArmor != "")
			{
				decal = _tile.spawnDetail(appearance.CorpseArmor, this.Const.Tactical.DetailFlag.Corpse, flip);
				decal.Scale = 0.9;
				decal.setBrightness(0.9);
			}

			if (_fatalityType != this.Const.FatalityType.Decapitated)
			{
				if (!appearance.HideCorpseHead)
				{
					decal = _tile.spawnDetail(sprite_head.getBrush().Name + "_dead", this.Const.Tactical.DetailFlag.Corpse, flip);
					decal.Color = sprite_head.Color;
					decal.Saturation = sprite_head.Saturation;
					decal.Scale = 0.9;
					decal.setBrightness(0.9);
				}

				if (appearance.HelmetCorpse != "")
				{
					decal = _tile.spawnDetail(appearance.HelmetCorpse, this.Const.Tactical.DetailFlag.Corpse, flip);
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

				if (appearance.HelmetCorpse.len() != 0)
				{
					layers.push(appearance.HelmetCorpse);
				}

				local decap = this.Tactical.spawnHeadEffect(this.getTile(), layers, this.createVec(-50, 30), 180.0, "bust_percht_head_02_dead_bloodpool");
				local idx = 0;

				if (!appearance.HideCorpseHead)
				{
					decap[idx].Color = sprite_head.Color;
					decap[idx].Saturation = sprite_head.Saturation;
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
			}

			if (_fatalityType == this.Const.FatalityType.Disemboweled)
			{
				if (appearance.CorpseArmor != "")
				{
					decal = _tile.spawnDetail(appearance.CorpseArmor + "_guts", this.Const.Tactical.DetailFlag.Corpse, flip);
				}
				else
				{
					decal = _tile.spawnDetail("bust_percht_dead_guts", this.Const.Tactical.DetailFlag.Corpse, flip);
				}

				decal.Scale = 0.9;
			}
			else if (_skill && _skill.getProjectileType() == this.Const.ProjectileType.Arrow)
			{
				if (appearance.CorpseArmor != "")
				{
					decal = _tile.spawnDetail(appearance.CorpseArmor + "_arrows", this.Const.Tactical.DetailFlag.Corpse, flip);
				}
				else
				{
					decal = _tile.spawnDetail("bust_percht_body_02_dead_arrows", this.Const.Tactical.DetailFlag.Corpse, flip);
				}

				decal.Scale = 0.9;
			}
			else if (_skill && _skill.getProjectileType() == this.Const.ProjectileType.Javelin)
			{
				if (appearance.CorpseArmor != "")
				{
					decal = _tile.spawnDetail(appearance.CorpseArmor + "_javelin", this.Const.Tactical.DetailFlag.Corpse, flip);
				}
				else
				{
					decal = _tile.spawnDetail("bust_percht_body_02_dead_javelin", this.Const.Tactical.DetailFlag.Corpse, flip);
				}

				decal.Scale = 0.9;
			}

			this.spawnTerrainDropdownEffect(_tile);
		}

		local deathLoot = this.getItems().getDroppableLoot(_killer);
		local tileLoot = this.actor.getLootForTile(_killer, deathLoot);
		this.dropLoot(_tile, tileLoot, !flip);
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

		if (_tile != null)
		{
			local corpse = _tile.Properties.get("Corpse");
			corpse.IsPlayer = true;
			corpse.Value = 10.0;
		}

		if (!this.m.IsGuest && !this.Tactical.State.isScenarioMode())
		{
			this.World.Assets.addScore(-5 * this.getLevel());
		}

		if (!this.m.IsGuest && !this.Tactical.State.isScenarioMode() && _fatalityType != this.Const.FatalityType.Unconscious && (_skill != null && _killer != null || _fatalityType == this.Const.FatalityType.Devoured || _fatalityType == this.Const.FatalityType.Kraken))
		{
			this.World.Statistics.addFallen(this.getObituaryInfo(_skill, _killer, _fatalityType));
		}
	}

	function generateCorpse( _tile, _fatalityType, _killer )
	{
		local corpse = clone this.Const.Corpse;
		corpse.Faction = this.getFaction();
		corpse.CorpseName = this.getName();
		corpse.IsResurrectable = false;
		corpse.IsConsumable = _fatalityType != this.Const.FatalityType.Unconscious;
		corpse.Items = this.getItems().prepareItemsForCorpse(_killer);
		corpse.IsHeadAttached = _fatalityType != this.Const.FatalityType.Decapitated;

		if (_tile != null)
		{
			corpse.Tile = _tile;
		}

		return corpse;
	}

	function getObituaryInfo( _skill, _killer, _fatalityType )
	{
		local killedBy;

		if (_fatalityType == this.Const.FatalityType.Devoured)
		{
			killedBy = "Devoured by a Nachzehrer";
		}
		else if (_fatalityType == this.Const.FatalityType.Kraken)
		{
			killedBy = "Devoured by a Kraken";
		}
		else if (_fatalityType == this.Const.FatalityType.Suicide)
		{
			killedBy = "Committed Suicide";
		}
		else if (_skill.isType(this.Const.SkillType.StatusEffect))
		{
			killedBy = _skill.getKilledString();
		}
		else if (_killer.getID() == this.getID())
		{
			killedBy = "Killed in battle";
		}
		else
		{
			if (_fatalityType == this.Const.FatalityType.Decapitated)
			{
				killedBy = "Beheaded";
			}
			else if (_fatalityType == this.Const.FatalityType.Disemboweled)
			{
				if (this.Math.rand(1, 2) == 1)
				{
					killedBy = "Disemboweled";
				}
				else
				{
					killedBy = "Gutted";
				}
			}
			else
			{
				killedBy = _skill.getKilledString();
			}

			killedBy = killedBy + (" by " + _killer.getKilledName());
		}

		local fallen = {
			Name = this.getName(),
			Time = this.World.getTime().Days,
			TimeWithCompany = this.Math.max(1, this.getDaysWithCompany()),
			Kills = this.m.LifetimeStats.Kills,
			Battles = this.m.LifetimeStats.Battles + 1,
			KilledBy = killedBy,
			Expendable = this.getBackground().getID() == "background.slave"
		};
		return fallen;
	}

	function onInit()
	{
		this.m.Body = this.Math.rand(1,2);
		this.m.Head = this.Math.rand(1,3);
		this.actor.onInit();
		this.m.ActionPoints = 10;
		this.m.ActionPointCosts = this.Const.DefaultMovementAPCost;
		this.m.FatigueCosts = this.Const.DefaultMovementFatigueCost;
		local app = this.getItems().getAppearance();
		app.Quiver = this.Const.Items.Default.PlayerQuiver;
		//app.Body = "bust_orc_01_body";
		//app.Corpse = "bust_orc_01_body_dead";
		//app.Body = this.m.Bodies[this.m.Body];
		//app.Corpse = this.m.Bodies[this.m.Body] + "_dead";
		this.addSprite("background");
		this.addSprite("socket").setBrush("bust_base_player");
		this.addSprite("quiver");
		local body = this.addSprite("body");
		body.setBrush("bust_percht_body_0" + this.m.Body);	
		body.varySaturation(0.05);
		body.varyColor(0.07, 0.07, 0.07);
		//this.addSprite("tattoo_body");
		this.addSprite("scar_body");
		local injury_body = this.addSprite("injury_body");
		injury_body.Visible = false;
		injury_body.setBrush("bust_percht_body_0" + this.m.Body + "_injured");
		//this.addSprite("armor");
		this.addSprite("surcoat");
		this.addSprite("armor_upgrade_back");
		local bandage2 = this.addSprite("bandage_2");
		bandage2.Visible = false;
		bandage2.setBrush("bandage_clean_02");
		local bandage3 = this.addSprite("bandage_3");
		bandage3.Visible = false;
		bandage3.setBrush("bandage_clean_03");
		this.addSprite("shaft");
		this.addSprite("permanent_injury_1");
		local head = this.addSprite("head");
		head.setBrush("bust_percht_head_0" + this.m.Head);	
		head.Saturation = body.Saturation;
		head.Color = body.Color;
		//local eye_rings = this.addSprite("eye_rings");
		//eye_rings.setBrush("bust_eye_rings");
		//eye_rings.Visible = false;
		local closed_eyes = this.addSprite("closed_eyes");
		//closed_eyes.setBrush("sleep_eyes");
		//closed_eyes.Visible = false;
		this.addSprite("tattoo_head");
		this.addSprite("scar_head");
		local injury_head = this.addSprite("injury");
		injury_head.Visible = false;
		injury_head.setBrush("bust_percht_head_0" + this.m.Head + "_injured");

		//this.addSprite("helmet");
		//this.addSprite("helmet_damage");
		this.addSprite("accessory");
		this.addSprite("accessory_special");
		//local beard_top = this.addSprite("beard_top");
		this.addSprite("armor_upgrade_front");
		local bandage1 = this.addSprite("bandage_1");
		bandage1.Visible = false;
		bandage1.setBrush("bandage_clean_01");
		local body_blood = this.addSprite("body_blood");
		body_blood.setBrush("bust_body_bloodied_02");
		body_blood.Visible = false;
		this.addSprite("permanent_injury_3");
		this.addSprite("permanent_injury_2");
		//local beard = this.addSprite("beard");
		//local hair = this.addSprite("hair");
		this.addSprite("permanent_injury_4");
		local body_dirt = this.addSprite("dirt");
		body_dirt.setBrush("");
		body_dirt.Visible = false;
		this.addDefaultStatusSprites();
		this.getSprite("status_rooted").Scale = 0.55;
		this.setSpriteOffset("status_rooted", this.createVec(0, 5));
		this.m.Skills.add(this.new("scripts/skills/actives/hand_to_hand"));

		if (this.Const.DLC.Unhold)
		{
			this.m.Skills.add(this.new("scripts/skills/actives/wake_ally_skill"));
		}

		this.m.Skills.add(this.new("scripts/skills/special/double_grip"));
		this.m.Skills.add(this.new("scripts/skills/effects/captain_effect"));

		//this.human.onInit();
		this.m.Skills.add(this.new("scripts/skills/special/stats_collector"));
		this.m.Skills.add(this.new("scripts/skills/special/mood_check"));
		this.m.Skills.add(this.new("scripts/skills/special/weapon_breaking_warning"));
		this.m.Skills.add(this.new("scripts/skills/special/no_ammo_warning"));
		this.m.Skills.add(this.new("scripts/skills/effects/battle_standard_effect"));
		this.m.Skills.add(this.new("scripts/skills/actives/break_ally_free_skill"));

		if (this.Const.DLC.Unhold)
		{
			this.m.Skills.add(this.new("scripts/skills/actives/wake_ally_skill"));
		}
		
		this.setAlwaysApplySpriteOffset(true);
		this.m.spriteOffset = 7;
		this.setSpriteOffset("arms_icon", ::createVec(this.m.spriteOffset, 0))

		this.setFaction(this.Const.Faction.Player);
		this.m.Items.setUnlockedBagSlots(2);
		this.m.Skills.add(this.new("scripts/skills/special/bag_fatigue"));
		this.setDiscovered(true);
		this.setSpriteOffset("permanent_injury_1", this.createVec(9, -2));
		this.setSpriteOffset("permanent_injury_3", this.createVec(9, -5));
		this.setSpriteOffset("permanent_injury_2", this.createVec(9, -2));
		this.setSpriteOffset("permanent_injury_4", this.createVec(9, -2));
	}

	function onFactionChanged()
    {
        this.actor.onFactionChanged();
        local flip = !this.isAlliedWithPlayer();
		this.getSprite("background").setHorizontalFlipping(flip);
		this.getSprite("quiver").setHorizontalFlipping(flip);
		this.getSprite("body").setHorizontalFlipping(!flip);
		//this.getSprite("tattoo_body").setHorizontalFlipping(flip);
		this.getSprite("injury_body").setHorizontalFlipping(!flip);
		//this.getSprite("armor").setHorizontalFlipping(flip);
		this.getSprite("surcoat").setHorizontalFlipping(flip);
		this.getSprite("armor_upgrade_back").setHorizontalFlipping(flip);
		this.getSprite("armor_upgrade_front").setHorizontalFlipping(flip);
		this.getSprite("shaft").setHorizontalFlipping(flip);
		this.getSprite("head").setHorizontalFlipping(!flip);
		//this.getSprite("closed_eyes").setHorizontalFlipping(flip);
		//this.getSprite("eye_rings").setHorizontalFlipping(flip);
		this.getSprite("tattoo_head").setHorizontalFlipping(flip);
		this.getSprite("injury").setHorizontalFlipping(!flip);
		//this.getSprite("beard").setHorizontalFlipping(flip);
		//this.getSprite("hair").setHorizontalFlipping(flip);
		//this.getSprite("helmet").setHorizontalFlipping(flip);
		//this.getSprite("helmet_damage").setHorizontalFlipping(flip);
		//this.getSprite("beard_top").setHorizontalFlipping(flip);
		this.getSprite("body_blood").setHorizontalFlipping(flip);
		this.getSprite("accessory").setHorizontalFlipping(flip);
		this.getSprite("accessory_special").setHorizontalFlipping(flip);
		//this.getSprite("dirt").setHorizontalFlipping(flip);
		this.getSprite("permanent_injury_1").setHorizontalFlipping(flip);
		this.getSprite("permanent_injury_2").setHorizontalFlipping(flip);
		this.getSprite("permanent_injury_3").setHorizontalFlipping(flip);
		this.getSprite("permanent_injury_4").setHorizontalFlipping(flip);
		this.getSprite("bandage_1").setHorizontalFlipping(flip);
		this.getSprite("bandage_2").setHorizontalFlipping(flip);
		this.getSprite("bandage_3").setHorizontalFlipping(flip);

        //if(flip){
        //this.setSpriteOffset("arms_icon", ::createVec(this.m.spriteOffset*-1, 0)); }
        this.setSpriteOffset("arms_icon", ::createVec(this.m.spriteOffset, 0));		
        this.setSpriteOffset("permanent_injury_1", this.createVec(9, -2));
		this.setSpriteOffset("permanent_injury_3", this.createVec(9, -5));
		this.setSpriteOffset("permanent_injury_2", this.createVec(9, -2));
		this.setSpriteOffset("permanent_injury_4", this.createVec(9, -2));		
		this.setAlwaysApplySpriteOffset(true);
    }

	function onActorKilled( _actor, _tile, _skill )
	{
		this.actor.onActorKilled(_actor, _tile, _skill);
		local XPkiller = this.Math.floor(_actor.getXPValue() * this.Const.XP.XPForKillerPct);
		local XPgroup = _actor.getXPValue() * (1.0 - this.Const.XP.XPForKillerPct);
		this.addXP(XPkiller);
		local brothers = this.Tactical.Entities.getInstancesOfFaction(this.Const.Faction.Player);

		if (brothers.len() == 1)
		{
			if (this.getSkills().hasSkill("trait.oath_of_distinction"))
			{
				return;
			}

			this.addXP(XPgroup);
		}
		else
		{
			foreach( bro in brothers )
			{
				if (bro.getCurrentProperties().IsAllyXPBlocked)
				{
					return;
				}

				bro.addXP(this.Math.max(1, this.Math.floor(XPgroup / brothers.len())));
			}
		}
	}

	function setMoraleState( _m )
	{
		if (_m == this.Const.MoraleState.Confident && this.m.Skills.hasSkill("trait.insecure"))
		{
			return;
		}

		if (_m == this.Const.MoraleState.Confident && ("State" in this.World) && this.World.State != null && this.World.Assets.getOrigin().getID() == "scenario.anatomists")
		{
			return;
		}

		if (_m == this.Const.MoraleState.Fleeing && this.m.Skills.hasSkill("effects.ancient_priest_potion"))
		{
			return;
		}

		if (_m == this.Const.MoraleState.Fleeing && this.m.Skills.hasSkill("trait.oath_of_valor"))
		{
			return;
		}

		if (_m == this.Const.MoraleState.Confident && this.getMoraleState() != this.Const.MoraleState.Confident && this.isPlacedOnMap() && this.Time.getRound() >= 1 && ("State" in this.World) && this.World.State != null && this.World.Ambitions.hasActiveAmbition() && this.World.Ambitions.getActiveAmbition().getID() == "ambition.oath_of_camaraderie")
		{
			this.World.Statistics.getFlags().increment("OathtakersBrosConfident");
		}

		this.actor.setMoraleState(_m);
	}

	function checkMorale( _change, _difficulty, _type = this.Const.MoraleCheckType.Default, _showIconBeforeMoraleIcon = "", _noNewLine = false )
	{
		if (_change > 0 && this.m.MoraleState == this.Const.MoraleState.Steady && this.m.Skills.hasSkill("trait.insecure"))
		{
			return false;
		}

		if (_change > 0 && this.m.MoraleState == this.Const.MoraleState.Steady && ("State" in this.World) && this.World.State != null && this.World.Assets.getOrigin().getID() == "scenario.anatomists")
		{
			return false;
		}

		if (_change < 0 && this.m.MoraleState == this.Const.MoraleState.Breaking && this.m.Skills.hasSkill("effects.ancient_priest_potion"))
		{
			return false;
		}

		if (_change < 0 && this.m.MoraleState == this.Const.MoraleState.Breaking && this.m.Skills.hasSkill("trait.oath_of_valor"))
		{
			return false;
		}

		if (_change > 0 && this.m.Skills.hasSkill("trait.optimist"))
		{
			_difficulty = _difficulty + 5;
		}
		else if (_change < 0 && this.m.Skills.hasSkill("trait.pessimist"))
		{
			_difficulty = _difficulty - 5;
		}
		else if (this.m.Skills.hasSkill("trait.irrational"))
		{
			_difficulty = _difficulty + (this.Math.rand(0, 1) == 0 ? 10 : -10);
		}
		else if (this.m.Skills.hasSkill("trait.mad"))
		{
			_difficulty = _difficulty + (this.Math.rand(0, 1) == 0 ? 15 : -15);
		}

		if (_change < 0 && _type == this.Const.MoraleCheckType.MentalAttack && this.m.Skills.hasSkill("trait.superstitious"))
		{
			_difficulty = _difficulty - 10;
		}

		return this.actor.checkMorale(_change, _difficulty, _type, _showIconBeforeMoraleIcon, _noNewLine);
	}

	function getXPForNextLevel()
	{
		if (this.m.Level >= 7 && ("State" in this.World) && this.World.State != null && this.World.Assets.getOrigin().getID() == "scenario.manhunters" && this.getBackground().getID() == "background.slave")
		{
			return this.Const.LevelXP[6];
		}
		else
		{
			return this.m.Level < this.Const.LevelXP.len() ? this.Const.LevelXP[this.m.Level] : this.Const.LevelXP[this.Const.LevelXP.len() - 1];
		}
	}

	function addXP( _xp, _scale = true )
	{
		local isScenarioMode = !(("State" in this.World) && this.World.State != null);

		if (this.m.Level >= this.Const.LevelXP.len() || this.isGuest() || !isScenarioMode && this.World.Assets.getOrigin().getID() == "scenario.manhunters" && this.m.Level >= 7 && this.getBackground().getID() == "background.slave")
		{
			return;
		}

		if (_scale)
		{
			_xp = _xp * this.Const.Combat.GlobalXPMult;
		}

		if (_scale && !isScenarioMode)
		{
			_xp = _xp * this.Const.Difficulty.XPMult[this.World.Assets.getDifficulty()];
		}

		if (this.m.Level >= 11)
		{
			_xp = _xp * this.Const.Combat.GlobalXPVeteranLevelMult;
		}

		if (!isScenarioMode)
		{
			if (_scale)
			{
				_xp = _xp * this.World.Assets.m.XPMult;

				if (this.World.Retinue.hasFollower("follower.drill_sergeant"))
				{
					_xp = _xp * this.Math.maxf(1.0, 1.2 - 0.02 * (this.m.Level - 1));
				}
			}

			if (this.World.getPlayerRoster().getSize() < 3)
			{
				_xp = _xp * (1.0 - (3 - this.World.getPlayerRoster().getSize()) * 0.15);
			}
		}

		if (this.m.XP + _xp * this.m.CurrentProperties.XPGainMult >= this.Const.LevelXP[this.Const.LevelXP.len() - 1])
		{
			this.m.CombatStats.XPGained += this.Const.LevelXP[this.Const.LevelXP.len() - 1] - this.m.XP;
			this.m.XP = this.Const.LevelXP[this.Const.LevelXP.len() - 1];
			return;
		}
		else if (!isScenarioMode && this.World.Assets.getOrigin().getID() == "scenario.manhunters" && this.m.XP + _xp * this.m.CurrentProperties.XPGainMult >= this.Const.LevelXP[6] && this.getBackground().getID() == "background.slave")
		{
			this.m.CombatStats.XPGained += this.Const.LevelXP[6] - this.m.XP;
			this.m.XP = this.Const.LevelXP[6];
			return;
		}

		this.m.XP += this.Math.floor(_xp * this.m.CurrentProperties.XPGainMult);
		this.m.CombatStats.XPGained += this.Math.floor(_xp * this.m.CurrentProperties.XPGainMult);
	}

	function unlockPerk( _id )
	{
		if (this.hasPerk(_id))
		{
			return true;
		}

		local perk = this.Const.Perks.findById(_id);

		if (perk == null)
		{
			return false;
		}

		if (this.m.PerkPoints > 0)
		{
			--this.m.PerkPoints;
		}

		++this.m.PerkPointsSpent;
		this.m.Skills.add(this.new(perk.Script));
		this.m.Skills.update();

		if (this.m.Level >= 11 && _id == "perk.student")
		{
			++this.m.PerkPoints;
		}

		if (("State" in this.World) && this.World.State != null && this.World.Assets.getOrigin() != null)
		{
			this.World.Assets.getOrigin().onUnlockPerk(this, _id);
		}

		return true;
	}

	function isPerkUnlockable( _id )
	{
		if (this.m.PerkPoints == 0 || this.hasPerk(_id))
		{
			return false;
		}

		local perk = this.Const.Perks.findById(_id);

		if (this.m.PerkPointsSpent >= perk.Unlocks)
		{
			return true;
		}

		return false;
	}

	function hasPerk( _id )
	{
		return this.m.Skills.hasSkill(_id);
	}

	function isPerkTierUnlocked( _category, _tier )
	{
		local numPerks = 0;

		for( local j = 0; j < this.m.PerksUnlocked[_category].len(); j = ++j )
		{
			numPerks = numPerks + this.m.PerksUnlocked[_category][j];
		}

		if (numPerks < this.Const.Perks.UnlockRequirementsPerTier[_tier])
		{
			return false;
		}

		return true;
	}

	function getPerksUnlocked( _category, _tier )
	{
		return this.m.PerksUnlocked[_category][_tier];
	}

	function updateLevel()
	{
		while (this.m.Level < this.Const.LevelXP.len() && this.m.XP >= this.Const.LevelXP[this.m.Level])
		{
			++this.m.Level;
			++this.m.LevelUps;

			if (this.m.Level <= this.Const.XP.MaxLevelWithPerkpoints)
			{
				++this.m.PerkPoints;
			}

			if (this.m.Level == 11 && this.m.Skills.hasSkill("perk.student"))
			{
				++this.m.PerkPoints;
			}

			if (("State" in this.World) && this.World.State != null && this.World.Assets.getOrigin() != null)
			{
				this.World.Assets.getOrigin().onUpdateLevel(this);
			}

			if (this.m.Level == 11)
			{
				this.updateAchievement("OldAndWise", 1, 1);
			}

			if (this.m.Level == 11 && this.m.Skills.hasSkill("trait.player"))
			{
				this.updateAchievement("TooStubbornToDie", 1, 1);
			}
		}
	}

	function assignRandomEquipment()
	{
		if (this.Math.rand(0, 2) != 0)
		{
			this.assignRandomMeleeEquipment();
		}
		else
		{
			this.assignRandomRangedEquipment();
		}
	}

	function assignRandomMeleeEquipment()
	{
		local r = this.Math.rand(1, 24);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/armor/padded_surcoat"));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/armor/mail_shirt"));
		}
		else if (r == 3)
		{
			this.m.Items.equip(this.new("scripts/items/armor/coat_of_plates"));
		}
		else if (r == 4)
		{
			this.m.Items.equip(this.new("scripts/items/armor/gambeson"));
		}
		else if (r == 5)
		{
			this.m.Items.equip(this.new("scripts/items/armor/leather_tunic"));
		}
		else if (r == 6)
		{
			this.m.Items.equip(this.new("scripts/items/armor/padded_leather"));
		}
		else if (r == 7)
		{
			this.m.Items.equip(this.new("scripts/items/armor/lamellar_harness"));
		}
		else if (r == 8)
		{
			this.m.Items.equip(this.new("scripts/items/armor/sackcloth"));
		}
		else if (r == 9)
		{
			this.m.Items.equip(this.new("scripts/items/armor/heavy_lamellar_armor"));
		}
		else if (r == 10)
		{
			this.m.Items.equip(this.new("scripts/items/armor/basic_mail_shirt"));
		}
		else if (r == 11)
		{
			this.m.Items.equip(this.new("scripts/items/armor/scale_armor"));
		}
		else if (r == 12)
		{
			this.m.Items.equip(this.new("scripts/items/armor/coat_of_scales"));
		}
		else if (r == 13)
		{
			this.m.Items.equip(this.new("scripts/items/armor/linen_tunic"));
		}
		else if (r == 14)
		{
			this.m.Items.equip(this.new("scripts/items/armor/tattered_sackcloth"));
		}
		else if (r == 15)
		{
			this.m.Items.equip(this.new("scripts/items/armor/heraldic_mail"));
		}
		else if (r == 16)
		{
			this.m.Items.equip(this.new("scripts/items/armor/named/black_leather_armor"));
		}
		else if (r == 17)
		{
			this.m.Items.equip(this.new("scripts/items/armor/named/golden_scale_armor"));
		}
		else if (r == 18)
		{
			this.m.Items.equip(this.new("scripts/items/armor/named/blue_studded_mail_armor"));
		}
		else if (r == 19)
		{
			this.m.Items.equip(this.new("scripts/items/armor/named/brown_coat_of_plates_armor"));
		}
		else if (r == 20)
		{
			this.m.Items.equip(this.new("scripts/items/armor/named/green_coat_of_plates_armor"));
		}
		else if (r == 21)
		{
			this.m.Items.equip(this.new("scripts/items/armor/ragged_surcoat"));
		}
		else if (r == 22)
		{
			this.m.Items.equip(this.new("scripts/items/armor/reinforced_mail_hauberk"));
		}
		else if (r == 23)
		{
			this.m.Items.equip(this.new("scripts/items/armor/mail_hauberk"));
		}
		else if (r == 24)
		{
			this.m.Items.equip(this.new("scripts/items/armor/leather_lamellar"));
		}

		r = this.Math.rand(1, 30);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/hood"));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/mail_coif"));
		}
		else if (r == 3)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/closed_mail_coif"));
		}
		else if (r == 4)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/reinforced_mail_coif"));
		}
		else if (r == 5)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/kettle_hat"));
		}
		else if (r == 6)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/nasal_helmet"));
		}
		else if (r == 7)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/padded_nasal_helmet"));
		}
		else if (r == 8)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/nasal_helmet_with_mail"));
		}
		else if (r == 9)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/full_helm"));
		}
		else if (r == 10)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/flat_top_helmet"));
		}
		else if (r == 11)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/padded_flat_top_helmet"));
		}
		else if (r == 12)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/flat_top_with_mail"));
		}
		else if (r == 13)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/kettle_hat_with_mail"));
		}
		else if (r == 14)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/kettle_hat_with_closed_mail"));
		}
		else if (r == 15)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/closed_flat_top_with_neckguard"));
		}
		else if (r == 16)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/closed_flat_top_helmet"));
		}
		else if (r == 17)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/closed_flat_top_with_mail"));
		}
		else if (r == 18)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/witchhunter_hat"));
		}
		else if (r == 19)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/named/golden_feathers_helmet"));
		}
		else if (r == 20)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/named/heraldic_mail_helmet"));
		}
		else if (r == 21)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/named/nasal_feather_helmet"));
		}
		else if (r == 22)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/named/norse_helmet"));
		}
		else if (r == 23)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/named/sallet_green_helmet"));
		}
		else if (r == 24)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/named/wolf_helmet"));
		}

		r = this.Math.rand(1, 17);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/noble_sword"));
			this.m.Items.equip(this.new("scripts/items/shields/heater_shield"));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/shortsword"));
		}
		else if (r == 3)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/greatsword"));
		}
		else if (r == 4)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/bludgeon"));
		}
		else if (r == 5)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/winged_mace"));
			this.m.Items.equip(this.new("scripts/items/shields/kite_shield"));
		}
		else if (r == 6)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/winged_mace"));
		}
		else if (r == 7)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/boar_spear"));
			this.m.Items.equip(this.new("scripts/items/shields/wooden_shield"));
		}
		else if (r == 8)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/hand_axe"));
			this.m.Items.equip(this.new("scripts/items/shields/wooden_shield"));
		}
		else if (r == 9)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/fighting_axe"));
		}
		else if (r == 10)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/dagger"));
		}
		else if (r == 11)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/billhook"));
		}
		else if (r == 12)
		{
			this.m.Items.equip(this.new("scripts/items/shields/heater_shield"));
			this.m.Items.equip(this.new("scripts/items/weapons/warhammer"));
		}
		else if (r == 13)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/military_cleaver"));
		}
		else if (r == 14)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/flail"));
		}
		else if (r == 15)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/pike"));
		}
		else if (r == 16)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/two_handed_hammer"));
		}
		else if (r == 17)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/warbrand"));
		}
	}

	function assignRandomRangedEquipment()
	{
		local r = this.Math.rand(1, 10);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/armor/padded_surcoat"));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/armor/mail_shirt"));
		}
		else if (r == 3)
		{
			this.m.Items.equip(this.new("scripts/items/armor/padded_leather"));
		}
		else if (r == 4)
		{
			this.m.Items.equip(this.new("scripts/items/armor/gambeson"));
		}
		else if (r == 5)
		{
			this.m.Items.equip(this.new("scripts/items/armor/leather_tunic"));
		}
		else if (r == 6)
		{
			this.m.Items.equip(this.new("scripts/items/armor/sackcloth"));
		}
		else if (r == 7)
		{
			this.m.Items.equip(this.new("scripts/items/armor/linen_tunic"));
		}
		else if (r == 8)
		{
			this.m.Items.equip(this.new("scripts/items/armor/tattered_sackcloth"));
		}
		else if (r == 9)
		{
			this.m.Items.equip(this.new("scripts/items/armor/ragged_surcoat"));
		}
		else if (r == 10)
		{
			this.m.Items.equip(this.new("scripts/items/armor/thick_tunic"));
		}

		r = this.Math.rand(1, 7);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/hood"));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/aketon_cap"));
		}
		else if (r == 3)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/full_aketon_cap"));
		}
		else if (r == 4)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/open_leather_cap"));
		}
		else if (r == 5)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/full_leather_cap"));
		}

		r = this.Math.rand(1, 4);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/hunting_bow"));
			this.m.Items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/short_bow"));
			this.m.Items.equip(this.new("scripts/items/ammo/quiver_of_arrows"));
		}
		else if (r == 3)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/crossbow"));
			this.m.Items.equip(this.new("scripts/items/ammo/quiver_of_bolts"));
		}
		else if (r == 4)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/light_crossbow"));
			this.m.Items.equip(this.new("scripts/items/ammo/quiver_of_bolts"));
		}
	}

	function assignRandomThrowingEquipment()
	{
		local r = this.Math.rand(1, 8);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/armor/padded_surcoat"));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/armor/mail_shirt"));
		}
		else if (r == 3)
		{
			this.m.Items.equip(this.new("scripts/items/armor/padded_leather"));
		}
		else if (r == 4)
		{
			this.m.Items.equip(this.new("scripts/items/armor/gambeson"));
		}
		else if (r == 5)
		{
			this.m.Items.equip(this.new("scripts/items/armor/leather_tunic"));
		}
		else if (r == 6)
		{
			this.m.Items.equip(this.new("scripts/items/armor/sackcloth"));
		}
		else if (r == 7)
		{
			this.m.Items.equip(this.new("scripts/items/armor/linen_tunic"));
		}
		else if (r == 8)
		{
			this.m.Items.equip(this.new("scripts/items/armor/tattered_sackcloth"));
		}

		r = this.Math.rand(1, 4);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/hood"));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/aketon_cap"));
		}
		else if (r == 3)
		{
			this.m.Items.equip(this.new("scripts/items/helmets/full_aketon_cap"));
		}

		r = this.Math.rand(1, 2);

		if (r == 1)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/throwing_axe"));
		}
		else if (r == 2)
		{
			this.m.Items.equip(this.new("scripts/items/weapons/javelin"));
		}
	}

	function setScenarioValues()
	{
		local b = this.m.BaseProperties;
		b.ActionPoints = 9;
		b.Hitpoints = 60;
		b.Bravery = this.Math.rand(45, 55);
		b.Stamina = 120;
		b.MeleeSkill = 65;
		b.RangedSkill = 65;
		b.MeleeDefense = 10;
		b.RangedDefense = 10;
		b.Initiative = 115;
		this.setName(this.Const.Tactical.Common.getRandomPlayerName());
		local background = this.new("scripts/skills/backgrounds/" + this.Const.CharacterBackgrounds[this.Math.rand(0, this.Const.CharacterBackgrounds.len() - 1)]);
		background.setScenarioOnly(true);
		this.m.Skills.add(background);
		background.buildDescription();
		background.setAppearance();
		local c = this.m.CurrentProperties;
		this.m.ActionPoints = c.ActionPoints;
		this.m.Hitpoints = c.Hitpoints;
		this.m.Talents.resize(this.Const.Attributes.COUNT, 0);
		this.fillAttributeLevelUpValues(this.Const.XP.MaxLevelWithPerkpoints - 1);
	}

	function setStartValuesEx( _backgrounds, _addTraits = true )
	{
		if (this.isSomethingToSee() && this.World.getTime().Days >= 7)
		{
			_backgrounds = this.Const.CharacterPiracyBackgrounds;
		}

		local background = this.new("scripts/skills/backgrounds/" + _backgrounds[this.Math.rand(0, _backgrounds.len() - 1)]);
		this.m.Skills.add(background);
		this.m.Background = background;
		this.m.Ethnicity = this.m.Background.getEthnicity();
		background.buildAttributes();
		background.buildDescription();

		if (this.m.Name.len() == 0)
		{
			this.m.Name = background.m.Names[this.Math.rand(0, background.m.Names.len() - 1)];
		}

		if (_addTraits)
		{
			local maxTraits = this.Math.rand(this.Math.rand(0, 1) == 0 ? 0 : 1, 2);
			local traits = [
				background
			];

			for( local i = 0; i < maxTraits; i = ++i )
			{
				for( local j = 0; j < 10; j = ++j )
				{
					local trait = this.Const.CharacterTraits[this.Math.rand(0, this.Const.CharacterTraits.len() - 1)];
					local nextTrait = false;

					for( local k = 0; k < traits.len(); k = ++k )
					{
						if (traits[k].getID() == trait[0] || traits[k].isExcluded(trait[0]))
						{
							nextTrait = true;
							break;
						}
					}

					if (!nextTrait)
					{
						traits.push(this.new(trait[1]));
						break;
					}
				}
			}

			for( local i = 1; i < traits.len(); i = ++i )
			{
				this.m.Skills.add(traits[i]);

				if (traits[i].getContainer() != null)
				{
					traits[i].addTitle();
				}
			}
		}

		background.addEquipment();
		background.setAppearance();
		background.buildDescription(true);
		this.m.Skills.update();
		local p = this.m.CurrentProperties;
		this.m.Hitpoints = p.Hitpoints;

		if (_addTraits)
		{
			this.fillTalentValues();
			this.fillAttributeLevelUpValues(this.Const.XP.MaxLevelWithPerkpoints - 1);
		}
	}

	function fillTalentValues()
	{
		this.m.Talents.resize(this.Const.Attributes.COUNT, 0);

		if (this.getBackground() != null && this.getBackground().isUntalented())
		{
			return;
		}

		for( local done = 0; done < 3;  )
		{
			local i = this.Math.rand(0, this.Const.Attributes.COUNT - 1);

			if (this.m.Talents[i] == 0 && (this.getBackground() == null || this.getBackground().getExcludedTalents().find(i) == null))
			{
				local r = this.Math.rand(1, 100);

				if (r <= 60)
				{
					this.m.Talents[i] = 1;
				}
				else if (r <= 90)
				{
					this.m.Talents[i] = 2;
				}
				else
				{
					this.m.Talents[i] = 3;
				}

				done = ++done;
			}
		}
	}

	function fillAttributeLevelUpValues( _amount, _maxOnly = false, _minOnly = false )
	{
		if (this.m.Attributes.len() == 0)
		{
			this.m.Attributes.resize(this.Const.Attributes.COUNT);

			for( local i = 0; i != this.Const.Attributes.COUNT; i = ++i )
			{
				this.m.Attributes[i] = [];
			}
		}

		for( local i = 0; i != this.Const.Attributes.COUNT; i = ++i )
		{
			for( local j = 0; j < _amount; j = ++j )
			{
				if (_minOnly)
				{
					this.m.Attributes[i].insert(0, 1);
				}
				else if (_maxOnly)
				{
					this.m.Attributes[i].insert(0, this.Const.AttributesLevelUp[i].Max);
				}
				else
				{
					this.m.Attributes[i].insert(0, this.Math.rand(this.Const.AttributesLevelUp[i].Min + (this.m.Talents[i] == 3 ? 2 : this.m.Talents[i]), this.Const.AttributesLevelUp[i].Max + (this.m.Talents[i] == 3 ? 1 : 0)));
				}
			}
		}
	}

	function getAttributeLevelUpValues()
	{
		local b = this.getBaseProperties();

		if (this.m.Attributes[0].len() == 0)
		{
			for( local i = 0; i != this.Const.Attributes.COUNT; i = ++i )
			{
				this.m.Attributes[i].push(1);
			}
		}

		local ret = {
			hitpoints = b.Hitpoints,
			hitpointsMax = 150,
			hitpointsIncrease = this.m.Attributes[this.Const.Attributes.Hitpoints][0],
			bravery = b.Bravery,
			braveryMax = 150,
			braveryIncrease = this.m.Attributes[this.Const.Attributes.Bravery][0],
			fatigue = b.Stamina,
			fatigueMax = 150,
			fatigueIncrease = this.m.Attributes[this.Const.Attributes.Fatigue][0],
			initiative = b.Initiative,
			initiativeMax = 200,
			initiativeIncrease = this.m.Attributes[this.Const.Attributes.Initiative][0],
			meleeSkill = b.MeleeSkill,
			meleeSkillMax = 120,
			meleeSkillIncrease = this.m.Attributes[this.Const.Attributes.MeleeSkill][0],
			rangeSkill = b.RangedSkill,
			rangeSkillMax = 120,
			rangeSkillIncrease = this.m.Attributes[this.Const.Attributes.RangedSkill][0],
			meleeDefense = b.MeleeDefense,
			meleeDefenseMax = 100,
			meleeDefenseIncrease = this.m.Attributes[this.Const.Attributes.MeleeDefense][0],
			rangeDefense = b.RangedDefense,
			rangeDefenseMax = 100,
			rangeDefenseIncrease = this.m.Attributes[this.Const.Attributes.RangedDefense][0]
		};
		return ret;
	}

	function setAttributeLevelUpValues( _v )
	{
		local b = this.getBaseProperties();
		b.Hitpoints += _v.hitpointsIncrease;
		this.m.Hitpoints += _v.hitpointsIncrease;
		b.Stamina += _v.maxFatigueIncrease;
		b.Bravery += _v.braveryIncrease;
		b.MeleeSkill += _v.meleeSkillIncrease;
		b.RangedSkill += _v.rangeSkillIncrease;
		b.MeleeDefense += _v.meleeDefenseIncrease;
		b.RangedDefense += _v.rangeDefenseIncrease;
		b.Initiative += _v.initiativeIncrease;
		this.m.LevelUps = this.Math.max(0, this.m.LevelUps - 1);

		for( local i = 0; i != this.Const.Attributes.COUNT; i = ++i )
		{
			this.m.Attributes[i].remove(0);
		}

		this.getSkills().update();
		//this.setDirty(true);

		if (b.MeleeSkill >= 90)
		{
			this.updateAchievement("Swordmaster", 1, 1);
		}

		if (b.RangedSkill >= 90)
		{
			this.updateAchievement("Deadeye", 1, 1);
		}
	}

	function addInjury( _injuries, _maxThreshold = 1.0, _isOutOfCombat = true )
	{
		if (_injuries.len() == 0)
		{
			return null;
		}

		local candidates = [];

		foreach( inj in _injuries )
		{
			if (inj.Threshold <= _maxThreshold && !this.m.Skills.hasSkill(inj.ID))
			{
				candidates.push(inj.Script);
			}
		}

		if (candidates.len() == 0)
		{
			return null;
		}

		local injury;

		while (candidates.len() != 0)
		{
			local r = this.Math.rand(0, candidates.len() - 1);
			injury = this.new("scripts/skills/" + candidates[r]);

			if (!injury.isValid(this))
			{
				candidates.remove(r);
				injury = null;
				continue;
			}

			break;
		}

		if (injury == null)
		{
			return null;
		}

		if (_isOutOfCombat)
		{
			injury.setOutOfCombat(true);
		}
		else
		{
			this.worsenMood(this.Const.MoodChange.Injury, "Suffered an injury");
		}

		this.m.Skills.add(injury);
		this.setHitpoints(this.Math.max(1, this.getHitpoints() - this.Math.rand(5, 20)));
		this.updateInjuryVisuals();
		return injury;
	}

	function addLightInjury()
	{
		this.setHitpoints(this.Math.max(1, this.getHitpoints() - this.Math.rand(5, 20)));
	}

	function addHeavyInjury()
	{
		this.setHitpoints(this.Math.max(1, this.getHitpoints() - this.Math.rand(20, 40)));
	}

	function retreat()
	{
		if (!this.isHiddenToPlayer())
		{
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(this) + " has retreated from battle");
		}

		this.m.IsTurnDone = true;
		this.m.IsAbleToDie = false;
		this.Tactical.getRetreatRoster().add(this);
		this.removeFromMap();
		this.Tactical.Entities.setLastCombatResult(this.Const.Tactical.CombatResult.PlayerRetreated);
	}

	function onSerialize( _out )
	{
		this.actor.onSerialize(_out);
		_out.writeU8(this.m.Body);

		if (this.m.Surcoat != null)
		{
			_out.writeU8(this.m.Surcoat);
		}
		else
		{
			_out.writeU8(0);
		}

		_out.writeU8(this.m.Ethnicity);
		_out.writeU8(this.m.Gender);
		_out.writeU8(this.m.VoiceSet);
		_out.writeBool(false);

		_out.writeU8(this.m.Level);
		_out.writeU8(this.m.PerkPoints);
		_out.writeU8(this.m.PerkPointsSpent);
		_out.writeU8(this.m.LevelUps);
		_out.writeF32(this.m.Mood);
		_out.writeU8(this.m.MoodChanges.len());

		for( local i = 0; i != this.m.MoodChanges.len(); i = ++i )
		{
			_out.writeBool(this.m.MoodChanges[i].Positive);
			_out.writeString(this.m.MoodChanges[i].Text);
			_out.writeF32(this.m.MoodChanges[i].Time);
		}

		_out.writeF32(this.m.HireTime);
		_out.writeF32(this.m.LastDrinkTime);

		for( local i = 0; i != this.Const.Attributes.COUNT; i = ++i )
		{
			_out.writeU8(this.m.Talents[i]);
		}

		for( local i = 0; i != this.Const.Attributes.COUNT; i = ++i )
		{
			_out.writeU8(this.m.Attributes[i].len());

			foreach( a in this.m.Attributes[i] )
			{
				_out.writeU8(a);
			}
		}

		_out.writeU8(this.m.PlaceInFormation);
		_out.writeU32(this.m.LifetimeStats.Kills);
		_out.writeU32(this.m.LifetimeStats.Battles);
		_out.writeU32(this.m.LifetimeStats.BattlesWithoutMe);
		_out.writeU16(this.m.LifetimeStats.MostPowerfulVanquishedType);
		_out.writeString(this.m.LifetimeStats.MostPowerfulVanquished);
		_out.writeU16(this.m.LifetimeStats.MostPowerfulVanquishedXP);
		_out.writeString(this.m.LifetimeStats.FavoriteWeapon);
		_out.writeU32(this.m.LifetimeStats.FavoriteWeaponUses);
		_out.writeU32(this.m.LifetimeStats.CurrentWeaponUses);
		_out.writeBool(this.m.IsTryoutDone);
	}

	function onDeserialize( _in )
	{
		if (_in.getMetaData().getVersion() >= 59)
		{
			this.actor.onDeserialize(_in);
			this.m.Body = _in.readU8();
			this.m.Surcoat = _in.readU8();

			if (this.m.Surcoat == 0)
			{
				this.m.Surcoat = null;
			}

			this.m.Ethnicity = _in.readU8();
			this.m.Gender = _in.readU8();
			this.m.VoiceSet = _in.readU8();
			this.m.Sound[this.Const.Sound.ActorEvent.Death] = [
				"sounds/enemies/percht_death01.wav",
				"sounds/enemies/percht_death02.wav",
				"sounds/enemies/percht_death03.wav",
				"sounds/enemies/percht_death04.wav"
			];
			this.m.Sound[this.Const.Sound.ActorEvent.Flee] = [
				"sounds/enemies/percht_flee01.wav",
				"sounds/enemies/percht_flee02.wav"
			];
			this.m.Sound[this.Const.Sound.ActorEvent.NoDamageReceived] = [
				"sounds/enemies/percht_hurt01.wav",
				"sounds/enemies/percht_hurt02.wav",
				"sounds/enemies/percht_hurt03.wav",
				"sounds/enemies/percht_hurt04.wav",
				"sounds/enemies/percht_hurt05.wav",
			];
			this.m.Sound[this.Const.Sound.ActorEvent.DamageReceived] = [
				"sounds/enemies/percht_hurt01.wav",
				"sounds/enemies/percht_hurt02.wav",
				"sounds/enemies/percht_hurt03.wav",
				"sounds/enemies/percht_hurt04.wav",
				"sounds/enemies/percht_hurt05.wav",
			];
			this.m.Sound[this.Const.Sound.ActorEvent.Idle] = [
				"sounds/enemies/percht_idle01.wav",
				"sounds/enemies/percht_idle02.wav",
				"sounds/enemies/percht_idle03.wav",
				"sounds/enemies/percht_idle04.wav",
				"sounds/enemies/percht_idle05.wav",
				"sounds/enemies/percht_idle06.wav",
				"sounds/enemies/percht_idle07.wav",
				"sounds/enemies/percht_idle08.wav",
				"sounds/enemies/percht_idle09.wav",
				"sounds/enemies/percht_idle10.wav",
				"sounds/enemies/percht_idle11.wav",
				"sounds/enemies/percht_idle12.wav"
			];
			this.m.Sound[this.Const.Sound.ActorEvent.Move] = [
				"sounds/enemies/percht_move01.wav",
				"sounds/enemies/percht_move02.wav",
				"sounds/enemies/percht_move03.wav",
				"sounds/enemies/percht_move04.wav"
			];
			this.m.Sound[this.Const.Sound.ActorEvent.Fatigue]=this.m.Sound[this.Const.Sound.ActorEvent.Move];
			this.m.SoundPitch = 1.0;
			this.m.SoundVolume[this.Const.Sound.ActorEvent.Death] = 1.7;
			this.m.SoundVolume[this.Const.Sound.ActorEvent.DamageReceived] = 1.7;
			this.m.SoundVolume[this.Const.Sound.ActorEvent.Idle] = 4;
			this.m.SoundVolume[this.Const.Sound.ActorEvent.Move] = 2;
			_in.readBool();
		}
		else
		{
			this.actor.onDeserialize(_in);
		}

		this.m.Surcoat = null;
		this.m.Level = _in.readU8();
		this.m.PerkPoints = _in.readU8();
		this.m.PerkPointsSpent = _in.readU8();
		this.m.LevelUps = _in.readU8();
		this.m.Mood = _in.readF32();
		local numMoodChanges = _in.readU8();
		this.m.MoodChanges.resize(numMoodChanges, 0);

		for( local i = 0; i != numMoodChanges; i = ++i )
		{
			local moodChange = {};
			moodChange.Positive <- _in.readBool();
			moodChange.Text <- _in.readString();
			moodChange.Time <- _in.readF32();
			this.m.MoodChanges[i] = moodChange;
		}

		this.m.HireTime = _in.readF32();
		this.m.LastDrinkTime = _in.readF32();
		this.m.Talents.resize(this.Const.Attributes.COUNT, 0);

		for( local i = 0; i != this.Const.Attributes.COUNT; i = ++i )
		{
			this.m.Talents[i] = _in.readU8();
		}

		this.m.Attributes.resize(this.Const.Attributes.COUNT);

		for( local i = 0; i != this.Const.Attributes.COUNT; i = ++i )
		{
			this.m.Attributes[i] = [];
			local n = _in.readU8();
			this.m.Attributes[i].resize(n);

			for( local j = 0; j != n; j = ++j )
			{
				this.m.Attributes[i][j] = _in.readU8();
			}
		}

		local ret = this.m.Skills.query(this.Const.SkillType.Background);

		if (ret.len() != 0)
		{
			this.m.Background = ret[0];
			this.m.Background.adjustHiringCostBasedOnEquipment();
			this.m.Background.buildDescription(true);
		}

		this.m.PlaceInFormation = _in.readU8();
		this.m.LifetimeStats.Kills = _in.readU32();
		this.m.LifetimeStats.Battles = _in.readU32();
		this.m.LifetimeStats.BattlesWithoutMe = _in.readU32();

		if (_in.getMetaData().getVersion() >= 37)
		{
			this.m.LifetimeStats.MostPowerfulVanquishedType = _in.readU16();
		}

		this.m.LifetimeStats.MostPowerfulVanquished = _in.readString();
		this.m.LifetimeStats.MostPowerfulVanquishedXP = _in.readU16();
		this.m.LifetimeStats.FavoriteWeapon = _in.readString();
		this.m.LifetimeStats.FavoriteWeaponUses = _in.readU32();
		this.m.LifetimeStats.CurrentWeaponUses = _in.readU32();
		this.m.IsTryoutDone = _in.readBool();
		this.m.Skills.update();
	}	

	function setAppearance()
	{
		if (this.m.HairColors == null)
		{
			return;
		}

		local hairColor = this.m.HairColors[this.Math.rand(0, this.m.HairColors.len() - 1)];

		if (this.m.Faces != null)
		{
			local sprite = this.getSprite("head");
			sprite.setBrush(this.m.Faces[this.Math.rand(0, this.m.Faces.len() - 1)]);
			sprite.Color = this.createColor("#fbffff");
			sprite.varyColor(0.05, 0.05, 0.05);
			sprite.varySaturation(0.1);
			local body = this.getSprite("body");
			body.Color = sprite.Color;
			body.Saturation = sprite.Saturation;
		}

		if (this.m.Hairs != null && this.Math.rand(0, this.m.Hairs.len()) != this.m.Hairs.len())
		{
			local sprite = this.getSprite("hair");
			sprite.setBrush("hair_" + hairColor + "_" + this.m.Hairs[this.Math.rand(0, this.m.Hairs.len() - 1)]);

			if (hairColor != "grey")
			{
				sprite.varyColor(0.1, 0.1, 0.1);
			}
			else
			{
				sprite.varyBrightness(0.1);
			}
		}
		else
		{
			this.getSprite("hair").Visible = false;
		}

		if (this.m.Beards != null && this.Math.rand(1, 100) <= this.m.BeardChance)
		{
			local beard = this.getSprite("beard");
			beard.setBrush("beard_" + hairColor + "_" + this.m.Beards[this.Math.rand(0, this.m.Beards.len() - 1)]);
			beard.Color = this.getSprite("hair").Color;

			if (this.doesBrushExist(beard.getBrush().Name + "_top"))
			{
				local sprite = this.getSprite("beard_top");
				sprite.setBrush(beard.getBrush().Name + "_top");
				sprite.Color = this.getSprite("hair").Color;
			}
		}
		else
		{
			this.getSprite("beard").Visible = false;
		}

		if (this.m.Ethnicity == 1 && hairColor != "grey")
		{
			local hair = this.getSprite("hair");
			hair.Saturation = 0.8;
			hair.setBrightness(0.4);
			local beard = this.getSprite("beard");
			beard.Color = hair.Color;
			beard.Saturation = hair.Saturation;
			local beard_top = this.getSprite("beard_top");
			beard_top.Color = hair.Color;
			beard_top.Saturation = hair.Saturation;
		}
	}

	function updateInjuryVisuals( _setDirty = true )
	{
		local injuries = this.getSkills().query(this.Const.SkillType.Injury);
		this.getSprite("bandage_1").Visible = false;
		this.getSprite("bandage_1").setBrush("bandage_01");
		this.getSprite("bandage_2").Visible = false;
		this.getSprite("bandage_2").setBrush("bandage_02");
		this.getSprite("bandage_3").Visible = false;
		this.getSprite("bandage_3").setBrush("bandage_03");

		foreach( inj in injuries )
		{
			inj.showInjury();
		}

		//this.setDirty(_setDirty);
	}

});

