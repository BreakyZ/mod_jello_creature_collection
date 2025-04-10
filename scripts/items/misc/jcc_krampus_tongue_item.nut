this.jcc_krampus_tongue_item <- this.inherit("scripts/items/item", {
	m = {},
	function create()
	{
		this.item.create();
		this.m.ID = "misc.jcc_krampus_tongue";
		this.m.Name = "Devilish Tongue";
		this.m.Description = "Removed from it\'s owner\'s foul mouth, this pointed tongue has at last ceased it\'s conniving whispers and guttural roars. Even so, it has yet to stop bleeding...";
		this.m.Icon = "misc/krampus_tongue.png";
		this.m.SlotType = this.Const.ItemSlot.None;
		this.m.ItemType = this.Const.Items.ItemType.Misc | this.Const.Items.ItemType.Crafting;
		this.m.IsDroppedAsLoot = true;
		this.m.Value = 1100;
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

