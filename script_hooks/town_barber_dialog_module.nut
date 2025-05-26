::ModJelloCreatureCollection.HooksMod.hook("scripts/ui/screens/world/modules/world_town_screen/town_barber_dialog_module", function ( q ) {
	q.queryRosterInformation = @(__original) function ()
	{
		local ret = __original();
		local cleanedRoster = [];
		foreach (bro in ret.Roster)
		{
			::logInfo(bro.ID);
			if (bro.ID != "background.jcc_percht")
			{
				cleanedRoster.push(bro);
			}
		}

		ret.Roster = cleanedRoster;
		return ret;
	}
});
