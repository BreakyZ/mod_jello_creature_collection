::ModJelloCreatureCollection.HooksMod.hook("scripts/skills/items/firearms_resistance_skill", function ( q )
{
	q.onBeforeDamageReceived = @(__original) function ( _attacker, _skill, _hitInfo, _properties )
	{
		if (_skill != null && (_skill.getID() == "actives.jcc_dragon_fire_area" ||  _skill.getID() == "actives.jcc_dragon_firejet"))
			_properties.DamageReceivedRegularMult *= 0.66;

		__original(_attacker, _skill, _hitInfo, _properties);
	}
});