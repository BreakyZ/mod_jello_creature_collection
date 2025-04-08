::ModJelloCreatureCollection.HooksMod.hook("scripts/states/main_menu_state", function ( q )
{

	q.onSiblingAdded = @(__original) function ( _stateName )
	{
		if (_stateName == "TacticalState")
		{
			local tacticalState = this.RootState.get(_stateName);

			if (tacticalState != null)
			{


				switch(this.m.SelectedScenarioID)
				{
				case 0:
					tacticalState.setScenario(this.new("scripts/scenarios/tactical/scenario_combat_basics"));
					break;

				case 1:
					tacticalState.setScenario(this.new("scripts/scenarios/tactical/scenario_swipe"));
					break;

				case 2:
					tacticalState.setScenario(this.new("scripts/scenarios/tactical/scenario_defend_the_hill"));
					break;

				case 3:
					tacticalState.setScenario(this.new("scripts/scenarios/tactical/scenario_advanced_combat"));
					break;

				case 4:
					tacticalState.setScenario(this.new("scripts/scenarios/tactical/scenario_early_game"));
					break;

				case 6:
					tacticalState.setScenario(this.new("scripts/scenarios/tactical/scenario_line_battle"));
					break;

				case 7:
					tacticalState.setScenario(this.new("scripts/scenarios/tactical/scenario_vampire_hunt"));
					break;

				case 8:
					tacticalState.setScenario(this.new("scripts/scenarios/tactical/scenario_canyon"));
					break;

				case 9:
					tacticalState.setScenario(this.new("scripts/scenarios/tactical/scenario_line_battle_orcs"));
					break;

				case 10:
					tacticalState.setScenario(this.new("scripts/scenarios/tactical/scenario_line_battle_goblins"));
					break;

				case 13:
					tacticalState.setScenario(this.new("scripts/scenarios/tactical/scenario_wolfriders"));
					break;

				case 14:
					tacticalState.setScenario(this.new("scripts/scenarios/tactical/scenario_line_battle_lindwurm"));
					break;

				case 15:
					tacticalState.setScenario(this.new("scripts/scenarios/tactical/scenario_ghouls"));
					break;

				case 16:
					tacticalState.setScenario(this.new("scripts/scenarios/tactical/scenario_archers"));
					break;

				case 20:
					tacticalState.setScenario(this.new("scripts/scenarios/tactical/scenario_test_bed"));
					break;

				case 21:
					tacticalState.setScenario(this.new("scripts/scenarios/tactical/scenario_test_bed_orc"));
					break;

				case 22:
					tacticalState.setScenario(this.new("scripts/scenarios/tactical/scenario_test_bed_human"));
					break;

				case 50:
					tacticalState.setScenario(this.new("scripts/scenarios/tactical/jcc_scenario_basilisks"));
					break;

				case 51:
					tacticalState.setScenario(this.new("scripts/scenarios/tactical/jcc_scenario_perchts"));
					break;

				case 52:
					tacticalState.setScenario(this.new("scripts/scenarios/tactical/jcc_scenario_slimes"));
					break;

				default:
					tacticalState.setScenario(this.new("scripts/scenarios/tactical/scenario_combat_basics"));
					break;
				}
			}
		}
		else if (_stateName == "WorldState")
		{
			local worldState = this.RootState.get(_stateName);

			if (worldState != null)
			{
				if (this.m.SelectedCampaignFileName != null)
				{
					worldState.setCampaignToLoadFileName(this.m.SelectedCampaignFileName);
					this.m.SelectedCampaignFileName = null;
				}
				else if (this.m.NewCampaignSettings != null)
				{
					worldState.setNewCampaignSettings(this.m.NewCampaignSettings);
					this.m.NewCampaignSettings = null;
				}
			}
		}
	}

	q.scenario_menu_module_onQueryData = @(__original) function ()
	{
		local result = [
			{
				id = 0,
				name = "Combat Basics",
				description = "[p=c][img]gfx/ui/events/event_28.png[/img][/p]\n[p=c]A simple scenario to learn combat basics. Easy.[/p]"
			},
			{
				id = 1,
				name = "Swipe",
				description = "[p=c][img]gfx/ui/events/event_133.png[/img][/p]\n[p=c]Few and easy opponents all over a map with lots of terrain features blocking sight. Well suited to get used to lines of sight, fog of war and ranged combat. Easy.[/p]"
			},
			{
				id = 4,
				name = "Early Game",
				description = "[p=c][img]gfx/ui/events/event_09.png[/img][/p]\n[p=c]A possible early game encounter in enemy composition and equipment available. Moderate difficulty.[/p]"
			},
			{
				id = 15,
				name = "Defend the Hill",
				description = "[p=c][img]gfx/ui/events/event_22.png[/img][/p]\n[p=c]Survive against overwhelming odds while positioned on top of a hill. Well suited to learn about height advantage and to test sight and usability issues with height levels. Difficult.[/p]"
			},
			{
				id = 6,
				name = "Line Battle (Undead)",
				description = "[p=c][img]gfx/ui/events/event_143.png[/img][/p]\n[p=c]Featuring two battle lines pitted against each other in close combat from the start. Difficult.[/p]"
			},
			{
				id = 9,
				name = "Line Battle (Orcs)",
				description = "[p=c][img]gfx/ui/events/event_49.png[/img][/p]\n[p=c]ORC ORC ORC ORC ORC ORC. Difficult.[/p]"
			},
			{
				id = 10,
				name = "Line Battle (Goblins)",
				description = "[p=c][img]gfx/ui/events/event_48.png[/img][/p]\n[p=c]Featuring two battle lines pitted against each other in close combat from the start. Difficult.[/p]"
			},
			{
				id = 13,
				name = "Wolfriders",
				description = "[p=c][img]gfx/ui/events/event_60.png[/img][/p]\n[p=c]Defend against a pack of vicious Goblin Wolfriders. Don\'t let them encircle you! Moderate difficulty.[/p]"
			},
			{
				id = 3,
				name = "A Walk in the Woods",
				description = "[p=c][img]gfx/ui/events/event_127.png[/img][/p]\n[p=c]A possible late game encounter in enemy composition and equipment available. Difficult.[/p]"
			},
			{
				id = 50,
				name = "Basilisks",
				description = "[p=c][img]gfx/ui/events/event_05.png[/img][/p]\n[p=c]Fight against Basilisk Drones[/p]"
			},
			{
				id = 51,
				name = "Perchts",
				description = "[p=c][img]gfx/ui/events/event_05.png[/img][/p]\n[p=c]Fight against Perchts and various beasts.[/p]"
			},			
			{
				id = 52,
				name = "Slimes",
				description = "[p=c][img]gfx/ui/events/event_05.png[/img][/p]\n[p=c]Fight against Slimes.[/p]"
			}
		];

		return result;
	}
});
