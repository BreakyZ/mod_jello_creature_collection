this.jcc_call_of_the_wild <- this.inherit("scripts/skills/skill", {
	m = {
		BleedDamage = 5,
		BleedSounds = [
			"sounds/combat/cleave_hit_hitpoints_01.wav",
			"sounds/combat/cleave_hit_hitpoints_02.wav",
			"sounds/combat/cleave_hit_hitpoints_03.wav"
		],
		TurnsLeft = 2
	},
	function create()
	{
		this.m.ID = "effects.jcc_call_of_the_wild";
		this.m.Name = "Call of the Wild";
		this.m.Description = "";
		this.m.Icon = "ui/perks/perk_28.png";
		this.m.IconMini = "perk_28_mini";
		this.m.Overlay = "perk_28";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function onAdded()
	{
		this.getContainer().getActor().setMoraleState(this.Const.MoraleState.Confident);
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (!_targetEntity.isAlive() || _targetEntity.isDying())
		{
			return false;
		}

		if (_targetEntity.getCurrentProperties().IsImmuneToBleeding)
		{
			return false;
		}

		if (_targetEntity.isNonCombatant())
		{
			return false;
		}

		if (!_targetEntity.isAlive() || _targetEntity.isDying())
		{
			if (this.isKindOf(_targetEntity, "lindwurm_tail") || !_targetEntity.getCurrentProperties().IsImmuneToBleeding)
			{
				this.Sound.play(this.m.BleedSounds[this.Math.rand(0, this.m.BleedSounds.len() - 1)], this.Const.Sound.Volume.Skill, this.getContainer().getActor().getPos());
			}
		}
		else if (!_targetEntity.getCurrentProperties().IsImmuneToBleeding && _hitInfo.DamageInflictedHitpoints >= this.Const.Combat.MinDamageToApplyBleeding)
		{
			local effect = this.new("scripts/skills/effects/bleeding_effect");
			effect.setDamage(this.m.BleedDamage);
			_targetEntity.getSkills().add(effect);
			this.Sound.play(this.m.BleedSounds[this.Math.rand(0, this.m.BleedSounds.len() - 1)], this.Const.Sound.Volume.Skill, this.getContainer().getActor().getPos());
		}

		return true;

	}

	function onTurnEnd()
	{
		if (--this.m.TurnsLeft == 0)
		{
			this.removeSelf();
		}
	}

});

