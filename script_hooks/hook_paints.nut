local paints = [
    ["paint_black_item", this.Const.Items.Paint.Black],
    ["paint_orange_red_item", this.Const.Items.Paint.OrangeRed],
    ["paint_red_item", this.Const.Items.Paint.Red],
    ["paint_white_blue_item", this.Const.Items.Paint.WhiteBlue],
    ["paint_white_green_item", this.Const.Items.Paint.WhiteGreen]
];

local colors = [
	this.Const.Items.Paint.Black,
	this.Const.Items.Paint.OrangeRed,
	this.Const.Items.Paint.Red,
	this.Const.Items.Paint.WhiteBlue,
	this.Const.Items.Paint.WhiteGreen
];
		
foreach (paint in paints)
{
    ::ModJelloCreatureCollection.HooksMod.hook("scripts/items/misc/" + paint[0], function ( q ) {
        q.onUse = @(__original) function( _actor, _item = null )
        {
            local helmet = _item == null ? _actor.getItems().getItemAtSlot(this.Const.ItemSlot.Head) : _item;

			if (helmet == null || !("onPaint" in helmet))
            {
                return false;
            }

            if ("allowedColours" in helmet.m)
            {
                local canPaint = false;
            	foreach (color in helmet.m.allowedColours)
            	{
            		if (paint[1] == color)
            		{
            			canPaint = true;
            			break
            		}
            	}
                if (!canPaint)
                    return false;
            }

            __original(_actor, _item = null);
        }
    });
}