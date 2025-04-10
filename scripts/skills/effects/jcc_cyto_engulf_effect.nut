this.jcc_cyto_engulf_effect <- this.inherit("scripts/skills/skill", {
	m = {
		Mode = 0,
		LastRoundApplied = 0,
		SpriteScaleBackup = 1.0,
		OnRemoveCallback = null,
		OnRemoveCallbackData = null,
		ParentID = null
	},
	function setOnRemoveCallback( _c, _d )
	{
		this.m.OnRemoveCallback = _c;
		this.m.OnRemoveCallbackData = _d;
	}



	function setParentID( _p )
	{
		this.m.ParentID = _p;
	}

	function create()
	{
		this.m.ID = "effects.jcc_cyto_engulf";
		this.m.Name = "Engulfed";
		this.m.Description = "This character is engulfed by a cytoplasm and slowly being digested alive";
		this.m.Icon = "skills/status_effect_95.png";
		this.m.IconMini = "status_effect_95_mini";
		this.m.Overlay = "status_effect_95";
		this.m.SoundOnUse = [
			"sounds/enemies/dlc2/giant_spider_poison_01.wav",
			"sounds/enemies/dlc2/giant_spider_poison_02.wav"
		];
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
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
				text = "This character is engulfed by a cytoplasm and slowly being digested alive, resulting in the loss of [color=" + this.Const.UI.Color.NegativeValue + "]10[/color] hitpoints and [color=" + this.Const.UI.Color.NegativeValue + "]20[/color]% armor."
			},
			{
				id = 9,
				type = "text",
				icon = "ui/icons/action_points.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Unable to move[/color]"
			},
			{
				id = 9,
				type = "text",
				icon = "ui/icons/action_points.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Unable to use skills[/color]"
			}
		];
	}

	function applyDamage()
	{
		if (this.m.LastRoundApplied != this.Time.getRound())
		{
			this.m.LastRoundApplied = this.Time.getRound();
			local actor = this.getContainer().getActor();
			local head_affected = !actor.getFlags().has("head_immune_to_acid");
			local body_affected = !actor.getFlags().has("body_immune_to_acid");
			local damage_applied = false;
			this.spawnIcon("status_effect_78", actor.getTile());

			if (head_affected)
			{
				local damage = actor.getArmor(this.Const.BodyPart.Head) * 0.2;

				if (this.isKindOf(actor.get(), "kraken"))
				{
					damage = damage * 0.5;
				}

				local hitInfo = clone this.Const.Tactical.HitInfo;
				hitInfo.DamageRegular = 0.0;
				hitInfo.DamageArmor = damage;
				hitInfo.DamageDirect = 0.0;
				hitInfo.BodyPart = this.Const.BodyPart.Head;
				hitInfo.BodyDamageMult = 1.0;
				hitInfo.FatalityChanceMult = 0.0;

				if (hitInfo.DamageArmor > 0)
				{
					damage_applied = true;
				}

				this.getContainer().getActor().onDamageReceived(this.getContainer().getActor(), this, hitInfo);
			}

			if (body_affected)
			{
				local damage = actor.getArmor(this.Const.BodyPart.Body) * 0.2;

				if (this.isKindOf(actor.get(), "kraken"))
				{
					damage = damage * 0.5;
				}

				local hitInfo = clone this.Const.Tactical.HitInfo;
				hitInfo.DamageRegular = 0.0;
				hitInfo.DamageArmor = damage;
				hitInfo.DamageDirect = 0.0;
				hitInfo.BodyPart = this.Const.BodyPart.Body;
				hitInfo.BodyDamageMult = 1.0;
				hitInfo.FatalityChanceMult = 0.0;

				if (hitInfo.DamageArmor > 0)
				{
					damage_applied = true;
				}

				this.getContainer().getActor().onDamageReceived(this.getContainer().getActor(), this, hitInfo);
			}

			if (damage_applied && !actor.isHiddenToPlayer())
			{
				if (this.m.SoundOnUse.len() != 0)
				{
					this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.RacialEffect * 1.2, actor.getPos());
				}

				for( local i = 0; i < this.Const.Tactical.AcidParticles.len(); i = ++i )
				{
					this.Tactical.spawnParticleEffect(true, this.Const.Tactical.AcidParticles[i].Brushes, this.getContainer().getActor().getTile(), this.Const.Tactical.AcidParticles[i].Delay, this.Const.Tactical.AcidParticles[i].Quantity, this.Const.Tactical.AcidParticles[i].LifeTimeQuantity, this.Const.Tactical.AcidParticles[i].SpawnRate, this.Const.Tactical.AcidParticles[i].Stages);
				}
			}

		}

		if (this.m.LastRoundApplied != this.Time.getRound())
		{
			this.m.LastRoundApplied = this.Time.getRound();
			this.spawnIcon("status_effect_95", this.getContainer().getActor().getTile());

			if (this.m.SoundOnUse.len() != 0)
			{
				this.Sound.play(this.m.SoundOnUse[this.Math.rand(0, this.m.SoundOnUse.len() - 1)], this.Const.Sound.Volume.RacialEffect * 1.0, this.getContainer().getActor().getPos());
			}

			local hitInfo = clone this.Const.Tactical.HitInfo;
			hitInfo.DamageRegular = this.Math.rand(10, 15);
			hitInfo.DamageDirect = 1.0;
			hitInfo.BodyPart = this.Const.BodyPart.Body;
			hitInfo.BodyDamageMult = 1.0;
			hitInfo.FatalityChanceMult = 0.0;
			this.getContainer().getActor().onDamageReceived(this.getContainer().getActor(), this, hitInfo);
		}
	}

	function onAdded()
	{
		local actor = this.getContainer().getActor();
		local sprite1 = actor.getSprite("status_rooted");
		local sprite2 = actor.getSprite("status_rooted_back");
		this.m.SpriteScaleBackup = sprite1.Scale;
		sprite1.Scale = 1.0;
		sprite2.Scale = 1.0;
		this.Tactical.TurnSequenceBar.pushEntityBack(this.getContainer().getActor().getID());

		if (this.m.ParentID != null)
		{
			this.Tactical.TurnSequenceBar.pushEntityBack(this.m.ParentID);
		}
	}

	function onRemoved()
	{
		local actor = this.getContainer().getActor();
		actor.getSprite("status_rooted").Scale = this.m.SpriteScaleBackup;
		actor.getSprite("status_rooted_back").Scale = this.m.SpriteScaleBackup;

		if (this.m.OnRemoveCallback != null && !this.Tactical.Entities.isCombatFinished())
		{
			this.m.OnRemoveCallback(this.m.OnRemoveCallbackData);
		}
	}

	function onDeath( _fatalityType )
	{
		if (this.m.OnRemoveCallbackData != null)
		{
			this.m.OnRemoveCallbackData.LoseHitpoints = false;
		}

		this.onRemoved();
	}

	function onUpdate( _properties )
	{
		_properties.IsRooted = true;
		_properties.IsAbleToUseSkills = false;
		_properties.InitiativeForTurnOrderAdditional = -100;
	}

	function onTurnEnd()
	{

			this.applyDamage();
		
	}

	function onWaitTurn()
	{

			this.applyDamage();
		
	}

});

