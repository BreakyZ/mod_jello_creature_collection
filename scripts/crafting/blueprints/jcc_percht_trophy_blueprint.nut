this.jcc_percht_trophy_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.jcc_percht_trophy";
		this.m.PreviewCraftable = this.new("scripts/items/accessory/jcc_percht_trophy_item"); 
		this.m.Cost = 450;
		local ingredients = [
			{
				Script = "scripts/items/misc/jcc_krampus_coal_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/jcc_krampus_scalp_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/jcc_krampus_tongue_item",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/accessory/jcc_percht_trophy_item"));
	}

});

