this.jcc_cyto_engulf_effect <- this.inherit("scripts/skills/skill", {
	m = {
		LastRoundApplied = 0,
		SpriteScaleBackup = 1.0,
		Slime = null,
		IsActivated = false
	},

	function activate()
	{
		this.m.IsActivated = true;
	}

	function setSlime ( _a )
	{
		this.m.Slime = ::MSU.asWeakTableRef(_a);
	}
	
	function create()
	{
		this.m.Name = "Engulfed";
		this.m.Description = "This character is engulfed by a cytoplasm and slowly being digested alive.";
		this.m.SoundOnUse = [
			"sounds/combat/poison_applied_01.wav",
			"sounds/combat/poison_applied_02.wav"
		];
		this.m.ID = "effects.jcc_cyto_engulf";
		this.m.Icon = "skills/jcc_engulfed_effect.png";
		this.m.IconMini = "jcc_engulfed_effect_mini";
		this.m.Overlay = "jcc_engulfed_effect";
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
				text = "This character is engulfed by a cytoplasm and slowly being digested alive, resulting in the loss of [color=" + this.Const.UI.Color.NegativeValue + "]10[/color] hitpoints and [color=" + this.Const.UI.Color.NegativeValue + "]20%[/color] armor."
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/regular_damage.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-50%[/color] Damage"
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
				icon = "ui/icons/special.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Status is removed when the cytoplasm takes 60 or more damage in one attack[/color]"
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
				local hitInfo = clone this.Const.Tactical.HitInfo;
				hitInfo.DamageRegular = 0;
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
				local hitInfo = clone this.Const.Tactical.HitInfo;
				hitInfo.DamageRegular = 0;
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

			if (damage_applied)
			{
				local hitInfo = clone this.Const.Tactical.HitInfo;
				hitInfo.DamageRegular = 10;
				hitInfo.DamageArmor = 0;
				hitInfo.DamageDirect = 1.0;
				hitInfo.BodyPart = this.Const.BodyPart.Body;
				hitInfo.BodyDamageMult = 1.0;
				hitInfo.FatalityChanceMult = 0.0;

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
	}


	function removeOthersEffect()
	{
		if (this.m.Slime != null && this.m.Slime.isAlive())
		{
			this.m.Slime.getSkills().removeByID("effects.jcc_engulfing_enemy")
			this.m.Slime = null;
			this.m.IsActivated = false;
		}
	}

	function onRemoved()
	{
		this.removeOthersEffect()
		local actor = this.getContainer().getActor();
		actor.getSprite("status_rooted").Scale = this.m.SpriteScaleBackup;
		actor.getSprite("status_rooted_back").Scale = this.m.SpriteScaleBackup;
	}

	function onDeath( _fatalityType )
	{
		this.onRemoved();
	}

	function onUpdate( _properties )
	{
		if (this.m.IsActivated && this.m.Slime != null && this.m.Slime.isAlive())
		{
			_properties.IsRooted = true;
			_properties.DamageTotalMult *= 0.5;
			_properties.InitiativeMult *= 0.5;
		}
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
