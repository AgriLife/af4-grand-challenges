$ = jQuery
AgriLife = {} if not AgriLife

AgriLife.People = class People

	lastSpec: ''

	updateSpecs: (data) ->
		$('#s').autocomplete 'option', 'source', data

	get: ->
		$.ajax(
			# url: url.ajax
			url: 'http://agriflex4multisite.local/wp-content/plugins/agrilife-faculty-search/js/test.json'
			data:
				action: 'get_people'
			success: (response) =>
				prefix = 'agrilife-people-';
				if @specialization then prefix += @specialization
				else prefix += 'all'
				response = {"cached":true,"people":[{"f":"Srinivasulu","l":"Ale","t":"$A $P","e":"sriniale$AT","p":"940.552.9941","d":0,"s":[0,1,2,3,4,5]},{"f":"James","l":"Richardson","t":"$P","e":"jwrichardson$T","p":"979.845.2116","d":4,"s":[528,14,529,19,445]},{"f":"Patricia","l":"Pietrantonio","t":"$P","e":"p-pietrantonio$T","p":"979.845.9728","d":10,"s":[55,1,483,484,29,485,486,487,33,488,489,490,409]},{"f":"Suresh","l":"Pillai","t":"$P","e":"s-pillai$T","p":"979.458.3229","d":1,"s":[491,55,14,0,43,1,492,7,8,9,493,10,11,494,29,90,69,58,187,495,496,497,498,3,499,4]},{"f":"Manuel","l":"Pina","t":"$A $P","e":"m-pina$T","p":"979.862.1978","d":13,"s":[197,90,500,3]},{"f":"Bill","l":"Pinchak","t":"$P","e":"bill.pinchak$AT","p":"940.552.9941","d":0,"s":[132,501,7,119,29,502,3]},{"f":"Sorin","l":"Popescu","t":"$A $P","e":"s-popescu$T","p":"979.862.2614","d":12,"s":[0,1,384,200,3]},{"f":"Dana","l":"Porter","t":"$P & $A $H","e":"dporter$AT","p":"806.723.8426","d":15,"s":[503,1,220,504,3,4,78]},{"f":"Edwin","l":"Price","t":"$P and Buffet Chair","e":"ec-price$T","p":"979.845.3270","d":4,"s":[343,14,69,22]},{"f":"Tony","l":"Provin","t":"$P and $E Soil Chemist","e":"t-provin$T","p":"979.845.4816","d":8,"s":[505,49,506,139,140,25,0,1,7,507,29,508,255,509,302,510,209,3,4,78,511]},{"f":"W. Shawn","l":"Ramsey","t":"$P & Assistant $H","e":"sramsey$T","p":"979.845.1541","d":9,"s":[512,513,84,85,514]},{"f":"Barron","l":"Rector","t":"$A $P and $E Range $S","e":"b-rector$T","p":"979.845.2755","d":12,"s":[14,0,515,1,516,345,4,84,517]},{"f":"Larry","l":"Redmon","t":"$P and $E $S","e":"l-redmon$T","p":"979.845.4826","d":8,"s":[49,139,140,25,0,1,7,141,29,3,4]},{"f":"David","l":"Reed","t":"$P","e":"dwreed$T","p":"979.458.0710","d":7,"s":[518,519,520,521,522,523,348,255]},{"f":"Luis","l":"Ribera","t":"$A $P & $E $S - International Trade and Transportation","e":"lribera$T","p":"979.845.3070","d":4,"s":[524,14,43,7,10,19,29,75,525,526,110,527,3]},{"f":"Penny","l":"Riggs","t":"$A $P","e":"riggs$T","p":"979.845.1541","d":9,"s":[7,530,531,29,112]},{"f":"James","l":"Petrick","t":"$P","e":"jpetrick$T","p":"979.845.8806","d":19,"s":[14,476,41]},{"f":"David","l":"Riley","t":"$A $P","e":"d-riley8$T","p":"979.845.1541","d":9,"s":[132,7,532]},{"f":"Gerald","l":"Riskowski","t":"$P","e":"riskowski$T","p":"979.845.7619","d":17,"s":[42,0,1]},{"f":"Ed","l":"Rister","t":"$P and $A $H","e":"e-rister$T","p":"979.845.2116","d":4,"s":[14,445,4]},{"f":"Glen","l":"Ritchie","t":"$A $P","e":"glen.ritchie@ttu.edu","p":"806.746.6101","d":15,"s":[1,212,3]},{"f":"John","l":"Robinson","t":"$P and $E Economist - Cotton Marketing","e":"jrcr$T","p":"979.845.8011","d":4,"s":[14,19,300,3]},{"f":"Daniel","l":"Roelke","t":"$P","e":"droelke$T","p":"979.845.5777","d":22,"s":[49,0,1,33,4]},{"f":"William","l":"Rogers","t":"$P","e":"wer$T","p":"979.845.0317","d":12,"s":[49,224,0,1,533,534,33]},{"f":"Lloyd","l":"Rooney","t":"$P","e":"lrooney$T","p":"979.845.3041","d":8,"s":[535,1,7,8,29,536,320,537]},{"f":"William","l":"Rooney","t":"$P","e":"wlr$T","p":"979.845.3041","d":8,"s":[49,213,25,0,43,1,7,238,538,51,98,320,306,4]},{"f":"Francis","l":"Rouquette","t":"$P","e":"monte.rouquette$AT","p":"903.834.6191","d":18,"s":[1,8,212,41]},{"f":"Jackie","l":"Rudd","t":"$P","e":"jcrudd$AT","p":"806.677.5600","d":2,"s":[7,98,539,307]},{"f":"Charles","l":"Rush","t":"$P","e":"crush$AT","p":"806.354.5800","d":2,"s":[55,1,7,540,33,276,541,4]},{"f":"Victoria","l":"Salin","t":"$A $P","e":"v-salin$T","p":"979.845.2116","d":4,"s":[14,344,542,19,525]},{"f":"Betsy","l":"Pierson","t":"$P","e":"eapierson$T","p":"979.862.1307","d":7,"s":[49,1,7,10,29,102,477,478,479,98,480,481,3,482,4]},{"f":"John","l":"Penson","t":"$P","e":"jpenson$T","p":"979.845.2116","d":4,"s":[14,344,19,475]},{"f":"Carey","l":"Satterfield","t":"$A $P","e":"csatterfield$T","p":"979.845.1541","d":9,"s":[132,1,543,29,58,65,544,3]},{"f":"Clyde","l":"Munster","t":"$P","e":"c-munster$T","p":"979.847.8793","d":17,"s":[439,1,440,2,441,442,4]},{"f":"Rhonda","l":"Miller","t":"$P","e":"rmiller$T","p":"979.845.1541","d":9,"s":[269,7,8,273,289,412]},{"f":"Forrest","l":"Mitchell","t":"$P","e":"forrest.mitchell$AT","p":"254.968.4144","d":25,"s":[55,7,413,410]},{"f":"James","l":"Mjelde","t":"$P","e":"j-mjelde$T","p":"979.845.2116","d":4,"s":[14,0,43,414]},{"f":"Binayak","l":"Mohanty","t":"$P","e":"bmohanty$T","p":"979.458.4421","d":17,"s":[0,43,1,8,19,29,355,292,3,41,415,4,416]},{"f":"David","l":"Montague","t":"$A $P","e":"thayne.montague@ttu.edu","p":"806.746.6101","d":15,"s":[1,417,16]},{"f":"Georgianne","l":"Moore","t":"$A $P & $A $H","e":"gwmoore$T","p":"979.845.3765","d":12,"s":[49,0,1,2,418,3,419,4]},{"f":"Lori","l":"Moore","t":"$A $P and $A $H - Undergraduate Programs","e":"llmoore$T","p":"979.845.1295","d":13,"s":[420,14,7,9,11,421,90,422,190,191,423,84,85,86]},{"f":"Miguel","l":"Mora-Zacarias","t":"$P","e":"mmora$T","p":"979.845.5777","d":22,"s":[424,425,426,29,4]},{"f":"Rosana","l":"Moreira","t":"$P","e":"rmoreira$T","p":"979.847.8794","d":17,"s":[427,428,7,8,9,429,430,11,431,432,433,29,69,434,435]},{"f":"Cristine","l":"Morgan","t":"$A $P","e":"clsmorgan$T","p":"979.845.3041","d":8,"s":[0,1,7,29,2,291,436,3,4]},{"f":"Gaylon","l":"Morgan","t":"$A $P and $E Agronomist (Cotton - Statewide)","e":"gdmorgan$T","p":"979.845.0870","d":8,"s":[49,314,139,140,25,0,1,7,29,3,4]},{"f":"Mike","l":"Morrison","t":"$P","e":"mlmorrison$T","p":"979.845.5777","d":22,"s":[0,227,1,437,438]},{"f":"James","l":"Muir","t":"$P","e":"jim.muir$AT","p":"254.968.4144","d":25,"s":[49,0,1,238,241]},{"f":"Timothy","l":"Murphy","t":"$P and $A $H","e":"tmurphy$T","p":"979.862.3419","d":13,"s":[90,443,444]},{"f":"Bhimanagouda","l":"Patil","t":"$P & Director VFIC","e":"b-patil@email.tamu.edu","p":"979.458.8090","d":7,"s":[328,329,55,7,8,19,29,128,69,129,330]},{"f":"Desmond","l":"Ng","t":"$A $P","e":"dng$T","p":"979.845.2116","d":4,"s":[14,11,445]},{"f":"Zivko","l":"Nikolov","t":"$P","e":"znikolov$T","p":"979.458.0763","d":17,"s":[213,214,446,14,7,8]},{"f":"Genhua","l":"Niu","t":"$A $P","e":"genhua.niu$AT","p":"915.859.9111","d":23,"s":[447,448,43,1,7,370,3,449,41,4,378,379]},{"f":"Gary","l":"Odvody","t":"$A $P","e":"gary.odvody$AT","p":"361.265.9201","d":14,"s":[55,7,276]},{"f":"Kevin","l":"Ong","t":"$P and Director, Texas Plant Disease Diagnostic Lab","e":"kevo$T","p":"979.845.8032","d":6,"s":[14,1,33,450,98,451,452,3,41]},{"f":"John","l":"Oswald","t":"$P","e":"j-oswald$T","p":"979.862.3507","d":10,"s":[453,49,454,455,0,1,456,204,33,457,458,459,460,461]},{"f":"Joe","l":"Outlaw","t":"$P and $E Economist - $M","e":"joutlaw$T","p":"979.845.3062","d":4,"s":[462,463,14,19,3]},{"f":"Corliss","l":"Outley","t":"$A $P and $A $H","e":"coutley$T","p":"979.845.5330","d":19,"s":[464,85,465]},{"f":"Marco","l":"Palma","t":"$A $P & $E $S - Horticultural Marketing","e":"mapalma$T","p":"979.845.5284","d":4,"s":[72,63,14,7,29]},{"f":"Megha","l":"Parajulee","t":"$P","e":"mparajul$AT","p":"806.746.6101","d":15,"s":[466,1,33]},{"f":"John","l":"Park","t":"$P & $E $S - Cooperative Marketing","e":"jlpark$T","p":"979.845.8982","d":4,"s":[467,468,469,470,14,471,7,253,472,3,84]},{"f":"Seong","l":"Park","t":"$A $P","e":"scpark872@gmail.com","p":"940.552.9941","d":0,"s":[473,14,0,3,4]},{"f":"Joe","l":"Paschal","t":"$P and $E Livestock $S","e":"joe.paschal$AT","p":"361.265.9203","d":14,"s":[132,474,7,106]},{"f":"James","l":"Sanders","t":"$P","e":"j-sanders1$T","p":"979.845.1541","d":9,"s":[132,7,532]},{"f":"Jeffrey","l":"Savell","t":"Distinguished $P","e":"j-savell$T","p":"979.845.1541","d":9,"s":[545,1,7,8,10,11,546,3]},{"f":"Raul","l":"Medina","t":"$P","e":"rfmedina$T","p":"979.845.4775","d":10,"s":[49,0,1,396,7,29,102,33,397]},{"f":"Gary","l":"Williams","t":"$P","e":"gary.williams$AT","p":"361.358.6390","d":14,"s":[641,29,58,642]},{"f":"Gary","l":"Voelker","t":"$A $P","e":"gvoelker$T","p":"979.845.5288","d":22,"s":[49,617,618,1,619]},{"f":"Russ","l":"Wallace","t":"$A $P and $E Vegetable $S","e":"russ.wallace$AT","p":"806.723.8433","d":26,"s":[237,1,7,11,620,621,622,3,623,4]},{"f":"Mark","l":"Waller","t":"$A $H and $E Program Leader for Agricultural Economics; $P","e":"mwaller$T","p":"979.845.1751","d":4,"s":[14,19,300,3]},{"f":"Rosemary","l":"Walzem","t":"$P","e":"rosemary-l-walzem$T","p":"979.847.7361","d":1,"s":[624,625,67,55,8,626,29,627,58,628,629,62]},{"f":"Mark","l":"Welch","t":"$P and $E Economist - Grain Marketing and Policy","e":"jmwelch$T","p":"979.845.8011","d":4,"s":[14,19,300]},{"f":"Tom","l":"Welsh","t":"$P","e":"twelsh@cvm.tamu.edu","p":"979.845.1541","d":9,"s":[55,630,29,58]},{"f":"Jason","l":"West","t":"$A $P","e":"jbwest$T","p":"979.845.3772","d":12,"s":[0,1,241,418,631,3,4]},{"f":"Terry","l":"Wheeler","t":"$P","e":"twheeler$AT","p":"806.746.6101","d":15,"s":[1,33,276]},{"f":"Richard","l":"White","t":"$P","e":"rh-white$T","p":"979.845.3041","d":8,"s":[25,0,43,1,29,98,632,633,41,4]},{"f":"Travis","l":"Whitney","t":"$A $P","e":"trwhitney$AT","p":"325.653.4576","d":27,"s":[269,7,512,58,115,513]},{"f":"Tryon","l":"Wickersham","t":"$A $P","e":"tryon$T","p":"979.845.1541","d":9,"s":[269,213,133,14,0,43,1,7,28,29,58,240,608,3]},{"f":"Bradford","l":"Wilcox","t":"$P","e":"bwilcox$T","p":"979.458.1899","d":12,"s":[0,1,2,69,4,634]},{"f":"Heather","l":"Wilkinson","t":"$A $P","e":"h-wilkinson$T","p":"979.845.7311","d":6,"s":[635,636,43,1,637,638,90,639,640]},{"f":"Gary","l":"Williams","t":"$P","e":"gwwilliams$T","p":"979.845.2116","d":4,"s":[343,14,19,69]},{"f":"Calvin","l":"Trostle","t":"$P And $E $S (lubbock Research And $E Center)","e":"ctrostle$AT","p":"806.746.6101","d":26,"s":[167,49,139,140,25,0,1,7,29,3,4]},{"f":"Jennifer","l":"Strong","t":"$A $P","e":"dr.jen$T","p":"979.862.1423","d":13,"s":[14,90,69,643,422,84,85,86]},{"f":"Kirk","l":"Winemiller","t":"$P","e":"k-winemiller$T","p":"979.845.5777","d":22,"s":[644,645,0,1,646,647,648,416,649]},{"f":"Gary","l":"Wingenbach","t":"$P","e":"g-wingenbach$T","p":"979.862.1507","d":13,"s":[650,197,90,651,652]},{"f":"Richard","l":"Woodward","t":"$P","e":"r-woodward$T","p":"979.845.2116","d":4,"s":[653,343,14,0,1]},{"f":"Guoyao","l":"Wu","t":"Distinguished $P","e":"g-wu$T","p":"979.845.1541","d":9,"s":[654,23,655,29,656]},{"f":"Ximing","l":"Wu","t":"$A $P","e":"xwu$T","p":"979.845.2116","d":4,"s":[657,653,14,29,69,60]},{"f":"Wenwei","l":"Xu","t":"$P","e":"wxu$AT","p":"806.746.6101","d":15,"s":[658,7,98]},{"f":"Qingwu","l":"Xue","t":"$A $P","e":"qxue$AT","p":"806.354.5800","d":2,"s":[144,659,1,168,3,4]},{"f":"Hongbin","l":"Zhang","t":"$P","e":"hbz7049$T","p":"979.845.3041","d":8,"s":[49,0,1,7,106,288,51,660,98,4]},{"f":"Keyan","l":"Zhu Salzman","t":"$P","e":"ksalzman$T","p":"979.458.3357","d":10,"s":[1,7,11,661]},{"f":"Gabe","l":"Hamer","t":"$A $P","e":"ghamer$T","p":"979.862.4067","d":10,"s":[55,1,29,33,662,663,664,665]},{"f":"Juliana","l":"Rangel Posada","t":"$A $P","e":"jrangel$T","p":"979.845.1074","d":10,"s":[666,667,668,669,670]},{"f":"Rabi","l":"Mohtar","t":"$P","e":"mohtar$T","p":"979.458.9886","d":17,"s":[43,1,7,19,69,211,671,3,4,672]},{"f":"Dmitry","l":"Vedenov","t":"$A $P","e":"vedenov$T","p":"979.845.2116","d":4,"s":[14,69,616]},{"f":"Jeffery","l":"Tomberlin","t":"$P","e":"jktomberlin$T","p":"979.845.9718","d":10,"s":[7,8,615]},{"f":"Herman","l":"Scholthof","t":"$P","e":"herscho$T","p":"979.845.7311","d":6,"s":[275,55,1,7,11,29,547]},{"f":"Patricia","l":"Smith","t":"$P","e":"phaan$T","p":"979.845.3630","d":17,"s":[574,0,1,2,575,3,41,4]},{"f":"Karenbeth","l":"Scholthof","t":"$P","e":"kbgs$T","p":"979.845.7311","d":6,"s":[55,1,7,548,549,550]},{"f":"Michael","l":"Schuett","t":"$A $P and $E $S","e":"mschuett$T","p":"979.845.0872","d":19,"s":[1,551,41]},{"f":"David","l":"Scott","t":"$P","e":"dscott$T","p":"979.845.5334","d":19,"s":[552,553,554,555,556]},{"f":"Scott","l":"Shafer","t":"$P and $H","e":"sshafer$T","p":"979.845.3837","d":19,"s":[557,41,221]},{"f":"Libo","l":"Shan","t":"$P","e":"lshan$T","p":"979.845.7311","d":6,"s":[558,55,104,1,11,106,559,29,560,98,561]},{"f":"William","l":"Shaw","t":"$P","e":"wdshaw$T","p":"979.845.2116","d":4,"s":[72,14,0,1]},{"f":"Zhuping","l":"Sheng","t":"$P and Center Director","e":"zsheng$AT","p":"915.859.9111","d":23,"s":[562,0,43,1,19,440,69,33,563,3,4,378,564]},{"f":"Won-Bo","l":"Shim","t":"$P and $A $H","e":"wbshim$T","p":"979.845.7311","d":6,"s":[55,7,565,260,566,319]},{"f":"Nova","l":"Silvy","t":"$P","e":"n-silvy$T","p":"979.845.5749","d":22,"s":[0,227,1,567,568]},{"f":"Charles","l":"Simpson","t":"$P","e":"charles.simpson$AT","p":"254.968.4144","d":25,"s":[7,97,98,3]},{"f":"Vijay","l":"Singh","t":"$P","e":"vsingh$T","p":"979.845.7028","d":17,"s":[0,1,2,69,569,570,41,4,325]},{"f":"Michel","l":"Slotman","t":"$A $P","e":"maslotman$T","p":"979.845.7556","d":10,"s":[571,49,29,572,573]},{"f":"Gerald","l":"Smith","t":"$P","e":"gerald.smith$AT","p":"903.834.6191","d":18,"s":[49,43,1,7,8,98,3]},{"f":"Stephen","l":"Smith","t":"$P","e":"sbsmith$T","p":"979.845.1541","d":9,"s":[269,576,577,7,29,578,58]},{"f":"Alex","l":"Thomasson","t":"$P","e":"thomasson$T","p":"979.458.3598","d":17,"s":[314,612,43,1,7,8,11,69,613,614,4]},{"f":"Raghavan","l":"Srinivasan","t":"$P","e":"r-srinivasan$T","p":"979.845.5069","d":12,"s":[0,1,211,579,4]},{"f":"Terri","l":"Starman","t":"$A $P","e":"tstarman$T","p":"979.862.2910","d":7,"s":[580,581,14,582,583,9,584,585,586,587,523,588,589,3,41,4,590,556,84,85,86]},{"f":"David","l":"Stelly","t":"$P","e":"stelly$T","p":"979.845.3041","d":8,"s":[49,169,25,0,1,7,364,51,591,98,306,4]},{"f":"Robert","l":"Strong","t":"$A $P and $A Department $H - Graduate Programs","e":"r-strong$T","p":"979.845.1139","d":13,"s":[592,593,7,90,69,190]},{"f":"Amanda","l":"Stronza","t":"$A $P","e":"astronza$T","p":"979.845.5411","d":19,"s":[49,594,595]},{"f":"Sonja","l":"Swiger","t":"$A $P & $E $S","e":"slswiger$AT","p":"254.968.4144","d":25,"s":[596,55,597,7,29,20]},{"f":"Gregory","l":"Sword","t":"$P","e":"gasword$T","p":"979.862.1702","d":10,"s":[202,0,87,1,7,102,3]},{"f":"Cecilia","l":"Tamborindeguy Camacho","t":"$A $P","e":"ctamborindeguy$T","p":"979.845.2516","d":10,"s":[598,55,1,260,29,33,347,599]},{"f":"Aaron","l":"Tarone","t":"$A $P","e":"tamlucilia$T","p":"979.862.1311","d":10,"s":[600,55,63,202,203,7,11,106,260,29,33,601,58,41]},{"f":"Matt","l":"Taylor","t":"$A $P","e":"matt_taylor$T","p":"979.845.1541","d":9,"s":[7,602,603,11,604,29]},{"f":"Richard","l":"Teague","t":"$P","e":"richard.teague$AT","p":"940.552.9941","d":0,"s":[49,202,0,1,605,606,4]},{"f":"Luis","l":"Tedeschi","t":"$A $P","e":"luis.tedeschi$T","p":"979.845.1541","d":9,"s":[114,0,43,1,7,607,58,211,65,608,609,3]},{"f":"Pete","l":"Teel","t":"$P & Interim Head","e":"pteel$T","p":"979.845.3253","d":10,"s":[55,0,29,610,611,84,85]},{"f":"Mike","l":"Merchant","t":"$P and $E Urban Entomologist","e":"michael.merchant$AT","p":"972.952.9204","d":11,"s":[398,399,400,55,1,401,29,402,102,403,404,405,406,407,408,409,410,4,411]},{"f":"Billy","l":"McKim","t":"$A $P","e":"brmckim$T","p":"979.845.0794","d":13,"s":[63,7,9,29,90,60,394,395,41]},{"f":"Christine","l":"Alvarado","t":"$P","e":"czalvarado$T","p":"979.847.7345","d":1,"s":[6,7,8,9,10,11,12]},{"f":"Tim","l":"Davis","t":"$P (International Horticulture)","e":"t-davis5$T","p":"979.847.5887","d":21,"s":[163,49,1,164,165,166]},{"f":"Alejandro","l":"Castillo","t":"$A $P","e":"a-castillo$T","p":"979.845.1541","d":9,"s":[7,124,10,11,125,29,69,126]},{"f":"Luis","l":"Cisneros-Zevallos","t":"$A $P","e":"lcisnero$T","p":"979.845.3244","d":7,"s":[127,7,8,9,11,29,128,69,58,129,130,131]},{"f":"Jason","l":"Cleere","t":"$A $P and $E Beef Cattle $S","e":"jjcleere$T","p":"979.845.6931","d":9,"s":[132,133,7]},{"f":"Craig","l":"Coates","t":"Instructional $A $P","e":"ccoates$T","p":"979.845.1219","d":10,"s":[55,134,29,135]},{"f":"James","l":"Conner","t":"$P","e":"jrc$T","p":"979.845.2116","d":4,"s":[49,14,136,43,1,137,33,30,3,41,4,138]},{"f":"Vanessa","l":"Corriher-Olson","t":"$A $P and $E Forage $S","e":"vacorriher$AT","p":"903.834.6191","d":18,"s":[49,139,140,25,0,1,7,141,29,3,4]},{"f":"Craig","l":"Coufal","t":"$A $P and $E $S\\$A $H for $E and $E Program Leader","e":"cdcoufal$T","p":"979.845.2249","d":1,"s":[6,1,142,111]},{"f":"Robert","l":"Coulson","t":"$P","e":"r-coulson@email.tamu.edu","p":"979.845.9725","d":10,"s":[0,1,143]},{"f":"Harry","l":"Cralle","t":"$A $P","e":"hcralle$T","p":"979.845.3041","d":8,"s":[144,49,0,1,145,7,51,4]},{"f":"John","l":"Crompton","t":"Distinguished $P","e":"jcrompton$T","p":"979.845.5320","d":19,"s":[146,14,147,148,41]},{"f":"Kevin","l":"Crosby","t":"$A $P","e":"k-crosby$T","p":"979.845.7012","d":7,"s":[149,1,7,150,151,98,152,153,154]},{"f":"Scott","l":"Cummings","t":"$A $H and Program Leader for Organizational Development; $P","e":"s-cummings$T","p":"979.847.9388","d":20,"s":[155,156,157,55,158,29,90]},{"f":"Fred","l":"Davies","t":"$P","e":"f-davies$T","p":"979.422.9434","d":7,"s":[0,1,74,19,159,160,161,162,3,41,4]},{"f":"Paul","l":"De Laune","t":"$A $P","e":"pbdelaune$AT","p":"940.552.9941","d":0,"s":[144,167,1,7,98,168,3,4]},{"f":"Kenneth","l":"Casey","t":"$A $P","e":"kdcasey$AT","p":"806.677.5600","d":2,"s":[42,116,117,118,0,1,119,3,4]},{"f":"Jane","l":"Dever","t":"$P","e":"jdever$AT","p":"806.746.6101","d":15,"s":[169,1,98]},{"f":"Thomas","l":"Dewitt","t":"$A $P","e":"tdewitt$T","p":"979.458.1684","d":22,"s":[170,171,172,49,0,1,173,174,175,176,4]},{"f":"Peter","l":"Dotray","t":"$P (Weeds and Herbicides)","e":"pete.dotray$AT","p":"806.746.6101","d":15,"s":[1,33,177]},{"f":"Norman","l":"Dronen","t":"$P","e":"n-dronen$T","p":"979.845.5749","d":22,"s":[49,55,0,1,29,33]},{"f":"Rebekka","l":"Dudensing","t":"$A $P and $E $S - Community Economic Development","e":"rmdudensing$T","p":"979.845.1719","d":4,"s":[178,179,180,181]},{"f":"Tri","l":"Duong","t":"$A $P","e":"t-duong$T","p":"979.847.7364","d":1,"s":[182,183,184,55,8,11,29,185,69,58,186]},{"f":"Daniel","l":"Ebbole","t":"$P","e":"d-ebbole$T","p":"979.845.7311","d":6,"s":[1,7,10,69,58,187,188,3,189]},{"f":"Kirk","l":"Edney","t":"Instructional $A $P","e":"kc-edney$T","p":"979.458.2306","d":13,"s":[90,190,191,192,193,84,85,86]},{"f":"Chanda","l":"Elbert","t":"$A $P","e":"celbert$T","p":"979.458.2699","d":13,"s":[194,195,84,85,86]},{"f":"Jack","l":"Elliot","t":"$P","e":"jelliot$T","p":"979.458.3391","d":13,"s":[196,1,197,90,198,69,199,3]},{"f":"Marian","l":"Eriksson","t":"$A $P","e":"m-eriksson$T","p":"979.845.6638","d":12,"s":[0,1,200,201]},{"f":"Micky","l":"Eubanks","t":"$P","e":"m-eubanks@email.tamu.edu","p":"979.862.7847","d":10,"s":[202,0,1,203,204,3,41,4]},{"f":"Russell","l":"Feagin","t":"$A $P","e":"feaginr$T","p":"979.862.2612","d":12,"s":[205,0,1,200,4,206]},{"f":"M","l":"Castell-Perez","t":"$P","e":"ecastell$T","p":"979.845.3931","d":17,"s":[63,7,8,9,120,121,122,123,11,69,58]},{"f":"Gordon","l":"Carstens","t":"$P","e":"g-carstens$T","p":"979.845.1541","d":9,"s":[114,43,1,7,58,115,3]},{"f":"Summer","l":"Felton Odom","t":"$A $P","e":"summer99$T","p":"979.862.7650","d":13,"s":[7,9,82,210,84,85]},{"f":"Luc","l":"Berghman","t":"$P","e":"luc-r-berghman$T","p":"979.847.7387","d":1,"s":[67,55,7,11,68,29,57,69,70,71]},{"f":"Stephen","l":"Amosson","t":"$P and $E Economist - $M","e":"samosson$AT","p":"806.677.5600","d":2,"s":[13,14,7,15,16,3,4]},{"f":"Juan","l":"Anciso","t":"$P and $E Vegetable $S","e":"juan.anciso$AT","p":"956.968.5581","d":3,"s":[17,7,11]},{"f":"David","l":"Anderson","t":"$P and $E Economist - Livestock Marketing","e":"danderson$T","p":"979.845.4351","d":4,"s":[18,14,19,20,21,22,3]},{"f":"Jay","l":"Angerer","t":"$A $P","e":"jangerer@brc.tamus.edu","p":"254.774.6053","d":5,"s":[23,24,25,26,1,27,28,29,30,31,3]},{"f":"David","l":"Appel","t":"$P and $E $S","e":"d-appel$T","p":"979.845.8273","d":6,"s":[1,7,32,33,34,35,3]},{"f":"Gregory","l":"Archer","t":"$A $P & $E $S","e":"garcher$T","p":"979.845.7658","d":1,"s":[36,7,3]},{"f":"Mike","l":"Arnold","t":"$P (Landscape\/Nursery)","e":"ma-arnold@email.tamu.edu","p":"979.845.1499","d":7,"s":[1,37,38,39,40,41]},{"f":"Brent","l":"Auvermann","t":"$P and Center Director","e":"bauverma$AT","p":"806.677.5600","d":2,"s":[42,14,0,43,1,29,44,45,3,46,4]},{"f":"Christopher","l":"Bailey","t":"$P","e":"c-bailey$T","p":"979.847.7352","d":1,"s":[47,1,7,8,29,48,3]},{"f":"Paul","l":"Baumann","t":"$P and $E Weed $S","e":"p-baumann$T","p":"979.845.4880","d":8,"s":[49,0,1,7,50,51,4,52]},{"f":"Fuller","l":"Bazer","t":"Distinguished $P","e":"fbazer$T","p":"979.845.1541","d":9,"s":[53,54,55,56,7,29,57,58,59,60,61,62]},{"f":"Spencer","l":"Behmer","t":"$P","e":"s-behmer$T","p":"979.845.7304","d":10,"s":[49,63,0,1,64,29,58,65,66,41]},{"f":"Blake","l":"Bennett","t":"$A $P and $E Economist","e":"blake.bennett$AT","p":"972.231.5362","d":11,"s":[14,19,3,4]},{"f":"David","l":"Bessler","t":"$P","e":"d-bessler$T","p":"979.845.2116","d":4,"s":[72,14,19]},{"f":"John","l":"Carey","t":"$P","e":"j-carey$T","p":"979.847.7344","d":1,"s":[0,1,7,8,29,113,3,4]},{"f":"Frederick","l":"Boadu","t":"$P And Assistant $H","e":"f-boadu$T","p":"979.845.2116","d":4,"s":[14,1,73,74,75,76,77]},{"f":"Diane","l":"Boellstorff","t":"$A $P and $E Water Resources $S","e":"dboellstorff$T","p":"979.458.3562","d":8,"s":[0,1,7,11,29,4,78]},{"f":"Thomas","l":"Boutton","t":"$P","e":"boutton$T","p":"979.845.8027","d":12,"s":[79,24,0,80,1,3]},{"f":"Barry","l":"Boyd","t":"$A $P","e":"b-boyd$T","p":"979.862.3693","d":13,"s":[81,82,83,84,85,86]},{"f":"Michael","l":"Brewer","t":"$A $P, Field Crops Entomology","e":"mjbrewer$AT","p":"361.265.9201","d":14,"s":[87,1,88,33,89,3]},{"f":"Gary","l":"Briers","t":"$P","e":"g-briers$T","p":"979.862.3000","d":13,"s":[90,91,92,93,84]},{"f":"David","l":"Briske","t":"$P","e":"dbriske$T","p":"979.845.5581","d":12,"s":[24,0,1,90,94,95,3]},{"f":"Henry","l":"Bryant","t":"Research $A $P","e":"h-bryant$T","p":"979.845.2116","d":4,"s":[96,14,19]},{"f":"Mark","l":"Burow","t":"$P","e":"mdburow$AT","p":"806.746.6101","d":15,"s":[7,97,98]},{"f":"Edsel","l":"Bynum","t":"$A $P & $E $S","e":"ebynum$AT","p":"806.677.5600","d":16,"s":[99,0,7,100,101,102]},{"f":"David","l":"Byrne","t":"$P and $A $H","e":"dbyrne$T","p":"979.862.3072","d":7,"s":[103,104,7,105,106,29,107,108,98,3]},{"f":"Sergio","l":"Capareda","t":"$P","e":"scapareda$T","p":"979.458.3028","d":17,"s":[43,1,109,110,3,111]},{"f":"Oral","l":"Capps","t":"Executive $P","e":"ocapps$T","p":"979.845.2116","d":4,"s":[72,14,7,10,29,112]},{"f":"Sam","l":"Feagley","t":"$P and State Soil Environmental $S","e":"s-feagley$T","p":"979.862.4160","d":8,"s":[49,207,139,140,25,0,1,7,29,208,209,3,4]},{"f":"Carlos","l":"Fernandez","t":"$A $P","e":"carlos.fernandez$AT","p":"361.265.9201","d":14,"s":[144,14,1,211,212,4]},{"f":"Kevin","l":"Mcinnes","t":"$P","e":"k-mcinnes$T","p":"979.845.3041","d":8,"s":[0,1,7,29,2,291,292,3,4]},{"f":"Hisashi","l":"Koiwa","t":"$A $P","e":"koiwa$T","p":"979.845.5282","d":7,"s":[1,260,58,347,98,348,162,3]},{"f":"Tazim","l":"Jamal","t":"$A $P","e":"tjamal$T","p":"979.845.6454","d":19,"s":[326,69,327]},{"f":"Guddadarangavva","l":"Jayaprakasha","t":"Research $A $P","e":"gkjp@email.tamu.edu","p":"979.845.3864","d":7,"s":[328,329,55,7,8,19,29,128,69,129,330]},{"f":"Young-Ki","l":"Jo","t":"$A $P and $E $S","e":"ykjo$T","p":"979.862.1758","d":6,"s":[55,1,7,11,331,332,333,334,335,336]},{"f":"Jason","l":"Johnson","t":"$A $P and $E Economist - $M","e":"jason.johnson$AT","p":"254.968.4144","d":25,"s":[14,15,337,4]},{"f":"Spencer","l":"Johnston","t":"$P","e":"spencerj$T","p":"979.845.8295","d":10,"s":[49,7,11]},{"f":"Ronald","l":"Kaiser","t":"$P","e":"rkaiser$T","p":"979.845.5303","d":19,"s":[1,4]},{"f":"Wayne","l":"Keeling","t":"$P","e":"wkeeling$AT","p":"806.746.6101","d":15,"s":[1,33,177]},{"f":"Charles","l":"Kenerley","t":"$P","e":"c-kenerley$T","p":"979.845.7311","d":6,"s":[338,55,0,1,7,339,340,131,341,3,4]},{"f":"Christopher","l":"Kerth","t":"$A $P","e":"c-kerth$T","p":"979.845.1541","d":9,"s":[342,7,8]},{"f":"Patricia","l":"Klein","t":"$A $P","e":"pklein$T","p":"979.862.6308","d":7,"s":[43,1,260,98]},{"f":"Steven","l":"Klose","t":"$P and $E $S - Risk $M","e":"sklose$T","p":"979.458.1807","d":4,"s":[343,14,344,19,300,3]},{"f":"Robert","l":"Knight","t":"$A $P","e":"bob-knight$T","p":"979.845.5557","d":12,"s":[0,1,345]},{"f":"Allen","l":"Knutson","t":"$P and $E $S","e":"allen.knutson$AT","p":"972.952.9222","d":11,"s":[346,1,33]},{"f":"Merwyn","l":"Kothmann","t":"$P & $A $H","e":"m-kothmann$T","p":"979.845.5575","d":12,"s":[0,1,345]},{"f":"Thomas","l":"Isakeit","t":"$P and $E $S","e":"t-isakeit$T","p":"979.862.1340","d":6,"s":[312,313,314,315,55,88,7,316,317,318,319,320,321,322]},{"f":"Urs","l":"Kreuter","t":"$P","e":"urs$T","p":"979.845.5583","d":12,"s":[0,349,1,94,3,41]},{"f":"Gerard","l":"Kyle","t":"$A $P","e":"gkyle$T","p":"979.862.3794","d":19,"s":[350,351,41]},{"f":"Ronald","l":"Lacey","t":"$P","e":"ron-lacey$T","p":"979.845.3967","d":17,"s":[352,0,1,7,353,354,98,355,356,357,3,41]},{"f":"Thomas","l":"Lacher","t":"$P","e":"tlacher$T","p":"979.845.5750","d":22,"s":[49,251,227,1,75]},{"f":"David","l":"Leatham","t":"$P and $A $H","e":"d-leatham$T","p":"979.845.2116","d":4,"s":[14,358,19]},{"f":"Daniel","l":"Leskovar","t":"Resident Director and $P","e":"daniel.leskovar$AT","p":"830.278.9151","d":24,"s":[359,49,360,361,237,362,104,25,1,363,7,8,364,29,365,366,69,367,368,129,98,369,370,371,372,373,374,3,375,376,377,4,378,379]},{"f":"Kerry","l":"Litzenberg","t":"$P","e":"litz$T","p":"979.845.2116","d":4,"s":[14,380,381,84]},{"f":"Shuyu","l":"Liu","t":"$A $P","e":"sliu$AT","p":"806.677.5600","d":2,"s":[7,382,98,307,383]},{"f":"Carol","l":"Loopstra","t":"$A $P","e":"c-loopstra$T","p":"979.862.2200","d":12,"s":[0,1,384,98,385]},{"f":"Robert","l":"Lyons","t":"$P and $E Range $S","e":"robert.lyons$AT","p":"830.278.9151","d":24,"s":[0,1,7,90,345,3]},{"f":"Clint","l":"Magill","t":"$P","e":"c-magill$T","p":"979.845.7311","d":6,"s":[49,55,1,7,10,386,29,33,58,387,388,98,389,390]},{"f":"Dariusz","l":"Malinowski","t":"$P","e":"dmalinow$AT","p":"940.552.9941","d":0,"s":[7,391,392,98,3,379]},{"f":"Bruce","l":"Mccarl","t":"Distinguished $P","e":"mccarl$T","p":"979.845.2116","d":4,"s":[43,1,7,393,4]},{"f":"Fouad","l":"Jaber","t":"$A $P and $E Agricultural Engineering $S","e":"fouad.jaber$AT","p":"972.952.9672","d":11,"s":[323,324,325]},{"f":"Nancy","l":"Ing","t":"$P","e":"ning@cvm.tamu.edu","p":"979.845.1541","d":9,"s":[132,309,310,1,311,29]},{"f":"Sandun","l":"Fernando","t":"$P","e":"sfernando$T","p":"979.845.9793","d":17,"s":[213,214,215,14,43,1,3]},{"f":"James","l":"Gramann","t":"$P","e":"j-gramann$T","p":"979.845.4920","d":19,"s":[1,266,41]},{"f":"Scott","l":"Finlayson","t":"$A $P","e":"sfinlayson$T","p":"979.845.3041","d":8,"s":[49,25,0,1,7,216,51,98,217,218,4]},{"f":"Guy","l":"Fipps","t":"$P and $E Agricultural Engineer (Irrigation and Water $M)","e":"g-fipps$T","p":"979.845.7454","d":17,"s":[1,219,220,41,4,221,222]},{"f":"Lee","l":"Fitzgerald","t":"$P","e":"lfitzgerald$T","p":"979.862.7480","d":22,"s":[223,49,224,225,226,227,1,228,229,230,231,232,233]},{"f":"David","l":"Forrest","t":"$P","e":"d-forrest$T","p":"979.845.1541","d":9,"s":[132,234,7,235,236]},{"f":"Jamie","l":"Foster","t":"$A $P","e":"jlfoster$AT","p":"361.265.9201","d":14,"s":[144,49,213,237,0,43,1,238,33,239,240,241,242,3,4]},{"f":"William","l":"Fox","t":"$A $P","e":"william.fox$AT","p":"254.774.6034","d":5,"s":[243,244,1,245,246,247,248]},{"f":"Jianbang","l":"Gan","t":"$P","e":"j-gan$T","p":"979.862.4392","d":12,"s":[14,0,43,1,249,3]},{"f":"Girisha","l":"Ganjegunte","t":"$A $P","e":"gkganjegunte$AT","p":"915.859.9111","d":23,"s":[250,251,43,1,252,253,247,254,255,256,3,4,78]},{"f":"Delbert","l":"Gatlin","t":"$P & $A $H","e":"d-gatlin$T","p":"979.847.9333","d":22,"s":[257,258,7,8,11]},{"f":"Steven","l":"George","t":"$P and $E Horticulturist","e":"steve.george$AT","p":"972.231.5362","d":11,"s":[1,259,4]},{"f":"Clare","l":"Gill","t":"$P","e":"clare.gill$AT","p":"979.845.3712","d":9,"s":[132,7,260]},{"f":"Ron","l":"Gill","t":"$A $H and $E Program Leader for Animal Science; $P","e":"r-gill1$T","p":"979.845.3579","d":9,"s":[36,261,65,3]},{"f":"Carmen","l":"Gomes","t":"$A $P","e":"carmen$T","p":"979.845.2455","d":17,"s":[262,263,55,7,8,9,264,10,11,29,265]},{"f":"William","l":"Grant","t":"$P","e":"wegrant$T","p":"979.845.5702","d":22,"s":[0,267,227,1,33,268,231]},{"f":"Amir","l":"Ibrahim","t":"$A $P","e":"aibrahim$T","p":"979.845.3041","d":8,"s":[49,25,0,1,7,51,98,306,4,307,308]},{"f":"Davey","l":"Griffin","t":"$P and $E Meats $S","e":"dgriff$T","p":"979.845.3935","d":9,"s":[269,270,7,9,11,271,272,273,84,85]},{"f":"Dennis","l":"Gross","t":"$P - Plant Pathology & Microbiology","e":"d-gross$T","p":"979.845.7311","d":6,"s":[274,275,55,7,260,276]},{"f":"Daniel","l":"Hale","t":"$P and $E Meats $S","e":"daniel.hale$AT","p":"979.845.3935","d":9,"s":[36,14,1,7,8,9,277,11,19,29,90,69,60,3,84,85,86,278]},{"f":"Charlie","l":"Hall","t":"$P, Floriculture Chair","e":"charliehall$T","p":"979.458.0439","d":7,"s":[279,14,280,281,282,283,3]},{"f":"Julie","l":"Harlin","t":"$A $P","e":"j-harlin$T","p":"979.862.3014","d":13,"s":[284,285,84,85,86]},{"f":"Kerri","l":"Gehring","t":"$A $P","e":"kbgehring$T","p":"979.862.3643","d":9,"s":[286,269,7,10,11,271,287]},{"f":"Dirk","l":"Hays","t":"$A $P","e":"dbhays$T","p":"979.845.3041","d":8,"s":[49,25,0,43,1,7,288,107,51,98,289,290,4]},{"f":"James","l":"Heilman","t":"$P","e":"j-heilman$T","p":"979.845.3041","d":8,"s":[0,1,7,29,2,291,292,3,4]},{"f":"Andy","l":"Herring","t":"$A $P","e":"andy.herring$T","p":"979.845.1541","d":9,"s":[132,293,294,295,296,14,7,19,69,3,84,85]},{"f":"Billy","l":"Higginbotham","t":"$P and Wildlife and Fisheries $S","e":"billy.higginbotham$AT","p":"903.834.6191","d":18,"s":[297,84,85]},{"f":"Louis","l":"Hodges","t":"$A $P","e":"louhodges$T","p":"979.845.5368","d":19,"s":[1,266,41]},{"f":"Rob","l":"Hogan","t":"$A $P & $E Economist","e":"rhogan$AT","p":"830.278.9151","d":24,"s":[14,298,19,299,300,3]},{"f":"Frank","l":"Hons","t":"$P","e":"f-hons$T","p":"979.845.3041","d":8,"s":[301,0,1,7,29,2,241,302,291,3,4]},{"f":"Yongheng","l":"Huang","t":"$A $P","e":"yhuang$T","p":"979.862.8031","d":17,"s":[0,1,303,304,4,305]},{"f":"Cesar","l":"Izaurralde","t":"Research $P","e":"cizaurralde@brc.tamus.edu","p":"254.774.6000","d":5,"s":[24,673,1,88,27,19,674,241]}],"specializations":["Ecosystem","Environment","Hydrology","Sustainability","Water","Water Quality Management","Egg Quality","Food","Food Development","Food Education","Food Safety","Food Safety And Technology","Poultry Meat Quality","Applied Economic Analysis","Economy","Land","Resource Management","Agricultural Best Practices","Dairy","Global Dynamics","Livestock","Markets","Policy","Animal Nutrition","Climate Change","Drought","Early Warning","Food Security And Resilience","Grazing","Health","Land Management","Livestock Marketing","Forest Pathology","Invasive Species","Plant Disease Control","Plant Disease Epidemiology","Animal Welfare","Plant Selection","Stress Tolerant Landscape Plants","Sustainable Urban Landscapes","Urban Ecosystems","Urbanization And Land Use","Air Quality","Energy","Livestock Production","Manure Management","System Dynamics And Modeling","Aflatoxin","Poultry Nutrition","Biodiversity","Herbicides","Human Health","Weed Management","Contraception","Diabetes","Disease Prevention","Epigenomics","Immunology","Metabolism","Obesity","Population Growth","Reproductive Biology","Reproductive Rights","Eating Behavior","Feeding Behavior","Nutrition","Physiological Ecology","Diagnostics","Food Safety Pathogens","International Development","Poultry Diseases","Vaccine Development","Applied Econometrics","Food Research","Food Security","International","Legal And Institutional Aspects Of Technology","Water Research","Water Quality","Biogeochemistry","Ecosystem Science","Capacity Building","Leadership","Volunteer Development","Youth","Youth Development Initiatives","Youth Program Staff Education Training","Entomology","Field Crops","Pest Management","Human Capacity","School-Based Agricultural Education","Technical Education In Agriculture","Vocational Agriculture","Human-Ecological Systems","Rangeland Systems","Economic Modeling And Econometrics","Peanut Breeding","Plant Breeding","Bt Transgenic Corn","Grain Crops Insects And Spider Mites","Insecticide Resistance","Integrated Pest Management","Breeding","Disease Resistance","Fruit","Genetics","Heat Tolerance","Ornamentals","Environmental Quality","Renewable Energy","Waste Management","Technology","Poultry","Bioenergetics","Ruminant Nutrition","Biological And Agricultural Engineering","Cattle Feedlot","Dairy Cattle Production","Greenhouse Gas Emissions","Food Materials","Food Packaging","Food Processing Technologies","Food Quality","Food Microbiology","Food Spoilage","International Food Trade","Biological Activity","Human Health Benefits","Phytochemicals","Post Harvest Physiology","Secondary Metabolites","Animal Breeding","Cattle","Genetic Transformation","Insect Molecular Genetics","Ecosystem Services","Environmental Policy","Wildlife","Crop Management","Crop Production","Forages","Manure","Landscape Ecology","Agronomy","Ethics","And Tourism","Marketing Parks","Recreation","Cantaloupe","Muskmelon","Pepper","Plant Improvement","Tomato","Variety Development","Accountability","Behavior Change","Community Education","Evaluation","Nursery Production","Plant Propagation","Rhizosphere Dynamics","Stress Physiology","Asia","International Develop","Plant Science","Specialty Crops","Alternative Crops","Soil Science","Cotton Breeding","Analysis","Aquatic Ecology","Aquatic Toxicology","Fish","Mollusks","Morphometrics","Multivariate Statistics","Weed Science","Community Economics","Impact Analysis","Rural Development","Rural Economic Analysis","Bacterial Genetics","Bacterial Physiology","Beneficial Microbes","Host-Microbe Interactions","Probiotics","Microbiology","Plant Protection","Technology And Development","Needs Assessment","Program Evaluation","Reliability And Validity","Resource Development And Delivery","Program Evaluation And Accountability","Women Gender Issues","Agricultural Literacy","Food And Economy","Human Capacity Development","Program Assessments","Spatial Science","Statistics","Ecology","Evolution","Insects","Coastal Ecology","Wetlands","Confined Animal Feeding Operation","Mine Reclamation","Soils","Survey Methodology","Modeling","Plant Physiology","Bioenergy","Bioprocessing","Catalysis","Hormones","Plant Development","Tillering","Evapotranspiration Networks","Irrigation","Water Management","Weather Stations","Applied Biodiversity Science","Community Ecology","Conservation And Development","Conservation Biology","Endangered Species","Herpetology","Invasion Biology","Population Biology","Species Distribution Modeling","Tropical Biology","Zoology","Breeding Soundness","Ovarian Cycling","Reproductive Physiology","Cropping Systems","Forage","Legumes","Nitrogen","Nutrient Cycling","Soil Security","Ecosystems","Ecosystems Evolution And Resilience","Grazing Land Management","Managing Climate Extremes","Monitoring","Water Availability And Quality","Forest Economics","Agricultural Production","Conservation","Irrigation Scheduling","Management","Reuse","Salinity","Soil Salinity","Aquaculture","Fish Nutrition","Environmental Landscape Management","Genomics","Natural Resource Management","Biopolymers","Biosensors","Food Processing","Nanotechnology","Park Management","Emerging Diseases","Simulation Modeling","Beef","Composition Anatomy","HACCP","Lamb","Pork","Bacteriology","Biotechnology","Plant Pathology","Food Production Efficiency","Youth Wellness","Consumer Behavior","Horticultural Economics","Industry Outlook","Profitability","Strategic Management","STEM","Teacher Preparation And Training","Antimicrobial Interventions","Nutritional Composition","Genomic Selection","Quality","Tortilla","Soil Health","Soil Physics","Animal Breeding And Genetics","Beef Cattle Breeding","Beef Cattle Production Systems","Beef Supply Chains","Curriculum Enrichment","Farm And Ranch Management","Market Dynamics","Risk Management","Carbon Cycling","Soil Fertility","Membrane Technology","Remediation Technology","Waterborne Contaminants","Subtropical Genomic Selection","Wheat Breeding","Wheat Quality","Animal Reproduction","Endocrine Disruptor","Gene Expression","Chemical Control","Corn","Cotton","Cultural Controls","Fungicide Resistance Management","Host Resistance","Invasive Diseases","Mycotoxins","Sorghum","Soybeans","Vegetables","Green Infrastructure","Stormwater","Water Engineering","Health Economy","Sustainable Tourism","And Sustainability","Biological Activities","Pre And Post Harvest Factors","Fungicide","Mycotoxin","Nematicide","Rice","Seed Treatment","Turfgrass","Resource Management And Conservation","Biological Control","Induced Systemic Resistance","Rhizosphere","STEM Education","Flavor Chemistry","Economic Analysis","Finance","Range Management","Biological Control Of Weeds","Molecular Biology","Plant Nutrition","Ecosystem Management","Environment Economy","Tourism Marketing","Controlled Environments","Image Processing","Instrumentation","Remote Sensing","Signal Processing","Statistical Analysis","Finance And Risk","Antioxidants","Crop Adaptation","Crop Water Use","Designer Foods","Exchange Programs","Germplasm","High-Value Vegetable Crops","Hydroponics","Nutrient Use Efficiency","Pest Resistance","Protected Cultivation","Resource Use Efficiency","Root Biology","Root Traits","Stress Tolerance","Student Training","Sustainable Practices","Vegetable Organic Production","Vegetable Quality","Water Conservation","Water Use Efficiency","Human Capital","Pedagogical Methods","Marker Assisted Selection","Wheat Genetics","Forestry","Tissue Culture","Grain Mold Resistance","Oomycetes DNA","Pathogen Races And Distribution","Plant Host Resistance","Resistance Genes","Forage Breeding","Ornamental Plant Breeding","Mathematical Programming","Program Assessment","Teaching Effectiveness","Evolutionary Ecology","Population Genetics","Bates","Bed Bug","Cockroach","Fleas","Insecticide","IPM","Mosquito Control","Pesticide","Rabies","Rodent","Schools","Tick","Vector","West Nile Virus","Sensory","Insect","Pricing Systems","Vadose Zone Hydrology","Water Resources","Horticulture","Plant Ecophysiology","Tropical Ecology","Curriculum And Instruction","Formal And Nonformal Education","Leadership Education","Training And Development","Birds","Contaminants","Ecotoxicology","Dehydration","Extrusion","Food Engineering","Food Processing Systems Modeling And Design","Food Safety Engineering","Freezing","Frying","Irradiation","Predictive Microbiology","Soil Pedagogy","Habitat","Restoration","Chemical Transport","Groundwater","Surface Water","SWAT Modeling","STEM Integration","Youth Economy","Quantitative Methods","Bioproducts","Controlled Environment Food Crop Production","Drought And Salt Tolerance","Urban Agriculture","Phytoplasma","Plant Diseases","Plant Quarantine","Arthropods","Biologies","Collections","Identification","Life Histories","Museums","Surveys","Systematics","Taxonomy","Agriculture And Policy Analysis","Decision Support Systems","Youth Development","Youth Health","Cotton Entomology","Agribusiness","Career Development","Cooperatives","Economic Growth","Enriching Our Youth","Marketing","Agricultural And Natural Resource Economics","Beef Cattle","Macroeconomics","Leisure Behavior","Microbial Ecology","Microbial Signaling And Biofilms","Plant And Human Disease Prevention","Plant-Microbe Interactions","Soil And Rhizosphere Ecology","Sustainable Agriculture","Fire Ant","GPCRs","Insect Endocrinology","Insect Physiology","Insect Toxicology","Mosquito","Pesticide Toxicity","Receptors","Cell-Cell Signaling","Environmental Microbiology","Food Irradiation","Food Technology","Molecular Microbiology","Pathogen Transport","Pathogens","Public Health Microbiology","Vaccines","Minority Student Programs","Beef Cattle Nutrition","Stocker Cattle","Agricultural Water Management","Soil","Analytical Chemistry","Biosolids","Forage Testing","Nutrient Management","Soil Chemistry","Soil Testing","Water Testing","Goat","Sheep","Youth Education","Ent","Plant Identification","Youth Develop","Alkalinity Tolerance","Fertilization Management","Iron Nutrition","Iron Reductase","Irrigation Water Quality","Ornamental Horticulture","Development","International Trade","Production Economics","Safety And Technology","Agriculture And Food Policy","Food Systems","Functional Genomics","Genomics Policy And Education","Genetic Improvement","Fire","Invasive Plant Management","Cereal Chemistry","New Products","Wheat","Grain","Small Grains Breeding","Insect-Vectored Disease","Plant Virology","Food Supply Chains","Fetal Programming","Pregnancy","Beef Sustainability","Meat Quality","Virology","History Of Science","Plant-Microbe Interaction","Virus","Park And Protected Area Management","And Management","Design","Health Environment","Park Planning","Wellness Through Park And Natural Environment","Environment Health Economy","Biochemistry","Growth And Development","Immunity","Plant Molecular Biology","Conjunctive Water Management","River System","Water Uses","Fungi","Microbial Pathogens","Game Birds And Mammals","Predators","Mathematical Modeling","Risk Analysis","Behavioral Genetics","Malaria Vectors","Population Genomics","Ecological Engineering","Land Use","Cardiovascular Disease","Fatty Acids","Lipids","Spatial Sciences","Abiotic Stress Physiology","Economics Of Greenhouse","Floral Design","Floriculture And Vegetable Production","Greenhouse Technology","Heat Tolerant Cultivars","High Impact Learning","Local Production","Postharvest Physiology","Root Amendment","Water Conservation In Greenhouse Production","Nematodes","Adoption And Diffusion","Adult Training","Environment Food Economy Health","Human Dimensions Of Natural Resource Management","Animal Safety","Ectoparasites","Aphids","Psyllids","Decomposition","Life History","Food Antimicrobials Preservatives","Food Preservation","Food Safety Microbiology","Range Science","Rangeland Restoration","Integration","Ruminants","Simulation","Tick-Borne Diseases","Ticks","Culturally Appropriate Technologies","Mechatronics","Sensing","Non-Plant Based Alternate Protein Production","Production Risk Management In Developing Countries","Biogeography","Ecosystem Systematics","Ornithology","High Tunnel","Production","Small Acreage","Vegetable","Clinical Trials","Comparative Metabolism","Food Regulations","Lipoprotein Biology","Metabolomics","Microbiota","Endocrine Physiology","Stable Isotopes","Runoff","Turf Grass Management","Woody Plant Invasion","Adaptation To Extreme Environments","Biostatistics","Environmental Careers","Environmental Regulations","Microbial Genetics","Population And Community Biology","Endocrinology","Physiology","Leadership Development","Ecological Indicators","Ecological Restoration","Estuaries","Rivers","Sustainable Fisheries","Watersheds","Agricultural Communications","International Agriculture Development","Online Learning","Econometrics","Amino Acids","Arginine","Health And Metabolism","Applied Microeconomics","Corn Breeding","Crop Water Use Efficiency","Molecular","Insect-Plant-Environment Interactions","Medical Entomology","Mosquito-Borne Viruses","Vector-Borne Diseases","Wildlife Disease","Health And Animal Breeding","Health And Environment","Honey Bees","Pesticides","Reproduction","Soil-Water Dynamics","Water-Energy-Food-Nexus","Climate Extreme Events","Greenhouse Gases"],"departments":["Vernon Research and Extension Center","Poultry Science","Amarillo Research and Extension Center","District 12 Office - South","Agricultural Economics","Temple Research and Extension Center","Plant Pathology and Microbiology","Horticultural Sciences","Soil and Crop Sciences","Animal Science","Entomology","Dallas Research and Extension Center","Ecosystem Science and Management (ESSM)","Agricultural Leadership, Education and Communication (ALEC)","Corpus Christi Research and Extension Center","Lubbock Research and Extension Center","District 01 Office - Panhandle","Biological and Agricultural Engineering (BAEN)","Overton Research and Extension Center","Recreation, Park and Tourism Sciences (RPTS)","Organizational Development","Borlaug Institute of International Agriculture","Wildlife and Fisheries Sciences","El Paso Research and Extension Center","Uvalde Research and Extension Center","Stephenville Research and Extension Center","District 02 Office - South Plains","San Angelo Research and Extension Center"]}
				@people = response.people
				@specializations = response.specializations
				@departments = response.departments

				localStorage.setItem prefix + '-faculty', JSON.stringify response.people
				localStorage.setItem prefix + '-specializations', JSON.stringify response.specializations
				localStorage.setItem prefix + '-departments', JSON.stringify response.departments

				# Decompress people attributes
				@people = @decompress @people

				if $('#s').data 'ui-autocomplete'
					@update()
				else
					@init()
		)

	tryInitLocalStorage: ->
		prefix = 'agrilife-people-' + @specialization
		faculty = localStorage.getItem prefix + '-faculty'
		departments = localStorage.getItem prefix + '-departments'
		specializations = localStorage.getItem prefix + '-specializations'

		if typeof faculty is 'string' and
		typeof departments is 'string' and
		typeof specializations is 'string'
			@people = JSON.parse faculty
			@specializations = JSON.parse specializations
			@departments = JSON.parse departments

			@people = @decompress @people

			@init()

	decompress: (people) ->
		_.each people, (person, index, list) =>
			# Department
			person.fd = @departments[person.d]
			# Specializations
			person.fs = []
			_.each person.s, (specialty) =>
				person.fs.push @specializations[specialty]
			# Title
			person.t = person.t.replace /\$P/g, 'Professor'
				.replace /\$A/g, 'Associate'
				.replace /\$E/g, 'Extension'
				.replace /\$S/g, 'Specialist'
				.replace /\$M/g, 'Management'
				.replace /\$H/g, 'Department Head'
			# Email
			person.e = person.e.replace /\$AT/g, '@ag.tamu.edu'
				.replace /\$T/g, '@tamu.edu'
			# Phone
			phone = person.p
			person.p = phone.replace /^(\d{3})\D+(\d{3})\D+(\d{4})/, '($1) $2-$3'
			person.pt = phone.replace /^(\d{3})\D+(\d{3})\D+(\d{4})/, '+1-$1-$2-$3'
			# Complete
			list[index] = person

	init: ->
		console.log 'init'
		@parent = $ '.people-searchform'
		@listParent = $ '#people-listing-ul'

		@updateTermFilters @getTermsInURL()
		@render()
		@updateResults()
		$('#s').autocomplete source: @specializations
		@attachEvents()

	update: ->
		$('#s').autocomplete 'option', 'source', @specializations
		@render true
		@updateResults()

	attachEvents: ->
		people = this

		$('.people-search-form .category').click (e) ->
			vals = {spec: people.specializations.indexOf($(this).data('category'))}
			valsX = {spec: $(this).data('category')}
			people.updateTermFilters vals
			people.updateResults vals
			people.tryPushState e, valsX, people.reload

		$('.people-searchform').on 'submit', (e) ->
			people.submit e

		$('.people-search-form .clear.button').click (e) ->
			vals = {spec: -1, dept: -1, facultyname: ''}
			people.updateTermFilters vals
			people.updateResults()
			tryPushState e, vals

	setLastUsedVals: (vals) ->
		if vals is undefined
			vals = @getFiltersAsIndexes()
		console.log 'setLastUsedVals' + JSON.stringify(vals)
		@lastSpec = vals.spec
		@lastDept = vals.dept
		@lastName = vals.facultyname
		return vals

	getTermsInURL: () ->
		specregex = new RegExp '[\\?&]specialization=([^&#]*)'
		specresults = specregex.exec location.search
		spec = if specresults is null then '' else decodeURIComponent specresults[1].replace /\+/g, ' '

		deptregex = new RegExp '[\\?&]department=([^&#]*)'
		deptresults = deptregex.exec location.search
		dept = if deptresults is null then '' else decodeURIComponent deptresults[1].replace /\+/g, ' '

		nameregex = new RegExp '[\\?&]facultyname=([^&#]*)'
		nameresults = nameregex.exec location.search
		facultyname = if nameresults is null then '' else decodeURIComponent nameresults[1].replace /\+/g, ' '


		@setLastUsedVals {
			spec: @specializations.indexOf(spec),
			dept: @departments.indexOf(dept),
			facultyname: facultyname
		}

	updateTermFilters: (vals) ->
		$specfilter = @parent.find('input[name="p"]')
		$deptfilter = @parent.find('select[name="department"]')
		$namefilter = @parent.find('input[name="facultyname"]')

		if vals.spec < 0 or vals.spec is undefined
			$specfilter.val ''
		else
			spec = @specializations[vals.spec]
			$specfilter.val spec

		if vals.dept < 0 or vals.dept is undefined
			$deptfilter.val ''
		else
			$deptfilter.val vals.dept

		if vals.facultyname is undefined
			$namefilter.val ''
		else
			$namefilter.val vals.facultyname

		@setLastUsedVals vals


	getFiltersAsIndexes: ->
		vals = {}
		spec = @parent.find('input[name="p"]').val()
		dept = @parent.find('select[name="department"]').val()
		facultyname = @parent.find('input[name="facultyname"]').val()
		# Capitalize all words
		splitStr = spec.toLowerCase().split ' '
		i = 0
		while i < splitStr.length
			splitStr[i] = splitStr[i].charAt 0
				.toUpperCase() + splitStr[i].substring 1
			i++
		spec = splitStr.join ' '
		spec = @specializations.indexOf spec
		dept = if dept is '' then -1 else parseInt dept

		return {
			spec: spec,
			dept: dept,
			facultyname: facultyname
		}

	render: (refresh) ->
		$parent = $ '#people-listing-ul'
		template = $ 'script#people-template'
			.html()

		if refresh is true then $parent.html ''

		_.each(@people, (person) =>
			saveSettings = _.templateSettings
			_.templateSettings =
				evaluate : /\{\{(.+?)\}\}/g
				interpolate : /\{\{=(.+?)\}\}/g
			compiled = _.template template
			_.templateSettings = saveSettings
			output = compiled {person:person}
			$parent.append output
		)

	updateResults: (terms) ->
		$faculty = $ '.people-listing-item'
		$activeFaculty = $faculty

		if terms is undefined
			terms = @getFiltersAsIndexes()

		console.log 'updateResults' + JSON.stringify(terms)

		activeClasses = []
		if -1 isnt terms.spec and undefined isnt terms.spec then activeClasses.push '.spec-' + terms.spec
		if -1 isnt terms.dept and undefined isnt terms.dept then activeClasses.push '.dept-' + terms.dept

		console.log activeClasses
		if activeClasses.length is 0 and (terms.facultyname is undefined or terms.facultyname is '')
			$faculty.filter(':hidden').fadeIn()
			$faculty.removeClass('item-odd').each (i) ->
				if i%2 is 0 then $(this).addClass 'item-odd'
		else
			selected = activeClasses.join ''
			if terms.facultyname isnt undefined and terms.facultyname isnt ''
				$activeFaculty = @itemsHavingText $faculty, terms.facultyname, '.people-name'
			$activeFaculty = $activeFaculty.filter selected
			if $activeFaculty.length > 0
				# Show or hide faculty
				$activeFaculty.fadeIn().removeClass('item-odd').each (i) ->
					if i%2 is 0 then $(this).addClass 'item-odd'
				$faculty.not $activeFaculty
					.fadeOut().removeClass 'item-odd'
			else
				$('.people-listing-item').fadeOut().removeClass 'item-odd'

	itemsHavingText: ($items, text, selector) ->
		$items.filter (i) ->
				$this = $ this
				text = text.toLowerCase()
				fulltext = $this.find(selector).html().toLowerCase()
				return fulltext.indexOf(text) >= 0

	tryPushState: (e, vals, callback) ->
		console.log 'tryPushState'
		if history.pushState
			# Update results without reloading
			@updateResults()
			params = []
			newurl = window.location.protocol + "//" + window.location.host + window.location.pathname
			if vals.spec then params.push 'specialization=' + vals.spec
			if vals.dept then params.push 'department=' + vals.dept
			if vals.facultyname then params.push 'facultyname=' + vals.facultyname
			if params.length > 0
				newurl += '?'
				newurl += encodeURI params.join('&')
			window.history.pushState({path:newurl},'',newurl)
		else
			callback(e, vals)

	reload: (e, vals) ->
		# Redirect page
		resultPage = $(e.target).attr 'action'
		params = []
		newurl = encodeURI resultPage
		if vals.spec then params.push 'specialization=' + vals.spec
		if vals.dept then params.push 'department=' + vals.dept
		if vals.facultyname then params.push 'facultyname=' + vals.facultyname
		if params.length > 0
			newurl += '?'
			newurl += encodeURI params.join('&')
		window.location.href = newurl

	submit: (e) ->
		e.preventDefault()
		@setLastUsedVals()
		vals = {}
		if '' isnt @lastSpec then vals.spec = @specializations[@lastSpec]
		if '' isnt @lastDept then vals.dept = @departments[@lastDept]
		if '' isnt @lastName then vals.facultyname = @lastName
		@tryPushState e, vals, @reload

do ( $ = jQuery ) ->
	"use strict"
	$ ->
		people = new AgriLife.People
		people.specialization = $('.people-searchform').data 'specialization'
		people.tryInitLocalStorage()
		people.get()
