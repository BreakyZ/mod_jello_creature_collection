this.jcc_dragon_zoc_claws_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.jcc_dragon_zoc_claws";
		this.m.Name = "Dragon Claws";
		this.m.Description = "Long and sharp claws that can tear flesh with ease.";
		this.m.KilledString = "Ripped to shreds";
		this.m.Icon = "skills/active_21.png";
		this.m.IconDisabled = "skills/active_21_sw.png";
		this.m.Overlay = "active_21";
		this.m.SoundOnUse = [
			"sounds/enemies/jcc_dragon_claw_01.wav",
			"sounds/enemies/jcc_dragon_claw_02.wav",
			"sounds/enemies/jcc_dragon_claw_03.wav",
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
		this.m.ActionPointCost = 4;
		this.m.FatigueCost = 6;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
		this.m.ChanceDecapitate = 33;
		this.m.ChanceDisembowel = 33;
		this.m.ChanceSmash = 0;
	}

	function onUpdate( _properties )
	{

		//local size = this.getContainer().getActor().getSize();
	}

	function onUse( _user, _targetTile )
	{
		this.spawnAttackEffect(_targetTile, this.Const.Tactical.AttackEffectClaws);
		return this.attackEntity(_user, _targetTile.getEntity());
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			_properties.DamageRegularMin += 25;
			_properties.DamageRegularMax += 40;
			_properties.DamageArmorMult *= 0.75;
		}
	}

});

