this.jcc_player_percht_intro_event <- this.inherit("scripts/events/event", {
	m = {},
	function create()
	{
		this.m.ID = "event.jcc_player_percht_intro";
		this.m.IsSpecial = true;
		this.m.Screens.push({
			ID = "A",
			Text = "[img]gfx/ui/events/jcc_event_01.png[/img]It took years for the %companyname% to earn it\'s standing, but only one streak of bad luck and worse leadership to lose it. Your incompetent new captain led the company into a series of fatal skirmishes that cost you friends and, more importantly, crowns. When you suffered a final, crushing defeat, you took the chance to cut his throat in the chaos.\n\nThe remaining men looked to you for guidance and so, recalling childhood tales of horned men in the darkest parts of the forest, benefactors to witches and desperate men, you dragged them into the woods.\n\n You now find yourself part of one such bargain, your hand warm with fresh blood, the air tense with anticipation. %hunter1% and %hunter2% look on anxiously as you offer your bloodied hand to the colossal, white-furred beastman in front of you. His massive hand tightly grips yours as if to squeeze every drop from your arm. Easing his grip just as you\'re about to faint, he pauses to read you for a moment before breaking the silence with his guttural voice.%SPEECH_ON%The pact is sealed, warmblood. Remember always that you chose this...%SPEECH_OFF% The elder nods towards another of his group, who steps into the torchlight with a snarl. %SPEECH_ON%This one\'s name is %hunter3%, he will repay our blood-debt in the moons to come... and remind you of your obligations if necessary. In that case, I hope for your sake you make good sport.%SPEECH_OFF% With that, the perchts depart and the men reluctantly welcome %hunter3% into your ranks. As dawn breaks, the newly bolstered %companyname% make their way back to civilisation and hopefully, to fortune.",
			Image = "",
			Banner = "",
			List = [],
			Characters = [],
			Options = [
				{
					Text = "Who could stand against us now?",
					function getResult( _event )
					{
						return 0;
					}

				}
			],
			function start( _event )
			{
				this.Banner = "ui/banners/" + this.World.Assets.getBanner() + "s.png";
				local brothers = this.World.getPlayerRoster().getAll();
				this.Characters.push(brothers[1].getImagePath());
				this.Characters.push(brothers[2].getImagePath());
			}

		});
	}

	function onUpdateScore()
	{
		return;
	}

	function onPrepare()
	{
		this.m.Title = "Pactsworn";
	}

	function onPrepareVariables( _vars )
	{
		local brothers = this.World.getPlayerRoster().getAll();
		local settlements = this.World.EntityManager.getSettlements();
		local closest;
		local distance = 9999;

		foreach( s in settlements )
		{
			local d = s.getTile().getDistanceTo(this.World.State.getPlayer().getTile());

			if (d < distance)
			{
				closest = s;
				distance = d;
			}
		}

		local f = closest.getFactionOfType(this.Const.FactionType.NobleHouse);
		_vars.push([
			"hunter1",
			brothers[0].getName()
		]);
		_vars.push([
			"hunter2",
			brothers[1].getName()
		]);
		_vars.push([
			"hunter3",
			brothers[2].getName()
		]);
		_vars.push([
			"noble",
			f.getRandomCharacter().getName()
		]);
	}

	function onClear()
	{
	}

});

