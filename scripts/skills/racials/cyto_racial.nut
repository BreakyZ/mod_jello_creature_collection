this.cyto_racial <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "racial.cyto";
		this.m.Name = "Resistant to Ranged Attacks";
		this.m.Description = "";
		this.m.Icon = "";
		this.m.Type = this.Const.SkillType.Racial | this.Const.SkillType.Perk | this.Const.SkillType.StatusEffect;
		this.m.Order = this.Const.SkillOrder.Last;
		this.m.IsActive = false;
		this.m.IsStacking = false;
		this.m.IsHidden = true;
	}

	function addStack()
    {
        local actor = this.getContainer().getActor();
        actor.grow();
        //actor.checkMorale(1, 20);
    }

    function onUpdate( _properties )
	{
		local size = this.getContainer().getActor().getSize();

		if (size == 2)
		{
			_properties.Hitpoints += 110;
			_properties.MeleeSkill += 10;
			_properties.MeleeDefense -= 5;
			_properties.Bravery += 60;
			_properties.Stamina += 100;
			_properties.RangedDefense -= 5;
			_properties.Initiative -= 10;
		}
		else if (size == 3)
		{
			_properties.Hitpoints += 330;
			_properties.MeleeSkill += 15;
			_properties.MeleeDefense -= 10;
			_properties.Bravery += 100;
			_properties.Stamina += 300;
			_properties.RangedDefense -= 15;
			_properties.Initiative -= 20;
		}
		local actor = this.getContainer().getActor();

	}

	function onBeforeDamageReceived( _attacker, _skill, _hitInfo, _properties )
	{
		if (_skill == null)
		{
			return;
		}

		if (_skill.getID() == "actives.aimed_shot" || _skill.getID() == "actives.quick_shot" )
		{
			_properties.DamageReceivedRegularMult *= 0.1;
		}
		else if (_skill.getID() == "actives.shoot_bolt" || _skill.getID() == "actives.shoot_stake" || _skill.getID() == "actives.sling_stone" || _skill.getID() == "actives.fire_handgonne" || _skill.getID() == "actives.percht_shot")
		{
			_properties.DamageReceivedRegularMult *= 0.33;
		}
		else if (_skill.getID() == "actives.throw_javelin" || _skill.getID() == "actives.ignite_firelance")
		{
			_properties.DamageReceivedRegularMult *= 0.25;
		}
		else if (_skill.getID() == "actives.puncture" || _skill.getID() == "actives.thrust" || _skill.getID() == "actives.stab" || _skill.getID() == "actives.deathblow" || _skill.getID() == "actives.impale" || _skill.getID() == "actives.rupture" || _skill.getID() == "actives.prong" || _skill.getID() == "actives.lunge" || _skill.getID() == "actives.throw_spear")
		{
			_properties.DamageReceivedRegularMult *= 0.5;
		}
		else if (_skill.getID() == "actives.ignite_firelance" || _skill.getID() == "actives.throw_fire_bomb")
		{
			_properties.DamageReceivedRegularMult *= 2.0;
		}
	}


});

