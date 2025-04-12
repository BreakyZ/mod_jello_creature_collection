// Lookup table for default faction
::Const.EntityFaction <- [];

for (local i = -1; i < ::Const.EntityIcon.len(); i++) {
	::Const.EntityFaction.push(::Const.EntityType.getDefaultFaction(i));
}

::Const.EntityType.addNew <- function (_icon, _name, _plural, _faction = ::Const.FactionType.Generic) {
	local id = ::Const.EntityIcon.len();
	::Const.EntityIcon.push(_icon);
	::Const.Strings.EntityName.push(_name);
	::Const.Strings.EntityNamePlural.push(_plural);
	::Const.EntityFaction.push(_faction);
	return id;
}

::Const.EntityType.getDefaultFaction = function (_id) {
	if (_id < ::Const.EntityFaction.len() - 1)
		return ::Const.EntityFaction[_id + 1];
	return ::Const.FactionType.Generic;
}

::Const.EntityType.JccBeastslayer <-
	::Const.EntityType.addNew("jcc_beastslayer_orientation", "Beastslayer", "Beastslayers", this.Const.FactionType.Settlement);
::Const.EntityType.JccBasiliskSentry <-
	::Const.EntityType.addNew("basilisk_sentry_orientation", "Basilisk Sentry", "Basilisk Sentries", this.Const.FactionType.Beasts);
::Const.EntityType.JccBasiliskDrone <-
	::Const.EntityType.addNew("basilisk_drone_orientation", "Basilisk Drone", "Basilisk Drones", this.Const.FactionType.Beasts);
::Const.EntityType.JccBasiliskDroneLow <-
	::Const.EntityType.addNew("basilisk_drone_orientation", "Basilisk Drone", "Basilisk Drones", this.Const.FactionType.Beasts);
::Const.EntityType.JccBasiliskQueen <-
	::Const.EntityType.addNew("basilisk_queen_orientation", "Basilisk Queen", "Basilisk Queens", this.Const.FactionType.Beasts);
::Const.EntityType.JccPercht <-
	::Const.EntityType.addNew("percht_orientation", "Percht", "Perchts", this.Const.FactionType.Beasts);
::Const.EntityType.JccPerchta <-
	::Const.EntityType.addNew("perchta_orientation", "Perchta", "Perchtas", this.Const.FactionType.Beasts);
::Const.EntityType.JccCytoplasm <-
	::Const.EntityType.addNew("cytoplasm_small_orientation", "Cytoplasm", "Cytoplasms", this.Const.FactionType.Beasts);
::Const.EntityType.JccCytoplasmOoze <-
	::Const.EntityType.addNew("cyto_ooze_orientation", "Oozing Cytoplasm", "Oozing Cytoplasms", this.Const.FactionType.Beasts);
::Const.EntityType.JccCytoplasmSoldier <-
	::Const.EntityType.addNew("cyto_soldier_orientation", "Cytoplasm Soldier", "Cytoplasm Soldiers", this.Const.FactionType.Beasts);
::Const.EntityType.JccCytoplasmBlack <-
	::Const.EntityType.addNew("cyto_black_orientation", "Black Cytoplasm", "Black Cytoplasms", this.Const.FactionType.Beasts);

