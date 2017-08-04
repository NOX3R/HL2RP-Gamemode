-- This module will make voice sounds play when certain words are typed in the chat
-- You can add/remove sounds as you wish, just follow the format used here
-- To disble them completey, use the command rp_chatsounds 0 or delete this file.
-- TODO: Add female sounds & detect gender of model, Use combine sounds for CPs.

-- DaCoolboy: I sorted the entries alphabetically for better overview
-- Sorry for messing up custom entries, you can now add them near the end of the file

local sounds = {}
local soundsMPF = {}
local soundsF = {}
local soundsZM = {}
local soundsV = {}

sounds[ "je ne vous en voudrez pas" ] = { "npc/male/answer02.wav" }

sounds[ "parlez encore seul" ] = { "npc/male/answer09.wav" }

sounds[ "mieux vaut ne pas y penser" ] = { "npc/male/answer12.wav" }

sounds[ "une facon de voir les choses" ] = { "npc/male/answer15.wav" }

sounds[ "Penser par vous même" ] = { "npc/male/answer16.wav" }

sounds[ "je me decale" ] = { "npc/male/outofyourway02.wav" }

sounds[ "y'a des trucs auxquels je m'habitue pas" ] = { "npc/male/vquestion02.wav" }

sounds[ "un pour moi" ] = { "npc/male/oneforme.wav" }

sounds[ "je sais pas comment vous avez pu survivre aussi longtemps" ] = { "npc/male/vquestion03.wav" }

sounds[ "un strider" ] = { "npc/male/strider.wav" }

sounds[ "des scanners" ] = { "npc/male/scanners02.wav" }

sounds[ "ok j'y vais" ] = { "npc/male/squad_affirm04.wav" }

sounds[ "desfois je me demande ce que je fais avec vous" ] = { "npc/male/vquestion04.wav" }

sounds[ "si on m'avais dis un jour que je serais pote avec un vort" ] = { "npc/male/vquestion07.wav" }

sounds[ "on avait confiance" ] = { "npc/male/wetrustedyou01.wav" }

sounds[ "ce sera parfait" ] = { "npc/male/thislldonicely01.wav" }

sounds[ "zombies" ] = { "npc/male/zombies01.wav" }

sounds[ "la haut" ] = { "npc/male/upthere02.wav" }

sounds[ "foutu vort" ] = { "npc/male/vanswer02.wav" }

sounds[ "je sais pas comment le prendre" ] = { "npc/male/vanswer03.wav" }

sounds[ "parlez francais" ] = { "npc/male/vanswer05.wav" }

sounds[ "c'est pour ça qu'on vous supporte" ] = { "npc/male/vanswer07.wav" }

sounds[ "par la les gars" ] = { "npc/male/squad_away01.wav" }

sounds[ "j'aurais pas dit mieux" ] = { "npc/male/vanswer08.wav" }

sounds[ "c'etais presque logique" ] = { "npc/male/vanswer09.wav" }

sounds[ "j'ai presque compris" ] = { "npc/male/vanswer10.wav" }

sounds[ "esprit mal place" ] = { "npc/male/answer20.wav" }

sounds[ "je m'habitue aux vort" ] = { "npc/male/vanswer11.wav" }

sounds[ "arretez je vais mourir" ] = { "npc/male/vanswer13.wav" }

sounds[ "je merite ca" ] = { "npc/male/vanswer14.wav" }

sounds[ "10 $ a chaque fois" ] = { "npc/male/answer28.wav" }

sounds[ "c'est la liberté" ] = { "npc/male/question07.wav" }

sounds[ "j'ai l'impression que ca empire" ] = { "npc/male/question12.wav" }

sounds[ "Je vous dirais même pas ce que ça me rappelle" ] = { "npc/male/question14.wav" }

sounds[ "je ressens plus rien" ] = { "npc/male/question18.wav" }

sounds[ "un jour ca ne sera plus qu'un mauvais souvenir" ] = { "npc/male/question20.wav" }

sounds[ "c'est mal barré" ] = { "npc/male/question21.wav" }

sounds[ "je meurs de faim" ] = { "npc/male/question28.wav" }

sounds[ "a la fin de ca je vais copuler" ] = { "npc/male/question29.wav" }

sounds[ "heureusement qu'il y a pas d'enfants pour voir ça" ] = { "npc/male/question30.wav" }

sounds[ "quand vous voulez" ] = { "npc/male/readywhenyouare01.wav" }

sounds[ "c'est pas mon jour" ] = { "npc/male/question25.wav" }

sounds[ "y'a un truc qui passe pas" ] = { "npc/male/question27.wav" }

sounds[ "je peux pas m'enlever cet air de la tête" ] = { "npc/male/question23.wav" }

sounds[ "tout le monde se fiche de ce que je pense" ] = { "npc/male/question22.wav" }

sounds[ "je pourrais manger n'importe quoi" ] = { "npc/male/question09.wav" }

sounds[ "je doute que cette guerre finisse un jour" ] = { "npc/male/question01.wav" }

sounds[ "quand je pense que je voulais bosser dans les assurances" ] = { "npc/male/question02.wav" }

sounds[ "quand tout sera fini" ] = { "npc/male/question04.wav" }

sounds[ "on devrait pas se bouger" ] = { "npc/male/doingsomething.wav" }

sounds[ "retablissons les choses" ] = { "npc/male/evenodds.wav" }

sounds[ "tout allait tellement bien" ] = { "npc/male/gordead_ans02.wav" }

sounds[ "je peux rien y faire" ] = { "npc/male/answer29.wav" }

sounds[ "je suis prêt" ] = { "npc/male/okimready01.wav",
"npc/male/okimready02.wav",
"npc/male/okimready03.wav" }

sounds[ "si vous dites ca doit faire mal" ] = { "npc/male/gordead_ans07.wav" }

sounds[ "il va s'en sortir" ] = { "npc/male/gordead_ans18.wav" }

sounds[ "mourir comme ca" ] = { "npc/male/gordead_ques02.wav" }

sounds[ "pour quelqu'un d'invincible" ] = { "npc/male/gordead_ques11.wav" }

sounds[ "helico" ] = { "npc/male/gunship02.wav" }

sounds[ "crabe de tete" ] = { "npc/male/headcrabs01.wav" }

sounds[ "vous etes cense nous aider" ] = { "npc/male/heretohelp02.wav" }

sounds[ "en plein ventre" ] = { "npc/male/hitingut01.wav" }

sounds[ "plus d'espoir" ] = { "npc/male/gordead_ques13.wav" }

sounds[ "je vais vomir" ] = { "npc/male/gordead_ans19.wav" }

sounds[ "on est foutus" ] = { "npc/male/gordead_ans14.wav" }

sounds[ "tout à fait d'accord" ] = { "npc/male/answer33.wav" }

sounds[ "rechargez" ] = { "npc/male/youdbetterreload01.wav" }

sounds[ "t'aime ça" ] = { "npc/male/likethat.wav" }

sounds[ "aie" ] = { "npc/male/moan01.wav",
"npc/male/moan02.wav",
"npc/male/moan03.wav",
"npc/male/moan04.wav",
"npc/male/moan05.wav" }

sounds[ "mon bras" ] = { "npc/male/myarm01.wav",
"npc/male/myarm02.wav",}

sounds[ "mon ventre" ] = { "npc/male/mygut02.wav" }

sounds[ "ma jambe" ] = { "npc/male/myleg01.wav",
"npc/male/myleg02.wav" }

sounds[ "vous n'etes pas celui que je croyais" ] = { "npc/male/notthemanithought01.wav" }

soundsF[ "je ne vous en voudrez pas" ] = { "npc/female/answer02.wav" }

soundsF[ "parlez encore seul" ] = { "npc/female/answer09.wav" }

soundsF[ "mieux vaut ne pas y penser" ] = { "npc/female/answer12.wav" }

soundsF[ "une facon de voir les choses" ] = { "npc/female/answer15.wav" }

soundsF[ "penser par vous même" ] = { "npc/female/answer16.wav" }

soundsF[ "je me decale" ] = { "npc/female/outofyourway02.wav" }

soundsF[ "y'a des trucs auxquels je m'habitue pas" ] = { "npc/female/vquestion02.wav" }

soundsF[ "un pour moi" ] = { "npc/female/oneforme.wav" }

soundsF[ "je sais pas comment vous avez pu survivre aussi longtemps" ] = { "npc/female/vquestion03.wav" }

soundsF[ "un strider" ] = { "npc/female/strider.wav" }

soundsF[ "des scanners" ] = { "npc/female/scanners02.wav" }

soundsF[ "ok j'y vais" ] = { "npc/female/squad_affirm04.wav" }

soundsF[ "desfois je me demande ce que je fais avec vous" ] = { "npc/female/vquestion04.wav" }

soundsF[ "si on m'avais dis un jour que je serais pote avec un vort" ] = { "npc/female/vquestion07.wav" }

soundsF[ "on avait confiance" ] = { "npc/female/wetrustedyou01.wav" }

soundsF[ "ce sera parfait" ] = { "npc/female/thislldonicely01.wav" }

soundsF[ "zombies" ] = { "npc/female/zombies01.wav" }

soundsF[ "la haut" ] = { "npc/female/upthere02.wav" }

soundsF[ "foutu vort" ] = { "npc/female/vanswer02.wav" }

soundsF[ "je sais pas comment le prendre" ] = { "npc/female/vanswer03.wav" }

soundsF[ "parlez francais" ] = { "npc/female/vanswer05.wav" }

soundsF[ "c'est pour ça qu'on vous supporte" ] = { "npc/female/vanswer07.wav" }

soundsF[ "par la les gars" ] = { "npc/female/squad_away01.wav" }

soundsF[ "j'aurais pas dit mieux" ] = { "npc/female/vanswer08.wav" }

soundsF[ "c'etais presque logique" ] = { "npc/female/vanswer09.wav" }

soundsF[ "j'ai presque compris" ] = { "npc/female/vanswer10.wav" }

soundsF[ "esprit mal place" ] = { "npc/female/answer20.wav" }

soundsF[ "je m'habitue aux vort" ] = { "npc/female/vanswer11.wav" }

soundsF[ "arretez vous allez me tuer" ] = { "npc/female/vanswer13.wav" }

soundsF[ "je merite ca" ] = { "npc/female/vanswer14.wav" }

soundsF[ "10 $ a chaque fois" ] = { "npc/female/answer28.wav" }

soundsF[ "c'est la liberté" ] = { "npc/female/question07.wav" }

soundsF[ "j'ai l'impression que ca empire" ] = { "npc/female/question12.wav" }

soundsF[ "je vous dirrais meme pas ce que ca me rappelle" ] = { "npc/female/question14.wav" }

soundsF[ "je ressens plus rien" ] = { "npc/female/question18.wav" }

soundsF[ "un jour ca ne sera plus qu'un mauvais souvenir" ] = { "npc/female/question20.wav" }

soundsF[ "c'est mal barré" ] = { "npc/female/question21.wav" }

soundsF[ "je meurs de faim" ] = { "npc/female/question28.wav" }

soundsF[ "a la fin de ca je vais copuler" ] = { "npc/female/question29.wav" }

soundsF[ "heuresement qu'il y a pas d'enfants pour voir ca" ] = { "npc/female/question30.wav" }

soundsF[ "quand vous voulez" ] = { "npc/female/readywhenyouare01.wav" }

soundsF[ "c'est pas mon jour" ] = { "npc/female/question25.wav" }

soundsF[ "y'a un truc qui passe pas" ] = { "npc/female/question27.wav" }

soundsF[ "je peux pas m'enlever cet air de la tête" ] = { "npc/female/question23.wav" }

soundsF[ "heureusement qu'il y a pas d'enfants pour voir ça" ] = { "npc/female/question30.wav" }

soundsF[ "tout le monde se fiche de ce que je pense" ] = { "npc/female/question22.wav" }

soundsF[ "je pourrais manger n'importe quoi" ] = { "npc/female/question09.wav" }

soundsF[ "je doute que cette guerre finisse un jour" ] = { "npc/female/question01.wav" }

soundsF[ "quand je pense que je voulais bosser dans les assurances" ] = { "npc/female/question02.wav" }

soundsF[ "quand tout sera fini" ] = { "npc/female/question04.wav" }

soundsF[ "on devrait pas se bouger" ] = { "npc/female/doingsomething.wav" }

soundsF[ "retablissons les choses" ] = { "npc/female/evenodds.wav" }

soundsF[ "Je vous dirais même pas ce que ça me rappelle" ] = { "npc/female/question14.wav" }

soundsF[ "tout allait tellement bien" ] = { "npc/female/gordead_ans02.wav" }

soundsF[ "je peux rien y faire" ] = { "npc/female/answer29.wav" }

soundsF[ "je suis prêt" ] = { "npc/female/okimready01.wav",
"npc/female/okimready02.wav",
"npc/female/okimready03.wav" }

soundsF[ "si vous dites ca doit faire mal" ] = { "npc/female/gordead_ans07.wav" }

soundsF[ "il va s'en sortir" ] = { "npc/female/gordead_ans18.wav" }

soundsF[ "mourir comme ca" ] = { "npc/female/gordead_ques02.wav" }

soundsF[ "je croyais qu'il était invincible" ] = { "npc/female/gordead_ques11.wav" }

soundsF[ "hélico" ] = { "npc/female/gunship02.wav" }

soundsF[ "crabe de tete" ] = { "npc/female/headcrabs01.wav" }

soundsF[ "vous etes cense nous aider" ] = { "npc/female/heretohelp02.wav" }

soundsF[ "en plein ventre" ] = { "npc/female/hitingut01.wav" }

soundsF[ "plus d'espoir" ] = { "npc/female/gordead_ques13.wav" }

soundsF[ "je vais vomir" ] = { "npc/female/gordead_ans19.wav" }

soundsF[ "on est foutus" ] = { "npc/female/gordead_ans14.wav" }

soundsF[ "tout a fait d'accord" ] = { "npc/female/answer33.wav" }

soundsF[ "rechargez" ] = { "npc/female/youdbetterreload01.wav" }

soundsF[ "t'aime ça" ] = { "npc/female/likethat.wav" }

soundsF[ "aie" ] = { "npc/female/moan01.wav",
"npc/female/moan02.wav",
"npc/female/moan03.wav",
"npc/female/moan04.wav",
"npc/female/moan05.wav" }

soundsF[ "mon bras" ] = { "npc/female/myarm01.wav",
"npc/male/myarm02.wav",}

soundsF[ "mon ventre" ] = { "npc/female/mygut02.wav" }

soundsF[ "ma jambe" ] = { "npc/female/myleg01.wav",
"npc/female/myleg02.wav" }

soundsF[ "vous n'etes pas celui que je croyais" ] = { "npc/female/notthemanithought01.wav" }


sounds[ "munition" ] = { "npc/male/ammo03.wav", "npc/male/ammo04.wav", "npc/male/ammo05.wav" }

sounds[ "derrière vous" ] = { "npc/male/behindyou01.wav", "npc/male/behindyou02.wav" }

sounds[ "rechargez" ] = { "npc/male/youdbetterreload01.wav" }

sounds[ "conneries" ] = { "npc/male/question26.wav" }

sounds[ "fromage" ] = { "npc/male/question06.wav" }

sounds[ "cartel" ] = { "npc/male/combine01.wav", "npc/male/combine02.wav" }

sounds[ "on est là" ] = { "npc/male/squad_approach04.wav" }

sounds[ "milice" ] = { "npc/male/civilprotection01.wav", "npc/male/civilprotection02.wav", "npc/male/cps01.wav", "npc/male/cps02.wav" }
sounds[ "pc" ] = sounds[ "milice" ]
sounds[ "pcs" ] = sounds[ "milice" ]

sounds[ "arrétez" ] = { "trainyard/male/cit_hit01.wav", "trainyard/male/cit_hit02.wav", "trainyard/male/cit_hit03.wav", "trainyard/male/cit_hit04.wav", "trainyard/male/cit_hit05.wav" }

sounds[ "me dites rien" ] = { "npc/male/gordead_ans03.wav" }

sounds[ "déjà vu" ] = { "npc/male/question05.wav" }
sounds[ "déjà vu" ] = sounds[ "deja vu" ]

soundsF[ "vous et moi" ] = { "npc/male/answer14.wav" }

sounds[ "pardon" ] = { "npc/male/excuseme01.wav", "npc/male/excuseme02.wav" }

sounds[ "génial" ] = { "npc/male/fantastic01.wav", "npc/male/fantastic02.wav" }

sounds[ "logique" ] = { "npc/male/answer03.wav" }

sounds[ "enfin" ] = { "npc/male/finally.wav" }

sounds[ "suivez moi" ] = { "coast/odessa/male/stairman_follow01.wav", "npc/male/squad_away03.wav", "coast/cardock/le_followme.wav" }

sounds[ "concentré" ] = { "npc/male/answer18.wav", "npc/male/answer19.wav" }

sounds[ "freeman" ] = { "npc/male/freeman.wav", "npc/male/docfreeman01.wav", "npc/male/docfreeman02.wav" }

sounds[ "à terre" ] = { "npc/male/getdown02.wav" }

sounds[ "rentrez" ] = { "canals/gunboat_getin.wav" }

sounds[ "dégagez" ] = { "npc/male/gethellout.wav" }

sounds[ "mon dieu" ] = { "npc/male/goodgod.wav", "npc/male/gordead_ans04.wav" }

sounds[ "je l'ai eu" ] = { "npc/male/gotone01.wav", "npc/male/gotone01.wav"}

sounds[ "je dois recharger" ] = { "npc/male/gottareload01.wav" }


sounds[ "lames" ] = { "npc/male/hacks01.wav",  "npc/male/hacks02.wav", "npc/male/thehacks01.wav", "npc/male/thehacks02.wav"}
sounds[ "lames" ] = sounds [ "lames" ]
sounds[ "lames" ] = sounds [ "lames" ]

sounds[ "à l'aide" ] = { "npc/male/help01.wav" }

sounds[ "les voilà" ] = { "npc/male/heretheycome01.wav", "npc/male/incoming02.wav" }

sounds[ "hey" ] = { "npc/male/hi01.wav", "npc/male/hi02.wav" }
sounds[ "hey" ] = sounds[ "hey" ]
sounds[ "salut" ] = sounds[ "hey" ]

sounds[ "attention" ] = { "npc/male/headsup01.wav", "npc/male/headsup02.wav" }

sounds[ "il est mort" ] = { "npc/male/gordead_ques01.wav",  "npc/male/gordead_ques07.wav" }
sounds[ "il est mort" ] = sounds[ "il est mort" ]

sounds[ "et ça" ] = { "npc/male/answer25.wav" }

sounds[ "je comprend" ] = { "npc/male/answer08.wav" }

sounds[ "je bouge pas" ] = { "npc/male/illstayhere01.wav", "npc/male/holddownspot01.wav", "npc/male/holddownspot02.wav", "npc/male/imstickinghere01.wav",  "npc/male/littlecorner01.wav" }

sounds[ "occupé" ] = { "npc/male/busy02.wav" }
sounds[ "occupé" ] = sounds[ "occupé" ]

sounds[ "je vous suis" ] = { "npc/male/answer13.wav" }
sounds[ "je vous suis" ] = sounds[ "je vous suis" ]

sounds[ "isnt good" ] = { "trainyard/male/cit_window_use01.wav" }
sounds[ "isn't good" ] = sounds[ "isnt good" ]

sounds[ "les voilà" ] = sounds[ "les voilà" ]

sounds[ "pas possible" ] = { "npc/male/gordead_ques06.wav" }

sounds[ "pas de problèmes" ] = { "npc/male/answer02.wav" }
sounds[ "ça va aller" ] = sounds[ "pas de problèmes" ]

sounds[ "ok" ] = { "npc/male/ok01.wav", "npc/male/ok02.wav" }

sounds[ "je vous suis" ] = { "npc/male/leadtheway01.wav", "npc/male/leadtheway02.wav" }
sounds[ "je vous suis" ] = sounds[ "je vous suis" ]

sounds[ "allons y" ] = { "npc/male/letsgo01.wav", "npc/male/letsgo02.wav" }
sounds[ "allons y" ] = sounds[ "allons y" ]

sounds[ "on sais jamais" ] = { "npc/male/answer23.wav" }

sounds[ "cool" ] = { "npc/male/nice01.wav", "npc/male/nice02.wav" }

sounds[ "pas bon" ] = sounds[ "pas bon" ]

sounds[ "pas sûre" ] = { "npc/male/answer21.wav" }

sounds[ "et maintenant" ] = { "npc/male/gordead_ans01.wav", "npc/male/gordead_ans15.wav" }

sounds[ "oh non" ] = { "npc/male/gordead_ans05.wav", "npc/male/ohno.wav" }


sounds[ "ok" ] = sounds[ "ok" ]
sounds[ "okay" ] = sounds[ "ok" ]

sounds[ "oops" ] = { "npc/male/whoops01.wav" }

sounds[ "par ici" ] = { "npc/male/overhere01.wav", "npc/male/squad_away02.wav" }

sounds[ "par là" ] = { "npc/male/overthere01.wav", "npc/male/overthere02.wav" }

sounds[ "excusez moi" ] = { "npc/male/pardonme01.wav", "npc/male/pardonme02.wav" }

sounds[ "pitié non" ] = { "npc/male/gordead_ans06.wav" }

sounds[ "mouton" ] = { "npc/male/answer18.wav" }

sounds[ "courez" ] = { "npc/male/strider_run.wav" }

sounds[ "moi aussi" ] = { "npc/male/answer07.wav" }

sounds[ "fermez là" ] = { "npc/male/answer17.wav" }

sounds[ "faites passer" ] = { "npc/male/gordead_ans10.wav" }

sounds[ "arrétez" ] = sounds[ "arrétez" ]
sounds[ "arrétez ça" ] = sounds[ "arrétez" ]

sounds[ "me regardez pas" ] = { "npc/male/vquestion01.wav" }

sounds[ "pardon" ] = { "npc/male/sorry01.wav", "npc/male/sorry02.wav", "npc/male/sorry03.wav" }

sounds[ "aux abris" ] = { "npc/male/takecover02.wav" }

sounds[ "trousse de soin" ] = {"npc/male/health01.wav", "npc/male/health02.wav", "npc/male/health03.wav", "npc/male/health04.wav" }

sounds[ "mouton" ] = { "npc/male/answer18.wav" }

sounds[ "pardon" ] = { "npc/male/answer30.wav" }

sounds[ "c'est bien vous ça" ] = { "npc/male/answer01.wav" }


sounds[ "mauvais signe" ] = { "npc/male/gordead_ques10.wav" }

sounds[ "trop d'informations" ] = { "npc/male/answer26.wav" }
sounds[ "trop d'informations" ] = sounds[ "trop d'informations" ]

sounds[ "ohoh" ] = { "npc/male/uhoh.wav" }
sounds[ "oh oh" ]  = sounds[ "ohoh" ]

sounds[ "attendez" ] = { "trainyard/man_waitaminute.wav" }

sounds[ "attendez moi" ] = { "npc/male/squad_reinforce_single04.wav" }

sounds[ "attendez nous" ] = { "npc/male/squad_reinforce_group04.wav" }

sounds[ "on parie" ] = { "npc/male/answer27.wav" }

sounds[ "attention" ] = { "npc/male/watchout.wav" }

sounds[ "foutu" ] = { "npc/male/gordead_ans14.wav" }
sounds[ "foutus" ] = sounds[ "foutu" ]

sounds[ "et maintenant" ] = { "npc/male/gordead_ques16.wav" }

sounds[ "vous voudrez" ] = { "npc/male/squad_affirm03.wav" }

sounds[ "à quoi bon" ] = { "npc/male/gordead_ans11.wav" }
sounds[ "a quoi bon" ] = sounds[ "à quoi bon" ]

sounds[ "pourquoi faire" ] = { "npc/male/gordead_ans12.wav" }
sounds[ "pourquoi faire" ] = sounds[ "pourquoi faire" ]

sounds[ "whoops" ] = sounds[ "oops" ]

sounds[ "pourquoi continuer" ] = { "npc/male/gordead_ans13.wav" }

sounds[ "pourquoi vous dites ça" ] = { "npc/male/answer24.wav" }

sounds[ "ouais" ] = { "npc/male/yeah02.wav" }
sounds[ "oui" ] = sounds[ "ouais" ]

sounds[ "vous et moi" ] = { "npc/male/answer14.wav" }

sounds[ "sais jamais" ] = { "npc/male/answer22.wav" }

sounds[ "êtes sûrs" ] = { "npc/male/answer37.wav" }


-- Femme VOIX
soundsF[ "munition" ] = { "npc/female/ammo03.wav", "npc/female/ammo04.wav", "npc/female/ammo05.wav" }

soundsF[ "on est là" ] = { "npc/female/squad_approach04.wav" }

soundsF[ "derrière vous" ] = { "npc/female/behindyou01.wav", "npc/female/behindyou02.wav" }

soundsF[ "Recharger" ] = { "npc/female/youdbetterreload01.wav" }

soundsF[ "conneries" ] = { "npc/female/question26.wav" }

soundsF[ "Fromage" ] = { "npc/female/question06.wav" }

soundsF[ "Cartel" ] = { "npc/female/combine01.wav", "npc/female/combine02.wav" }

soundsF[ "on est la" ] = { "npc/female/squad_approach04.wav" }

soundsF[ "milice" ] = { "npc/female/civilprotection01.wav", "npc/female/civilprotection02.wav", "npc/female/cps01.wav", "npc/female/cps02.wav" }
soundsF[ "Pc" ] = soundsF[ "Milice" ]
soundsF[ "pcs" ] = soundsF[ "milice" ]

soundsF[ "cut it" ] = { "trainyard/female/cit_hit01.wav", "trainyard/female/cit_hit02.wav", "trainyard/female/cit_hit03.wav", "trainyard/female/cit_hit04.wav", "trainyard/female/cit_hit05.wav" }

soundsF[ "me dite rien" ] = { "npc/female/gordead_ans03.wav" }

soundsF[ "déjà vu" ] = { "npc/female/question05.wav" }
soundsF[ "déjà vu" ] = soundsF[ "déjè vu" ]

soundsF[ "excusez moi" ] = { "npc/female/excuseme01.wav", "npc/female/excuseme02.wav" }

soundsF[ "génial" ] = { "npc/female/fantastic01.wav", "npc/female/fantastic02.wav" }

soundsF[ "logique" ] = { "npc/female/answer03.wav" }

soundsF[ "enfin" ] = { "npc/female/finally.wav" }

soundsF[ "suivez moi" ] = { "coast/odessa/female/stairman_follow01.wav", "npc/female/squad_away03.wav", "coast/cardock/le_followme.wav" }

soundsF[ "mouton" ] = { "npc/female/answer18.wav", "npc/female/answer19.wav" }

soundsF[ "freeman" ] = { "npc/female/freeman.wav", "npc/female/docfreeman01.wav", "npc/female/docfreeman02.wav" }

soundsF[ "à terre" ] = { "npc/female/getdown02.wav" }

soundsF[ "get in" ] = { "canals/gunboat_getin.wav" }

soundsF[ "fermez là" ] = { "npc/female/answer17.wav" }


soundsF[ "faites passer" ] = { "npc/female/gordead_ans10.wav" }

soundsF[ "get out" ] = { "npc/female/gethellout.wav" }

soundsF[ "mon dieu" ] = { "npc/female/goodgod.wav", "npc/female/gordead_ans04.wav" }

soundsF[ "je l'ai eu" ] = { "npc/female/gotone01.wav", "npc/female/gotone01.wav"}
soundsF[ "aux abris" ] = { "npc/female/takecover02.wav" }
soundsF[ "me dites rien" ] = { "npc/male/gordead_ans03.wav" }

soundsF[ "je dois recharger" ] = { "npc/female/gottareload01.wav" }

sounds[ "dégagez" ] = { "npc/female/gethellout.wav" }

soundsF[ "lames" ] = { "npc/female/hacks01.wav",  "npc/female/hacks02.wav", "npc/female/thehacks01.wav", "npc/female/thehacks02.wav"}
soundsF[ "lames" ] = soundsF [ "lames" ]
soundsF[ "lames" ] = soundsF [ "lames" ]

soundsF[ "à l'aide" ] = { "npc/female/help01.wav" }
soundsF[ "allons y" ] = { "npc/female/letsgo01.wav", "npc/female/letsgo02.wav" }
soundsF[ "allons y" ] = sounds[ "allons y" ]

soundsF[ "ils arrivent" ] = { "npc/female/heretheycome01.wav", "npc/female/incoming02.wav" }

soundsF[ "salut" ] = { "npc/female/hi01.wav", "npc/female/hi02.wav" }
soundsF[ "salut" ] = soundsF[ "salut" ]
soundsF[ "salut" ] = soundsF[ "salut" ]

soundsF[ "attention" ] = { "npc/female/headsup01.wav", "npc/female/headsup02.wav" }

soundsF[ "je bouge pas" ] = { "npc/female/illstayhere01.wav", "npc/female/holddownspot01.wav", "npc/female/holddownspot02.wav", "npc/female/imstickinghere01.wav",  "npc/female/littlecorner01.wav" }


soundsF[ "il est mort" ] = { "npc/female/gordead_ques01.wav",  "npc/female/gordead_ques07.wav" }
soundsF[ "il est mort" ] = soundsF[ "il est mort" ]

soundsF[ "et ça" ] = { "npc/female/answer25.wav" }

soundsF[ "êtes sûrs" ] = { "npc/female/answer37.wav" }

soundsF[ "je comprend" ] = { "npc/female/answer08.wav" }

soundsF[ "je reste ici" ] = { "npc/female/illstayhere01.wav", "npc/female/holddownspot01.wav", "npc/female/holddownspot02.wav", "npc/female/imstickinghere01.wav",  "npc/female/littlecorner01.wav" }
soundsF[ "je reste ici" ] = soundsF[ "je reste ici" ]
soundsF[ "je reste ici" ] = soundsF[ "je reste ici" ]

sounds[ "pitié non" ] = { "npc/female/gordead_ans06.wav" }

soundsF[ "occupé" ] = { "npc/female/busy02.wav" }

soundsF[ "je vous suis" ] = { "npc/female/answer13.wav" }
soundsF[ "je vous suis" ] = soundsF[ "je vous suis" ]

soundsF[ "isnt good" ] = { "trainyard/female/cit_window_use01.wav" }
sounds[ "isn't good" ] = soundsF[ "isnt good" ]

soundsF[ "les voilà" ] = soundsF[ "les voilà" ]

soundsF[ "pas possible" ] = { "npc/female/gordead_ques06.wav" }

soundsF[ "pas de problèmes" ] = { "npc/female/answer02.wav" }
soundsF[ "ça va aller" ] = soundsF[ "pas de problèmes" ]

soundsF[ "okay" ] = { "npc/female/ok01.wav", "npc/female/ok02.wav" }

soundsF[ "je vous suis" ] = { "npc/female/leadtheway01.wav", "npc/female/leadtheway02.wav" }
soundsF[ "je vous suis" ] = soundsF[ "je vous suis" ]

soundsF[ "c'est partie" ] = { "npc/female/letsgo01.wav", "npc/female/letsgo02.wav" }
soundsF[ "c'est partie" ] = soundsF[ "c'est partie" ]

soundsF[ "on sait jamais" ] = { "npc/female/answer23.wav" }

soundsF[ "cool" ] = { "npc/female/nice01.wav", "npc/female/nice02.wav" }

soundsF[ "not good" ] = soundsF[ "isnt good" ]

soundsF[ "pas sûre" ] = { "npc/female/answer21.wav" }

soundsF[ "et maintenant" ] = { "npc/female/gordead_ans01.wav", "npc/female/gordead_ans15.wav" }

soundsF[ "oh non" ] = { "npc/female/gordead_ans05.wav", "npc/female/ohno.wav" }


soundsF[ "ok" ] = soundsF[ "okay" ]
soundsF[ "okay" ] = soundsF[ "okay" ]

soundsF[ "oops" ] = { "npc/female/whoops01.wav" }

soundsF[ "par ici" ] = { "npc/female/overhere01.wav", "npc/female/squad_away02.wav" }

soundsF[ "par là" ] = { "npc/female/overthere01.wav", "npc/female/overthere02.wav" }

sounds[ "pardon" ] = { "npc/male/excuseme01.wav", "npc/female/excuseme02.wav" }

soundsF[ "s'il vous plait non" ] = { "npc/female/gordead_ans06.wav" }

soundsF[ "mouton" ] = { "npc/female/answer18.wav" }

soundsF[ "courez" ] = { "npc/female/strider_run.wav" }

soundsF[ "moi aussi" ] = { "npc/female/answer07.wav" }

soundsF[ "ferme la" ] = { "npc/female/answer17.wav" }

soundsF[ "spread the word" ] = { "npc/female/gordead_ans10.wav" }

soundsF[ "stop it" ] = soundsF[ "cut it" ]
soundsF[ "stop that" ] = soundsF[ "cut it" ]

soundsF[ "me regardez pas" ] = { "npc/female/vquestion01.wav" }

soundsF[ "désolé" ] = { "npc/female/sorry01.wav", "npc/female/sorry02.wav", "npc/female/sorry03.wav" }

soundsF[ "à couvert" ] = { "npc/female/takecover02.wav" }

soundsF[ "trousse de soin" ] = {"npc/female/health01.wav", "npc/female/health02.wav", "npc/female/health03.wav", "npc/female/health04.wav" }

soundsF[ "mouton" ] = { "npc/female/answer18.wav" }

soundsF[ "c'est à moi que vous parlez" ] = { "npc/female/answer30.wav" }

soundsF[ "c'est bien vous ça" ] = { "npc/female/answer01.wav" }


soundsF[ "mauvais signe" ] = { "npc/female/gordead_ques10.wav" }

soundsF[ "trop d'infos" ] = { "npc/female/answer26.wav" }
soundsF[ "trop d'infos" ] = soundsF[ "too much info" ]

soundsF[ "ohoh" ] = { "npc/female/uhoh.wav" }
soundsF[ "ohoh" ]  = soundsF[ "ohoh" ]

soundsF[ "attendez" ] = { "trainyard/man_waitaminute.wav" }

soundsF[ "attendez moi" ] = { "npc/female/squad_reinforce_single04.wav" }

soundsF[ "attendez nous" ] = { "npc/female/squad_reinforce_group04.wav" }

soundsF[ "on parie" ] = { "npc/female/answer27.wav" }

soundsF[ "attention" ] = { "npc/female/watchout.wav" }

soundsF[ "on est foutu" ] = { "npc/female/gordead_ans14.wav" }

soundsF[ "quoi encore" ] = { "npc/female/gordead_ques16.wav" }

soundsF[ "vous voudrez" ] = { "npc/female/squad_affirm03.wav" }

soundsF[ "à quoi bon" ] = { "npc/female/gordead_ans11.wav" }
soundsF[ "à quoi bon" ] = soundsF[ "à quoi bon" ]

soundsF[ "Pourquoi faire" ] = { "npc/female/gordead_ans12.wav" }

soundsF[ "oops" ] = soundsF[ "oops" ]

soundsF[ "pourquoi continuer" ] = { "npc/female/gordead_ans13.wav" }

soundsF[ "pourquoi vous me dite ça" ] = { "npc/female/answer24.wav" }

soundsF[ "ouais" ] = { "npc/female/yeah02.wav" }
soundsF[ "ouais" ] = soundsF[ "ouais" ]

soundsF[ "vous et moi" ] = { "npc/female/answer14.wav" }

soundsF[ "on sait jamais" ] = { "npc/female/answer22.wav" }

soundsF[ "pas la première fois" ] = { "npc/female/answer37.wav" }

-- You should add custom entries below this line to avoid merge issues

soundsMPF[ "appliquer" ] = { "npc/metropolice/fr/apply.wav" }

soundsMPF[ "citoyen" ] = { "npc/metropolice/fr/citizen.wav" }

soundsMPF[ "affirmatif" ] = { "npc/metropolice/fr/affirmative.wav" , "npc/metropolice/fr/affirmative2.wav"}

soundsMPF[ "administrer" ] = { "npc/metropolice/fr/administer.wav" }

soundsMPF[ "505" ] = { "npc/metropolice/fr/subjectis505.wav" }

soundsMPF[ "404" ] = { "npc/metropolice/fr/possible404here.wav" }

soundsMPF[ "circulez" ] = { "npc/metropolice/fr/movealong.wav" ,"npc/metropolice/fr/allrightyoucango.wav","npc/metropolice/fr/isaidmovealong.wav"}

soundsMPF[ "isolez" ] = { "npc/metropolice/fr/isolate.wav","npc/metropolice/fr/isolate.wav" }

soundsMPF[ "anti citoyen" ] = { "npc/metropolice/fr/anticitizen.wav" }

soundsMPF[ "reçu" ] = { "npc/metropolice/fr/copy.wav" }

soundsMPF[ "pas un geste" ] = { "npc/metropolice/fr/dontmove.wav" }

soundsMPF[ "premier avertissement" ] = { "npc/metropolice/fr/firstwarningmove.wav" }

soundsMPF[ "dernier avertissement" ] = { "npc/metropolice/fr/finalwarning.wav" }

soundsMPF[ "verdic final" ] = { "npc/metropolice/fr/finalverdictadministered.wav" }

soundsMPF[ "a terre" ] = { "npc/metropolice/fr/getdown.wav" }

soundsMPF[ "sortez d'ici" ] = { "npc/metropolice/fr/getoutofhere.wav" }

soundsMPF[ "a l'aide" ] = { "npc/metropolice/fr/help.wav" }

soundsMPF[ "Il fuit" ] = { "npc/metropolice/fr/hesrunning.wav" }

soundsMPF[ "arretez tout de suite" ] = { "npc/metropolice/fr/holditrightthere.wav" }

soundsMPF[ "refus d'obtempérer" ] = { "npc/metropolice/fr/issuingmalcompliantcitation.wav","npc/metropolice/fr/youwantamalcomplianceverdict.wav" }

soundsMPF[ "continuez" ] = { "npc/metropolice/fr/keepmoving.wav" }

soundsMPF[ "gardez position" ] = { "npc/metropolice/fr/lockyourposition.wav" }

soundsMPF[ "haha" ] = { "npc/metropolice/fr/chuckle.wav","npc/metropolice/vo/chuckle.wav" }

soundsMPF[ "merde" ] = { "npc/metropolice/fr/shit.wav" }

soundsMPF[ "ennuis" ] = { "npc/metropolice/fr/lookingfortrouble.wav" }

soundsMPF[ "amputez" ] = { "npc/metropolice/fr/amputate.wav" }

soundsMPF[ "attention" ] = { "npc/metropolice/fr/lookout.wav" }

soundsMPF[ "coups mineur" ] = { "npc/metropolice/fr/minorhitscontinuing.wav" }

soundsMPF[ "avancez" ] = { "npc/metropolice/fr/moveit2.wav" }

soundsMPF[ "reculez" ] = { "npc/metropolice/fr/movebackrightnow.wav" }

soundsMPF[ "jugement civil" ] = { "npc/metropolice/fr/prepareforjudgement.wav" }

soundsMPF[ "poursuivez" ] = { "npc/metropolice/fr/prosecute.wav" }

soundsMPF[ "prêt à amputer" ] = { "npc/metropolice/fr/readytoamputate.wav" }

soundsMPF[ "entendu" ] = { "npc/metropolice/fr/rodgerthat.wav" }

soundsMPF[ "cherchez" ] = { "npc/metropolice/fr/search.wav" }

soundsMPF[ "sentence prononcé" ] = { "npc/metropolice/fr/sentencedelivered.wav" }

soundsMPF[ "stérilisez" ] = { "npc/metropolice/fr/sterilize.wav" }

soundsMPF[ "aux abris" ] = { "npc/metropolice/fr/takecover.wav" }

soundsMPF[ "interdire" ] = { "npc/metropolice/fr/restrict.wav" }

soundsMPF[ "zone interdite" ] = { "npc/metropolice/fr/restrictedblock.wav" }

soundsMPF[ "deuxième avertissement" ] = { "npc/metropolice/fr/thisisyoursecondwarning.wav" }

soundsMPF[ "protection compléte" ] = { "npc/metropolice/fr/protectioncomplete.wav" }

soundsMPF[ "emplacement inconnue" ] = { "npc/metropolice/fr/suspectlocationunknown.wav" }

soundsMPF[ "ramasse cette boîte" ] = { "npc/metropolice/fr/pickupthecan1.wav" }

soundsMPF[ "ramasse la boîte" ] = { "npc/metropolice/fr/pickupthecan2.wav","npc/metropolice/fr/pickupthecan3.wav" }

soundsMPF[ "met ça dans la poubelle" ] = { "npc/metropolice/fr/putitinthetrash1.wav","npc/metropolice/fr/putitinthetrash2.wav" }

soundsMPF[ "okay terminé" ] = { "npc/combine_soldier/fr/thatsitwrapitup.wav" }

soundsMPF[ "maintenant partez" ] = { "npc/metropolice/fr/nowgetoutofhere.wav" }

soundsMPF[ "patrouille" ] = { "npc/metropolice/fr/patrol.wav" }

soundsMPF[ "renversé" ] = { "npc/metropolice/fr/youknockeditover.wav" }

soundsMPF[ "dégage citoyen" ] = { "npc/metropolice/fr/vacatecitizen.wav" }

soundsMPF[ "on l'a" ] = { "npc/combine_soldier/fr/affirmativewegothimnow.wav" }

soundsMPF[ "nettoyez" ] = { "npc/combine_soldier/fr/cleaned.wav" }

soundsMPF[ "nettoyage initié" ] = { "npc/combine_soldier/fr/engagedincleanup.wav" }

soundsMPF[ "début" ] = { "npc/combine_soldier/fr/engaging.wav" }

soundsMPF[ "exécution des ordres" ] = { "npc/combine_soldier/fr/executingfullresponse.wav" }

soundsMPF[ "solide résistance" ] = { "npc/combine_soldier/fr/heavyresistance.wav" }

soundsMPF[ "arrive" ] = { "npc/combine_soldier/fr/inbound.wav" }

soundsMPF[ "contact perdu" ] = { "npc/combine_soldier/fr/lostcontact.wav" }

soundsMPF[ "renforcez position" ] = { "npc/combine_soldier/fr/hardenthatposition.wav" }

soundsMPF[ "foncez foncez" ] = { "npc/combine_soldier/fr/gosharpgosharp.wav" }

soundsMPF[ "recevez" ] = { "npc/combine_soldier/fr/copythat.wav" }

soundsMPF[ "milice" ] = { "npc/combine_soldier/fr/overwatch.wav" }

soundsMPF[ "faites pression" ] = { "npc/metropolice/fr/pressure.wav" }

soundsMPF[ "injectez" ] = { "npc/metropolice/fr/inject.wav" }

soundsMPF[ "fantôme" ] = { "npc/combine_soldier/fr/ghost.wav" }

soundsMPF[ "union" ] = { "npc/metropolice/fr/union.wav" }

soundsMPF[ "helix" ] = { "npc/combine_soldier/fr/helix.wav" }

soundsMPF[ "tirez" ] = { "npc/combine_soldier/fr/dash.wav" }

soundsMPF[ "roi" ] = { "npc/metropolice/fr/king.wav" }

soundsMPF[ "bloquez" ] = { "npc/metropolice/fr/lock.wav" }

soundsMPF[ "mode visuel" ] = { "npc/metropolice/fr/acquiringonvisual.wav" }

soundsMPF[ "code 100" ] = { "npc/metropolice/fr/code100.wav" }

soundsMPF[ "passif" ] = { "npc/metropolice/fr/ispassive.wav" }

soundsMPF[ "prêt à partir" ] = { "npc/metropolice/fr/isreadytogo.wav" }

soundsMPF[ "toutes unités sur le suspect" ] = { "npc/metropolice/fr/allunitscloseonsuspect.wav" }

soundsMPF[ "647e" ] = { "npc/metropolice/fr/anyonepickup647e.wav" }

soundsMPF[ "nécrotiques" ] = { "npc/combine_soldier/fr/necrotics.wav" }

soundsMPF[ "canal" ] = { "npc/metropolice/fr/canal.wav" }

soundsMPF[ "bip" ] = { "npc/metropolice/fr/catchthatbliponstabilization.wav" }

soundsMPF[ "vérifier comptage" ] = { "npc/metropolice/fr/checkformiscount.wav" }

soundsMPF[ "conscription volontaire" ] = { "npc/metropolice/fr/citizensummoned.wav" }

soundsMPF[ "insectes" ] = { "npc/metropolice/fr/bugs.wav" }

soundsMPF[ "sujet décédé" ] = { "npc/metropolice/fr/classifyasdbthisblockready.wav" }

soundsMPF[ "rien en vue" ] = { "npc/metropolice/fr/clearandcode100.wav" }

soundsMPF[ "zone condamné" ] = { "npc/metropolice/fr/condemnedzone.wav" }

soundsMPF[ "confirmation data" ] = { "npc/metropolice/fr/confirmadw.wav" }

soundsMPF[ "contrôle 100" ] = { "npc/metropolice/fr/control100percent.wav" }

soundsMPF[ "zone contrôle" ] = { "npc/metropolice/fr/controlsection.wav" }

soundsMPF[ "pc perte contrôle" ] = { "npc/metropolice/fr/cpisoverrunwehavenocontainment.wav" }

soundsMPF[ "pc positions" ] = { "npc/metropolice/fr/cprequestsallunitsreportin.wav" }

soundsMPF[ "nombre de mort" ] = { "npc/metropolice/fr/dbcountis.wav" }

soundsMPF[ "quartier distribution" ] = { "npc/metropolice/fr/distributionblock.wav" }

soundsMPF[ "documentez" ] = { "npc/metropolice/fr/document.wav" }

soundsMPF[ "mort!" ] = { "npc/metropolice/fr/expired.wav" }

soundsMPF[ "rompez pc" ] = { "npc/metropolice/fr/dontmove.wav" }

soundsMPF[ "tirez obstacle" ] = { "npc/metropolice/fr/firetodislocateinterpose.wav" }

soundsMPF[ "tirez exposer" ] = { "npc/metropolice/fr/firingtoexposetarget.wav" }

soundsMPF[ "nécrotiques libres" ] = { "npc/metropolice/fr/freenecrotics.wav" }

soundsMPF[ "là haut" ] = { "npc/metropolice/fr/hesupthere.wav" }

soundsMPF[ "maintenez positions" ] = { "npc/metropolice/fr/holdthisposition.wav" }

soundsMPF[ "enclenchez" ] = { "npc/metropolice/fr/investigate.wav" }

soundsMPF[ "okay" ] = { "npc/metropolice/fr/isgo.wav" }

soundsMPF[ "pc rapports" ] = { "npc/metropolice/fr/localcptreportstatus.wav" }

soundsMPF[ "hostile" ] = { "npc/metropolice/fr/malignant.wav" }

soundsMPF[ "coups feu" ] = { "npc/metropolice/fr/sentencedelivered.wav" }

soundsMPF[ "test loyauté" ] = { "npc/metropolice/fr/standardloyaltycheck.wav" }

soundsMPF[ "grenade" ] = { "npc/metropolice/fr/thatsagrenade.wav" }

soundsMPF[ "unité attente" ] = { "npc/metropolice/fr/unitis10-8standingby.wav" }

soundsMPF[ "unité service" ] = { "npc/metropolice/fr/unitisonduty10-8.wav" }

soundsMPF[ "contact" ] = { "npc/combine_soldier/fr/contact.wav" }

soundsMPF[ "contact confirmé" ] = { "npc/combine_soldier/fr/contactconfim.wav" }

soundsMPF[ "déplacez" ] = { "npc/combine_soldier/fr/displace.wav" }

soundsMPF[ "activez" ] = { "npc/combine_soldier/fr/fullactive.wav" }

soundsMPF[ "echo" ] = { "npc/combine_soldier/fr/echo.wav" }

soundsMPF[ "désignation cible" ] = { "npc/combine_soldier/fr/designatetargetas.wav" }

soundsMPF[ "faux" ] = { "npc/combine_soldier/fr/reaper.wav" }

soundsMPF[ "accès libre" ] = { "npc/combine_soldier/fr/reportingclear.wav" }

soundsMPF[ "aide médical" ] = { "npc/combine_soldier/fr/requestmedical.wav" }

soundsMPF[ "en attente" ] = { "npc/combine_soldier/fr/standingby].wav" }

soundsMPF[ "sécurisez" ] = { "npc/combine_soldier/fr/secure.wav" }

soundsMPF[ "cible" ] = { "npc/combine_soldier/fr/target.wav" }


soundsMPF[ "stabilisation" ] = { "npc/combine_soldier/fr/stabilizationteamhassector.wav" }

soundsMPF[ "position stab" ] = { "npc/combine_soldier/fr/stabilizationteamholding.wav" }

soundsMPF[ "approchez cible" ] = { "npc/combine_soldier/fr/targetcompromisedmovein.wav" }

soundsMPF[ "prêt à poursuivre" ] = { "npc/metropolice/fr/readytoprosecute.wav" }

soundsMPF[ "poursuivre rebelle" ] = { "npc/metropolice/fr/readytoprosecutefinalwarning.wav" }

soundsMPF[ "bienvenue crp" ] = { "npc/common/Bienvenue sur combined RP Citoyen.wav" }

soundsMPF[ "invasion biotique" ] = { "npc/zombinefr/zombine_alert1.wav" }

soundsMPF[ "11 99" ] = { "npc/metropolice/fr/11-99officerneedsassistance.wav" }

soundsMPF[ "code 2" ] = { "npc/metropolice/fr/allunitscode2.wav" }

soundsMPF[ "unites restez vigilantes" ] = { "npc/metropolice/fr/allunitsbol34sat.wav" }

soundsMPF[ "unites rentrez" ] = { "npc/metropolice/fr/allunitsmovein.wav" }

soundsMPF[ "obeir code 3" ] = { "npc/metropolice/fr/allunitsrespondcode3.wav" }

soundsMPF[ "position securisee" ] = { "npc/metropolice/fr/assaultpointsecureadvance.wav" }

soundsMPF[ "localisez le suspect" ] = { "npc/metropolice/fr/allunitsreportlocationsuspect.wav" }

soundsMPF[ "insectes libres" ] = { "npc/metropolice/fr/bugsontheloose.wav" }

soundsMPF[ "aucun 647e en vue" ] = { "npc/metropolice/fr/clearno647no10-107.wav" }

soundsMPF[ "code 7" ] = { "npc/metropolice/fr/code7.wav" }

soundsMPF[ "243" ] = { "npc/metropolice/fr/contactwith243suspect.wav" }

soundsMPF[ "pc compromise" ] = { "npc/metropolice/fr/cpiscompromised.wav" }

soundsMPF[ "agent en danger" ] = { "npc/metropolice/fr/dispatchineed10-78.wav" }

soundsMPF[ "intrusion" ] = { "npc/metropolice/fr/dispreportssuspectincursion.wav" }

soundsMPF[ "nettoyage" ] = { "npc/metropolice/fr/get11-44inboundcleaningup.wav" }

soundsMPF[ "zone industrielle" ] = { "npc/metropolice/fr/industrialzone.wav" }

soundsMPF[ "infection" ] = { "npc/metropolice/fr/infection.wav" }

soundsMPF[ "zone infectee" ] = { "npc/metropolice/fr/infestedzone.wav" }

soundsMPF[ "intervenez" ] = { "npc/metropolice/fr/intercede.wav" }

soundsMPF[ "rebelle 10107" ] = { "npc/metropolice/fr/malcompliant10107my1020.wav" }

soundsMPF[ "besoin d'aide" ] = { "npc/metropolice/fr/needanyhelpwiththisone.wav" }

soundsMPF[ "agent a terre" ] = { "npc/metropolice/fr/officerdowniam10-99.wav" }

soundsMPF[ "potentiel 647e" ] = { "npc/metropolice/fr/possible647erequestairwatch.wav" }

soundsMPF[ "lamineur" ] = { "npc/metropolice/fr/roller.wav" }

soundsMPF[ "en surveillance locale" ] = { "npc/metropolice/fr/stillgetting647e.wav" }

soundsMPF[ "un mort" ] = { "npc/metropolice/fr/wegotadbherecancel10-102.wav" }

soundsMPF[ "tout est sociostable" ] = { "npc/metropolice/fr/wearesociostablethislocation.wav" }


soundsZM[ "invasion" ] = { "npc/zombinefr/zombine_alert2.wav" }

soundsZM[ "bougez" ] = { "npc/zombinefr/zombine_alert3.wav" }

soundsZM[ "cible" ] = { "npc/zombinefr/zombine_alert4.wav" }

soundsZM[ "contact" ] = { "npc/zombinefr/zombine_alert5.wav" }

soundsZM[ "Graaa" ] = { "npc/zombinefr/zombine_alert6.wav" }

soundsZM[ "provenance nécrotique" ] = { "npc/zombinefr/zombine_alert7.wav" }

soundsZM[ "invavite" ] = { "npc/zombinefr/zombine_idle1.wav" }

soundsZM[ "invasion biotique" ] = { "npc/zombinefr/zombine_idle2.wav" }


soundsZM[ "biotique périmètre" ] = { "npc/zombinefr/zombine_idle3.wav" }

soundsZM[ "secteur 0 en danger" ] = { "npc/zombinefr/zombine_idle4.wav" }

soundsV[ "Oui" ] = { "npc/vortiguantfr/yes.wav" }







DarkRP.hookStub{
	name = "canChatSound",
	description = "Whether a chat sound can be played.",
	parameters = {
		{
			name = "ply",
			description = "The player who triggered the chat sound.",
			type = "Player"
		},
		{
			name = "chatPhrase",
			description = "The chat sound phrase that has been detected.",
			type = "string"
		},
		{
			name = "chatText",
			description = "The whole chat text the player sent that contains the chat sound phrase.",
			type = "string"
		}
	},
	returns = {
		{
			name = "canChatSound",
			description = "False if the chat sound should not be played.",
			type = "boolean"
		}
	}
}

DarkRP.hookStub{
	name = "onChatSound",
	description = "When a chat sound is played.",
	parameters = {
		{
			name = "ply",
			description = "The player who triggered the chat sound.",
			type = "Player"
		},
		{
			name = "chatPhrase",
			description = "The chat sound phrase that was detected.",
			type = "string"
		},
		{
			name = "chatText",
			description = "The whole chat text the player sent that contains the chat sound phrase.",
			type = "string"
		}
	},
	returns = {
	}
}

local function CheckChat(ply, text)
	if not GAMEMODE.Config.chatsounds or ply.nextSpeechSound and ply.nextSpeechSound > CurTime() then return end
	local prefix = string.sub(text, 0, 1)
	if prefix == "/" or prefix == "!" or prefix == "@" then return end -- should cover most chat commands for various mods/addons
	for k, v in pairs(sounds) do
		local res1, res2 = string.find(string.lower(text), k)
		if res1 and (not text[res1 - 1] or text[res1 - 1] == "" or text[res1 - 1] == " ") and (not text[res2 + 1] or text[res2 + 1] == "" or text[res2 + 1] == " ") then
			local canChatSound = hook.Call("canChatSound", nil, ply, k, text)
			if canChatSound == false then return end
			ply:EmitSound(table.Random(v), 80, 100)
			ply.nextSpeechSound = CurTime() + GAMEMODE.Config.chatsoundsdelay -- make sure they don't spam HAX HAX HAX, if the server owner so desires
			hook.Call("onChatSound", nil, ply, k, text)
			break
		end
	end
end

local function CheckChat( ply, text )

	if not GAMEMODE.Config.chatsounds or ply.nextSpeechSound and ply.nextSpeechSound > CurTime() then return end
	local prefix = string.sub( text, 0, 1 )
	if prefix ~= "/" and prefix ~= "!" and prefix ~= "@" then -- should cover most chat commands for various mods/addons
	if(ply:Team()==TEAM_CHIEF or ply:Team()==TEAM_REB_PC or ply:Team()==TEAM_POLICE_GHOST or ply:Team()==TEAM_POLICEC or ply:Team()==TEAM_POLICE_RCT or ply:Team()==TEAM_POLICE_05 or ply:Team()==TEAM_POLICE_04 or ply:Team()==TEAM_POLICE_03 or ply:Team()==TEAM_POLICE_02 or ply:Team()==TEAM_POLICE_01 or ply:Team()==TEAM_OTA or ply:Team()==TEAM_GUNPC or ply:Team()==TEAM_OTA_KING or ply:Team()==TEAM_REB_PC or ply:Team()== TEAM_OTA_PRISON) then
		for k, v in pairs( soundsMPF ) do

			local res1, res2 = string.find( string.lower( text ), k )
		
			if res1 and ( not text[ res1 - 1 ] or text[ res1 - 1 ] == "" or text[ res1 - 1 ] == " ") and ( not text[ res2 + 1 ] or text[ res2 + 1 ] == "" or text[ res2 + 1 ] == " ") then

			local canChatSound = hook.Call("canChatSound", nil, ply, k, text)
			if canChatSound == false then return end
			ply:EmitSound(table.Random(v), 80, 100)
			ply.nextSpeechSound = CurTime() + 0 -- make sure they don't spam HAX HAX HAX, if the server owner so desires
			hook.Call("onChatSound", nil, ply, k, text)
			end

		end
	elseif(ply:Team()==TEAM_HOBOH) then 
		for k, v in pairs( soundsZM ) do

			local res1, res2 = string.find( string.lower( text ), k )
		
			if res1 and ( not text[ res1 - 1 ] or text[ res1 - 1 ] == "" or text[ res1 - 1 ] == " ") and ( not text[ res2 + 1 ] or text[ res2 + 1 ] == "" or text[ res2 + 1 ] == " ") then
			local canChatSound = hook.Call("canChatSound", nil, ply, k, text)
			if canChatSound == false then return end
			ply:EmitSound(table.Random(v), 80, 100)
			ply.nextSpeechSound = CurTime() + 10 -- make sure they don't spam HAX HAX HAX, if the server owner so desires
			hook.Call("onChatSound", nil, ply, k, text)			break
			end

		end	
	elseif(ply:Team()==TEAM_VORT) then 
		for k, v in pairs( soundsV ) do

			local res1, res2 = string.find( string.lower( text ), k )
		
			if res1 and ( not text[ res1 - 1 ] or text[ res1 - 1 ] == "" or text[ res1 - 1 ] == " ") and ( not text[ res2 + 1 ] or text[ res2 + 1 ] == "" or text[ res2 + 1 ] == " ") then

				ply:EmitSound( table.Random( v ), 80, 100 )
				ply.nextSpeechSound = CurTime() + GAMEMODE.Config.chatsoundsdelay -- make sure they don't spam HAX HAX HAX, if the server owner so desires
				break
			end

		end		
	elseif(ply:Team()==TEAM_CITIZENF or ply:Team()==TEAM_ANTICF or ply:Team()==TEAM_LOYALF or ply:Team()==TEAM_COOK or ply:Team()==TEAM_CWUF or ply:Team()==TEAM_MAYORF or ply:Team()==TEAM_REBF or ply:Team()==TEAM_REB_MEDF or ply:Team()==TEAM_REB_ELITEF) then 
		for k, v in pairs( soundsF ) do

			local res1, res2 = string.find( string.lower( text ), k )
		
			if res1 and ( not text[ res1 - 1 ] or text[ res1 - 1 ] == "" or text[ res1 - 1 ] == " ") and ( not text[ res2 + 1 ] or text[ res2 + 1 ] == "" or text[ res2 + 1 ] == " ") then

			local canChatSound = hook.Call("canChatSound", nil, ply, k, text)
			if canChatSound == false then return end
			ply:EmitSound(table.Random(v), 80, 100)
			ply.nextSpeechSound = CurTime() + GAMEMODE.Config.chatsoundsdelay -- make sure they don't spam HAX HAX HAX, if the server owner so desires
			hook.Call("onChatSound", nil, ply, k, text)				break
			end

		end
	elseif(ply:Team()==TEAM_CITIZEN or ply:Team()==TEAM_ANTIC or ply:Team()==TEAM_LOYAL or ply:Team()==TEAM_CWUM or ply:Team()==TEAM_CWU or ply:Team()==TEAM_CWUS or ply:Team()==TEAM_REB or ply:Team()==TEAM_REB_MED or ply:Team()==TEAM_REB_ELITE or ply:Team()==TEAM_CHIEF_REBELLE or ply:Team()==TEAM_GUN or ply:Team()==TEAM_MAYOR) then 
		for k, v in pairs( sounds ) do

			local res1, res2 = string.find( string.lower( text ), k )
		
			if res1 and ( not text[ res1 - 1 ] or text[ res1 - 1 ] == "" or text[ res1 - 1 ] == " ") and ( not text[ res2 + 1 ] or text[ res2 + 1 ] == "" or text[ res2 + 1 ] == " ") then

			local canChatSound = hook.Call("canChatSound", nil, ply, k, text)
			if canChatSound == false then return end
			ply:EmitSound(table.Random(v), 80, 100)
			ply.nextSpeechSound = CurTime() + GAMEMODE.Config.chatsoundsdelay -- make sure they don't spam HAX HAX HAX, if the server owner so desires
			hook.Call("onChatSound", nil, ply, k, text)				break
			end

		end

	
	end
	end
end
hook.Add("PostPlayerSay", "ChatSounds", CheckChat)

DarkRP.getChatSound = DarkRP.stub{
	name = "getChatSound",
	description = "Get a chat sound (play a noise when someone says something) associated with the given phrase.",
	parameters = {
		{
			name = "text",
			description = "The text that triggers the chat sound.",
			type = "string",
			optional = false
		}
	},
	returns = {
		{
			name = "soundPaths",
			description = "A table of string sound paths associated with the given text.",
			type = "table"
		}
	},
	metatable = DarkRP
}

function DarkRP.getChatSound(text)
	return sounds[string.lower(text or "")]
end

DarkRP.setChatSound = DarkRP.stub{
	name = "setChatSound",
	description = "Set a chat sound (play a noise when someone says something)",
	parameters = {
		{
			name = "text",
			description = "The text that should trigger the sound.",
			type = "string",
			optional = false
		},
		{
			name = "sounds",
			description = "A table of string sound paths.",
			type = "table",
			optional = false
		}
	},
	returns = {
	},
	metatable = DarkRP
}

function DarkRP.setChatSound(text, sndTable)
	sounds[string.lower(text or "")] = sndTable
end
