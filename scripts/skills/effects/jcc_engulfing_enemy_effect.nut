this.jcc_engulfing_enemy_effect <- this.inherit("scripts/skills/skill", {
	m = {
		Victim = null,
		IsActivated = false
	},

	function activate()
	{
		this.m.IsActivated = true;
	}

	function setVictim ( _a )
	{
		this.m.Victim = ::MSU.asWeakTableRef(_a);
	}

	function create()
	{
		this.m.ID = "effects.jcc_engulfing_enemy";
		this.m.Name = "Engulfing an enemy";
		this.m.Description = "This slime is engulfing an enemy, slowly eating them.";
		this.m.Icon = "skills/jcc_engulfed_effect.png";
		this.m.IconMini = "jcc_engulfed_effect_mini";
		this.m.Overlay = "jcc_engulfed_effect";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getName()
	{
		if (this.m.Victim != null) return "Engulfing " + this.m.Victim.getName()
		return "Engulfing an enemy";
	}

	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = "Holding " + this.m.Victim.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];
	}
	
	function onDamageReceived( _attacker, _damageHitpoints, _damageArmor )
	{
		if (_damageHitpoints >= 60)
		{
			this.removeSelf();
		}
	}

	function onRemoved()
	{
		this.removeOthersEffect()

	}
	function onUpdate( _properties )
	{
		if (this.m.IsActivated && this.m.Victim != null && this.m.Victim.isAlive())
		{
			local dist = this.getContainer().getActor().getTile().getDistanceTo(this.m.Victim.getTile())
			if (dist > 1)
			{
				this.removeSelf();
				return;
			}

		}
		_properties.IsRooted = true;
	}
	function onDeath(_fatalityType)
	{	
		this.removeSelf()
	}

	function removeOthersEffect()
	{
		if (this.m.Victim != null && this.m.Victim.isAlive())
		{
			this.m.Victim.getSkills().removeByID("effects.jcc_cyto_engulf")
			this.m.Victim = null;
			this.m.IsActivated = false;
		}
	}
});

