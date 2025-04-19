/*::Const.World.Spawn.JccCytoplasm <- [
	{
		Body = "figure_Cytoplasm_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.JccCytoplasm,
				Num = 1
			}
		]
	},
	{
		Body = "figure_Cytoplasm_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.JccCytoplasm,
				Num = 2
			}
		]
	},
	{
		Body = "figure_Cytoplasm_01",
		Troops = [
			{
				Type = this.Const.World.Spawn.Troops.JccCytoplasm,
				Num = 3
			}
		]
	}
];*/

::Const.World.Spawn.JccBeastslayer <- [];


	for (local i = 7; i <= 30; i++)
	{
		::Const.World.Spawn.JccBeastslayer.push({
	        Body = "figure_bandit_01",
	        Troops = [
	            {
	                Type = this.Const.World.Spawn.Troops.JccBeastslayer,
	                Num = i
	            }
	       	]
		});
	}



::Const.World.Spawn.JccPercht <- [];

for (local i = 1; i <= 13; i++){
	::Const.World.Spawn.JccPercht.push({
	        Body = "figure_percht_01",
	        Troops = [
	            {
	                Type = this.Const.World.Spawn.Troops.JccPercht,
	                Num = i+3
	            }
	       ]
	});
	for (local j = 1; j <= 3; j++){
		::Const.World.Spawn.JccPercht.push({
	        Body = "figure_percht_01",
	        Troops = [
	            {
	                Type = this.Const.World.Spawn.Troops.JccPercht,
	                Num = i+2
	            },	            
	            {
	                Type = this.Const.World.Spawn.Troops.JccPerchta,
	                Num = j
	            }
	       ]
		});
	}
	for (local j = 3; j <= 15; j++){
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j-1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j-2
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i+1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.GhoulLOW,
		                Num = j
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j-1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j-2
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.GhoulLOW,
		                Num = j
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i+1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.GhoulLOW,
		                Num = j
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j-1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j-2
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Ghoul,
		                Num = j
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i+1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.GhoulLOW,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Ghoul,
		                Num = j-1
		            }
		       ]
		});
		for(local l = 1; l<=3; l++){
			::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j-1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j-2
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Ghoul,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.GhoulHIGH,
		                Num = l
		            }
		       ]
				});
				::Const.World.Spawn.JccPercht.push({
				        Body = "figure_percht_01",
				        Troops = [
				            {
				                Type = this.Const.World.Spawn.Troops.JccPercht,
				                Num = i+1
				            },
				            {
				                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
				                Num = j
				            },
				            {
				                Type = this.Const.World.Spawn.Troops.GhoulLOW,
				                Num = j
				            },
				            {
				                Type = this.Const.World.Spawn.Troops.GhoulHIGH,
				                Num = j-1
				            }
				       ]
				});
		}
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i+1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.GhoulLOW,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j-1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j-2
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Ghoul,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j-1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j-2
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j+4
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j-1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j+4
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j-2
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j+6
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j+3
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j+3
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Ghoul,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Lindwurm,
		                Num = 1
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j+3
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j+3
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j+4
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Lindwurm,
		                Num = 1
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i+1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j+8
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j+4
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Lindwurm,
		                Num = 1
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j+6
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j+6
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Lindwurm,
		                Num = 1
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j+4
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j+3
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Ghoul,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.JccDragon,
		                Num = 1
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j+3
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j+3
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j+4
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.JccDragon,
		                Num = 1
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j+7
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j+6
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.JccDragon,
		                Num = 1
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j+5
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j+5
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Ghoul,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Lindwurm,
		                Num = 1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.JccDragon,
		                Num = 1
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j+5
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j+3
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j+4
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Lindwurm,
		                Num = 1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.JccDragon,
		                Num = 1
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j+12
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j+4
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Lindwurm,
		                Num = 1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.JccDragon,
		                Num = 1
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j+5
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j+6
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Lindwurm,
		                Num = 1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.JccDragon,
		                Num = 1
		            }
		       ]
		});
	}

	foreach (num in [1,2,3,4]){
			for (local j = 3; j <= 15; j++){
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Schrat,
		                Num = num
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j-1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j-2
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Schrat,
		                Num = num
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i+1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Schrat,
		                Num = num
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.GhoulLOW,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Schrat,
		                Num = num
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j-1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j-2
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.GhoulLOW,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Schrat,
		                Num = num
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i+1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.GhoulLOW,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Schrat,
		                Num = num
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j-1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j-2
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Ghoul,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Schrat,
		                Num = num
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i+1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.GhoulLOW,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Ghoul,
		                Num = j-1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Schrat,
		                Num = num
		            }
		       ]
		});
		
		for(local l = 1; l<=3; l++){
			::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j-1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j-2
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Ghoul,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.GhoulHIGH,
		                Num = l
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Schrat,
		                Num = num
		            }
		       ]
				});
			::Const.World.Spawn.JccPercht.push({
				        Body = "figure_percht_01",
				        Troops = [
				            {
				                Type = this.Const.World.Spawn.Troops.JccPercht,
				                Num = i+1
				            },
				            {
				                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
				                Num = j
				            },
				            {
				                Type = this.Const.World.Spawn.Troops.GhoulLOW,
				                Num = j
				            },
				            {
				                Type = this.Const.World.Spawn.Troops.GhoulHIGH,
				                Num = l-1
				            },
				            {
				                Type = this.Const.World.Spawn.Troops.Schrat,
				                Num = num
				            }
				       ]
				});
		}
		
		/*
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i+1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.GhoulLOW,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Schrat,
		                Num = num
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j-1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j-2
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Ghoul,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Schrat,
		                Num = num
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j-1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j-2
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j+4
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Schrat,
		                Num = num
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j-1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j+4
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Schrat,
		                Num = num
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j+5
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j+6
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Schrat,
		                Num = num
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j+7
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j+5
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Ghoul,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Lindwurm,
		                Num = 1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Schrat,
		                Num = num
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j-1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j-2
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j+4
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Lindwurm,
		                Num = 1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Schrat,
		                Num = num
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j+5
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j+12
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Lindwurm,
		                Num = 1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Schrat,
		                Num = num
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j+5
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j+12
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Lindwurm,
		                Num = 1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Schrat,
		                Num = num
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j-1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j-2
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Ghoul,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.JccDragon,
		                Num = 1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Schrat,
		                Num = num
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j-1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j-2
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j+4
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.JccDragon,
		                Num = 1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Schrat,
		                Num = num
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j-1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j+4
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.JccDragon,
		                Num = 1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Schrat,
		                Num = num
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j-2
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j+6
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.JccDragon,
		                Num = 1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Schrat,
		                Num = num
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j-1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j-2
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Ghoul,
		                Num = j
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j+5
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Lindwurm,
		                Num = 1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.JccDragon,
		                Num = 1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Schrat,
		                Num = num
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j-1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j-2
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j+4
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Lindwurm,
		                Num = 1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.JccDragon,
		                Num = 1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Schrat,
		                Num = num
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Direwolf,
		                Num = j-1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j+4
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Lindwurm,
		                Num = 1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.JccDragon,
		                Num = 1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Schrat,
		                Num = num
		            }
		       ]
		});
		::Const.World.Spawn.JccPercht.push({
		        Body = "figure_percht_01",
		        Troops = [
		            {
		                Type = this.Const.World.Spawn.Troops.JccPercht,
		                Num = i
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
		                Num = j+5
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Spider,
		                Num = j+6
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Lindwurm,
		                Num = 1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.JccDragon,
		                Num = 1
		            },
		            {
		                Type = this.Const.World.Spawn.Troops.Schrat,
		                Num = num
		            }
		       ]
		});
	}*/


	foreach (x in [1,2,3,4]){
		for (local j = 3; j <= 15; j++){
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j-1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j-2
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i+1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.GhoulLOW,
			                Num = j
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j-1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j-2
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.GhoulLOW,
			                Num = j
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i+1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.GhoulLOW,
			                Num = j
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j-1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j-2
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Ghoul,
			                Num = j
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i+1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.GhoulLOW,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Ghoul,
			                Num = j-1
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			for(local l = 1; l<=3; l++){
						::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j-1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j-2
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Ghoul,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.GhoulHIGH,
			                Num = l
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
					});
					::Const.World.Spawn.JccPercht.push({
					        Body = "figure_percht_01",
					        Troops = [
					            {
					                Type = this.Const.World.Spawn.Troops.JccPercht,
					                Num = i+1
					            },
					            {
					                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
					                Num = j
					            },
					            {
					                Type = this.Const.World.Spawn.Troops.GhoulLOW,
					                Num = j
					            },
					            {
					                Type = this.Const.World.Spawn.Troops.GhoulHIGH,
					                Num = l-1
					            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
					       ]
					});
			}
					::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i+1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.GhoulLOW,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j-1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j-2
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Ghoul,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j-1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j-2
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j+4
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j-1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j+4
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j-2
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j+6
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j-1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j-2
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Ghoul,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j+5
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Lindwurm,
			                Num = 1
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j+5
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j+2
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j+4
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Lindwurm,
			                Num = 1
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j+5
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j+9
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Lindwurm,
			                Num = 1
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j+10
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Lindwurm,
			                Num = 1
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
					::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j+5
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Ghoul,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j+9
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.JccDragon,
			                Num = 1
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j+5
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j-2
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j+12
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.JccDragon,
			                Num = 1
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i+2
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j+9
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j+12
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.JccDragon,
			                Num = 1
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i+2
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j+4
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j+12
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.JccDragon,
			                Num = 1
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
					::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j+7
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j+3
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Ghoul,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j+12
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Lindwurm,
			                Num = 1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.JccDragon,
			                Num = 1
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i+1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j-1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j+6
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j+9
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Lindwurm,
			                Num = 1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.JccDragon,
			                Num = 1
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i+3
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j+12
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j+14
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Lindwurm,
			                Num = 1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.JccDragon,
			                Num = 1
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i+3
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j+6
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Lindwurm,
			                Num = 1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.JccDragon,
			                Num = 1
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
		}

		foreach (num in [1,2,3,4]){
				for (local j = 3; j <= 15; j++){
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Schrat,
			                Num = num
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j-1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j-2
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Schrat,
			                Num = num
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i+1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Schrat,
			                Num = num
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.GhoulLOW,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Schrat,
			                Num = num
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j-1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j-2
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.GhoulLOW,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Schrat,
			                Num = num
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i+1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.GhoulLOW,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Schrat,
			                Num = num
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j-1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j-2
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Ghoul,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Schrat,
			                Num = num
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i+1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.GhoulLOW,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Ghoul,
			                Num = j-1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Schrat,
			                Num = num
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			for(local l = 1; l<=3; l++){
						::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j-1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j-2
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Ghoul,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.GhoulHIGH,
			                Num = l
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Schrat,
			                Num = num
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			      	 ]
					});
					::Const.World.Spawn.JccPercht.push({
					        Body = "figure_percht_01",
					        Troops = [
					            {
					                Type = this.Const.World.Spawn.Troops.JccPercht,
					                Num = i+1
					            },
					            {
					                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
					                Num = j
					            },
					            {
					                Type = this.Const.World.Spawn.Troops.GhoulLOW,
					                Num = j
					            },
					            {
					                Type = this.Const.World.Spawn.Troops.GhoulHIGH,
					                Num = l-1
					            },
					            {
					                Type = this.Const.World.Spawn.Troops.Schrat,
					                Num = num
					            },	            
					            {
					                Type = this.Const.World.Spawn.Troops.JccPerchta,
					                Num = x
					            }
					       ]
					});
					}
					::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i+1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.GhoulLOW,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Schrat,
			                Num = num
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j-1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j-2
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Ghoul,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Schrat,
			                Num = num
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j-1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j-2
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j+4
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Schrat,
			                Num = num
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j-1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j+4
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Schrat,
			                Num = num
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j-2
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j+6
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Schrat,
			                Num = num
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j-1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j-2
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Ghoul,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Lindwurm,
			                Num = 1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Schrat,
			                Num = num
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j-1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j-2
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j+4
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Lindwurm,
			                Num = 1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Schrat,
			                Num = num
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j-1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j+4
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Lindwurm,
			                Num = 1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Schrat,
			                Num = num
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j-2
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j+6
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Lindwurm,
			                Num = 1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Schrat,
			                Num = num
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
					::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j-1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j-2
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Ghoul,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.JccDragon,
			                Num = 1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Schrat,
			                Num = num
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j-1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j-2
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j+4
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.JccDragon,
			                Num = 1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Schrat,
			                Num = num
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j-1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j+4
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.JccDragon,
			                Num = 1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Schrat,
			                Num = num
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j-2
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j+6
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.JccDragon,
			                Num = 1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Schrat,
			                Num = num
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
					::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j-1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j-2
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Ghoul,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Lindwurm,
			                Num = 1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.JccDragon,
			                Num = 1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Schrat,
			                Num = num
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j-1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j-2
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j+4
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Lindwurm,
			                Num = 1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.JccDragon,
			                Num = 1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Schrat,
			                Num = num
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Direwolf,
			                Num = j-1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j+4
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Lindwurm,
			                Num = 1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.JccDragon,
			                Num = 1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Schrat,
			                Num = num
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
			::Const.World.Spawn.JccPercht.push({
			        Body = "figure_percht_01",
			        Troops = [
			            {
			                Type = this.Const.World.Spawn.Troops.JccPercht,
			                Num = i
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.DirewolfHIGH,
			                Num = j-2
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Spider,
			                Num = j+6
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Lindwurm,
			                Num = 1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.JccDragon,
			                Num = 1
			            },
			            {
			                Type = this.Const.World.Spawn.Troops.Schrat,
			                Num = num
			            },	            
			            {
			                Type = this.Const.World.Spawn.Troops.JccPerchta,
			                Num = x
			            }
			       ]
			});
		}

	}

}

//Basilisk

::Const.World.Spawn.JccBasilisk <- [
		{
	        Body = "figure_basilisk_03",
	        Troops = [
	            {
	                Type = this.Const.World.Spawn.Troops.JccBasiliskQueen,
	                Num = 1
	            }
	       ]
	   }
];

foreach (num in [1, 3, 5, 7, 12, 13, 14, 15, 16])
{
	   ::Const.World.Spawn.JccBasilisk.push({
	        Body = "figure_basilisk_01",
	        Troops = [
	            {
	                Type = this.Const.World.Spawn.Troops.JccBasiliskDrone,
	                Num = num
	            }
	       ]
	   });


		   ::Const.World.Spawn.JccBasilisk.push({
	        Body = "figure_basilisk_01",
	        Troops = [
	            {
	                Type = this.Const.World.Spawn.Troops.JccBasiliskDroneLOW,
	                Num = num
	            }
	       ]
	   });

		   ::Const.World.Spawn.JccBasilisk.push({
	        Body = "figure_basilisk_01",
	        Troops = [
	            {
	                Type = this.Const.World.Spawn.Troops.JccBasiliskDroneLOW,
	                Num = num
	            },
	            {
	                Type = this.Const.World.Spawn.Troops.JccBasiliskDrone,
	                Num = num
	            }
	       ]
	   });


	for(local j = 1; j<=2; j++)
	{	    	::Const.World.Spawn.JccBasilisk.push({
	        Body = "figure_basilisk_03",
	        Troops = [
	            {
	                Type = this.Const.World.Spawn.Troops.JccBasiliskDroneLOW,
	                Num = num
	            },
	            {
	                Type = this.Const.World.Spawn.Troops.JccBasiliskQueen,
	                Num = j
	            }
	       ]
	   });
	    	::Const.World.Spawn.JccBasilisk.push({
	        Body = "figure_basilisk_03",
	        Troops = [
	            {
	                Type = this.Const.World.Spawn.Troops.JccBasiliskDrone,
	                Num = num
	            },
	            {
	                Type = this.Const.World.Spawn.Troops.JccBasiliskQueen,
	                Num = j
	            }
	       ]
	   });
	    	::Const.World.Spawn.JccBasilisk.push({
	        Body = "figure_basilisk_03",
	        Troops = [
	            {
	                Type = this.Const.World.Spawn.Troops.JccBasiliskDroneLOW,
	                Num = num
	            },
	            {
	                Type = this.Const.World.Spawn.Troops.JccBasiliskQueen,
	                Num = j
	            },
	            {
	                Type = this.Const.World.Spawn.Troops.JccBasiliskDrone,
	                Num = num
	            }
	       ]
	   });
	}

	for (local i = 1; i <= 12; i++)
	{
	    ::Const.World.Spawn.JccBasilisk.push({
	        Body = "figure_basilisk_02",
	        Troops = [
	            {
	                Type = this.Const.World.Spawn.Troops.JccBasiliskDrone,
	                Num = num
	            }, 
	            {
	                Type = this.Const.World.Spawn.Troops.JccBasiliskSentry,
	                Num = i
	            }
	        ]
	    });
	    ::Const.World.Spawn.JccBasilisk.push({
	        Body = "figure_basilisk_02",
	        Troops = [
	            {
	                Type = this.Const.World.Spawn.Troops.JccBasiliskDroneLOW,
	                Num = num
	            },
	            {
	                Type = this.Const.World.Spawn.Troops.JccBasiliskDrone,
	                Num = num
	            }, 
	            {
	                Type = this.Const.World.Spawn.Troops.JccBasiliskSentry,
	                Num = i
	            }
	        ]
	    });
	    ::Const.World.Spawn.JccBasilisk.push({
	        Body = "figure_basilisk_02",
	        Troops = [
	            {
	                Type = this.Const.World.Spawn.Troops.JccBasiliskDroneLOW,
	                Num = num
	            }, 
	            {
	                Type = this.Const.World.Spawn.Troops.JccBasiliskSentry,
	                Num = i
	            }
	        ]
	    });
	    	for(local j = 1; j<=2; j++)
				{	    	::Const.World.Spawn.JccBasilisk.push({
				        Body = "figure_basilisk_03",
				        Troops = [
				            {
				                Type = this.Const.World.Spawn.Troops.JccBasiliskDroneLOW,
				                Num = num
				            },
				            {
				                Type = this.Const.World.Spawn.Troops.JccBasiliskQueen,
				                Num = j
				            },
				            {
				                Type = this.Const.World.Spawn.Troops.JccBasiliskSentry,
				                Num = i
				            }
				       ]
				   });
				    	::Const.World.Spawn.JccBasilisk.push({
				        Body = "figure_basilisk_03",
				        Troops = [
				            {
				                Type = this.Const.World.Spawn.Troops.JccBasiliskDrone,
				                Num = num
				            },
				            {
				                Type = this.Const.World.Spawn.Troops.JccBasiliskQueen,
				                Num = j
				            },
				            {
				                Type = this.Const.World.Spawn.Troops.JccBasiliskSentry,
				                Num = i
				            }
				       ]
				   });
				    	::Const.World.Spawn.JccBasilisk.push({
				        Body = "figure_basilisk_03",
				        Troops = [
				            {
				                Type = this.Const.World.Spawn.Troops.JccBasiliskDroneLOW,
				                Num = num
				            },
				            {
				                Type = this.Const.World.Spawn.Troops.JccBasiliskQueen,
				                Num = j
				            },
				            {
				                Type = this.Const.World.Spawn.Troops.JccBasiliskDrone,
				                Num = num
				            }, 
				            {
				                Type = this.Const.World.Spawn.Troops.JccBasiliskSentry,
				                Num = i
				            }
				       ]
				   });
				}
	}
}

//Dragon

::Const.World.Spawn.JccDragon <- [];

for (local i = 1; i <= 12; i++)
{
    ::Const.World.Spawn.JccDragon.push({
        Cost = 0,
        MovementSpeedMult = 0.75,
        Body = "figure_jcc_dragon",
        Troops = [
            {
                Type = this.Const.World.Spawn.Troops.JccDragon,
                Num = i
            }
        ]
    });
}

//Djinn

::Const.World.Spawn.JccDjinn <- [];

for (local i = 1; i <= 12; i++)
{
		    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i+3
				}
	        ]
	    });
	for (local j = 4; j <= 12; j++)
	{
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j
				}
	        ]
	    });

	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemHIGH,
					Num = j-3
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemHIGH,
					Num = j-3
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemHIGH,
					Num = j-3
				}
	        ]
	    });

	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemHIGH,
					Num = 1
				}
	        ]
	    });

	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemHIGH,
					Num = 2
				}
	        ]
	    });

	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j-3
				}
	        ]
	    });

	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.Lindwurm,
					Num = 1
				}
	        ]
	    });

	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemHIGH,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.Lindwurm,
					Num = 1
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemHIGH,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.Lindwurm,
					Num = 1
				}
	        ]
	    });
	}
}

for (local i = 1; i <= 12; i++)
{
	for (local j = 4; j <= 12; j++)
	{
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemHIGH,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemHIGH,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemHIGH,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });

	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemHIGH,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });

	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemHIGH,
					Num = 2
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });

	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });

	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.Lindwurm,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });

	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemHIGH,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.Lindwurm,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemHIGH,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.Lindwurm,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	}

	for (local j = 4; j <= 12; j++)
	{
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemHIGH,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemHIGH,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemHIGH,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				}
	        ]
	    });

	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemHIGH,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				}
	        ]
	    });

	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemHIGH,
					Num = 2
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				}
	        ]
	    });

	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				}
	        ]
	    });

	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.Lindwurm,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				}
	        ]
	    });

	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemHIGH,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.Lindwurm,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemHIGH,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.Lindwurm,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				}
	        ]
	    });
	    	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemHIGH,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemHIGH,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolem,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemHIGH,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });

	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemHIGH,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });

	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemHIGH,
					Num = 2
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });

	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });

	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.Lindwurm,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });

	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.Hyena,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j-2
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemHIGH,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.Lindwurm,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	    ::Const.World.Spawn.JccDjinn.push({
	        Cost = 0,
	        MovementSpeedMult = 0.75,
	        Body = "figure_jcc_djinn",
	        Troops = [
	            {
					Type = this.Const.World.Spawn.Troops.JccDjinn,
					Num = i
				},
				{
					Type = this.Const.World.Spawn.Troops.HyenaHIGH,
					Num = j
				},
				{
					Type = this.Const.World.Spawn.Troops.Serpent,
					Num = j-1
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemMEDIUM,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.SandGolemHIGH,
					Num = j-3
				},
				{
					Type = this.Const.World.Spawn.Troops.Lindwurm,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccGiantScorp,
					Num = 1
				},
				{
					Type = this.Const.World.Spawn.Troops.JccScorpion,
					Num = j
				}
	        ]
	    });
	}
}


//

function onCostCompare( _t1, _t2 )
{
	if (_t1.Cost < _t2.Cost)
	{
		return -1;
	}
	else if (_t1.Cost > _t2.Cost)
	{
		return 1;
	}

	return 0;
}

function calculateCosts( _p )
{
	foreach( p in _p )
	{
		p.Cost <- 0;

		foreach( t in p.Troops )
		{
			p.Cost += t.Type.Cost * t.Num;
		}

		if (!("MovementSpeedMult" in p))
		{
			p.MovementSpeedMult <- 1.0;
		}

		if (!("VisibilityMult" in p))
		{
			p.VisibilityMult <- 1.0;
		}

		if (!("VisionMult" in p))
		{
			p.VisionMult <- 1.0;
		}
	}

	_p.sort(this.onCostCompare);
}

this.calculateCosts(this.Const.World.Spawn.JccPercht);
this.calculateCosts(this.Const.World.Spawn.JccBasilisk);
this.calculateCosts(this.Const.World.Spawn.JccDragon);
this.calculateCosts(this.Const.World.Spawn.JccDjinn);