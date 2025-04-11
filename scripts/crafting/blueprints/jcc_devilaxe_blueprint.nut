this.jcc_devilaxe_blueprint <- this.inherit("scripts/crafting/blueprint", {
	m = {},
	function create()
	{
		this.blueprint.create();
		this.m.ID = "blueprint.jcc_devilaxe";
		this.m.PreviewCraftable = this.new("scripts/items/weapons/percht_axe");
		this.m.Cost = 666;
		local ingredients = [
			{
				Script = "scripts/items/weapons/greataxe",
				Num = 1
			},
			{
				Script = "scripts/items/misc/jcc_krampus_scalp_item",
				Num = 1
			},
			{
				Script = "scripts/items/misc/ghoul_horn_item",
				Num = 1
			}
		];
		this.init(ingredients);
	}

	function onCraft( _stash )
	{
		_stash.add(this.new("scripts/items/weapons/percht_axe"));
	}
});

