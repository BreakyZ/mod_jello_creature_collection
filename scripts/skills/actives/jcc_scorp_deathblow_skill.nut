this.jcc_scorp_deathblow_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.jcc_scorp_deathblow";
		this.m.Name = "Stinger Stab";
		this.m.Description = "Land a deadly hit on a debilitated target to finish it off.";
		this.m.KilledString = "Stabbed";
		this.m.Icon = "skills/jcc_scorpion_sting_01.png";
		this.m.IconDisabled = "skills/jcc_scorpion_sting_01_sw.png";
		this.m.Overlay = "jcc_scorpion_sting_01";
		this.m.SoundOnUse = [
			"sounds/combat/dlc6/deathblow_01.wav",
			"sounds/combat/dlc6/deathblow_02.wav",
			"sounds/combat/dlc6/deathblow_03.wav",
			"sounds/combat/dlc6/deathblow_04.wav"
		];
		this.m.SoundOnHitHitpoints = [
			"sounds/combat/dlc6/deathblow_hit_01.wav",
			"sounds/combat/dlc6/deathblow_hit_02.wav",
			"sounds/combat/dlc6/deathblow_hit_03.wav",
			"sounds/combat/dlc6/deathblow_hit_04.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsIgnoredAsAOO = false;
		this.m.IsWeaponSkill = false;
		this.m.InjuriesOnBody = this.Const.Injury.PiercingBody;
		this.m.InjuriesOnHead = this.Const.Injury.PiercingHead;
		this.m.DirectDamageMult = 0.3;
		this.m.ActionPointCost = 6;
		this.m.FatigueCost = 10;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
	}

	function getTooltip()
	{
		local ret = this.getDefaultTooltip();
		ret.push({
			id = 8,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]33%[/color] more damage against and ignores additional [color=" + this.Const.UI.Color.DamageValue + "]20%[/color] armor of targets that have the Dazed, Stunned or Trapped in Net status effects"
		});
		return ret;
	}

	function onAfterUpdate( _properties )
	{
		if (_properties.IsSpecializedInDaggers)
		{
			this.m.FatigueCostMult = this.Const.Combat.WeaponSpecFatigueMult;
			this.m.ActionPointCost = 3;
		}
	}

	function onUse( _user, _targetTile )
	{
		return this.attackEntity(_user, _targetTile.getEntity());
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_targetEntity == null)
		{
			return;
		}

		local targetStatus = _targetEntity.getSkills();

		if (_skill == this )
		{
			_properties.DamageRegularMin += 30;
			_properties.DamageRegularMax += 40;
			_properties.DamageArmorMult *= 1.0;

			if(targetStatus.hasSkill("effects.dazed") || targetStatus.hasSkill("effects.stunned") || targetStatus.hasSkill("effects.sleeping") || targetStatus.hasSkill("effects.net") || targetStatus.hasSkill("effects.web") || targetStatus.hasSkill("effects.rooted"))
			{
				_properties.DamageTotalMult *= 1.33;
				_properties.DamageDirectAdd += 0.3;
				_properties.MeleeSkill += 10;
			}
		}
	}

});

