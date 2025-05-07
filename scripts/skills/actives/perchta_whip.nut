this.perchta_whip <- this.inherit("scripts/skills/skill", {
	m = {
		StunChance = 30
	},
	function create()
	{
		this.m.ID = "actives.perchta_whip";
		this.m.Name = "Whip";
		this.m.Description = "";
		this.m.Icon = "skills/active_72.png";
		this.m.IconDisabled = "skills/active_72_sw.png";
		this.m.Overlay = "active_72";
		this.m.SoundOnUse = [
			"sounds/combat/dlc6/whip_slave_01.wav",
			"sounds/combat/dlc6/whip_slave_02.wav",
			"sounds/combat/dlc6/whip_slave_03.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = false;
		this.m.IsShieldRelevant = false;
		this.m.IsWeaponSkill = true;
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 5;
		this.m.MinRange = 1;
		this.m.MaxRange = 5;
	}

	function onVerifyTarget( _originTile, _targetTile )
	{
		if (!this.skill.onVerifyTarget(_originTile, _targetTile))
		{
			return false;
		}

		if (_targetTile.getEntity().getMoraleState() == this.Const.MoraleState.Confident || !_targetTile.getEntity().getFlags().has("jccBeast"))
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		local target = _targetTile.getEntity();

		if (!target.isHiddenToPlayer() || !_user.isHiddenToPlayer())
		{
			this.Time.scheduleEvent(this.TimeUnit.Virtual, 300, this.onDelayedEffect.bindenv(this), target);
		}
		else
		{
			this.onDelayedEffect(target);
		}



		local hitInfo = clone this.Const.Tactical.HitInfo;
		hitInfo.DamageRegular = this.Math.rand(1, 3);
		hitInfo.DamageDirect = 1.0;
		hitInfo.BodyPart = this.Const.BodyPart.Body;
		hitInfo.BodyDamageMult = 1.0;
		hitInfo.FatalityChanceMult = 0.0;
		target.onDamageReceived(_user, this, hitInfo);


		return true;
	}


	function onDelayedEffect( _target )
	{

		local target = _target;

		if (target.isAlive() && !target.isDying())
		{
			if (_target.getMoraleState() == this.Const.MoraleState.Fleeing)
			{
				_target.checkMorale(this.Const.MoraleState.Steady - this.Const.MoraleState.Fleeing, 9000);
			}
			else
			{
				_target.checkMorale(10, 9000);
			}

			local effect = _target.getSkills().getSkillByID("effects.killing_frenzy");

			if (effect != null)
			{
				effect.reset();
			}
			else
			{
				_target.getSkills().add(this.new("scripts/skills/effects/killing_frenzy_effect"));
			}
			this.spawnIcon("perk_36", _target.getTile());
		}
				if(this.Math.rand(1,100)<50){
			this.Sound.play("sounds/enemies/percht_hurt05.wav", this.Const.Sound.Volume.Skill, _target.getTile());
		}else{
			this.Sound.play("sounds/enemies/percht_hurt03.wav", this.Const.Sound.Volume.Skill, _target.getTile());
		}


	}

});

