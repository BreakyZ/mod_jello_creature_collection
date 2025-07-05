this.jcc_chitin_item <- this.inherit("scripts/items/item", {
	m = {},
	function create()
	{
		this.item.create();
		this.m.ID = "misc.jcc_chitin";
		this.m.Name = "Hardened Chitin";
		this.m.Description = "Taken from the back of a slain scorpion, this piece of chitin is much sturdier than that of the northern webknecht.";
		this.m.Icon = "misc/inventory_jcc_chitin.png";
		this.m.SlotType = this.Const.ItemSlot.None;
		this.m.ItemType = this.Const.Items.ItemType.Misc | this.Const.Items.ItemType.Crafting;
		this.m.IsDroppedAsLoot = true;
		this.m.Value = 200;
	}

	function playInventorySound( _eventType )
	{
		this.Sound.play("sounds/combat/armor_leather_impact_03.wav", this.Const.Sound.Volume.Inventory);
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

