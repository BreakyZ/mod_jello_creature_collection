this.jcc_basilisk_egg_item <- this.inherit("scripts/items/item", {
	m = {},
	function create()
	{
		this.item.create();
		this.m.ID = "misc.jcc_basilisk_egg";
		this.m.Name = "Alloyed Egg";
		this.m.Description = "A hardshell basilisk egg made up of calcium and various metals. Queens will devour failed Beastslayers, armor and all, to create eggshells for their progeny.";
		this.m.Icon = "misc/basilisk_egg.png";
		this.m.SlotType = this.Const.ItemSlot.None;
		this.m.ItemType = this.Const.Items.ItemType.Misc | this.Const.Items.ItemType.Crafting;
		this.m.IsDroppedAsLoot = true;
		this.m.Value = 1125;
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play("sounds/combat/unhold_regenerate_01.wav", this.Const.Sound.Volume.Inventory);
	}

	function getSellPriceMult()
	{
		return this.World.State.getCurrentTown().getBeastPartsPriceMult();
	}

	function getBuyPriceMult()
	{
		return this.World.State.getCurrentTown().getBeastPartsPriceMult();
	}

});

