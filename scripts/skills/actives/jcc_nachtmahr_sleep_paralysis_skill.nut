this.jcc_nachtmahr_sleep_paralysis_skill <- this.inherit("scripts/skills/skill", {
	m = {
			//Cooldown = 0
		},
	function create()
	{
		this.m.ID = "actives.jcc_nachtmahr_sleep_paralysis";
		this.m.Name = "Sleep Paralysis";
		this.m.Description = "";
		this.m.Icon = "skills/nachtmahr_paralysis.png";
		this.m.IconDisabled = "skills/nachtmahr_paralysis_sw.png";
		this.m.Overlay = "nachtmahr_paralysis";
		this.m.SoundOnUse = [
			"sounds/enemies/horror_spell_01.wav",
			"sounds/enemies/horror_spell_02.wav",
			"sounds/enemies/horror_spell_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.Delay = 0;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsRanged = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = false;
		this.m.IsUsingHitchance = false;
		this.m.IsDoingForwardMove = false;
		this.m.IsVisibleTileNeeded = false;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 0;
		this.m.MinRange = 2;
		this.m.MaxRange = 5;
		this.m.MaxLevelDifference = 4;
	}

	function isViableTarget( _user, _target )
	{
		if (_target.isAlliedWith(_user))
		{
			return false;
		}

		if (_target.getMoraleState() == this.Const.MoraleState.Ignore || _target.getMoraleState() == this.Const.MoraleState.Fleeing || _target.getCurrentProperties().IsStunned)
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		local targets = [];
						

		this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " uses Sleep Paralysis");

		//this.m.Cooldown = 3;

		this.getContainer().getActor().getAIAgent().setCooldown(3);

		if (_targetTile.IsOccupiedByActor)
		{
			local entity = _targetTile.getEntity();

			if (this.isViableTarget(_user, entity))
			{
				targets.push(entity);
			}
		}

		for( local i = 0; i < 6; i = ++i )
		{
			if (!_targetTile.hasNextTile(i))
			{
			}
			else
			{
				local adjacent = _targetTile.getNextTile(i);

				if (adjacent.IsOccupiedByActor)
				{
					local entity = adjacent.getEntity();

					if (this.isViableTarget(_user, entity))
					{
						targets.push(entity);
					}
				}
			}
		}

		foreach( target in targets )
		{
			
			if (target.getMoraleState() == this.Const.MoraleState.Steady)
			{
				target.setMoraleState(this.Const.MoraleState.Wavering);
			}

			local effect = this.Tactical.spawnSpriteEffect("effect_skull_03", this.createColor("#ffffff"), target.getTile(), 0, 40, 1.0, 0.25, 0, 400, 300);

			if (target.getCurrentProperties().MoraleCheckBraveryMult[this.Const.MoraleCheckType.MentalAttack] >= 1000.0)
			{
				continue;
			}

			target.checkMorale(-1, -15, this.Const.MoraleCheckType.MentalAttack);

			if (!target.checkMorale(0, -15, this.Const.MoraleCheckType.MentalAttack))
			{
				target.getSkills().add(this.new("scripts/skills/effects/horrified_effect"));

				if (!_user.isHiddenToPlayer() && !target.isHiddenToPlayer())
				{
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(target) + " is horrified");
				}
			}else{
				
				local bonus = this.m.MaxRange + 1 - this.getContainer().getActor().getTile().getDistanceTo(target.getTile());
				target.checkMorale(-1, 1*bonus, this.Const.MoraleCheckType.MentalAttack);
				if (target.checkMorale(0, -5 * bonus, this.Const.MoraleCheckType.MentalAttack))
				{
					if (!_user.isHiddenToPlayer() && !target.isHiddenToPlayer())
					{
						this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(target) + " resists the urge to sleep thanks to his resolve");
					}
					bonus*=2;
					continue;
				}

				target.getSkills().add(this.new("scripts/skills/effects/sleeping_effect"));

				if (!_user.isHiddenToPlayer() && !target.isHiddenToPlayer())
				{
					this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(target) + " falls to sleep");
				}
			}
		}

		return true;
	}

	function onTurnStart()
	{
		this.getContainer().getActor().getAIAgent().setCooldown(this.Math.max(0, this.getContainer().getActor().getAIAgent().getCooldown() - 1));
		
	}

	function isUsable()
	{
		return this.skill.isUsable() && this.getContainer().getActor().getAIAgent().getCooldown() == 0 && !this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions());;
	}

	
});

