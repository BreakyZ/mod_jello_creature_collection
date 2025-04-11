this.jcc_basilisk_cloak_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.jcc_basilisk_cloak";
		this.m.PreviewCraftable = this.new("scripts/items/armor_upgrades/jcc_basilisk_cloak");
		this.m.Cost = 350;
		local ingredients = [
			{
				Script = "scripts/items/misc/jcc_basilisk_feathers_item",
				Num = 4
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/armor_upgrades/jcc_basilisk_cloak"));
	}
});

