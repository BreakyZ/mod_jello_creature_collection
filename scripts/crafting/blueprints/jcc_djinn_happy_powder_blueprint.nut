this.jcc_djinn_happy_powder_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.jcc_djinn_happy_powder";
		this.m.PreviewCraftable = this.new("scripts/items/misc/happy_powder_item");
		this.m.Cost = 100;
		local ingredients = [
			{
				Script = "scripts/items/misc/jcc_djinn_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/parched_skin_item",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/misc/happy_powder_item"));
	}

});

