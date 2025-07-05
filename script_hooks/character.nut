::Const.ProjectileType.JccSlimeBall <- ::Const.ProjectileType.COUNT; // rename me
::Const.ProjectileType.COUNT += 1;
::Const.ProjectileType.JccSlimeFlask <- ::Const.ProjectileType.COUNT; // rename me
::Const.ProjectileType.COUNT += 1;
::Const.ProjectileType.JccTarpot <- ::Const.ProjectileType.COUNT; // rename me
::Const.ProjectileType.COUNT += 1;
::Const.ProjectileType.JccFirebomb <- ::Const.ProjectileType.COUNT; // rename me
::Const.ProjectileType.COUNT += 1;

::Const.ProjectileDecals.extend([
	[] // this needs to be extended, but i'm not too sure what it's for
]);

::Const.ProjectileSprite.extend([
	"jcc_slimeball",
	"jcc_slimeflask",
	"jcc_tarpot",
	"jcc_firebomb"
]);
