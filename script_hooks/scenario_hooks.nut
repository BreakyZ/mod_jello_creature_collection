
::mods_hookExactClass("states/main_menu_state", function(q) 
{
  q.onSiblingAdded = @(__original) function ( _stateName)
  {
	  __original(__stateName);
	  
	  if (_stateName == "TacticalState")
        {
            local tacticalState = this.RootState.get(_stateName);
          
	  if (tacticalState != null)
	  {


		switch(this.m.SelectedScenarioID)
		{
		case 02104301:
		  tacticalState.setScenario(this.new("scripts/scenarios/tactical/jcc_scenario_basilisks"));
		  break;
		}
	  }}
  }

  q.scenario_menu_module_onQueryData = @(__original) function ()
  {
	local result = __original();
	result.push({
					id = 02104301,
					name = "Basilisks",
					description = "[p=c][img]gfx/ui/events/event_05.png[/img][/p]\n[p=c]Fight against Basilisk Drones[/p]"
				});
	return result;
  }
});