this.jcc_scorp_throw_spear_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.jcc_scorp_throw_spear";
		this.m.Name = "Stinger Snipe";
		this.m.Description = "Hurl a throwing spear at a target in order to render their shield unusable. Targets with a shield will always be hit. Hitting a target without a shield can inflict devastating damage instead, but the attack may miss. Can not be used while engaged in melee.";
		this.m.KilledString = "Impaled";
		this.m.Icon = "skills/active_138.png";
		this.m.IconDisabled = "skills/active_138_sw.png";
		this.m.Overlay = "active_138";
		this.m.SoundOnUse = [
			"sounds/combat/dlc2/throwing_spear_throw_01.wav",
			"sounds/combat/dlc2/throwing_spear_throw_02.wav",
			"sounds/combat/dlc2/throwing_spear_throw_03.wav"
		];
		this.m.SoundOnHit = [
			"sounds/combat/dlc2/throwing_spear_hit_01.wav",
			"sounds/combat/dlc2/throwing_spear_hit_02.wav",
			"sounds/combat/dlc2/throwing_spear_hit_03.wav",
			"sounds/combat/dlc2/throwing_spear_hit_04.wav"
		];
		this.m.SoundOnMiss = [
			"sounds/combat/dlc2/throwing_spear_miss_01.wav",
			"sounds/combat/dlc2/throwing_spear_miss_02.wav",
			"sounds/combat/dlc2/throwing_spear_miss_03.wav",
			"sounds/combat/dlc2/throwing_spear_miss_04.wav"
		];
		this.m.SoundOnHitShield = [
			"sounds/combat/dlc2/throwing_spear_hit_shield_01.wav",
			"sounds/combat/dlc2/throwing_spear_hit_shield_02.wav",
			"sounds/combat/dlc2/throwing_spear_hit_shield_03.wav",
			"sounds/combat/dlc2/throwing_spear_hit_shield_04.wav"
		];
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.Delay = 0;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsOffensiveToolSkill = true;
		this.m.IsRanged = true;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = true;
		this.m.IsWeaponSkill = false;
		this.m.IsDoingForwardMove = false;
		this.m.InjuriesOnBody = this.Const.Injury.PiercingBody;
		this.m.InjuriesOnHead = this.Const.Injury.PiercingHead;
		this.m.DirectDamageMult = 0.45;
		this.m.ActionPointCost = 5;
		this.m.FatigueCost = 15;
		this.m.MinRange = 3;
		this.m.MaxRange = 4;
		this.m.MaxLevelDifference = 4;
		this.m.ProjectileType = this.Const.ProjectileType.Javelin;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			_properties.RangedSkill += 10;


				_properties.DamageRegularMin += 65;
				_properties.DamageRegularMax += 120;
				_properties.DamageArmorMult += 1.3;
		}
	}

	function getTooltip()
	{
		local ret = this.getDefaultTooltip();
		local damage = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand).getShieldDamage();
		ret.push({
			id = 7,
			type = "text",
			icon = "ui/icons/shield_damage.png",
			text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + damage + "[/color] damage to shields"
		});
		ret.extend([
			{
				id = 6,
				type = "text",
				icon = "ui/icons/vision.png",
				text = "Has a range of [color=" + this.Const.UI.Color.PositiveValue + "]" + this.getMaxRange() + "[/color] tiles on even ground, more if throwing downhill"
			},
			{
				id = 7,
				type = "text",
				icon = "ui/icons/hitchance.png",
				text = "Has [color=" + this.Const.UI.Color.PositiveValue + "]+30%[/color] chance to hit, and [color=" + this.Const.UI.Color.NegativeValue + "]-10%[/color] per tile of distance"
			}
		]);

		if (this.Tactical.isActive() && this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions()))
		{
			ret.push({
				id = 9,
				type = "text",
				icon = "ui/tooltips/warning.png",
				text = "[color=" + this.Const.UI.Color.NegativeValue + "]Can not be used because this character is engaged in melee[/color]"
			});
		}

		return ret;
	}

	function isUsable()
	{
		return !this.Tactical.isActive() || !this.getContainer().getActor().getTile().hasZoneOfControlOtherThan(this.getContainer().getActor().getAlliedFactions());
	}

	/*function getAmmo()
	{
		local item = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);

		if (item == null)
		{
			return 0;
		}

		return item.getAmmo();
	}

	function consumeAmmo()
	{
		local item = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand);

		if (item != null)
		{
			item.consumeAmmo();
		}
	}*/

	function onAfterUpdate( _properties )
	{
		this.m.FatigueCostMult = _properties.IsSpecializedInThrowing ? this.Const.Combat.WeaponSpecFatigueMult : 1.0;
	}

	function onUse( _user, _targetTile )
	{
		local targetEntity = _targetTile.getEntity();
		local shield = targetEntity.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);
			
		local ret = this.attackEntity(_user, _targetTile.getEntity());

		_user.getItems().unequip(_user.getItems().getItemAtSlot(this.Const.ItemSlot.Mainhand));
		return true;
	}

	function onAnySkillUsed( _skill, _targetEntity, _properties )
	{
		if (_skill == this)
		{
			_properties.RangedSkill += 20;
			_properties.HitChanceAdditionalWithEachTile -= 10;

			if (_targetEntity != null)
			{
				local shield = _targetEntity.getItems().getItemAtSlot(this.Const.ItemSlot.Offhand);

				if (shield != null && shield.isItemType(this.Const.Items.ItemType.Shield))
				{
					this.m.IsUsingHitchance = false;
				}
				else
				{
					this.m.IsUsingHitchance = true;
				}
			}
			else
			{
				this.m.IsUsingHitchance = true;
			}
		}
	}

});

