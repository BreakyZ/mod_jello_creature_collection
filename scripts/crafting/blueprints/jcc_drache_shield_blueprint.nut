this.jcc_drache_shield_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.jcc_drache_shield";
		this.m.PreviewCraftable = this.new("scripts/items/shields/jcc_drache_shield_red");
		this.m.Cost = 500;
		local ingredients = [
			{
				Script = "scripts/items/misc/jcc_dragon_scales_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/lindwurm_bones_item",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/shields/jcc_drache_shield_red"));
	}

});

