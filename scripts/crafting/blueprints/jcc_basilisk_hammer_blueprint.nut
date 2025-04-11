this.jcc_basilisk_hammer_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.jcc_basilisk_hammer";
		this.m.PreviewCraftable = this.new("scripts/items/weapons/basilisk_hammer"); 
		this.m.Cost = 650;
		local ingredients = [
			{
				Script = "scripts/items/weapons/polehammer",
				Num = 1
			},
			{
				Script = "scripts/items/misc/jcc_basilisk_egg_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/jcc_basilisk_feathers_item",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/weapons/basilisk_hammer"));
	}

});

