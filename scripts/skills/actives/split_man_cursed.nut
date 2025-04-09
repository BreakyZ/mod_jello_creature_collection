this.split_man_cursed <- this.inherit("scripts/skills/skill", {
	m = {
		ApplyBonusToBodyPart = -1,
		BackfireChance = 100
	},
	function create()
	{
		this.m.ID = "actives.split_man_cursed";
		this.m.Name = "Double Edge";
		this.m.Description = "A slow overhead attack performed with full force to split a target in two from top to bottom. Has enough force that it always hits both head and body for additional damage. May damage the wielder instead.";
		this.m.KilledString = "Split in two";
		this.m.Icon = "skills/split_man_cursed.png";
		this.m.IconDisabled = "skills/active_37_sw.png";
		this.m.Overlay = "split_man_cursed";
		this.m.SoundOnUse = [
			"sounds/combat/overhead_strike_01.wav",
			"sounds/combat/overhead_strike_02.wav",
			"sounds/combat/overhead_strike_03.wav"
		];

		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.OffensiveTargeted;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsIgnoredAsAOO = false;
		this.m.IsWeaponSkill = true;
		this.m.InjuriesOnBody = this.Const.Injury.CuttingBody;
		this.m.InjuriesOnHead = this.Const.Injury.CuttingHead;
		this.m.DirectDamageMult = 0.4;
		this.m.ActionPointCost = 5;
		this.m.FatigueCost = 15;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
		this.m.ChanceDecapitate = 99;
		this.m.ChanceDisembowel = 50;
		this.m.ChanceSmash = 0;
	}

	function getTooltip()
	{

		local backfireTT = (100-this.getContainer().getActor().getCurrentProperties().Bravery);

		if(backfireTT <= 0){
			backfireTT = 1;
		}

		local p = this.getContainer().buildPropertiesForUse(this, null);
		local mult = 1.5;
		local damage_regular_min = this.Math.floor(p.DamageRegularMin * p.DamageRegularMult * p.DamageTotalMult * mult * p.MeleeDamageMult);
		local damage_regular_max = this.Math.floor(p.DamageRegularMax * p.DamageRegularMult * p.DamageTotalMult * mult * p.MeleeDamageMult);
		local damage_armor_min = this.Math.floor(p.DamageRegularMin * p.DamageArmorMult * p.DamageTotalMult * mult * p.MeleeDamageMult);
		local damage_armor_max = this.Math.floor(p.DamageRegularMax * p.DamageArmorMult * p.DamageTotalMult * mult * p.MeleeDamageMult);
		local damage_direct_max = this.Math.floor(damage_regular_max * (this.m.DirectDamageMult + p.DamageDirectAdd + p.DamageDirectMeleeAdd));
		local ret = [
			{
				id = 1,
				type = "title",
				text = this.getName()
			},
			{
				id = 2,
				type = "description",
				text = this.getDescription()
			},
			{
				id = 3,
				type = "text",
				text = this.getCostString()
			}
		];

		if (this.m.DirectDamageMult > 0.0)
		{
			ret.push({
				id = 4,
				type = "text",
				icon = "ui/icons/regular_damage.png",
				text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + damage_regular_min + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + damage_regular_max + "[/color] damage to hitpoints, of which [color=" + this.Const.UI.Color.DamageValue + "]0[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + damage_direct_max + "[/color] can ignore armor"
			});
		}
		else
		{
			ret.push({
				id = 4,
				type = "text",
				icon = "ui/icons/regular_damage.png",
				text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + damage_regular_min + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + damage_regular_max + "[/color] damage to hitpoints"
			});
		}

		if (damage_armor_max > 0)
		{
			ret.push({
				id = 5,
				type = "text",
				icon = "ui/icons/armor_damage.png",
				text = "Inflicts [color=" + this.Const.UI.Color.DamageValue + "]" + damage_armor_min + "[/color] - [color=" + this.Const.UI.Color.DamageValue + "]" + damage_armor_max + "[/color] damage to armor"
			});
		}

		ret.push({
			id = 6,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Hits both head and body for additional damage"
		});
		ret.push({
			id = 7,
			type = "text",
			icon = "ui/icons/special.png",
			text = "Staggers the target on hit"
		});
		ret.push({
			id = 8,
			type = "text",
			icon = "ui/icons/warning.png",
			text = "Has a [color=" + this.Const.UI.Color.DamageValue + "]" + backfireTT + "%[/color] chance to damage the wielder instead " + "(100-Resolve)"
		});
		return ret;
	}

	function onAfterUpdate( _properties )
	{

		this.m.FatigueCostMult = _properties.IsSpecializedInAxes ? this.Const.Combat.WeaponSpecFatigueMult : 1.0;
	}

	function onUse( _user, _targetTile )
	{
		local item = this.getContainer().getActor().getItems().getItemAtSlot(this.Const.ItemSlot.Accessory); 
		local effResolve = _user.getCurrentProperties().Bravery;

		if(item!=null){
			if(item.getID() == "accessory.undead_trophy"){
				effResolve*=2;
			}
		}

		//protective sigils

		

		local backfire = false;
		local targetTile = _targetTile;
		this.m.BackfireChance=100-effResolve;
		local backfireRng = this.Math.rand(1, 100);

		if(this.m.BackfireChance<=0){
			this.m.BackfireChance=1;
		}

		if(backfireRng<=this.m.BackfireChance){
			this.Tactical.EventLog.log(this.Const.UI.getColorizedEntityName(_user) + " backfires! (Chance: "+this.m.BackfireChance+" Rolled: "+backfireRng+")");
			targetTile = _user.getTile();
			backfire = true;
					this.m.SoundOnHit = [
			"sounds/enemies/devilaxe_backfire.wav"
		];
		}else{
					this.m.SoundOnHit = [
			"sounds/combat/overhead_strike_hit_01.wav",
			"sounds/combat/overhead_strike_hit_02.wav",
			"sounds/combat/overhead_strike_hit_03.wav"
		];
		}


		this.spawnAttackEffect(targetTile, this.Const.Tactical.AttackEffectBash);
		local targetEntity = targetTile.getEntity();
		local success = this.attackEntity(_user, targetTile.getEntity());

		if (!_user.isAlive() || _user.isDying())
		{
			return success;
		}

		if (success && this.m.ApplyBonusToBodyPart != -1 && !targetTile.IsEmpty && targetEntity.isAlive())
		{
			local p = this.getContainer().buildPropertiesForUse(this, targetEntity);
			local hitInfo = clone this.Const.Tactical.HitInfo;
			local damageMult = p.MeleeDamageMult * p.DamageTotalMult;
			local damageRegular = this.Math.rand(p.DamageRegularMin, p.DamageRegularMax) * p.DamageRegularMult * 0.5;
			local damageArmor = this.Math.rand(p.DamageRegularMin, p.DamageRegularMax) * p.DamageArmorMult * 0.5;
			local damageDirect = this.Math.minf(1.0, p.DamageDirectMult * (this.m.DirectDamageMult + p.DamageDirectAdd + p.DamageDirectMeleeAdd));
			hitInfo.DamageRegular = damageRegular * damageMult;
			hitInfo.DamageArmor = damageArmor * damageMult;
			hitInfo.DamageDirect = damageDirect;
			hitInfo.BodyPart = this.m.ApplyBonusToBodyPart;
			hitInfo.BodyDamageMult = 1.0;
			hitInfo.FatalityChanceMult = 1.0;
			targetEntity.onDamageReceived(this.getContainer().getActor(), this, hitInfo);
			this.m.ApplyBonusToBodyPart = -1;
		}

		if (!targetEntity.isNonCombatant() && !backfire)
		{
			local stagger = this.new("scripts/skills/effects/staggered_effect");
			targetEntity.getSkills().add(stagger);
		}

		return success;
	}

	function onTargetHit( _skill, _targetEntity, _bodyPart, _damageInflictedHitpoints, _damageInflictedArmor )
	{
		if (_skill == this)
		{
			this.m.ApplyBonusToBodyPart = _bodyPart == this.Const.BodyPart.Body ? this.Const.BodyPart.Head : this.Const.BodyPart.Body;
		}
	}

});

