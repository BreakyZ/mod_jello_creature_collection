this.jcc_djinn_low <- this.inherit("scripts/entity/tactical/enemies/jcc_djinn", {
	m = {},
	function create()
	{
		this.jcc_djinn.create();
	}

	function onInit()
	{
		this.jcc_djinn.onInit();
	}

	function assignRandomEquipment()
	{
		local r;
		local armor;
		local weapon;
		local upgrade;

		
		//this.m.Skills.removeByID("perk.duelist");
		
		r = this.Math.rand(1, 100);

		if(r<=40){

			armor=(this.new("scripts/items/armor/jcc_djinn_heavy_armor"));

		}else if(r<=80){

			armor=(this.new("scripts/items/armor/jcc_djinn_medium_armor"));

		}else if(r<=90){

			armor=(this.new("scripts/items/armor/jcc_djinn_light_armor"));
		}

		if(armor!=null)
		{

			if( this.Math.rand(1, 100)<50){
				upgrade = this.new("scripts/items/armor_upgrades/jcc_djinn_upgrade");
				armor.setUpgrade(upgrade);
			}

			this.m.Items.equip(armor);	
		}
	

		r = this.Math.rand(1, 100);

		if(this.Math.rand(1, 100)<40){
			if(this.Math.rand(1, 100)<50){
				this.m.Items.equip(this.new("scripts/items/weapons/jcc_djinn_hammer"));
			}else{
				this.m.Items.equip(this.new("scripts/items/weapons/jcc_djinn_scimitar"));
			}
			if(this.Math.rand(1, 100)<50){
				this.m.Items.equip(this.new("scripts/items/shields/greenskins/orc_heavy_shield"));
			}
		}
		else if(this.Math.rand(1, 100)<80){
			if(this.Math.rand(1, 100)<50){
				this.m.Items.equip(this.new("scripts/items/weapons/jcc_djinn_bigsword"));
			}else{
				this.m.Items.equip(this.new("scripts/items/weapons/jcc_djinn_polemace"));
			}
		}else{
						this.m.Skills.add(this.new("scripts/skills/perks/perk_overwhelm"));
			this.m.Items.equip(this.new("scripts/items/weapons/jcc_djinn_scimitar_dual"));
			this.m.Skills.add(this.new("scripts/skills/racials/jcc_djinn_dual_racial"));

		}


	}

});
