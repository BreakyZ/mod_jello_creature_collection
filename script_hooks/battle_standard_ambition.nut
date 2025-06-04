::ModJelloCreatureCollection.HooksMod.hook("scripts/ambitions/ambitions/battle_standard_ambition", function ( q )
{
	q.onUpdateScore = @(__original) function ()
	{
		if (this.World.Assets.getOrigin().getID() != "scenario.jcc_player_percht")
			return __original();

		if (this.World.Ambitions.getDone() < 1)
			return;

		if (this.m.IsDone)
			return;

		local items = this.m.Stash.getItems();

		foreach( item in items )
		{
			if (item != null)
			{
				if (item.getID() == "weapon.player_banner")
				{
					hasStandard = true;
				}
			}
		}

		local roster = this.World.getPlayerRoster().getAll();

		foreach( bro in roster )
		{
			local item = bro.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);

			if (item != null && item.getID() == "weapon.player_banner")
			{
				hasStandard = true;
			}

			for( local i = 0; i < bro.getItems().getUnlockedBagSlots(); i = ++i )
			{
				item = bro.getItems().getItemAtBagSlot(i);

				if (item != null && item.getID() == "weapon.player_banner")
				{
					hasStandard = true;
				}
			}
		}

		if (hasStandard)
		{
			this.setDone(true);
			return;
		}

		if (this.World.Ambitions.getDone() < 1)
		{
			return;
		}

		this.m.Score = 10;
	}
});