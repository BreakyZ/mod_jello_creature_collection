this.jcc_basilisk_trophy_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.jcc_basilisk_trophy";
		this.m.PreviewCraftable = this.new("scripts/items/accessory/jcc_basilisk_trophy_item"); 
		this.m.Cost = 450;
		local ingredients = [
			{
				Script = "scripts/items/misc/jcc_basilisk_eye_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/jcc_basilisk_feathers_item",
				Num = 2
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/accessory/jcc_basilisk_trophy_item"));
	}

});

