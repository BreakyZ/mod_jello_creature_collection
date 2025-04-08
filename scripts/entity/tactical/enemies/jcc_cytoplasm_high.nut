this.jcc_cytoplasm_high <- this.inherit("scripts/entity/tactical/enemies/jcc_cytoplasm", {
	m = {},
	function create()
	{
		this.jcc_cytoplasm.create();
	}

	function onInit()
	{
		this.jcc_cytoplasm.onInit();
		this.grow(true);
		this.grow(true);
	}

});
