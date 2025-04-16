this.jcc_djinn_dual_racial <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "racial.djinn_dual";
		this.m.Name = "Djinn Dual Wield Racial";
		this.m.Description = "";
		this.m.Icon = "";
		this.m.Type = this.Const.SkillType.Racial | this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}

	function onUpdate( _properties )
	{
		_properties.MovementAPCostAdditional += 1;
		_properties.ActionPoints += 3;
		_properties.FatigueRecoveryRate += 10;
	}

});

