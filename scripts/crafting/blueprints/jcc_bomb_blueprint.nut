this.jcc_bomb_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.jcc_bomb";
		this.m.PreviewCraftable = this.new("scripts/items/tools/jcc_black_fire_bomb_item"); 
		this.m.Cost = 250;
		local ingredients = [
			{
				Script = "scripts/items/misc/jcc_djinn_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/jcc_krampus_coal_item",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/tools/jcc_black_fire_bomb_item"));
	}

});

