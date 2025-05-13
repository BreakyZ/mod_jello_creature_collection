this.jcc_tar_item <- this.inherit("scripts/items/item", {
	m = {},
	function create()
	{
		this.item.create();
		this.m.ID = "misc.jcc_tar_item";
		this.m.Name = "Cytoplasmic Tar";
		this.m.Description = "Foul-smelling and black as pitch, this dead cytoplasm can make for a valuable substitute in many alchemical processes.";
		this.m.Icon = "misc/jcc_tar.png";
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

