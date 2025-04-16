::ModJelloCreatureCollection.HooksMod.hook("scripts/skills/racials/skeleton_racial", function ( q )
{
	q.onBeforeDamageReceived = @(__original) function ( _attacker, _skill, _hitInfo, _properties )
	{
		if (_skill == null && _skill.getID() == "actives.percht_shot")
			_properties.DamageReceivedRegularMult *= 0.33;

		__original(_attacker, _skill, _hitInfo, _properties);
	}
});