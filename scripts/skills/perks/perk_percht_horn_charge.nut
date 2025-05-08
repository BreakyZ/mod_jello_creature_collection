this.perk_percht_horn_charge <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "perk.krampus_charge_alt";
		this.m.Name = "Horn Charge";
		this.m.Description = "Charge towards a position within 2 tiles, ramming a target at the destination with your horns to stun them.";
		this.m.Icon = "ui/perks/jcc_perk_01.png";
		this.m.Type = this.Const.SkillType.Perk;
		this.m.Order = this.Const.SkillOrder.Perk;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = false;
	}

	function onAdded()
	{
		if (!this.m.Container.hasSkill("actives.krampus_charge_alt"))
		{
			this.m.Container.add(this.new("scripts/skills/actives/krampus_charge_alt"));
		}
	}

	function onRemoved()
	{
		this.m.Container.removeByID("actives.krampus_charge_alt");
	}

	function onUpdate( _properties )
	{
		_properties.TargetAttractionMult *= 1.1;
	}

});

