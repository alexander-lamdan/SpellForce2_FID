return 
{
	-- Cs 1 Tutorial
	Bor0 = 
	{
		Comment = "finding avatar after searching for a while",
		Description = "Bor, human/Shaikan, male, about 28, brother of the avatar, warrior, strong, cool, , good hearted, protective about his siblings, has become a like this after going through a violent past ",
		Situation = "Near a wrecked monument, a symbol of the rune warriors. Both stand there and look up to it. Relaxed situation.",
		
		Group = "01Intro",
		Take = 1,
		Speaker = "Bor",
		Text = '<wave><ehigh>Wusste ich doch, dass du zuerst hierher kommen würdest, wenn du von deiner Reise <erelease>zurückkehrst…'
	},
	
	Avatar1 = 
	{
		Comment = "greeting, calm, friendly, nodding",
		
		Group = "01Intro",
		Take = 2,
		Speaker = "Avatar",
		Text = '<yes>Bruder.'
	},
	Bor1 = 
	{
		Group = "01Intro",
		Take = 3,
		Speaker = "Bor",
		Text = '<ehigh>Machst du dir immer noch Gedanken um die <erelease>Runenkrieger?'
	},
	Avatar2 = 
	{
		Group = "01Intro",
		Take = 4,
		Speaker = "Avatar",
		Text = '<yes>Fragst du dich nicht auch <ehigh>manchmal, wer sie waren? Und wo sie jetzt <erelease>sind?'
	},
	Bor2 = 
	{
		Group = "01Intro",
		Take = 5,
		Speaker = "Bor",
		Text = 'Hm. <eangry>Das Ende des Zirkels hat auch die Runenmagie gebrochen. Das Zeitalter der Rune ist endgültig <point>vorbei. <erelease>Wo immer sie jetzt sind, sie haben nun Frieden.'
	},
	Bor3 = 
	{
		Group = "01Intro",
		Take = 6,
		Speaker = "Bor",
		Text = 'Wir beide aber… <ehigh>wir werden mächtig Ärger mit Thora bekommen, wenn wir zu spät beim Fest <erelease>erscheinen!'
	},
	Bor4 = 
	{
		Group = "01Intro",
		Take = 7,
		Speaker = "Bor",
		Text = '<ehigh>Also los! Lass uns Lya bei ihrem Haus <erelease>abholen!'
	},
	
	-- Cs 2 Tutorial
	Bor5 = 
	{
		Comment = "looking at corpses, shocked",
		Description = "Bor, human/Shaikan, male, about 28, brother of the avatar, warrior, strong, cool, good hearted, protective about his siblings, has become a like this after going through a violent past.",
		Situation = "Approaching Lyas house, there are corpses littered on the ground, Lya is dead, nobdoy knowa whts going on",

		Group = "02FindingLya",
		Take = 1,
		Speaker = "Bor",
		Text = '<ehigh>Was zum ...?'
	},
	Avatar2_1 = 
	{
		Group = "02FindingLya",
		Take = 2,
		Speaker = "Avatar",
		Text = '<esad>Lya! – Schwester!'
	},
	Bor7 = 
	{
		Comment = "seeing his dead sister",
		
		Group = "02FindingLya",
		Take = 3,
		Speaker = "Bor",
		Text = '<taunt><eangry>Sie atmet nicht mehr! Rasch! Wir müssen das Ritual <erelease>vollziehen!'
	},
	Bor8 = 
	{
		Group = "02FindingLya",
		Take = 4,
		Speaker = "Bor",
		Text = 'Hier in der Nähe muss ein Altar sein! Finde ihn! Weihe ihn mit deinem Blut! Nur so können wir sie wieder beleben!'
	},
	
	-- Cs 3 Tutorial
	Lya1 = 
	{
		Comment = "weak after the return from the dead",
		Description = "Bor, human/Shaikan, male, about 28, brother of the avatar, warrior, strong, cool, good hearted, protective about his siblings, has become a like this after going through a violent past. Lya, human/Shaikan, female, about 30, a priest, calm, determined, friendly.",
		Situation = "Lyas house, all are still a bit stressed.",
		
		
		Group = "03LyaReanimated",
		Take = 1,
		Speaker = "Lya",
		Text = '<yes>Habt Dank!'
	},
	Bor9 = 
	{
		Comment = "poiting at corpses",
		
		Group = "03LyaReanimated",
		Take = 2,
		Speaker = "Bor",
		Text = '<point><eangry>Was sind das für Kerle? Sie tragen die Waffen von Dunkelelfen ... aber seht nur ihre Haare … und ihre <erelease>Augen ... !'
	},
	Lya2 = 
	{
		Group = "03LyaReanimated",
		Take = 3,
		Speaker = "Lya",
		Text = '<yes>Auch ihre Sprache war die von Dunkelelfen.'
	},
	Bor10 = 
	{
		Group = "03LyaReanimated",
		Take = 4,
		Speaker = "Bor",
		Text = '<eangry>Hm. Ihren Abzeichen nach scheinen sie Teil einer größeren Truppe zu <erelease>sein ...'
	},
	Lya3 = 
	{
		Comment = "referring to a shadow being, shivering",
		
		Group = "03LyaReanimated",
		Take = 5,
		Speaker = "Lya",
		Text = '<esad><no>Da war noch etwas bei ihnen. Etwas Dunkles ... etwas <erelease>Kaltes.'
	},
	Bor11 = 
	{
		Comment = "on the go",
		
		Group = "03LyaReanimated",
		Take = 6,
		Speaker = "Bor",
		Text = '<point><eangry>Wir müssen schnellstens zur Festung <erelease>zurück!'
	},
	Lya4 = 
	{
		Group = "03LyaReanimated",
		Take = 7,
		Speaker = "Lya",
		Text = '<ehigh>Nimm dir zuerst noch etwas Ausrüstung aus der Kiste bei meinem Haus. <yes>Dann brechen wir <erelease>auf!'
	},
	
	-- Cs 4 Tutorial
	DarkElfRanger1 = 
	{
		Comment = "spotting the heroes, shouting",
		Description = "DarkElfRanger, darkelf, male, about 30, vicious, quick, a soldier.",
		Situation = "Darkelvess are fighting Nightsong, heroes interrupt",
		
		Group = "04DarkElvEncounter",
		Take = 1,
		Speaker = "DarkElfRanger",
		Text = 'Menschen!'
	},
	DarkElfRanger2 = 
	{
		Comment = "shouting",
		
		Group = "04DarkElvEncounter",
		Take = 2,
		Speaker = "DarkElfRanger",
		Text = 'Falsche Zeit, falscher Ort! Tötet sie!'
	},
	
	-- Cs 5 Tutorial
	Avatar2a = 
	{
		Comment = "standing over Nightsongs corpse after the fight",
		Description = "Nightsong, darkelf, female, about 25, tough, determined, dark, under a lot of pressure.",
		Situation = "Nightsong is revived and joins the group. She is in a hurry.",
		
		Group = "05MeetingNightsong",
		Take = 1,
		Speaker = "Avatar",
		Text = '<esad>Diese Dunkelelfe wurde von ihnen gejagt. Sie hätte uns sagen können, was hier <erelease>geschieht!'
	},
	Avatar3 = 
	{
		Group = "05MeetingNightsong",
		Take = 2,
		Speaker = "Avatar",
		Text = 'Ich gebe ihr unser Blut. Wir müssen wissen, was hier vor sich geht!'
	},
	NightSong1 = 
	{
		Comment = "weak, awakening",
		
		Group = "05MeetingNightsong",
		Take = 3,
		Speaker = "Nightsong",
		Text = '<no><esad>Aber ich war …?'
	},
	Avatar3 = 
	{
		Group = "05MeetingNightsong",
		Take = 4,
		Speaker = "Avatar",
		Text = '<yes>Tot, ja. Ihr habt das Blut der Shaikan empfangen. Die Kraft des Drachen, <point>die es enthält, hat Euch wiederbelebt.'
	},
	NightSong2 = 
	{
		Group = "05MeetingNightsong",
		Take = 5,
		Speaker = "Nightsong",
		Text = '<yes><erelease>Ich schulde Euch mein <military>Leben. Nennt den Preis, den ich zu zahlen habe!'
	},
	Avatar4 = 
	{
		Group = "05MeetingNightsong",
		Take = 6,
		Speaker = "Avatar",
		Text = '<point><eangry>Sagt mir, was hier geschieht! Wer sind diese Krieger? Das sind keine gewöhnlichen <erelease>Dunkelelfen!'
	},
	NightSong3 = 
	{
		Group = "05MeetingNightsong",
		Take = 7,
		Speaker = "Nightsong",
		Text = '<eangry>Es sind Soldaten des Schattenpakts, Späher eines Heeres, das auf dieses Land zumarschiert! Und ein Teil von ihnen ist bereits auf dem Weg nach <erelease>Nordwesten!'
	},
	Avatar5 = 
	{
		Comment = "shocked",
		
		Group = "05MeetingNightsong",
		Take = 8,
		Speaker = "Avatar",
		Text = '<eangry><taunt>Nordwesten, das heißt ... nach <erelease>Hause!'
	},
	Avatar5a = 
	{
		Group = "05MeetingNightsong",
		Take = 9,
		Speaker = "Avatar",
		Text = '<point><eangry>Wir müssen das Warnfeuer anzünden! Dann können unsere Leute vielleicht noch rechtzeitig in die Festung fliehen! Zur Wachhöhe!'
	},
	NightSong3a = 
	{
		Group = "05MeetingNightsong",
		Take = 10,
		Speaker = "Nightsong",
		Text = '<yes>Es gibt noch mehr, das ich Euch berichten muss! Ich komme mit Euch!'
	},
	-- Cs 6 Tutorial
	NightSong4 = 
	{
		Comment = "pointing",
		Description = "Nightsong, darkelf, female, about 25, tough, determined, dark, under a lot of pressure.",
		Situation = "Group has arrived at a sentry pint, looking down on the village",
		
		Group = "06AtTheVillage",
		Take = 1,
		Speaker = "Nightsong",
		Text = '<point><eangry>Euer Dorf ist bereits umzingelt.'
	},
	Avatar6 = 
	{
		Comment = "stressed, loud",
		
		Group = "06AtTheVillage",
		Take = 2,
		Speaker = "Avatar",
		Text = '<esad><no>Es ist zu spät! Sie sind abgeschnitten!'
	},
	NightSong5 = 
	{
		Group = "06AtTheVillage",
		Take = 3,
		Speaker = "Nightsong",
		Text = '<yes>Zu viele Gegner, ihr könnt <no>ihnen nicht mehr <erelease>helfen.'
	},
	Avatar7 = 
	{
		Group = "06AtTheVillage",
		Take = 4,
		Speaker = "Avatar",
		Text = '<eangry>Es gibt einen Grenzposten des Bundes hier in der <taunt>Nähe! Wir müssen dort Hilfe holen, bevor diese Kreaturen unser Dorf <erelease>auslöschen!'
	},
	
	---- Cs 7 Tutorial
	--Wulfger1 = 
	--{
	--	Group = "07MeetingWulfger",
	--	Take = 1,
	--	Speaker = "Wulfger",
	--	Text = 'Keinen Schritt weiter, Drachenbrut! Was wollt Ihr hier? Und diese Dunkelelfe?'
	--},
	--NightSong6 = 
	--{
	--	Group = "07MeetingWulfger",
	--	Take = 2,
	--	Speaker = "Nightsong",
	--	Text = 'Euch vor einem Heer warnen, das in dieses Land einfällt!'
	--},
	--Avatar8 = 
	--{
	--	Group = "07MeetingWulfger",
	--	Take = 3,
	--	Speaker = "Avatar",
	--	Text = 'Und dessen Vorhut bereits unser Dorf eingekesselt hat! Wir brauchen Eure Leute um es wieder zu befreien, Ritter des Bundes!'
	--},
	--Wulfger2 = 
	--{
	--	Group = "07MeetingWulfger",
	--	Take = 4,
	--	Speaker = "Wulfger",
	--	Text = 'Meine Krieger wollt Ihr? Ihr, ein Shaikan?'
	--},
	--Wulfger3 = 
	--{
	--	Group = "07MeetingWulfger",
	--	Take = 5,
	--	Speaker = "Wulfger",
	--	Text = 'Ihr seid keine Diener des Lichts, ihr verratet jeden, wie es Euch passt! Mein Vater starb, weil er einem von Euch vertraute!'
	--},
	--Avatar9 = 
	--{
	--	Group = "07MeetingWulfger",
	--	Take = 6,
	--	Speaker = "Avatar",
	--	Text = 'Meine Leute werden sterben! Soll ihr  Blut an Euren Händen kleben, Ritter des Lichts?'
	--},
	--Wulfger4 = 
	--{
	--	Group = "07MeetingWulfger",
	--	Take = 7,
	--	Speaker = "Wulfger",
	--	Text = 'Mhmm, nun gut…Wir werden Euch helfen ... unter einer Bedingung: Ihr müsst zu Ende bringen, was Ihr beginnt! Lasst niemals Eure Leute im Stich ! Schwört es mir!'
	--},
	--Avatar10 = 
	--{
	--	Group = "07MeetingWulfger",
	--	Take = 8,
	--	Speaker = "Avatar",
	--	Text = 'Ich schwöre es bei dem Blut des Drachen in meinen Adern! Ich werde nicht sein wie meine Vorfahren! Ich werde meine Truppen niemals im Stich lassen! Nun helft uns!'
	--},
	--Wulfger5 = 
	--{
	--	Group = "07MeetingWulfger",
	--	Take = 9,
	--	Speaker = "Wulfger",
	--	Text = 'Die Götter mögen Euch verdammen, wenn ihr jemals diesen Schwur brecht! Aber wir helfen Euch!'
	--},
	
	-- Cs 8 Tutorial
	Avatar11 = 
	{
		Comment = "kneeling down in reverence",
		Description = "Ur, dragon, male, 15000, majestic, wise, huge, powerful, concerned, sends avatar away to protect Malacays soul but hides this intention. Nightsong, darkelf, female, about 25, tough, determined, dark, under a lot of pressure.",
		Situation = "In the dragons lair, everybody feels a bit small beside the dragon",
		
		Group = "08Ur",
		Take = 1,
		Speaker = "Avatar",
		Text = 'Altvater.'
	},
	Ur1 = 
	{
		Group = "08Ur",
		Take = 2,
		Speaker = "Ur",
		Text = 'Es ist lange her, Kind. Berichte!'
	},
	Avatar12 = 
	{
		Group = "08Ur",
		Take = 3,
		Speaker = "Avatar",
		Text = 'Ich bringe Euch diese Norcaine, sie weiß, was vor sich geht.'
	},
	NightSong7 = 
	{
		Group = "08Ur",
		Take = 4,
		Speaker = "Nightsong",
		Text = '<military>Man nennt mich Schattenlied. Ich bringe Euch Kunde von einem Bruderkrieg im Reich der Dunkelelfen. Ein Teil meines Volkes hat sich mit den Schatten verbündet. Sie nennen sich der Pakt.'
	},
	Ur2 = 
	{
		Group = "08Ur",
		Take = 5,
		Speaker = "Ur",
		Text = 'Die Schatten ...'
	},
	NightSong8 = 
	{
		Group = "08Ur",
		Take = 6,
		Speaker = "Nightsong",
		Text = '<eangry>Kreaturen <point>aus einer anderen Welt, Feinde allen Lebens. Und sie sind auf dem Weg hierher, zusammen mit einer Streitmacht der <erelease>Norcaine.'
	},
	Ur3 = 
	{
		Group = "08Ur",
		Take = 7,
		Speaker = "Ur",
		Text = 'Und ihr wolltet uns warnen? Warum sollten wir Euch trauen?'
	},
	NightSong9 = 
	{
		Group = "08Ur",
		Take = 8,
		Speaker = "NightSong",
		Text = '<eangry>Mein Vater Craig Un’Shallach <point>gab mir dies, dass Siegel der Norcaine …bevor er starb. Es sollte Euch als Pfand der Wahrheit genug <erelease>sein.'
	},
	Ur4 = 
	{
		Group = "08Ur",
		Take = 9,
		Speaker = "Ur",
		Text = 'Craig … ist gefallen?'
	},
	NighSong9a = 
	{
		Group = "08Ur",
		Take = 10,
		Speaker = "NightSong",
		Text = '<esad><yes>Ja. Sein letzter Wunsch war, das ich die Völker des Lichtes vor den Schatten warne . Ich muss also weiter in das Reich der <erelease>Menschen.'
	},
	Ur5 = 
	{
		Group = "08Ur",
		Take = 11,
		Speaker = "Ur",
		Text = 'Das müsst Ihr. Und du, Kind, wirst sie begleiten!'
	},
	Avatar13 = 
	{
		Group = "08Ur",
		Take = 12,
		Speaker = "Avatar",
		Text = '<taunt><eangry>Aber was ist mit der Armee des Paktes? Ich muss hier bei der Verteidigung helfen!'
	},
	Ur6 = 
	{
		Group = "08Ur",
		Take = 13,
		Speaker = "Ur",
		Text = 'Nein, Kind! Du musst Hilfe holen. Sucht Baron Ortbrand in Norimar auf. Er wird euch Geleit zu König Ulf geben.'
	},
	Ur7 = 
	{
		Group = "08Ur",
		Take = 14,
		Speaker = "Ur",
		Text = 'Bringt dem König die Warnung und kehrt mit einem Heer wieder, das diesen Pakt zurückschlagen kann!'
	},
	Ur7a = 
	{
		Group = "08Ur",
		Take = 15,
		Speaker = "Ur",
		Text = 'Wir werden hier aushalten.'
	},
	Avatar14 = 
	{
		Comment = "protesting",
		
		Group = "08Ur",
		Take = 16,
		Speaker = "Avatar",
		Text = 'Altvater!'
	},
	Ur8 = 
	{
		Group = "08Ur",
		Take = 17,
		Speaker = "Avatar",
		Text = 'Nehmt das Portal nach Norimar im Nordwesten. Geht! Holt Hilfe!'
	},
	
	-- Am Portal nach Dragh Lur
	TothLar0 = 
	{
		Comment = "commanding, shouting",
		Description = "Toth Lar, darkelf, male, 35, leader of the darkelves, aggressive, nervous, tries to hide his inabilities, is his mother Sorvinas puppet. Sorvina, darkelf, female, 40, stubborn, power-hungry, intelligent, dreamer, alchemist, has been piosoned years ago and is just alive through the help of magic, in constant pain but never showing it.",
		Situation = "Near the portal to Draghlur, troops march in, Toth Lar stops to give intructions",
		
		Group = "09PortalDraghLur",
		Take = 1,
		Speaker = "TothLar",
		Text = 'Erste Legion, Weitermarsch nach Norden! Zweite Legion schlägt hier ein Lager auf!'
	},
	TothLar0a = 
	{
		Group = "09PortalDraghLur",
		Take = 2,
		Speaker = "TothLar",
		Text = 'Hier sind wir, wie du es wolltest.'
	},
	TothLar0b = 
	{
		Group = "09PortalDraghLur",
		Take = 3,
		Speaker = "TothLar",
		Text = 'Nun erkläre mir, wie sollen wir den Drache überwinden? Oder den Wall?'
	},
	Sorvina0 = 
	{
		Group = "09PortalDraghLur",
		Take = 4,
		Speaker = "Sorvina",
		Text = '<ehigh>Keine Sorge, Mutter hat an alles gedacht.'
	},
	
	-- Kampagne 1
	
	Sorvina1 = 
	{
		Comment = "watching the fight, speaking to herself",
		Description = "Toth Lar, darkelf, male, 35, leader of the darkelves, aggressive, nervous, tries to hide his inabilities, is his mother Sorvinas puppet. Sorvina, darkelf, female, 40, stubborn, power-hungry, intelligent, dreamer, alchemist, has been piosoned years ago and is just alive through the help of magic, in constant pain but never showing it. Falkmar, human, male, about 25, stubborn, heroic, a knight of the light, aggressive, extreme.",
		Situation = "Near the fortress Shaikur, whcih is under siege by the darkelves. the dragon ur and the monstrous Devourer are fighting nearby.",
		
		
		Group = "09CampainUr",
		Take = 1,
		Speaker = "Sorvina",
		Text = '<ehigh>Ja, spei nur dein nutzloses <erelease>Feuer ...'
	},
	TothLar1 = 
	{
		Comment = "approaching in haste, excited",
		
		Group = "09CampainUr",
		Take = 2,
		Speaker = "TothLar",
		Text = 'Mutter! Der Bund hat das Bulwark durchbrochen!'
	},
	Sorvina2 = 
	{
		Comment = "angry",
		
		Group = "09CampainUr",
		Take = 3,
		Speaker = "Sorvina",
		Text = '<eangry>Dann hat Hagard  versagt! <no>Dieser Nichtsnutz!'
	},
	Sorvina2a = 
	{
		Group = "09CampainUr",
		Take = 4,
		Speaker = "Sorvina",
		Text = '<no>Ich kann jetzt keine Störung brauchen! Ich verschließe die Grenze mit einem Zauber! Das sollte sie <erelease>fernhalten!'
	},
	Sorvina3 = 
	{
		Comment = "Bund = Realm in english",
		
		Group = "09CampainUr",
		Take = 5,
		Speaker = "Sorvina",
		Text = '<point>Die zweite Legion soll sie vom Osten her angreifen! Wollen wir sehen, wie gut der Bund auf die Schatten vorbereitet ist!'
	},
	Falkmar1 = 
	{
		Comment = "appraching, shouting",
		
		Group = "09CampainUr",
		Take = 6,
		Speaker = "Falkmar",
		Text = '<military>Wir bringen Euch Verstärkung, Shaikan!'
	},
	Avatar14a = 
	{
		Comment = "almost angry",
		
		Group = "09CampainUr",
		Take = 7,
		Speaker = "Avatar",
		Text = '<esad>Beeilung! Der Pakt greift schon die Festung an!'
	},
	Avatar15 = 
	{
		Group = "09CampainUr",
		Take = 8,
		Speaker = "Avatar",
		Text = '<eangry><taunt>Wir müssen diese Barriere umgehen! Im Osten gibt es noch einen Küstenpfad Richtung Norden! Schnell!'
	},
	Avatar16 = 
	{
		Comment = "to himself",
		
		Group = "09CampainUr",
		Take = 9,
		Speaker = "Sorvina",
		Text = '<esad>Ur ist in Gefahr! Ich kann es <erelease>fühlen!'
	},
	Io1 = 
	{
		Comment = "seeing shadows, shouting",
		
		Group = "09CampainUr",
		Take = 10,
		Speaker = "Io",
		Text = '<point>Was ist das?'
	},
	NightSong9b = 
	{
		Group = "09CampainUr",
		Take = 11,
		Speaker = "NightSong",
		Text = '<yes>Die Schatten! Sie kommen!'
	},
	
	-- Kampagne 2
	Sorvina4 = 
	{
		Comment = "commanding",
		Description = "Sorvina, darkelf, female, 40, stubborn, power-hungry, intelligent, dreamer, alchemist, has been piosoned years ago and is just alive through the help of magic, in constant pain but never showing it. Falkmar, human, male, about 25, stubborn, heroic, a knight of the light, aggressive, extreme. Golgalath the Devourer, a lizard-being of enourmous size, brutal, hungry, vicious, full of rage.",
		Situation = "In front of the fortress Shaikur, the Devouerer has taken down the dragon ur, ready to feast on his flesh.",
		
		
		Group = "10UrDead",
		Take = 1,
		Speaker = "Sorvina",
		Text = '<point>Halt, Verschlinger!'
	},
	Sorvina5 = 
	{
		Group = "10UrDead",
		Take = 2,
		Speaker = "Sorvina",
		Text = 'Du wurdest gerufen, ihn zu besiegen, <no>nicht ihn zu töten!'
	},
	Hydra1 = 
	{
		Group = "10UrDead",
		Take = 3,
		Speaker = "Hydra",
		Text = 'Ihr habt mir ein Festmahl versprochen, Alchemistin ... Wenn nicht sein Fleisch, was soll meinen Hunger stillen?'
	},
	Sorvina6 = 
	{
		Group = "10UrDead",
		Take = 4,
		Speaker = "Sorvina",
		Text = '<point>Dort ist genug Fleisch für dich ...'
	},
	Sorvina7 = 
	{
		Group = "10UrDead",
		Take = 5,
		Speaker = "Sorvina",
		Text = 'Zeit für mich zu gehen. Dieser Drache und ich haben noch viel zu besprechen!'
	},
	TothLar1a = 
	{
		Group = "10UrDead",
		Take = 6,
		Speaker = "TothLar",
		Text = 'Was ist mit dem Bund? Der Schlacht? Den Schatten?'
	},
	Sorvina8 = 
	{
		Group = "10UrDead",
		Take = 7,
		Speaker = "Sorvina",
		Text = 'Sie werden deinen Befehlen folgen wie den meinen. <no>Spielt ihr Männer nur Euer Kriegsspiel, ich habe, was ich wollte.'
	},
	TothLar2 = 
	{
		Group = "10UrDead",
		Take = 8,
		Speaker = "TothLar",
		Text = 'Mutter!'
	},
	Sorvina9 = 
	{
		Group = "10UrDead",
		Take = 9,
		Speaker = "Sorvina",
		Text = 'Still jetzt, dieser Zauber ist nicht einfach.'
	},
	
	-- Kampagne 3
	Grimrot1 = 
	{
		Comment = "commanding",
		Description = "Grimroot, treant/tree-guardian, huge walking, talking tree,  ancient, grim, powerful, a bit slow",
		Situation = "Near an ancient forest, the avatar has just completed a ritual and the ancient tree guardians walk from the forest. Tense but no battle.",
		
		
		Group = "11Grimroot",
		Take = 1,
		Speaker = "Grimroot",
		Text = 'Der Ruf ...'
	},
	Grimrot2 = 
	{
		Group = "11Grimroot",
		Take = 2,
		Speaker = "Grimroot",
		Text = 'Habt Ihr das vollbracht, Mensch?'
	},
	Grimrot3 = 
	{
		Comment = "spotting a shadow, angry, shouting",
		
		Group = "11Grimroot",
		Take = 3,
		Speaker = "Grimroot",
		Text = 'Wer verbirgt sich da?'
	},
	Avatar17 = 
	{
		Group = "11Grimroot",
		Take = 4,
		Speaker = "Avatar",
		Text = '<military>Ich habe Euch gerufen, Wächter. Helft mir diese widernatürlichen Schatten zu vertreiben und meine Familie zu schützen!'
	},
	Grimrot4 = 
	{
		Group = "11Grimroot",
		Take = 5,
		Speaker = "Grimroot",
		Text = 'Hmm ...'
	},
	Avatar18 = 
	{
		Group = "11Grimroot",
		Take = 6,
		Speaker = "Avatar",
		Text = '<bow>Im Namen ... Elens.'
	},
	Grimrot5 = 
	{
		Group = "11Grimroot",
		Take = 7,
		Speaker = "Grimroot",
		Text = 'Wächter! Erwacht!'
	},
	Grimrot6 = 
	{
		Group = "11Grimroot",
		Take = 8,
		Speaker = "Grimroot",
		Text = 'Elen ruft uns ... zum Krieg!'
	},
	
	-- Kampagne 4
	Hydra2 = 
	{
		Comment = "mocking",
		Description = "Golgalath the Devourer, a lizard-being of enourmous size, brutal, hungry, vicious, full of rage.",
		Situation = "In the dragons lair, the Devourer has just finished his feast on the avatars family. they are all dead.",
		
		
		Group = "12Hydra",
		Take = 1,
		Speaker = "Hydra",
		Text = 'Zu spät, kleiner Mensch.'
	},
	Avatar19 = 
	{
		Comment = "shouting",
		
		Group = "12Hydra",
		Take = 2,
		Speaker = "Avatar",
		Text = '<eangry>Wo ist Ur? Der Drache? <taunt>Meine Leute? Was hast du mit ihnen gemacht?'
	},
	Hydra3 = 
	{
		Comment = "mocking",
		
		Group = "12Hydra",
		Take = 3,
		Speaker = "Hydra",
		Text = 'Ich arbeite nur für Nahrung, Menschlein. Dein Drache ist fort! Die Alchemistin hat ihn nach Shal geschleppt.'
	},
	Hydra4 = 
	{
		Group = "12Hydra",
		Take = 4,
		Speaker = "Hydra",
		Text = 'Er hat etwas, das sie will.'
	},
	Hydra5 = 
	{
		Group = "12Hydra",
		Take = 5,
		Speaker = "Hydra",
		Text = 'Glaub mir Menschlein, was ihm bevorsteht, ist schlimmer als das, was deinen Leuten widerfahren ist.'
	},
	Avatar20 = 
	{
		Group = "12Hydra",
		Take = 6,
		Speaker = "Avatar",
		Text = '<point>Meine Geschwister! Wo sind sie?'
	},
	Hydra6 = 
	{
		Group = "12Hydra",
		Take = 7,
		Speaker = "Hydra",
		Text = 'Komm näher ... Ich bringe dich zu ihnen ...'
	},
	NightSong11 = 
	{
		Comment = "pointing at the blood thats left of the family",
		
		Group = "12Hydra",
		Take = 8,
		Speaker = "Nightsong",
		Text = 'Freund ...<no>das Blut ...'
	},
	Avatar21 = 
	{
		Comment = "screaming",
		
		Group = "12Hydra",
		Take = 9,
		Speaker = "Avatar",
		Text = '<no><eangry>Nein ... <erelease>Nein!'
	},
	
	-- Kampagne 5 Nach Kampf gegen Hydra
	Avatar22 = 
	{
		
		Comment = "devastated, mourning, swelling rage",
		Description = "Falkmar, human, male, about 25, stubborn, heroic, a knight of the light, aggressive, extreme.",
		Situation = "In the dragons lair, avatar ist stills hocked. Later, Malacay takes over.",
		
		
		Group = "13HydraDaed",
		Take = 1,
		Speaker = "Avatar",
		Text = '<esad>Blut meines Blutes ...'
	},
	Falkmar2 = 
	{
		Comment = "even he ist touched",
		
		Group = "13HydraDaed",
		Take = 2,
		Speaker = "Falkmar",
		Text = '<esad><point>Ruhig, Ihr habt Eure Rache gehabt.'
	},
	Avatar23 = 
	{
		Comment = "angry",
		
		Group = "13HydraDaed",
		Take = 3,
		Speaker = "Avatar",
		Text = '<taunt><eangry>Noch lange nicht! Nicht bis Ur frei und diese Alchimistin beim Seelenfluss ist!'
	},
	Avatar24 = 
	{
		Group = "13HydraDaed",
		Take = 4,
		Speaker = "Avatar",
		Text = 'Unser Feldzug hat gerade <point>erst begonnen! Auf nach <erelease>Shal!'
	},
	Falkmar3 = 
	{
		Group = "13HydraDaed",
		Take = 5,
		Speaker = "Falkmar",
		Text = '<ehigh>Shal? <no>Zur Hauptstadt der Norcaine? <eangry>Seid Ihr von Sinnen? <point>Wir können froh sein, wenn wir diese Grenze halten können!'
	},
	Io2 = 
	{
		Group = "13HydraDaed",
		Take = 6,
		Speaker = "Io",
		Text = '<esad>Das <no>hieße Dragh’Lur  angreifen, <erelease>Shaikan! <no>Keine Armee des Lichts hat je diese Festung eingenommen!'
	},
	Falkmar4 = 
	{
		Group = "13HydraDaed",
		Take = 7,
		Speaker = "Falkmar",
		Text = '<no><esad>Nein Freund. Wir haben deine Heimat befreit, wie versprochen ... <yes>und wir trauern um deine Familie. <point><eangry>Aber den Pakt eines Drachen wegen anzugreifen, ist <erelease>Wahnsinn!'
	},
	Avatar25 = 
	{
		Comment = "Malacays voice, Malacay taking over",
		
		Group = "13HydraDaed",
		Take = 8,
		Speaker = "Malacay",
		Text = '<eangry>Ihr Würmer nennt mich wahnsinnig?'
	},
	Io3 = 
	{
		Group = "13HydraDaed",
		Take = 9,
		Speaker = "Io",
		Text = '<ehigh>Was ... Was ist mit <erelease>Euch?'
	},
	Avatar26 = 
	{
		Comment = "Malacays voice, angry",
		
		Group = "13HydraDaed",
		Take = 10,
		Speaker = "Malacay",
		Text = '<point><eangry>Feiglinge! Euer Gewinsel widert mich an! <taunt>Ich werde mir Verbündete suchen, die siegen können!'
	},
	Falkmar5 = 
	{
		Group = "13HydraDaed",
		Take = 11,
		Speaker = "Falkmar",
		Text = '<eangry><yes>Dann geht! Der Bund wird sich <no>nicht für Eure Rachsucht opfern!'
	},
	Avatar27 = 
	{
			Comment = "a bit later in time, avatars voice again, now alone with Nightsong looking back to the fortress",
		
		Group = "13HydraDaed",
		Take = 12,
		Speaker = "Avatar",
		Text = '<no><esad>Habe ich das wirklich <erelease>gesagt?'
	},
	NightSong12 = 
	{
		Group = "13HydraDaed",
		Take = 13,
		Speaker = "Nightsong",
		Text = 'Das <yes>Blut Eures Vaters ist stärker als Ihr glaubt, wie es scheint...'
	},
	Avatar27a = 
	{
		Group = "13HydraDaed",
		Take = 14,
		Speaker = "Avatar",
		Text = '<no><esad>Er … hat von mir Besitz ergriffen. <eangry><yes>Also bin ich der Seelenträger!'
	},
	NightSong12a = 
	{
		Group = "13HydraDaed",
		Take = 15,
		Speaker = "Nightsong",
		Text = '<ehigh>Seelenträger?'
	},
	Avatar27b = 
	{
		Group = "13HydraDaed",
		Take = 16,
		Speaker = "Avatar",
		Text = '<erelease>Jede <yes>Generation sucht sich Malacays Seele einen Shaikan, in dem sie sich manifestiert.'
	},
	Avatar27c = 
	{
		Group = "13HydraDaed",
		Take = 17,
		Speaker = "Avatar",
		Text = '<yes><esad>Deshalb war Kolar so besorgt … und <eangry>Ur sandte <point>mich mit Euch fort, um die Seele zu schützen, nicht mich!'
	},
	Avatar28 = 
	{
		Group = "13HydraDaed",
		Take = 18,
		Speaker = "Avatar",
		Text = '<taunt>Verflucht sei Malacay! Mit welchen Verbündeten soll ich nun Ur retten?'
	},
	NightSong13 = 
	{
		Group = "13HydraDaed",
		Take = 19,
		Speaker = "Nightsong",
		Text = '<ehigh>Habt Ihr nicht einem Chieftain der Clans das Leben geschenkt? <yes>Es wäre wohl an der Zeit, diese Schuld <erelease>einzufordern.'
	},
	Avatar29 = 
	{
		Group = "13HydraDaed",
		Take = 20,
		Speaker = "Avatar",
		Text = '<yes><erelease>Das wäre es wohl. Das Portal im Süden von hier führt zum Land der Clans.'
	},
	NightSong14 = 
	{
		Group = "13HydraDaed",
		Take = 21,
		Speaker = "Nightsong",
		Text = 'Dann lasst uns dort Verbündete suchen.'
	},
	Malacay1 = 
	{
		Comment = "Malacay whispering to the avatar, cant wait to meet Sorvina",
		
		Group = "13HydraDaed",
		Take = 22,
		Speaker = "Malacay",
		Text =  'Ja! Die Clans! Das ist es! Und dann zu dieser Frau ... Sorvina'
	},
}