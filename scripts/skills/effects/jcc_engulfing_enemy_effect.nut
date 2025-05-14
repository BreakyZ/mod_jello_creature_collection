this.jcc_engulfing_enemy_effect <- this.inherit("scripts/skills/skill", {
	m = {
		TargetEntity = null
		},
	function create()
	{
		this.m.ID = "effects.jcc_engulfing_enemy_effect"; // unused effect, but referenced in other files so useful to use here
		this.m.Name = "Engulfing an enemy";
		this.m.Description = "This slime is engulfing an enemy, slowly eating them.";
		this.m.Icon = "skills/jcc_engulfed_effect_.png";
		this.m.IconMini = "jcc_engulfed_effect_mini";
		this.m.Overlay = "jcc_engulfed_effect_";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getName()
	{
		if (this.m.TargetEntity != null) return "Engulfing " + this.m.TargetEntity.getName()
		return "Engulfing an enemy";
	}

	function getTooltip()
	{
		return [
			{
				id = 1,
				type = "title",
				text = "Holding " + this.m.TargetEntity.getName()
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
		if (this.m.TargetEntity != null && this.m.TargetEntity.isAlive())
		{
			local dist = this.getContainer().getActor().getTile().getDistanceTo(this.m.TargetEntity.getTile())
			if (dist != 2){
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
		if (this.m.TargetEntity != null && this.m.TargetEntity.isAlive())
		{
			this.m.TargetEntity.getSkills().removeByID("effects.jcc_cyto_engulf")
			this.m.TargetEntity = null;
		}
	}
});

