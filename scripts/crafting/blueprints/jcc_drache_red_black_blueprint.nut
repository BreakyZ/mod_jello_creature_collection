this.jcc_drache_red_black_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.jcc_drache_red_blueprint";
		this.m.PreviewCraftable = this.new("scripts/items/armor_upgrades/jcc_drache_armor_black");
		this.m.Cost = 15;
		local ingredients = [
			{
				Script = "scripts/items/armor_upgrades/jcc_drache_armor_red",
				Num = 1
			},
			{
				Script = "scripts/items/misc/paint_black_item",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/armor_upgrades/jcc_drache_armor_black"));
	}

});

