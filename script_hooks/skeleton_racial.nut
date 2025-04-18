::ModJelloCreatureCollection.HooksMod.hook("scripts/skills/racial/skeleton_racial", function ( q )
{
	q.onBeforeDamageReceived = @(__original) function ( _attacker, _skill, _hitInfo, _properties )
	{
		if (_skill != null && _skill.getID() == "actives.percht_shot")
			_properties.DamageReceivedRegularMult *= 0.33;
		else if (_skill != null && _skill.getID() == "actives.jcc_dragon_fire_area" ||  _skill.getID() == "actives.jcc_dragon_firejet")
			_properties.DamageReceivedRegularMult *= 0.25;

		__original(_attacker, _skill, _hitInfo, _properties);
	}
});