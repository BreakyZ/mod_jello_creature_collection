::Const.ProjectileType.JccSlimeBall <- ::Const.ProjectileType.COUNT; // rename me
::Const.ProjectileType.COUNT += 1;

::Const.ProjectileDecals.extend([
	[] // this needs to be extended, but i'm not too sure what it's for
]);

::Const.ProjectileSprite.extend([
	"jcc_slimeball"
]);

 q.onDamageDealt = @(__original) function ( _target, _skill, _hitInfo )
    {
        if (_skill.getID() != "actives.aimed_shot" && _skill.getID() != "actives.quick_shot" && _skill.getID() != "actives.percht_shot")
        {
            return;
        }

        if (!_target.isAlive() || _target.isDying())
        {
            if (this.isKindOf(_target, "lindwurm_tail") || !_target.getCurrentProperties().IsImmuneToBleeding)
            {
                this.Sound.play(this.m.BleedSounds[this.Math.rand(0, this.m.BleedSounds.len() - 1)], this.Const.Sound.Volume.Skill, this.getContainer().getActor().getPos());
            }
        }
        else if (!_target.getCurrentProperties().IsImmuneToBleeding && _hitInfo.DamageInflictedHitpoints >= this.Const.Combat.MinDamageToApplyBleeding)
        {
            local effect = this.new("scripts/skills/effects/bleeding_effect");
            effect.setDamage(this.m.BleedDamage);
            _target.getSkills().add(effect);
            this.Sound.play(this.m.BleedSounds[this.Math.rand(0, this.m.BleedSounds.len() - 1)], this.Const.Sound.Volume.Skill, this.getContainer().getActor().getPos());
        }
    }