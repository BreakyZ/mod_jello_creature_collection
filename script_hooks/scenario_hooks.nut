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
		local result = __original();
		result.extend([
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
		]);

		return result;
	}
});
