this.jcc_poisoned_oil_scorp_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.jcc_poisoned_oil_scorp";
		this.m.PreviewCraftable = this.new("scripts/items/accessory/spider_poison_item");
		this.m.Cost = 75;
		local ingredients = [
			{
				Script = "scripts/items/misc/jcc_scorp_stinger_item",
				Num = 2
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/accessory/spider_poison_item"));
	}

});

