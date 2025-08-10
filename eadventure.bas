1 rem ***8 bit adventure***
10 print "{clr}":poke 53280,0:poke 53281,0  
15 print "{grn}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}*** 8 bit island ***{grn}{sret}"
20 print "you wake up feeling excited, it is{sret}finally the day! the day that your{sret}freeze64 magazine arrives by mail.{sret}{sret}freeze64 is your favourite video game{sret}magazine. you are dying to read about{sret}warrior chicken, a new game";
30 print " that{sret}everyone's been talking about. the{sret}game is released today.{sret}{sret}as you get out of bed, you notice a{sret}note left on your bedside table."
40 print "{sret}type {yel}help{grn} for instructions (v0.9.3)"
70 cl=0:wl=0:bs=0:hb=0:mb=0:bk=0:tc=0:rk=0:bt=0:ss=0:ec=0:ty=0:wc=0:fz=0:lc=1:vr=0:wf=1:mn=0:cf=0:sw=0:sr=0:sb=0:sk=0:sl=0:bg=0:sc=0:pw=0:kn=0:bv=0:rl=0:rd=0
71 dim wd$(10)
72 dim l%(20,4):l%(1,4)=3:l%(2,1)=3:l%(2,2)=6:l%(3,2)=2:l%(3,3)=1:l%(4,4)=5:l%(5,2)=9:l%(5,3)=4:l%(5,4)=6:l%(6,1)=2:l%(6,2)=10:l%(6,3)=5:l%(6,4)=7:l%(7,3)=6:l%(7,4)=13:l%(9,1)=5:l%(10,1)=6
73 l%(11,2)=16:l%(11,4)=12:l%(12,2)=15:l%(12,3)=11:l%(12,4)=13:l%(13,2)=14:l%(13,3)=12:l%(13,4)=7:l%(14,1)=13:l%(14,2)=17:l%(15,1)=12:l%(16,1)=11:l%(17,1)=14:l%(17,2)=18:l%(18,1)=17:l%(18,2)=19:l%(19,1)=18:l%(19,2)=20:l%(20,1)=19
80 rem ***main loop***
85 lf=0
90 print: input "{lgrn}type command{grn}";a$:gosub 200: print
100 if mid$(wd$(1),1,3) = "inv" then gosub 400:lf=1
110 if (wd$(1)="look"or wd$(1)="examine") and wd$(2)<>"" then gosub 500:lf=1
115 if wd$(1)="look" and wd$(2)="" then gosub 900:lf=1
120 if wd$(1)="quit" then 20000:lf=1
130 if wd$(1)="n" or wd$(1)="north" or wd$(1)="s" or wd$(1)="south" or wd$(1)="e" or wd$(1)="east" or wd$(1)="w" or wd$(1)="west" then gosub 1000:lf=1
140 if wd$(1)="open" then gosub 1200:lf=1
145 if wd$(1)="talk" then gosub 1500:lf=1
150 if wd$(1)="take" or wd$(1)="get" then gosub 1800:lf=1
155 if wd$(1)="knock" then gosub 10000:lf=1
160 if wd$(1)="buy" then gosub 2000:lf=1
165 if wd$(1)="kill" then gosub 9100:lf=1
170 if wd$(1)="use" then gosub 2500:lf=1
175 if wd$(1)="close" then gosub 1300:lf=1
180 if wd$(1)="sell" then gosub 7000:lf=1
182 if wd$(1)="help" then gosub 11000:lf=1
183 if wd$(1)="save" then gosub 12000:lf=1
184 if wd$(1)="load" then gosub 12100:lf=1
185 if lf=0 then print "sorry i don't understand."
195 goto 80
200 rem ***word separator***
210 for i=0 to 10: wd$(i)="": next: wd=1
220 rem detect spaces
230 for i=1 to len(a$)
240 wd$(0)=mid$(a$,i,1)
250 if wd$(0)=" " then wd=wd+1: next
260 wd$(wd)=wd$(wd)+wd$(0)
270 if wd$(wd)="on"orwd$(wd)="betamax"orwd$(wd)="go"orwd$(wd)="the"or(wd$(wd)="at"andmid$(a$,i+1,1)=" ")orwd$(wd)="my"orwd$(wd)="please"or(wd$(wd)="to"and mid$(a$,i+1,1)=" ")orwd$(wd)="bent"orwd$(wd)="milk"orwd$(wd)="pile"orwd$(wd)="of" then wd$(wd)="": wd=wd-1
280 next
290 return
400 rem ***inventory***
410 print "you are carrying the following items:"
420 ee=0
430 if wl=1 then print "a wallet":ee=1
432 if bs=1 then print "a bus ticket":ee=1
434 if hb=1 then print "a baguette":ee=1
435 if sc=1 then print "a sculpture.":ee=1:
436 if mb=1 and sc=0 then print "a milk bottle":ee=1
438 if bk=1 and sc=0 then print "a bent key":ee=1
440 if tc=1 then print "a pack of trading cards":ee=1
442 if rk=1 then print "some rocks":ee=1
444 if bt=1 then print "a betamax tape":ee=1
446 if ss=1 then print "a slingshot":ee=1
448 if ec=1 then print "a coffee":ee=1
450 if ty=1 then print "a toy":ee=1
452 if wc=1 then print "a brand new copy of warrior chicken":ee=1
454 if fz=1 then print "an issue of freeze64":ee=1
455 if bg=1 then print "a burger":ee=1
456 if vr=1 then print "a video rental card":ee=1
457 if rd=1 then print "a radio":ee=1
458 if mn<>0 then print "$";:print mn;:print "dollars";:ee=1
459 if ee=0 then print "nothing!";
460 print " "
465 return
500 rem ***look at fixed and mobile objects***
510 vf=0
530 if wl=1 and wf=1 and wd$(2)="wallet" then print "a nylon wallet, it has something{sret}inside.":vf=1
535 if wl=1 and wf=0 and wd$(2)="wallet" then print "a nylon wallet, it is empty.":vf=1
532 if rd=1 and wd$(2)="radio" then print "an old am radio.":vf=1
540 if bs=1 and wd$(2)="bus" and wd$(3)="ticket" then print "your bus ticket, ride the bus as much{sret}as you like until 1984!":vf=1
542 if bs=0 and sr=1 and wd$(2)="bus" and wd$(3)="ticket" then print "you can't read it from here.":vf=1
545 if hb=1 and wd$(2)="baguette" then print "a baguette, it is as hard as a bat!":vf=1
550 if mb=1 and wd$(2)="bottle" and sc=0 then print "an empty milk bottle.":vf=1
551 if mb=1 and wd$(2)="bottle" and sc=1 then print "the key is now stuck inside it.":vf=1
552 if mb=1 and wd$(2)="bottle" and sc=2 then print "you sold the sculpture! the bottle is gone.":vf=1
553 if mb=0 and wd$(2)="bottle" and sb=1 and lc=6 then print "i guess the milkman forgot to take it.":vf=1
555 if bk=1 and wd$(2)="key" and sc=0 then print "a bent key, looks fairly artistic.":vf=1
556 if bk=1 and wd$(2)="key" and sc=1 then print "the key is stuck inside the bottle":vf=1
557 if bk=1 and wd$(2)="key" and sc=2 then print "you sold the key as part of the{sret}sculpture.":vf=1
560 if tc=1 and wd$(2)="trading" and wd$(3)="cards" then print "a brand new pack of vampire girl{sret}trading cards.":vf=1 
565 if rk=1 and wd$(2)="rocks" then print "a bunch of small rocks.":vf=1
570 if bt=1 and wd$(2)="tape" then print "a betamax tape, 1983's biggest movie,{sret}games of war.":vf=1
575 if ss=1 and wd$(2)="slingshot" then print "a powerful slingshot with a wooden{sret}handle.":vf=1
580 if ec=1 and wd$(2)="coffee" then print "the rumor is that this coffee is like{sret}rocket fuel.":vf=1
585 if ty=1 and wd$(2)="toy" then print "a small cute purple horse, you don't{sret}want this.":vf=1
590 if wc=1 and (wd$(2)="warrior" and wd$(3)="chicken") then print "this is the game you have been after,{sret}warrior chicken for the c64.":vf=1
595 if fz=1 and wd$(2)="freeze64" then print "your favourite magazine! it has a great{sret}article on warrior chicken.":vf=1
600 if vr=1 and wd$(2)="video" and wd$(3)="rental" and wd$(4)="card" then print "you can use this at the video rental{sret}shop.":vf=1
605 if lc=1 and wd$(2)="closet" and cf=0 then print "your closet is closed":vf=1
610 if lc=1 and wd$(2)="closet" and cf=1 then print "your closet is open":vf=1
615 if lc=1 and ((wd$(2)="bedside" and wd$(3)="table") or wd$(2)="table") then print "it is a small wooden table with a note{sret}on it.":vf=1
620 if lc=1 and wd$(2)="window" then print "you can see the sea from here, your{sret}house is on top of a cliff.":vf=1
625 if lc=1 and wd$(2)="note" then print "the note says:{sret}{sret} hi darling,{sret}{sret} your magazine didn't arrive.{sret}{sret} love,{sret} mom {red}{$73}{$73}{$73}{sret}":vf=1
630 if lc=1 and wd$(2)="bed" then print "your bed looks very soft.":vf=1
635 if lc=2 and wd$(2)="tv" then print "a 14 inch tv, looks ideal for playing{sret}games":vf=1
640 if lc=2 and wd$(2)="sofa" then print "a sofa, there's nothing special about{sret}it":vf=1
645 if lc=2 and wd$(2)="c64" then print "this is the most beautiful home{sret}computer you have ever seen!":vf=1
650 if lc=2 and (wd$(2)="2600" or wd$(2)="atari") then print "it is a little dusty.":vf=1
652 if lc=2 and wd$(2)="posters" then print "most of the posters are for c64 and{sret}atari games. there's also a poster of{sret}a red car.":vf=1
655 if lc=3 and wd$(2)="fridge" and bs=0 then print "there's no point in opening this{sret}fridge, there's never anything in it.{sret}{sret}there's a bus ticket under a fridge{sret}magnet. that's where you normally keep{sret}it.":sr=1:vf=1
657 if lc=3 and wd$(2)="fridge" and bs=1 then print "there's no point in opening this{sret}fridge, there's never anything in it.":vf=1
660 if lc=3 and wd$(2)="pantry" and wl=0 then print "it's full of cans and other things{sret}you don't need. and your wallet is{sret}there too! your mother keeps telling youthat you are too absent-minded and{sret}you will eventually lose your wallet.":vf=1:sw=1
662 if lc=3 and wd$(2)="pantry" and wl=1 then print "you don't need anything from the{sret}pantry.":vf=1
665 if lc=3 and wd$(2)="cooker" then print "last time you used this the fire was{sret}so vast it was headline news.":vf=1
670 if lc=4 and wd$(2)="door" and bk=0 then print "the door is closed, you can see a key{sret}in the lock.":sk=1:vf=1
672 if lc=4 and wd$(2)="door" and bk<>0 then print "the door cannot be opened.":vf=1
675 if lc=4 and bv=0 and wd$(2)="bakery" then print "the bakery's curtains are drawn and{sret}the door is closed. the sign on the{sret}door says closed.":vf=1
677 if lc=4 and bv=1 and wd$(2)="bakery" then print "the bakery's curtains are drawn, the{sret}door is closed. the sign on the door{sret}says closed. a baguette lies on the{sret}ground.":vf=1
680 if lc=4 and wd$(2)="key" and bk=0 and sk=1 then print "the key is in the lock, there's nothing{sret}special about it.":sk=1:vf=1
685 if lc=4 and wd$(2)="key" and bk=1 then print "the door is locked.":vf=1
690 if lc=6 and wd$(2)="convy" and wd$(3)="mart" and mb=0 then print "a convenience shop, there's a bottle on{sret}the ground. perhaps the milkman forgot{sret}to pick it up.":sb=1:vf=1
691 if lc=6 and wd$(2)="convy" and wd$(3)="mart" and mb=1 then print "just a convenience shop.":vf=1
692 if lc=6 and wd$(2)="house" then print "you can see your house from here, it{sret}is the only house on top of the cliff.":vf=1
695 if (lc=7 or lc=13) and wd$(2)="bus" then print "it is old, dirty, and ugly. all buses{sret}are old, dirty and ugly at bit island.":vf=1
700 if lc=9 and wd$(2)="woman" then print "she seems to work here, try talking to{sret}her.":vf=1
705 if lc=10 and wd$(2)="magazines" then print "the only magazine you care about is{sret}freeze64. you don't want the magazines{sret}they sell here.":vf=1
710 if lc=10 and wd$(2)="bubblegum" then print "i can't see it.":vf=1
715 if lc=10 and wd$(2)="sweets" then print "there's a whole counter full of sweets.":vf=1
720 if lc=10 and tc=0 and wd$(2)="trading"and wd$(3)="cards" then print "lots of brand new packs of vampire{sret}girl trading cards.":vf=1
722 if lc=10 and wd$(2)="man" then print "he looks bored":vf=1
725 if lc=11 and wd$(2)="pawn" and wd$(3)="shop" then print "the sign reads ''need money? no id{sret}needed!''":vf=1
730 if lc=12 and wd$(2)="video" and wd$(3)="rental" and wd$(4)="store" then print "the sign says betacine.":vf=1
735 if lc=14 and wd$(2)="mall" then print "you can see some rocks on the ground":vf=1
737 if lc=14 and wd$(2)="rocks" then print "there's a huge pile! you can't take{sret}them all.":vf=1
740 if lc=15 and wd$(2)="man" then print "a skinny man stands behind the{sret}counter. it seems like he works here.":vf=1
745 if lc=15 and (wd$(2)="tape" or wd$(2)="tapes" or wd$(2)="wall" or wd$(2)="movies") then print "every single tape is the same. the only{sret}movie available to rent is games of war.":vf=1
750 if lc=16 and wd$(2)="radio" and rd=1 then print "you already have it.":vf=1:return
751 if lc=16 and wd$(2)="radio" and rd=0 then print "it is an old am radio.":vf=1:return
755 if lc=16 and wd$(2)="guns" and ss=0 then print "you can see a slingshot amongst the{sret}guns.":sl=1:vf=1
756 if lc=16 and wd$(2)="guns" and ss=1 then print "they are just guns.":sl=1:vf=1
760 if lc=16 and wd$(2)="man" then print "he's big, bald, and looks grumpy.":vf=1
765 if lc=16 and wd$(2)="slingshot" then print "a wooden slingshot, it looks powerful.":vf=1
766 if lc=16 and rd=0 and wd$(2)="junk" then print "there's a radio amonst the useless{sret}junk.":rl=1:vf=1
767 if lc=16 and rd=1 and wd$(2)="junk" then print "it is just junk.":vf=1
770 if lc=17 and wd$(2)="coffee" then print "you've heard the coffee here is strong.":vf=1
775 if bg=1 and wd$(2)="burger" then print "it's a big burger in a cardboard box.{sret}it's still a bit warm.":vf=1
780 if lc=18 and bg=0 and (wd$(2)="burgers" or wd$(2)="burger") then print "they look big, fat, and juicy!":vf=1
785 if lc=18 and wd$(2)="kiddy" and (wd$(3)="meal" or wd$(3)="meals") then print "maybe they come with a toy!":vf=1
790 if lc=19 and wd$(2)="computers" then print "c64s, zx spectrums, apple iies, atari 8{sret}bits! just about everything other than{sret}amstrad cpcs.":vf=1
795 if lc=19 and (wd$(2)="c64" or wd$(2)="c64s") then print "oh my god! they are beautiful.":vf=1 
800 if lc=19 and (wd$(2)="atari" or wd$(2)="ataris") then print "mmm... they look nice.":vf=1
805 if lc=19 and (wd$(2)="spectrum" or wd$(2)="spectrums") then print "my friend billy has one of these.":vf=1
810 if lc=19 and (wd$(2)="apple" or wd$(2)="apples" or wd$(2)="iie" or wd$(2)="iies") then print "looks like something an accountant{sret}would use.":vf=1
815 if lc=19 and wc=0 and (wd$(2)="games" or (wd$(2)="warrior" and wd$(3)="chicken")) then print "you can see warrior chicken! the game{sret}you want. i should buy it.":vf=1
817 if lc=19 and wd$(2)="micro" and wd$(3)="bill" then print "bill has the best job! he has a cool{sret}mullet and some people say he has many{sret}videogame world records.":vf=1
820 if lc=20 and (wd$(2)="surfer" or wd$(2)="troll") then print "that troll is huge!":vf=1
830 if sc=1 and wd$(2)="sculpture" then print "this sculpture represents humanity's{sret}centering in the universality of our{sret}biological make-up and transcultural{sret}landscape; combining with the{sret}collective sense of the post-sublime.":vf=1
840 if (lc=10 or lc=15 or lc=16) and wd$(2)="counter" then print "it is a glass and metal counter.":vf=1
898 if vf=0 then print "what about it?"
899 return
900 rem ***look at surroundings***
902 on lc goto 905, 910, 915, 920, 925, 930, 935, 940, 945, 950, 955, 960, 965, 970, 975, 980, 985, 990, 995, 997
905 print "you are in your bedroom, you can see{sret}your closet, bed, bedside table, and{sret}window.":gosub 6200:return 
910 print "you are in your small livingroom, there{sret}are videogame posters on the walls. you{sret}can see your 14 inch tv and your comfy{sret}soft sofa, under the tv, there's a c64{sret}and a 2600.":gosub 6200:return
915 print "you are standing in your kitchen.{sret}there's a fridge, a cooker, and an{sret}open pantry here.":gosub 6200:return
920 print "you are standing in front of a bakery.{sret}the door is closed.":gosub 6200:return
925 print "you are standing in front of the bit{sret}island postal service, to enter{sret}go south.":gosub 6200:return
930 print "you are outside at the side of the road.{sret}behind you to the north is your house,{sret}in front of you to the south is the{sret}convy mart, there are more shops along{sret}this road.":gosub 6200:return
935 print "you are at the bus stop, the bus{sret}leaving to the mall is in front of you.{sret}to board the bus, walk east.":gosub 6200:return
940 print "you are tied up inside the bakery, the{sret}baker has an ax and is dressed like a{sret}clown.":return
945 print "you are in the postal service office. a{sret}woman stands behind the counter.":gosub 6200:return
950 print "you are in the convy mart, magazines,{sret}bubble gum, sweets, and trading{sret}cards are sold here. a man stands{sret}behind the counter.":gosub 6200:return
955 print "you are standing in front of the local{sret}pawn shop, there are rumours that all{sret}sorts of weapons can be bought here.{sret}walk south to enter the pawn shop.":gosub 6200:return
960 print "you are standing in front of the video{sret}rental store, to enter the store, walk{sret}south.":gosub 6200:return
965 print "you are at the bus stop, the bus{sret}in front of you goes back to your house.{sret}{sret}to take the bus, walk east.":gosub 6200:return
970 print "you are standing in front of your local{sret}mall, your hangout, where you feel most{sret}comfortable. on the ground, you can see{sret}some rocks. to enter the mall, walk{sret}south.":gosub 6200:return
975 print "you are inside the video rental store,{sret}here in bit island, you only get{sret}betamax all the walls are covered with{sret}betamax tapes! a man stands behind the{sret}counter.":gosub 6200:return
980 print "you are inside the pawn shop, you see a{sret}huge pile of junk, everything else{sret}appears to be guns! there's a big bald{sret}man behind the counter.":gosub 6200:return
985 print "you are in mega cafe, you can buy extra{sret}strong coffee here.{sret}{sret}{gry3}***price list***************************{grn}* coffee ......................... $2.00":gosub 6200:return
990 print "you are at barron burger, you can buy a{sret}fat barron burger, or a kiddy meal.{sret}{sret}{gry3}***price list***************************{grn}* burger ......................... $4.00* kiddy meal ..................... $4.00":gosub 6200:return
995 print "this is super micro mart, bit island's{sret}biggest computer shop! micro bill is{sret}standing behind the counter, you can{sret}see computers and many games.":gosub 5090:gosub 6200:return
997 print "you are at the beach, this is surfer{sret}territory, hanging out here for too{sret}long is dangerous. you can see a{sret}surfer. or is it a troll?":gosub 6200:return
999 return
1000 rem ***move around***
1005 nl=0
1010 if (wd$(1)="n" or wd$(1)="north") then nl=l%(lc,1)
1020 if (wd$(1)="s" or wd$(1)="south") then nl=l%(lc,2)
1030 if (wd$(1)="w" or wd$(1)="west") then nl=l%(lc,3)
1040 if (wd$(1)="e" or wd$(1)="east") and (lc<>7 and lc<>13)then nl=l%(lc,4)

1050 if nl=0 then print "you can't go that way"
1060 if (wd$(1)="e" or wd$(1)="east") and (lc=7 or lc=13) and bs=1 then gosub 9000:nl=l%(lc,4)
1070 if (wd$(1)="e" or wd$(1)="east") and (lc=7 or lc=13) and bs=0 then print "{lred}you cannot travel without a bus ticket.{grn}{sret}":nl=0
1080 if nl<>0 then lc=nl:gosub 900

1090 return
1200 rem *** open ***
1205 ee=0
1210 if wd$(2)="wallet" and wl=1 and wf=0 then print "you've opened it already. it is empty.":ee=1
1220 if wd$(2)="wallet" and wl=1 and wf=1 then vr=1:mn=mn+3:print "you open the wallet and find a video{sret}rental card and 3 dollars.":wf=0:ee=1
1230 if wd$(2)="bottle" and mb=1 then print "the bottle has no top.":ee=1
1240 if lc=4 and wd$(2)="door" then print "the bakery is closed, the door won't{sret}open.":ee=1
1250 if lc=8 and wd$(2)="door" then print "you are inside the bakery, you can't{sret}get out.":ee=1
1260 if wd$(2)="closet" and lc=1 and cf=0 and cl=0 then cf=1:cl=1:print "you open the closet and find some{sret}clothes. you get changed.":ee=1
1265 if wd$(2)="closet" and lc=1 and cf=0 and cl=1 then cf=1:print "you open the closet.":ee=1
1270 if (lc=1 or lc=2 or lc=3 or lc=5 or lc=6 or lc=9 or lc=10 or lc=11 or lc=12 or lc=15 or lc=16) and wd$(2)="door" then print "that door is already open.":ee=1
1280 if tc=1 and wd$(2)="trading" and wd$(3)="cards" then print "you'll open these later.":ee=1
1285 if ee=0 then print "you can't open that."
1290 return
1300 rem *** close ***
1305 rf=0
1310 if wd$(2)="wallet" and wl=1 then print "it is closed.":rf=1
1320 if wd$(2)="bottle" and mb=1 then print "the bottle has no top":rf=1
1330 if wd$(2)="closet" and cf=1 then cf=0:print "you close the closet.":rf=1
1340 if rf=0 then print "you can't close that"
1400 return
1500 rem ***talk***
1505 tf=0
1510 if lc=9 and cl=1 then print "{cyn}you:{grn}did you deliver my freeze64 today?{sret}{sret}{cyn}woman:{grn}we have delivered all packages{sret}for today including your magazine.{sret}{sret}**perhaps your magazine was stolen!**":tf=1
1520 if lc=10 and cl=1 then print "{cyn}man:{grn}we sell sweets, trading cards,{sret}bubble gum, and magazines. and we are{sret}all out of bubble gum.":gosub 5060:tf=1
1525 if lc=10 and cl=0 then print "{cyn}man:{grn}out in your pjs again?":tf=1
1530 if lc=15 and cl=1 then print "{cyn}man:{grn}do you want to rent games of war?":tf=1:gosub 1600
1535 if lc=15 and cl=0 then print "{cyn}man:{grn}it is pj kid!":tf=1
1540 if lc=16 and sl=0 and ss=0 then print "{cyn}you:{grn}i'm on a text adventure, i need a{sret}gun!{sret}{sret}{cyn}man:{grn}sorry kid, i'm not selling you a{sret}gun. you can buy anything else, or sell{sret}me something if you need the cash.":gosub 5010:tf=1
1542 if lc=16 and sl=1 and ss=0 then print "{cyn}you:{grn}i'm on a text adventure, i need {sret}weapons! what about that slingshot?{sret}{sret}{cyn}man:{grn}that old slingshot? i didn't{sret}think anyone would buy it. what do{sret}you want? buying or selling?":gosub 5010:tf=1
1545 if lc=16 and ss=1 then print "{cyn}you:{grn}hi again!{sret}{sret}{cyn}man:{grn}is there anything i can do for you?{sret}got anything to sell?":gosub 5010:tf=1
1550 if lc=17 or lc=18 then print "no need to talk to anyone here. just{sret}order at the counter.":tf=1
1555 if lc=19 then print "{cyn}bill:{grn}we have plenty of copies of{sret}warrior chicken, it is $25.":tf=1
1560 if lc=20 and cl=1 then print "{cyn}troll:{grn} get out here kid!":tf=1
1570 if lc=20 and cl=0 then print "{cyn}troll:{grn} pj loser!":tf=1
1580 if tf=0 then print "you mumble to yourself."
1590 return
1600 rem renting game
1610 input a$
1630 if (a$="y" or a$="yes") and bt=1 then print "{cyn}man:{grn} hey! you already rented this!"
1640 if (a$="y" or a$="yes") and bt=0 and vr=1 then bt=1:print "{cyn}man:{grn} bring it back in 3 days."
1650 if (a$="y" or a$="yes") and vr=0 then print "{cyn}man:{grn} no card? no video!"
1700 return
1800 rem *** take ***
1810 rf=0
1811 rem wallet
1815 if lc=3 and sw=0 and wd$(2)="wallet" then print "where is it? you can't see your wallet!":rf=1
1820 if wl=1 and wd$(2)="wallet" then print "you already have your wallet.":rf=1
1830 if lc=3 and sw=1 and wl=0 and wd$(2)="wallet" then print "you take your wallet from the pantry.":wl=1:rf=1
1832 rem bus ticket
1835 if lc=3 and sr=0 and wd$(2)="bus" and wd$(3)="ticket" then print "where is it? you can't see the bus{sret}ticket!":rf=1
1840 if bs=1 and wd$(2)="bus" and wd$(3)="ticket" then print "you already have the bus ticket.":rf=1
1845 if lc=3 and sr=1 and bs=0 and wd$(2)="bus" and wd$(3)="ticket" then print "you take the bus ticket.":bs=1:rf=1
1850 rem bottle
1860 if lc=6 and sb=0 and wd$(2)="bottle" then print "where is it? what bottle?":rf=1
1865 if mb<>0 and wd$(2)="bottle" then print "no bottle to take.":rf=1
1870 if lc=6 and sb=1 and mb=0 and wd$(2)="bottle" and sc<>2 then print "you take the bottle.":mb=1:rf=1
1880 rem key
1890 if lc=4 and sk=0 and wd$(2)="key" then print "what key?":rf=1
1900 if bk<>0 and wd$(2)="key" then print "there's no key to take.":rf=1
1910 if lc=4 and sk=1 and bk=0 and wd$(2)="key" then print "you pull the key, it is stuck!{sret}{sret}you pull as hard as you can and it{sret}bends.":bk=1:rf=1 
1920 rem rocks
1930 if lc=14 and rk=1 and wd$(2)="rocks" then print "you have plenty.":rf=1
1940 if lc=14 and rk=0 and wd$(2)="rocks" then print "you take some rocks.":rk=1:rf=1
1950 if lc=1 and wd$(2)="note" then print "you pick up the note, it says:{sret}{sret} hi darling,{sret}{sret} your magazine didn't arrive.{sret}{sret} love,{sret} mom {red}{$73}{$73}{$73}{sret}{sret}{grn}you put the note back down.":rf=1 
1960 if lc=4 and bv=1 and wd$(2)="baguette" then print "you take the baguette.":rf=1:bv=0:hb=1
1980 if rf=0 then print "you can't take that."
1990 return
2000 rem *** buy ***
2005 rf=0
2009 rem convy mart
2010 if lc=10 and mn<3 and wd$(2)="trading" and wd$(3)="cards" then gosub 6010:return
2020 if lc=10 and wd$(2)="trading" and wd$(3)="cards" and tc=1 then print "you don't want more cards today.":rf=1
2040 if lc=10 and wd$(2)="trading" and wd$(3)="cards" and tc=0 then print "you buy a pack of vampire girl trading{sret}cards.":tc=1:mn=mn-3:rf=1
2050 if lc=10 and wd$(2)="sweets" then print "{cyn}man:{grn}i'm not selling you sweets, dude.{sret}{sret}your mother said so.":rf=1
2060 if lc=10 and (wd$(2)="gum" or wd$(2)="bubblegum" or (wd$(2)="bubble" and wd$(3)="gum")) then print "{cyn}man:{grn}all out of bubble gum.":rf=1
2070 rem pawn shop
2080 if lc=16 and mn<7 and wd$(2)="slingshot" then gosub 6010:return 
2085 if lc=16 and mn<15 and wd$(2)="radio" then gosub 6010:return
2090 if lc=16 and wd$(2)="slingshot" and ss=1 then print "they are all out of slingshots.":rf=1
2100 if lc=16 and wd$(2)="slingshot" and sl=1 and ss=0 then print "you buy the slingshot.":ss=1:mn=mn-7:rf=1
2105 if lc=16 and wd$(2)="radio" and rd=1 then print "they are all out of radios":rf=1
2107 if lc=16 and wd$(2)="radio" and rd=0 and rl=0 then print "what radio?":rf=1
2110 if lc=16 and wd$(2)="radio" and rd=0 and rl=1 then print "you buy the radio.":rd=1:mn=mn-15:rf=1
2112 if lc=16 and (wd$(2)="small" or wd$(2)="big")  and wd$(3)="gun" then print "he won't sell you a gun.":rf=1
2120 rem coffee
2130 if lc=17 and mn<2 and wd$(2)="coffee" then gosub 6010:return
2140 if lc=17 and ec=1 and wd$(2)="coffee" then print "you can only carry one.":rf=1
2150 if lc=17 and ec=0 and wd$(2)="coffee" then print "you buy a coffee":mn=mn-2:ec=1:rf=1
2160 rem burger
2170 if lc=18 and mn<4 and wd$(2)="burger" then gosub 6010:return
2180 if lc=18 and bg=1 and wd$(2)="burger" then print "you can only carry one.":rf=1
2190 if lc=18 and bg=0 and wd$(2)="burger" then print "you buy a burger":mn=mn-4:bg=1:rf=1
2200 if lc=18 and mn<4 and wd$(2)="kiddy" and wd$(3)="meal" then gosub 6010:return
2210 if lc=18 and bg=1 and wd$(2)="kiddy" and wd$(3)="meal" then print "you can only carry one burger":rf=1:goto 2230
2220 if lc=18 and ty=1 and wd$(2)="kiddy" and wd$(3)="meal" then print "you can only carry one toy":rf=1
2230 if lc=18 and bg=0 and ty=0 and wd$(2)="kiddy" and wd$(3)="meal" then print "you buy a burger and a toy":mn=mn-4:bg=1:ty=1:rf=1
2250 rem videogame
2260 if lc=19 and mn<25 and wd$(2)="warrior" and wd$(3)="chicken" then gosub 6010:return
2270 if lc=19 and mn>=25 and wd$(2)="warrior" and wd$(3)="chicken" and wc=1 then print "you can only need one.":rf=1
2280 if lc=19 and mn>=25 and wd$(2)="warrior" and wd$(3)="chicken" and wc=0 then mn=mn-25:print "you buy the game! yes!.":wc=1:rf=1
2290 if rf=0 then print "buy what?"
2300 return 
2500 rem *** use ***
2510 rf=0
2520 if rd=1 and wd$(2)="radio" and wd$(3)<>"with" then print "it doesn't work, i guess it needs{sret}batteries.":rf=1
2530 if mb=1 and bk=1 and sc=0 and ((wd$(2)="bottle" and wd$(3)="with" and wd$(4)="key") or (wd$(2)="key" and wd$(3)="with" and wd$(4)="bottle")) then print "you have made a sculpture!":sc=1:rf=1
2540 if ec=1 and wd$(2)="coffee" then print "you feel so awake! like you have super{sret}powers.":ec=0:pw=1:rf=1
2550 if bg=1 and wd$(2)="burger" then print "yum! that's good!":bg=0:rf=1
2560 if lc=2 and wd$(2)="c64" and wc=0 then print "maybe later after you buy warrior{sret}chicken.":rf=1
2561 if lc=2 and wd$(2)="c64" and wc=1 then goto 9720
2570 if lc=2 and (wd$(2)="2600" or wd$(2)="atari") then print "wow! that was fun! you should play the{sret}2600 more often.":rf=1 
2580 if lc=2 and wd$(2)="tv" then print "you turn on the tv and then turn it off{sret}again. there's never anything to watch.{sret}games are much more fun.":rf=1
2585 if lc=2 and wd$(2)="sofa" then print "you only sit there to play games.":rf=1
2590 if lc=3 and wd$(2)="cooker" then print "no way!":rf=1
2600 if lc=1 and wd$(2)="bed" then print "you are not sleepy.":rf=1
2610 if (lc=7 or lc=13) and wd$(2)="bus" then print "if you want to ride the bus, you have{sret}to board it by walking east.":rf=1
2620 if wd$(2)="bathroom" or wd$(2)="toilet" then print "you have to find one first.":rf=1
2630 if wd$(2)="drugs" then print "winners don't use drugs.":rf=1
2640 if lc=16 and (wd$(2)="guns" or wd$(2)="gun") then print "that's a bad idea.":rf=1 
2900 if rf=0 then print "you can't use that here."
3000 return 
5000 rem *** price lists ***
5010 print "{sret}{sret}{gry3}***price list***************************{grn}"
5020 if rd=0 then print "* radio......................... $15.00"
5030 if ss=0 and sl=1 then print "* slingshot...................... $7.00"
5040 print "* big gun..................... $1100.00"
5045 print "* small gun.................... $300.00"
5050 return
5060 print "{sret}{sret}{gry3}***price list***************************{grn}"
5070 print "* trading cards................... $3.00* sweets.......................... $0.50"
5080 return
5090 print "{sret}{sret}{gry3}***price list***************************{grn}"
5100 print "* warrior chicken................ $25.00* 8 bit island ..................... tba* amiga ............................ tba"
5110 return
6000 rem *** money messages ***
6010 print "you don't have enough money":return
6200 rem *** exists ***
6210 print "{sret}{sret}exits to the: ";
6220 if l%(lc,1)<>0 then print "{lred}north ";
6230 if l%(lc,2)<>0 then print "{lgrn}south ";
6240 if l%(lc,3)<>0 then print "{pur}west ";
6250 if l%(lc,4)<>0 then print "{cyn}east ";
6260 print"{sret}"
6270 return
7000 rem *** sell ***
7010 rv=0
7020 if lc=16 and wd$(2)="toy" and ty=1 then print "{cyn}man:{grn}you can have $2 for it, this is{sret}quite a rare toy.{sret}{sret}{cyn}you:{grn}ok, i'll take it.":mn=mn+2:ty=0:rv=1
7030 if lc=16 and wd$(2)="key" and bk=1 then print "{cyn}man:{grn}looks ok, but i've seen better{sret}sculptures than this. you can have $4.{sret}{sret}{cyn}you:{grn}ok! i'll take it!":mn=mn+4:bk=0:rv=1
7040 if lc=16 and wd$(2)="bottle" and mb=1 then print "{cyn}man:{grn}where did you get that? that{sret}belongs to the milkman.{sret}{sret}{cyn}you:{grn}mmmm...yes, i'm just keeting it{sret}safe for him.":rv=1
7050 if lc=16 and wd$(2)="sculpture" and sc=1 then print "{cyn}man:{grn}could it be? could this be the lost piero manzoni sculpture? you can have{sret}$200.00 for it!{sret}{sret}{cyn}you:{grn}i hoped i would get more. ok, i'll take $200, but you owe me a favour.":sc=2:mn=mn+200:rv=1:mb=0:bk=0
7060 if rv=0 then print "{cyn}man:{grn}i don't want that.{sret}{sret}{cyn}you:{grn}fair enough.":rv=1
8000 return
9000 rem ***ride the bus***
9010 print "{clr}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{down}{down}{down}{down}{down}{down}{down}{down}{down}{down}{yel}you ride the bus..."
9020 print "{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{grn}[press any key]"
9030 poke 198,0: wait 198,1 
9040 print "{clr}"
9044 rem clear keyboard buffer
9045 poke 198,0
9050 return
9100 rem ***kill troll***
9110 if lc=20 and wd$(2)="troll" and (wd$(3)="" or (wd$(3)="with" and wd$(4)="hands")) then goto 9600
9120 if lc=20 and wd$(2)="troll" and wd$(3)="with" and wd$(4)="slingshot" and ss=1 and rk=0 then goto 9610
9130 if lc=20 and wd$(2)="troll" and wd$(3)="with" and wd$(4)="slingshot" and ss=1 and rk=1 and wc=0 and pw=0 then goto 9620
9135 if lc=20 and wd$(2)="troll" and wd$(3)="with" and wd$(4)="slingshot" and ss=1 and rk=1 and wc=0 and pw=1 then goto 9680
9140 if lc=20 and wd$(2)="troll" and wd$(3)="with" and wd$(4)="slingshot" and ss=1 and rk=1 and wc=1 then goto 9630
9150 if lc=20 and wd$(2)="troll" and wd$(3)="with" and wd$(4)="baguette" and hb=1 and wc=0 then goto 9640
9155 if lc=20 and wd$(2)="troll" and wd$(3)="with" and wd$(4)="baguette" and hb=1 and wc=1 then goto 9650
9160 if lc=20 and wd$(2)="troll" and wd$(3)="with" then print "you can't kill the troll with that.{sret}";:rv=1
9170 if lc=20 and wd$(2)="surfer" then print "you'll only fight the surfer if he is a{sret}troll.":rv=1
9180 if lc<>20 then print "there's nothing to kill here.":rv=1
9190 if rv=0 and wd$(2)<>"troll" and wd$(2)<>"surfer" then print "you can't kill that.":rv=1
9500 return
9600 print "you attack the troll bare handed and as{sret}soon as you do, you regret it. the{sret}troll is massive, he doesn't even{sret}attempt to block your punches, you hit{sret}him and he laughs! the troll hits you{sret}once and you die.{sret}{sret}ending 1/8 (bad ending)":goto 9800
9610 print "you grab your trusty wooden slingshot,{sret}get ready to take aim and quickly{sret}realise that you have nothing to shoot{sret}at the troll. in a panic, you throw{sret}your slingshot at the troll and it{sret}bounces off his head. the troll rushes{sret}at you and hits you.";
9615 print "{sret}{sret}you die.{sret}{sret}ending 2/8 (bad ending)":goto 9800
9620 print "you grab your trusty wooden slingshot{sret}and a rock and take aim at the troll.{sret}you shoot and it is the perfect shot,{sret}you hit him right between the eyes! the{sret}troll screams in agony and starts{sret}running towards you. you run back{sret}towards the mall but ";
9625 print "the troll is a{sret}fast runner and quickly catches up.{sret}{sret}the troll grabs you and slams you{sret}against the wall.{sret}{sret}you die.{sret}{sret}ending 3/8 (bad ending)":goto 9800
9630 print "you grab your trusty wooden slingshot{sret}and a rock and take aim at the troll.{sret}you shoot and it is the perfect shot,{sret}you hit him right between the eyes! the{sret}troll screams in agony and starts{sret}running towards you. you run back{sret}towards the mall but ";
9632 print "the troll is a{sret}fast runner and quickly catches up.{sret}{sret}as you round the corner and start{sret}running up the stairs to the door, you{sret}drop your game! the troll stops and{sret}takes your warrior chicken cartridge.{sret}{sret}you survived but you lost your game and";
9633 print "{sret}you didn't recover your stolen freeze64.{sret}ending 4/8 (ok ending)":wk=0:goto 9800
9640 print "you take your bagette and demand that{sret}the troll gives you back your freeze64.{sret}the trolls laughs and takes a swing at{sret}you, but you block him with the{sret}baguette, the troll's fist smashes into{sret}the rock hard bread. the troll hits the{sret}ground in agony";
9642 print " clenching his right{sret}fist with his left hand and drops{sret}your magazine which you quickly grab{sret}and run. you run as fast as you can{sret}back home with your magazine. your{sret}quest has ended, you survived and you{sret}recovered your magazine.";
9643 print "{sret}{sret}ending 5/8 (good ending)":fz=1:goto 9800
9650 print "you take your bagette and demand that{sret}the troll gives you back your freeze64.{sret}the trolls laughs and takes a swing at{sret}you, but you block him with the{sret}bagette, the troll's fist smashing into{sret}the rock hard bread. the troll hits the{sret}ground in agony";
9660 print " clenching his right{sret}fist with his left hand and he drops{sret}your magazine which you quickly grab{sret}and run. you run as fast as you can{sret}back home with your magazine. your{sret}quest has ended, you survived and you{sret}recovered your magazine ";
9670 print "and you have a{sret}great game to play later today, warrior{sret}chicken!{sret}{sret}ending 6/8 (best ending?)":fz=1:goto 9800
9680 print "you grab your trusty wooden slingshot{sret}and a rock and take aim at the troll.{sret}you shoot and it is the perfect shot,{sret}you hit him right between the eyes! the{sret}troll screams in agony and starts{sret}running towards you. you run back{sret}towards the mall and ";
9690 print "the troll is a fastrunner but so are you!, the troll tries{sret}to grab you and he just misses you.{sret}{sret}you barely get away.{sret}{sret}ending 7/8 (ok ending)":goto 9800
9700 print "you wake up inside the bakery, then run{sret}towards the door and find that it is{sret}locked. you turn around to see if{sret}there’s another way out and you catch a{sret}glimpse of a clown.{sret}{sret}you die.{sret}{sret}secret (horrific ending)"
9710 print "{sret}{sret}secret ending achieved!":goto 9800
9720 print "you plug in your brand new copy of{sret}warrior chicken into your c64. the{sret}game is amazing! you play for hours{sret}and hours, completely forgetting about{sret}your lost freeze64 magazine.{sret}{sret}you have completed your quest!{sret}{sret}ending 8/8 (the gamer ending)":goto 9800
9800 print "{sret}score:";:print int((mn/40)+cl+wl+bs+hb+mb+bk+tc+rk+bt+ss+ec+ty+wc+(fz*20)+vr+sw+sr+sb+sk+sl+bg+sc+pw+kn+bv)
9810 print "[press any key]"
9820 poke 198,0: wait 198,1
9830 print "{clr}{grn}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}*** credits ***{grn}{sret}{sret}"
9840 print "development: gpowerf{sret}"
9850 print "qa: gpowef, jp, and annah{sret}"
9860 print "copyright: guillermo power{sret}"
9870 print "[press any key]"
9880 poke 198,0: wait 198,1
9900 goto 20000
10000 rem *** knock ***
10005 rv=0
10010 if (lc=5 or lc=6 or lc=11 or lc=12) and wd$(2)="door" then print "you knock on the shop door, but there's no need. it is open.":rv=1
10020 if lc=4 then rv=1:gosub 10100
10030 if rv=0 then print "you can't knock on that."
10040 return
10100 kn=kn+1
10110 if kn=1 and wd$(2)="door" then print "the baker leans out of the window.{sret}{sret}{cyn}baker:{grn}stop knocking!"
10120 if kn=2 and wd$(2)="door" then print "the baker leans out of the window.{sret}{sret}{cyn}baker:{grn}damn it kid! stop knocking!"
10130 if kn=3 and wd$(2)="door" then print "the baker leans out of the window.{sret}{sret}{cyn}baker:{grn}bloody hell kid! stop it now!!!"
10140 if kn=4 and wd$(2)="door" then print "the baker leans out of the window with abaguette and throws it at you.{sret}thanfully,the baguette misses you and{sret}crashes into the ground cracking the{sret}pavement. {sret}{sret}{cyn}baker:{grn} bloody hell kid! stop it now!!!":bv=1
10150 if kn>4 and wd$(2)="door" then print "the baker growls loudly from inside the bakery."
10160 if kn>15 and wd$(2)="door" then goto 9700
10165 return
11000 rem *** help ***
11010 print "{clr}"
11020 print "{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}{rght}help"
11030 print "{sret}{lgrn}common verbs:{grn}look, get, talk, use, buy, sell, kill, go, knock, examine"
11040 print "{sret}{lgrn}common prepositions:{grn}with"
11050 print "{sret}{lgrn}sentences:{grn}the basic sentence is as{sret}follows:{sret}{sret}[verb][subject]"
11060 print "{sret}{lgrn}complex sentences:{grn}the game's natural{sret}language processing logic running on{sret}the mighty c64 is capable of{sret}understanding more. for example:"
11070 print "{sret}look at the window{sret}"
11080 print "{sret}{lgrn}goal:{grn}this game has multiple endings,{sret}try to find them all.{sret}"
11500 return 
12000 rem *** save game ***
12010 print "saving game... please wait."
12020 open 1,8,2,"@0:8bit.sav,s,w"
12025 if st<>0 then gosub 13000:return
12030 print#1,cl:print#1,wl:print#1,bs:print#1,hb:print#1,mb:print#1,bk:print#1,tc:print#1,rk:print#1,bt:print#1,ss:print#1,ec:print#1,ty:print#1,wc:print#1,fz:print#1,lc:print#1,vr:print#1,wf:print#1,mn:print#1,cf:print#1,sw:print#1,sr:print#1,sb:print#1,sk:print#1,sl:print#1,bg:print#1,sc:print#1,pw:print#1,kn:print#1,bv:print#1,rl:print#1,rd
12040 close 1
12045 if st<>0 then gosub 13000:return
12050 print "game saved successfully."
12060 return
12100 rem *** load game ***
12110 print "loading game... please wait."
12120 open 1,8,2,"0:8bit.sav,s,r"
12130 if st<>0 then gosub 13000:return
12140 input#1,cl:input#1,wl:input#1,bs:input#1,hb:input#1,mb:input#1,bk:input#1,tc:input#1,rk:input#1,bt:input#1,ss:input#1,ec:input#1,ty:input#1,wc:input#1,fz:input#1,lc:input#1,vr:input#1,wf:input#1,mn:input#1,cf:input#1,sw:input#1,sr:input#1,sb:input#1,sk:input#1,sl:input#1,bg:input#1,sc:input#1,pw:input#1,kn:input#1,bv:input#1,rl:input#1,rd
12145 if st<>0 then print"{red}error reading save file!":gosub 13000:return
12150 close 1
12160 print "game loaded."
12170 print "{clr}":gosub 900
12180 return
13000 rem *** disk error handler ***
13010 open 15,8,15,"i"
13020 input#15,en,em$,et,es
13030 close 15
13040 print "{red}disk error: ";em$
13050 close 1 : rem attempt to close the data channel
13060 return
20000 poke 53280,14:poke 53281,6:print "{clr}{sret}{lblu}thank you for playing":end



   
