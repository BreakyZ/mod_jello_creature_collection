this.slime_smack <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.slime_smack";
		this.m.Name = "Slime Smack";
		this.m.Description = "";
		this.m.KilledString = "Battered to death";
		this.m.Icon = "skills/slime_smack.png";
		this.m.IconDisabled = "skills/slime_smack.png";
		this.m.Overlay = "slime_smack";
		this.m.SoundOnUse = [
			"sounds/enemies/slime_smack_01.wav",
			"sounds/enemies/slime_smack_02.wav"
		];
		/*this.m.SoundOnHit = [
			"sounds/enemies/golem_flurry_01.wav",
			"sounds/enemies/golem_flurry_02.wav"
		];*/
		this.m.SoundOnHitDelay = 0;
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsAOE = true;
		this.m.InjuriesOnBody = this.Const.Injury.SlimeBodyInjuries;
		this.m.InjuriesOnHead = this.Const.Injury.SlimeHeadInjuries;
		this.m.HitChanceBonus = 0;
		this.m.DirectDamageMult = 0.35;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 25;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
		this.m.ChanceDecapitate = 0;
		this.m.ChanceDisembowel = 0;
		this.m.ChanceSmash = 0;
	}

	function isUsable()
	{
		return this.skill.isUsable();
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			if (this.getContainer().getActor().getSize() == 1)
			{
				this.m.SoundOnHit = [
				"sounds/combat/bash_01.wav",
				"sounds/combat/bash_02.wav",
				"sounds/combat/bash_03.wav"
				];
			}
			
			
			_properties.DamageRegularMin = 35;
			_properties.DamageRegularMax = 45;
			_properties.DamageArmorMult = 0.6;

			if (this.getContainer().getActor().getSize() >=2 )
			{
			
				_properties.DamageRegularMin = 40;
				_properties.DamageRegularMax = 50;
				_properties.DamageArmorMult = 0.7;

				this.m.SoundOnHit = [
					"sounds/enemies/golem_flurry_01.wav",
					"sounds/enemies/golem_flurry_02.wav"
				];
			}

			if (getContainer().getActor().getSize() ==3 )
			{	
				_properties.DamageRegularMin = 45;
				_properties.DamageRegularMax = 55;
				_properties.DamageArmorMult = 1.0;
			
				this.m.DirectDamageMult = 0.5;
			}
		}
	}

	function onUse( _user, _targetTile )
	{
		local user = this.m.Container.getActor();
		this.Sound.play(this.m.SoundOnHit[this.Math.rand(0, this.m.SoundOnHit.len() - 1)], 1.0, _targetTile.Pos);
		this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(user) + " attacks with oozing tendrils.");
		local ownTile = user.getTile();
		local targetTiles = [];
		local attackDelay = 0;
		local currentTileIndex = 0;
		local numAttacks = getContainer().getActor().getSize();

		for( local i = 0; i < 6; i = ++i )
		{
			if (!ownTile.hasNextTile(i))
			{
			}
			else
			{
				targetTiles.push(ownTile.getNextTile(i));
			}
		}

		while (numAttacks > 0)
		{
			local tile = targetTiles[currentTileIndex];

			if (!tile.IsEmpty && tile.getEntity().isAttackable() && this.Math.abs(tile.Level - ownTile.Level) <= 1 && !user.isAlliedWith(tile.getEntity()))
			{
				this.m.Container.setBusy(true);
				this.Time.scheduleEvent(this.TimeUnit.Virtual, attackDelay, function ( _skill )
				{
					if (tile.getEntity() != null && tile.getEntity().isAlive())
					{
						this.spawnAttackEffect(tile, this.Const.Tactical.AttackEffectChop);
						_skill.attackEntity(user, tile.getEntity());

						if (numAttacks == 1)
						{
							_skill.getContainer().setBusy(false);
						}
					}
				}.bindenv(this), this);
				attackDelay = attackDelay + 200;
				numAttacks--;
			}

			currentTileIndex++;

			if (currentTileIndex >= targetTiles.len())
			{
				if (numAttacks == 6)
				{
					  // [133]  OP_JMP            0      5    0    0
				}
				else
				{
					currentTileIndex = 0;
				}
			}

			  // [137]  OP_CLOSE          0      9    0    0
		}

		return true;
	}

});

