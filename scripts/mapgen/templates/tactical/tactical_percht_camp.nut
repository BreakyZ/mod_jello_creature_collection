this.tactical_percht_camp <- this.inherit("scripts/mapgen/tactical_template", {
	m = {},
	function init()
	{
		this.m.Name = "tactical.jcc_percht_camp";
		this.m.MinX = 32;
		this.m.MinY = 32;
	}

	function fill( _rect, _properties, _pass = 1 )
	{
		local centerTile;
		local minDist;
		local isOnHill;
		local hasPalisade;
		local radius;

		/*if(_properties!=null){	
			 centerTile = this.Tactical.getTileSquare(_rect.W / 2 + _properties.ShiftX, _rect.H / 2 + _properties.ShiftY);
			 minDist = 0;
			 isOnHill = centerTile.Level == 3;
			 hasPalisade = _properties.Fortification != 0;
			 radius = this.Const.Tactical.Settings.CampRadius + _properties.AdditionalRadius;
		}
		else{
			 centerTile = this.Tactical.getTileSquare(_rect.W / 2, _rect.H / 2);
			 minDist = 0;
			 isOnHill = centerTile.Level == 3;
			 hasPalisade = true;
			 radius = this.Const.Tactical.Settings.CampRadius + 30;
		}*/
		 centerTile = this.Tactical.getTileSquare(_rect.W / 2 + _properties.ShiftX, _rect.H / 2 + _properties.ShiftY);
		 minDist = 0;
		 isOnHill = centerTile.Level == 3;
		 hasPalisade = _properties.Fortification != 0;
		 radius = this.Const.Tactical.Settings.CampRadius + _properties.AdditionalRadius;

		local heads00 = 1;
		local heads01 = 1;

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

					if ((hasPalisade && d < radius || !hasPalisade && d < 6) && tile.IsEmpty && d > 2)
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

						if (this.Math.rand(1, 100) <= 3 + n * 2)
						{
							tile.clear();

							if (this.Math.rand(1, 100) <= 50)
							{
								tile.spawnObject("entity/tactical/objects/orc_camp_small_remains");
							}
							else
							{
								tile.spawnObject("entity/tactical/objects/orc_camp_large_remains");
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

				if (heads00 > 0 && d > 9 && d < 16 && this.Math.rand(1, 100) <= 1)
				{
					heads00 = --heads00;
					tile.removeObject();
					local o = tile.spawnObject("entity/tactical/objects/orc_camp_head");
					o.setVariant(0);
					o.setFlipped(x < (_rect.X + _rect.W) / 2);
				}

				if (heads01 > 0 && d > 9 && d < 16 && this.Math.rand(1, 100) <= 1)
				{
					heads01 = --heads01;
					tile.removeObject();
					local o = tile.spawnObject("entity/tactical/objects/orc_camp_head");
					o.setVariant(1);
					o.setFlipped(x < (_rect.X + _rect.W) / 2);
				}

				if (d < minDist || d > radius)
				{
				}
				else if (hasPalisade && d == radius && y != centerTile.SquareCoords.Y && x != centerTile.SquareCoords.X - 4)
				{
					tile.clear();

					if ((!isOnHill || tile.Level >= 2) && (this.Math.rand(1, 100) < 40 + (isOnHill ? -10 : 0) || y == centerTile.SquareCoords.Y + 2 || y == centerTile.SquareCoords.Y - 2))
					{
						tile.removeObject();
						local o;

						if(_properties!=null){

							if (_properties.Fortification == this.Const.Tactical.FortificationType.Palisade)
							{
								o = tile.spawnObject("entity/tactical/objects/human_camp_wall");
							}
							else if (_properties.Fortification == this.Const.Tactical.FortificationType.Walls)
							{
								o = tile.spawnObject("entity/tactical/objects/graveyard_wall");
							}
							else if (this.Math.rand(1, 100) <= 50)
							{
								o = tile.spawnObject("entity/tactical/objects/human_camp_wall");
							}
							else
							{
								o = tile.spawnObject("entity/tactical/objects/graveyard_wall");
							}
						}
						else{
							o = tile.spawnObject("entity/tactical/objects/graveyard_wall");
						}

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
				else if ((hasPalisade && d < radius - 1 || !hasPalisade && d < 6) && tile.IsEmpty)
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

					if (d == 0 || d > 1 && n == 0 && this.Math.rand(1, 100) <= 1)
					{
						tile.clear();

						if (d == 0 && hasPalisade)
						{
							tile.spawnObject("entity/tactical/objects/barbarian_camp_altar");
						}
						else
						{
							tile.spawnObject("entity/tactical/objects/orc_camp_fireplace");
						}
					}
					else if (d <= 1)
					{
						  // [480]  OP_JMP            0    145    0    0
					}
					else if (d >= 4 && this.Math.rand(1, 100) <= 2)
					{
						tile.clear();
						tile.spawnObject("entity/tactical/objects/goblin_camp_cage");
					}
					else if (this.Math.rand(1, 100) <= 2)
					{
						tile.clear();
						local r = this.Math.rand(1, 2);

						if (r == 1)
						{
							tile.spawnObject("entity/tactical/objects/boulder");
						}
						else
						{
							tile.spawnObject("entity/tactical/objects/boulder_bloody");
						}
					}
					else if (d <= 7 && this.Math.rand(1, 100) <= (hasPalisade ? 14 : 6))
					{
						tile.clear();
						
							local deco = [
								"07"
							];
							tile.spawnDetail("orcs_" + deco[this.Math.rand(0, deco.len() - 1)]);
						
					}
				}
			}
		}
	}

	function spawnDetail( _tile, _distance, _hasPalisade, _isOnHill )
	{
		if (_distance <= 7 && this.Math.rand(1, 100) <= (_hasPalisade ? 14 : 6))
		{
			_tile.clear();
			
				local deco = [
					"07"
				];
				_tile.spawnDetail("orcs_" + deco[this.Math.rand(0, deco.len() - 1)]);
			
		}
	}

});

