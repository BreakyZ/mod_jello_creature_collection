this.jcc_bomb_alt_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.jcc_bomb_alt";
		this.m.PreviewCraftable = this.new("scripts/items/tools/jcc_black_fire_bomb_item"); 
		this.m.Cost = 250;
		local ingredients = [
			{
				Script = "scripts/items/misc/jcc_fiery_blood_item",
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

