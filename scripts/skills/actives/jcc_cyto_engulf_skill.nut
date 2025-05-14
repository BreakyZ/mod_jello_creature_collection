this.jcc_cyto_engulf_skill <- this.inherit("scripts/skills/skill", {
	m = {},
	function create()
	{
		this.m.ID = "actives.jcc_cyto_engulf";
		this.m.Name = "Engulf";
		this.m.SoundOnHit = [
			"sounds/enemies/slime_smack_01.wav",
			"sounds/enemies/slime_smack_02.wav"
		];
		
		this.m.Type = this.Const.SkillType.Active;
		this.m.Order = this.Const.SkillOrder.UtilityTargeted;
		this.m.Delay = 0;
		this.m.IsSerialized = false;
		this.m.IsActive = true;
		this.m.IsTargeted = true;
		this.m.IsStacking = false;
		this.m.IsAttack = true;
		this.m.IsRanged = false;
		this.m.IsIgnoredAsAOO = true;
		this.m.IsShowingProjectile = false;
		this.m.IsUsingHitchance = false;
		this.m.IsDoingForwardMove = false;
		this.m.IsVisibleTileNeeded = true;
		this.m.ActionPointCost = 5;
		this.m.FatigueCost = 15;
		this.m.MinRange = 1;
		this.m.MaxRange = 1;
		this.m.MaxLevelDifference = 4;
	}

	function isViableTarget( _user, _target )
	{
		if (_target.isAlliedWith(_user))
		{
			return false;
		}

		if (_target.getCurrentProperties().IsRooted)
		{
			return false;
		}

		if (_target.getCurrentProperties().IsImmuneToRoot)
		{
			return false;
		}

		return true;
	}

	function onUse( _user, _targetTile )
	{
		local targets = [];

		if (_targetTile.IsOccupiedByActor)
		{
			local entity = _targetTile.getEntity();

			if (this.isViableTarget(_user, entity))
			{
				targets.push(entity);
			}
		}


		foreach( target in targets )
		{
			target.getSkills().add(this.new("scripts/skills/effects/jcc_cyto_engulf_effect"));
			target.raiseRootsFromGround("cyto_black_engulf", "cyto_black_engulf");

			target.getSkills().getSkillByID("effects.jcc_cyto_engulf").m.TargetEntity = _user;

			_user.getSkills().add(this.new("scripts/skills/effects/jcc_engulfing_enemy_effect"));
			_user.getSkills().getSkillByID("effects.jcc_engulfing_enemy_effect").m.TargetEntity = target;


			this.Sound.play(this.m.SoundOnHit[this.Math.rand(0, this.m.SoundOnHit.len() - 1)], this.Const.Sound.Volume.Skill, target.getPos());
		}


		return true;
	}

});

