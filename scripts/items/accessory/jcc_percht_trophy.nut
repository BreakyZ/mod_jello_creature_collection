this.jcc_percht_trophy_item <- this.inherit("scripts/items/accessory/accessory", {
	m = {},
	function create()
	{
		this.accessory.create();
		this.m.ID = "accessory.jcc_percht_trophy";
		this.m.Name = "Percht Trophy Necklace";
		this.m.Description = "Made from the parts of a vicious Percht, this trophy brazenly states a man's ego";
		this.m.SlotType = this.Const.ItemSlot.Accessory;
		this.m.IsDroppedAsLoot = true;
		this.m.ShowOnCharacter = true;
		this.m.IconLarge = "";
		this.m.Icon = "accessory/percht_trophy.png";
		this.m.Sprite = "percht_trophy"; //pulled from XML file under entity -> details
		this.m.Value = 1125;
	}

	function getTooltip() 
	{
		local result = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			}
		];
		result.push({
			id = 66,
			type = "text",
			text = this.getValueString()
		});

		if (this.getIconLarge() != null)
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getIconLarge(),
				isLarge = true
			});
		}
		else
		{
			result.push({
				id = 3,
				type = "image",
				image = this.getIcon()
			});
		}

		result.push({
			id = 10,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Grants [color=" + this.Const.UI.Color.PositiveValue + "]1[/color] additional Action Point"
		});

		result.push({
			id = 11,
			type = "text",
			icon = "ui/icons/special.png",
			text = "User can never have [color=" + this.Const.UI.Color.NegativeValue + "]confident[/color] morale"
		});
		return result;
	}

	function getSellPriceMult()
	{
		return this.World.State.getCurrentTown().getBeastPartsPriceMult();
	}

	function getBuyPriceMult()
	{
		return this.World.State.getCurrentTown().getBeastPartsPriceMult();
	}

	function onUpdateProperties( _properties )
	{
		this.accessory.onUpdateProperties(_properties);
		_properties.ActionPoints += 1;

		local actor = this.getContainer().getActor();
		actor.setMaxMoraleState(this.Const.MoraleState.Steady);

		if (actor.getMoraleState() > this.Const.MoraleState.Steady)
		{
			actor.setMoraleState(this.Const.MoraleState.Steady);
			actor.setDirty(true);
		}
	}



});

