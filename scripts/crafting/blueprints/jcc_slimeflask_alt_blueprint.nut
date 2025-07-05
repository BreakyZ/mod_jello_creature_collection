this.jcc_slimeflask_alt_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.jcc_slimeflask_alt";
		this.m.PreviewCraftable = this.new("scripts/items/tools/jcc_slime_flask_item"); 
		this.m.Cost = 250;
		local ingredients = [
			{
				Script = "scripts/items/misc/jcc_ooze_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/jcc_scorp_stinger_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/ghoul_brain_item",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/tools/jcc_slime_flask_item"));
	}

});

