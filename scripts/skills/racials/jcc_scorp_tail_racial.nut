this.jcc_scorp_tail_racial <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "racial.scorp_tail";
		this.m.Name = "Scorpion Tail Racial";
		this.m.Description = "";
		this.m.Icon = "";
		this.m.Type = this.Const.SkillType.Racial | this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}

	function getDefense( _attackingEntity, _skill, _properties )
	{
		local malus = 0;
		local d = 0;
		local shieldRangedDefense = 0;
		local shieldMeleeDefense = 0;

		if (!this.m.CurrentProperties.IsImmuneToSurrounding)
		{
			malus = _attackingEntity != null ? this.Math.max(0, _attackingEntity.getCurrentProperties().SurroundedBonus * _attackingEntity.getCurrentProperties().SurroundedBonusMult - this.getCurrentProperties().SurroundedDefense) * this.getSurroundedCount() : this.Math.max(0, 5 - this.getCurrentProperties().SurroundedDefense) * this.getSurroundedCount();
		}

		local shield = this.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);

		if (shield != null && shield.isItemType(this.Const.Items.ItemType.Shield))
		{
			shieldMeleeDefense = 0;
			shieldRangedDefense = 0;
		}

		if (_skill.isRanged())
		{
			d = _properties.getRangedDefense();

			if (!_skill.isShieldRelevant())
			{
				d = d - shieldRangedDefense;
			}
		}
		else
		{
			d = _properties.getMeleeDefense();

			if (!_skill.isShieldRelevant())
			{
				d = d - shieldMeleeDefense;
			}
		}

		if (d > this.Const.Tactical.Settings.AttributeDefenseSoftCap)
		{
			local e = d - this.Const.Tactical.Settings.AttributeDefenseSoftCap;
			d = this.Const.Tactical.Settings.AttributeDefenseSoftCap + e * 0.5;
		}

		if (!_skill.isRanged())
		{
			d = d - malus;
		}

		return d;
	}

});

