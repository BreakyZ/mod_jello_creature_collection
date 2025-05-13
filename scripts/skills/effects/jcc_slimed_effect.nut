this.jcc_slimed_effect <- this.inherit("scripts/skills/skill", {
	m = {
		Count = 1,
		TurnsLeft=2
	},
	function create()
	{
		this.m.ID = "effects.jcc_slimed";
		this.m.Name = "Slimed";
		this.m.Description = "This character has been covered in slime, making it increasingly difficult to move.";
		this.m.Icon = "skills/jcc_slimed_effect.png";
		this.m.IconMini = "jcc_slimed_effect_mini";
		this.m.Overlay = "jcc_slimed_effect";
		this.m.Type = this.Const.SkillType.StatusEffect;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsRemovedAfterBattle = true;
	}

	function getName()
	{
		if (this.m.Count <= 1)
		{
			return this.m.Name;
		}
		else
		{
			return this.m.Name + " (x" + this.m.Count + ")";
		}
	}

	function getTooltip()
	{
		local ini = 10*this.m.Count;
		return [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/action_points.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]+"+this.m.Count+"[/color] Additional Action Point per tile moved"
			},
			{
				id = 8,
				type = "text",
				icon = "ui/icons/initiative.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]-"+ini+"%[/color] Initiative"
			}
		];
	}

	function onRefresh()
	{
		/*if (this.getContainer().getActor().getCurrentProperties().IsResistantToAnyStatuses && this.Math.rand(1, 100) <= 50)
		{
			if (!this.getContainer().getActor().isHiddenToPlayer())
			{
				this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(this.getContainer().getActor()) + " resists being overwhelmed thanks to his unnatural physiology");
			}

			return;
		}*/

		this.m.TurnsLeft=2;
		++this.m.Count;
		this.spawnIcon("status_effect_74", this.getContainer().getActor().getTile());
	}

	function onUpdate( _properties )
	{
		_properties.InitiativeMult = this.Math.maxf(0.0, _properties.InitiativeMult - 0.1 * this.m.Count);
		_properties.MovementAPCostAdditional += this.Math.maxf(0.0, this.m.Count);
		local slime = this.getContainer().getActor().getSprite("dirt");
		slime.setBrush("bust_slime");
		slime.Visible = true;
	}

	function onTurnEnd()
	{
		if (--this.m.TurnsLeft <= 0)
		{
			this.removeSelf();
			local slime = this.getContainer().getActor().getSprite("dirt");
			slime.setBrush("bust_slime");
			slime.Visible = false;
		}
	}

});

