this.tactical_djinn_camp <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.jcc_djinn_camp";
		this.m.MinX = 32;
		this.m.MinY = 32;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local centerTile = this.Tactical.getTileSquare(_rect.W / 2 + _properties.ShiftX, _rect.H / 2 + _properties.ShiftY);
		local minDist = 0;
		local isOnHill = centerTile.Level == 3;
		local hasPalisade = _properties.Fortification != 0;
		local radius = this.Const.Tactical.Settings.CampRadius + _properties.AdditionalRadius;

		for( local x = _rect.X; x < _rect.X + _rect.W; x = ++x )
		{
			for( local y = _rect.Y; y < _rect.Y + _rect.H; y = ++y )
			{
				local tile = this.Tactical.getTileSquare(x, y);
				local d = centerTile.getDistanceTo(tile);

				if (d < minDist || d > radius)
				{
				}
				else
				{
					if (this.Math.rand(1, 100) <= (hasPalisade ? 50 : 75))
					{
						tile.removeObject();
					}

					if ((hasPalisade && d < radius || !hasPalisade && d < 6) && tile.IsEmpty)
					{
						local n = 0;

						for( local i = 0; i < 6; i = ++i )
						{
							if (!tile.hasNextTile(i))
							{
							}
							else if (!tile.getNextTile(i).IsEmpty)
							{
								n = ++n;
							}
						}

						if (this.Math.rand(1, 100) <= 3 + n * 3)
						{
							tile.clear();
							local r = this.Math.rand(1, 3);

							if (r == 1)
							{
								tile.spawnObject("entity/tactical/objects/human_camp_supplies");
							}
							else
							{
								tile.spawnObject("entity/tactical/objects/desert_camp_supplies");
							}
						}
					}
				}
			}
		}

		for( local x = _rect.X; x < _rect.X + _rect.W; x = ++x )
		{
			for( local y = _rect.Y; y < _rect.Y + _rect.H; y = ++y )
			{
				local tile = this.Tactical.getTileSquare(x, y);
				local d = centerTile.getDistanceTo(tile);

				if (d < minDist || d > radius)
				{
				}
				else if (hasPalisade && d == radius && y != centerTile.SquareCoords.Y)
				{
					tile.clear();

					if ((!isOnHill || tile.Level >= 2) && this.Math.rand(1, 100) < 60 + (isOnHill ? -10 : 0))
					{
						tile.removeObject();
						local o = tile.spawnObject("entity/tactical/objects/human_camp_wall");
						o.setDirBasedOnCenter(centerTile, radius);

						for( local i = 0; i < 6; i = ++i )
						{
							if (!tile.hasNextTile(i))
							{
							}
							else if (tile.getNextTile(i).getDistanceTo(centerTile) > d && tile.getNextTile(i).Level > tile.Level)
							{
								tile.getNextTile(i).Level = tile.Level;
							}
							else if (tile.getNextTile(i).getDistanceTo(centerTile) == d)
							{
								tile.IsDefensibleTerrain = true;
							}
						}
					}
				}
				else if ((hasPalisade && d < radius - 1 || !hasPalisade && d < 8) && tile.IsEmpty)
				{
					local n = 0;

					for( local i = 0; i < 6; i = ++i )
					{
						if (!tile.hasNextTile(i))
						{
						}
						else if (!tile.getNextTile(i).IsEmpty)
						{
							n = ++n;
						}
					}

					if (d <= 5 && (d == 0 || n == 0 && this.Math.rand(1, 100) <= 1))
					{
						tile.clear();
						tile.spawnObject("entity/tactical/objects/orc_camp_fireplace");
					}
					else if (d <= 1)
					{
						  // [357]  OP_JMP            0    170    0    0
					}
					else if (this.Math.rand(1, 100) <= 1)
					{
						tile.clear();
						tile.spawnObject("entity/tactical/objects/desert_camp_furniture");
					}
					else if (d >= 6 && this.Math.rand(1, 100) <= 1)
					{
						tile.clear();
						tile.spawnObject("entity/tactical/objects/desert_camp_marquee");
					}
					else if (d >= 6 && this.Math.rand(1, 100) <= 1)
					{
						tile.clear();
						tile.spawnObject("entity/tactical/objects/orc_camp_small_remains");
					}
					else if (d <= 7 && this.Math.rand(1, 100) <= (hasPalisade ? 12 : 6))
					{
						local deco = [
							"02",
							"03"
						];
						tile.clear();
						tile.spawnDetail("desert_camp_" + deco[this.Math.rand(0, deco.len() - 1)]);
					}
					else if (d <= 7 && this.Math.rand(1, 100) <= (hasPalisade ? 10 : 6))
					{
						local deco = [
							"01",
							"01",
							"01",
							"02"
						];
						tile.clear();
						tile.spawnDetail("camp_" + deco[this.Math.rand(0, deco.len() - 1)]);
					}
					else if (d >= 7 && this.Math.rand(1, 100) <= 3)
					{
						local deco = [
							"01"
						];
						tile.clear();
						tile.spawnDetail("goblins_" + deco[this.Math.rand(0, deco.len() - 1)]);
					}
				}
			}
		}
	}

	function spawnDetail( _tile, _distance, _hasPalisade, _isOnHill )
	{
		if (_distance <= 7 && this.Math.rand(1, 100) <= (_hasPalisade ? 12 : 6))
		{
			local deco = [
				"02",
				"03"
			];
			_tile.clear();
			_tile.spawnDetail("desert_camp_" + deco[this.Math.rand(0, deco.len() - 1)]);
		}
		else if (_distance <= 7 && this.Math.rand(1, 100) <= (_hasPalisade ? 12 : 6))
		{
			local deco = [
				"01",
				"01",
				"01",
				"02"
			];
			_tile.clear();
			_tile.spawnDetail("camp_" + deco[this.Math.rand(0, deco.len() - 1)]);
		}
		else if (_distance >= 7 && this.Math.rand(1, 100) <= 3)
		{
			local deco = [
				"01"
			];
			_tile.clear();
			_tile.spawnDetail("goblins_" + deco[this.Math.rand(0, deco.len() - 1)]);
		}
	}

});

