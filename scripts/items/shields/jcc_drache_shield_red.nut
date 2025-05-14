this.jcc_drache_shield_red <- this.inherit("scripts/items/shields/shield", {
	m = {},
	function create()
	{
		this.shield.create();
		this.m.ID = "shield.jcc_drache_shield_red";
		this.m.Name = "Drachen Shield";
		this.m.Description = "This sturdy shield fashioned from the shimmering scales of a dragon makes for protection nigh indestructible.";
		this.m.AddGenericSkill = true;
		this.m.ShowOnCharacter = true;
		this.m.Variant = 0;
		//this.updateVariant();
		this.setPlainVariant();
		this.m.Value = 800;
		this.m.MeleeDefense = 15;
		this.m.RangedDefense = 27;
		this.m.StaminaModifier = -14;
		this.m.Condition = 64;
		this.m.ConditionMax = 64;
	}

	function onEquip()
	{
		this.shield.onEquip();
		this.addSkill(this.new("scripts/skills/actives/shieldwall"));
		this.addSkill(this.new("scripts/skills/actives/knock_back"));
	}

	function setPlainVariant()
	{
		this.m.Sprite = "jcc_drache_shield_red";
		this.m.SpriteDamaged = "jcc_drache_shield_red_damaged";
		this.m.ShieldDecal = "jcc_drache_shield_red_destroyed";
		this.m.IconLarge = "shields/inventory_jcc_drache_shield_red.png";
		this.m.Icon = "shields/icon_jcc_drache_shield_red.png";
	}

	function onPaint( _color )
	{
		switch(_color)
		{
		case this.Const.Items.Paint.None:
			this.m.Sprite = "jcc_drache_shield_red";
			this.m.SpriteDamaged = "jcc_drache_shield_red_damaged";
			this.m.ShieldDecal = "jcc_drache_shield_red_destroyed";
			this.m.IconLarge = "shields/inventory_jcc_drache_shield_red.png";
			this.m.Icon = "shields/icon_jcc_drache_shield_red.png";
			break;

		case this.Const.Items.Paint.Red:
			this.m.Sprite = "jcc_drache_shield_red";
			this.m.SpriteDamaged = "jcc_drache_shield_red_damaged";
			this.m.ShieldDecal = "jcc_drache_shield_red_destroyed";
			this.m.IconLarge = "shields/inventory_jcc_drache_shield_red.png";
			this.m.Icon = "shields/icon_jcc_drache_shield_red.png";
			break;

		case this.Const.Items.Paint.Black:
			this.m.Sprite = "jcc_drache_shield_black";
			this.m.SpriteDamaged = "jcc_drache_shield_black_damaged";
			this.m.ShieldDecal = "jcc_drache_shield_black_destroyed";
			this.m.IconLarge = "shields/inventory_jcc_drache_shield_black.png";
			this.m.Icon = "shields/icon_jcc_drache_shield_black.png";
			break;

		case this.Const.Items.Paint.WhiteGreenYellow:
			this.m.Sprite = "jcc_drache_shield_green";
			this.m.SpriteDamaged = "jcc_drache_shield_green_damaged";
			this.m.ShieldDecal = "jcc_drache_shield_green_destroyed";
			this.m.IconLarge = "shields/inventory_jcc_drache_shield_green.png";
			this.m.Icon = "shields/icon_jcc_drache_shield_green.png";
			break;
		}
		//this.updateVariant();
		//this.updateAppearance();
	}

});

