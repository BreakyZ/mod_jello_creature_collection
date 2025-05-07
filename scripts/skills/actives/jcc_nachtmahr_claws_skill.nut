this.jcc_nachtmahr_claws_skill <- this.inherit("scripts/skills/skill", {
	m = {		BleedingSounds = [
			"sounds/combat/rupture_blood_01.wav",
			"sounds/combat/rupture_blood_02.wav",
			"sounds/combat/rupture_blood_03.wav"
		]},
	function create()
	{
		this.m.ID = "actives.jcc_nachtmahr_claws_skill";
		this.m.Name = "Gloom Claws";
		this.m.Description = "Long and sharp claws that can tear flesh with ease.";
		this.m.KilledString = "Ripped to shreds";
		this.m.Icon = "skills/nachtmahr_claw.png";
		this.m.IconDisabled = "skills/nachtmahr_claw_sw.png";
		this.m.Overlay = "nachtmahr_claw";
		this.m.SoundOnUse = [
			"sounds/enemies/nachtmahr_claws_01.wav",
			"sounds/enemies/nachtmahr_claws_02.wav",
			"sounds/enemies/nachtmahr_claws_03.wav",
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.InjuriesOnBody = this.Const.Injury.CuttingBody;
		this.m.InjuriesOnHead = this.Const.Injury.CuttingHead;
		this.m.DirectDamageMult = 0.1;
		this.m.ActionPointCost = 3;
		this.m.FatigueCost = 6;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
		this.m.ChanceDecapitate = 33;
		this.m.ChanceDisembowel = 33;
		this.m.ChanceSmash = 0;
	}
	function addResources()
	{
		this.skill.addResources();

		foreach( r in this.m.BleedingSounds )
		{
			this.Tactical.addResource(r);
		}
	}
	function onUpdate( _properties )
	{

		//local size = this.getContainer().getActor().getSize();
	}

	function onUse( _user, _targetTile )
	{
		this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectClaws);
		local success = this.attackEntity(_user, _targetTile.getEntity());
		if(success){
			this.Sound.play(this.m.BleedingSounds[this.Math.rand(0, this.m.BleedingSounds.len() - 1)], 0.75, _user.getPos());
		}
		return success;
	}

	function getExpectedDamage( _target )
	{
		local ret = this.skill.getExpectedDamage(_target);
		ret.HitpointDamage = this.Math.max(10, ret.HitpointDamage);
		ret.TotalDamage = this.Math.max(10, ret.TotalDamage);
		return ret;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			_properties.DamageMinimum = this.Math.max(_properties.DamageMinimum, 10);
			_properties.DamageRegularMin += 25;
			_properties.DamageRegularMax += 40;
			_properties.DamageArmorMult *= 0.75;

			local targetStatus = _targetEntity.getSkills();

			if (targetStatus.hasSkill("effects.sleeping"))
			{
				_properties.MeleeSkill += 20;
			}
		}


	}

});

