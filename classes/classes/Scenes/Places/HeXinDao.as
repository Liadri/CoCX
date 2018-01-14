/**
 * ...
 * @author Ormael
 *
 * Simple village for soul cultivators He'xin'dao - River Island
 */

package classes.Scenes.Places {

import classes.*;
import classes.GlobalFlags.kFLAGS;
import classes.CoC;
import classes.GlobalFlags.kACHIEVEMENTS;
import classes.Scenes.Areas.Forest.TentacleBeast;
import classes.Scenes.Areas.Mountain.HellHound;
import classes.Scenes.Areas.Swamp.CorruptedDrider;
import classes.Scenes.Dungeons.HiddenCave.BossGolems;
import classes.Scenes.Places.HeXinDao.*;
import classes.Scenes.Monsters.*;
import classes.Scenes.NPCs.Jeniffer;
import classes.Scenes.NPCs.ChiChiFollower;
import classes.Scenes.NPCs.Jinx;
import classes.Scenes.NPCs.Syth;
import classes.Scenes.NPCs.Rangiku;
//import classes.Scenes.Places.HeXinDao.*;
//import classes.Items.Armor;
//import classes.Scenes.Dungeons.DeepCave.ValaScene;

public class HeXinDao extends BaseContent
{

    public var ignisarenaseer:IgnisArenaSeerScene = new IgnisArenaSeerScene();
    public var chichiScene:ChiChiFollower = new ChiChiFollower();
    //public var TFmerch:MogaHen = new MogaHen();

    public function HeXinDao()
    {

    }

    public function riverislandVillageStuff():void {
        spriteSelect(-1);
        clearOutput();
        outputText("He'Xin'Dao is large sized village placed on many various sized islands in the middle of large river that flow from east ot west. Aside from bridges connecting each of the island to others, two larger ones connects them as whole to both sides of the river serving as only point of access to it.  Protection formations laid out preventing from entering by swimming throu the river directly to any of the smaller islands, which force anyone to use bridges if their wish to enter.\n");
        //outputText("\n\nNear one of major briges is located merchant area with various smaller or larger places where all visitors can buy or sell various items. Among then two attracts most attention with first been largest stall here and other largest shop. On almsot opposite side of village near other brige is located medium sized shop with sign indicating it govern local exchanges and transformation items market.");
        //outputText("\n\nAt the island located on west end of He'Xin'Dao you see one of biggest buildings here. From sounds of weapon clashing it seems to be some kind of local arena.");
        //outputText("\n.");	//Z czasem jak bede dodawac miejsca opis wioski bedzie rozbudowywany :P
        riverislandMenuShow();
    }

    public function riverislandMenuShow():void {
        menu();
        addButton(0, "Merchant", golemmerchant);
        addButton(1, "TFspec/Exch", mogahenmerchant);
        addButton(2, "SoulEquip", soulequipmentmerchant);
        addButton(3, "SoulArrow", soularrowmerchant);
        //addButton(5, "", ); siedziba lokalnej grupy zrzeszającej soul cultivators - PC aby potem pojsc dalej bedzie musial dolaczyc tutaj (pomyslec nad wiarygodnym sposobem zmuszenia go do tego - moze jakies ciekawe itemy/inne rzeczy dla czlonkow beda a miejsce sie zwolni jak wywala tak goblinke tworzynie golemow, ktora potem oczywiscie wcisnie sie do obozu PC aby w spokoju rozwijac sie w tworzeniu golemow itp.)
        //addButton(6, "", ); jakies miejsce aby zdobywac gems lub/i EXP - moze jakies zadania tu zlecane czy cos w tym stylu?
        addButton(7, "Arena", soularena);
        addButton(8, "Restaurant", restaurantShiraOfTheEast);
        if (flags[kFLAGS.CHI_CHI_AFFECTION] >= 20 && flags[kFLAGS.CHI_CHI_FOLLOWER] < 2) addButton(13, "Chi Chi", chichiScene.MeetingChiChiInHeXinDao);
        addButton(14, "Leave", camp.returnToCampUseOneHour);
    }
    public function golemmerchant():void {
        clearOutput();
        outputText("You enter a shop that got sign over the entrance titled 'Soul Items'.  Inside you see few stalls with similar looking items put on the display.  Actually it not seems this merchant got 'a wide' choice of things but for someone at the beginning of soul cultivator road it's probably enough.  Sensing some movements from the corner of the shop that is pernamently covered in darkness a person appearing without making any sound.  'He' is around five feet tall with outer appearance of some kind of demonic monster. ");
        if (flags[kFLAGS.FOUND_CATHEDRAL] > 0) outputText("But he do looks quite similar to the gargoyle from the cathedral.");
        outputText("\n\n\"<i>Welcome to my master's shop dear customer. Feel free to look around,</i>\" he says. \n\n");
        if (flags[kFLAGS.CODEX_ENTRY_GOLEMS] <= 0) {
            flags[kFLAGS.CODEX_ENTRY_GOLEMS] = 1;
            outputText("<b>New codex entry unlocked: Golems!</b>\n\n")
        }
        menu();
        var buyItem:Function = curry(confirmBuy,golemmerchant,"Golem",1);
        var introText:String = "\"While you reach toward the one of the pills on the display golem says, \\\"<i>";
        var costText:String = " Interested?  It is <b>";
        var endText:String = " gems</b></i>.\"";
        function sayLine(itype:ItemType,desc:String):String{
            return introText+desc+costText+itype.value+endText;
        }
        addButton(0, "LGSFRecovPill", buyItem,consumables.LG_SFRP,
                sayLine(consumables.LG_SFRP,"It's quite useful item for all soul cultivators, this little pill can help you restore some of used up soulforce.")).hint("Low-grade Soulforce Recovery Pill.");
        addButton(1, "Bag of Cosmos", buyItem,consumables.BAGOCOS,
                sayLine(consumables.BAGOCOS,"It's quintessential item for all soul cultivators, this little bag can hold much more things inside that it own size.")).hint("Bag of Cosmos.");
        if (player.findPerk(PerkLib.JobSoulCultivator) >= 0) {
            addButton(2, "Triple Thrust", buyItem,consumables.TRITMAN,
                    sayLine(consumables.TRITMAN,"It's manual for Triple Thrust, this simple technique allows to unleash three thrusts that will became stronger and stronger as you train your body and soul."),
                    "\n\nWherever you gonna try to go deeper into all that 'soulforce' stuff or not at least you now got something to begin.  Although seems even name of the manual mentioning thrusting seems like it could have been influenced by this realm nature...or it's just a coincidence.  "
            ).hint("Triple Thrust Manual.");
            addButton(3, "Draco Sweep", buyItem,consumables.DRASMAN,
                    sayLine(consumables.DRASMAN,"It's manual for Draco Sweep, this simple technique allows to unleash attack that would strike in wide arc before you.  Perfect when you fight group of enemies and it also becoming more powerful as long you would train your body and soul."),
                    "\n\nWherever you gonna try to go deeper into all that 'soulforce' stuff or not at least you now got something to use when figthing group of enemies.  Although you not meet often so far more than singular enemy at once you're sure that deeper in this forsaken realm you will face groups or maybe even hordes of demons at once and would need something to deal with them.  "
            ).hint("Draco Sweep Manual.");
            addButton(4, "Many Birds", buyItem,consumables.MABIMAN,
                    sayLine(consumables.MABIMAN,"It's manual for Many Birds, this simple technique allows to project a figment of your soulforce as a crystal traveling at extreme speeds that will became stronger and stronger as you train your body and soul."),
                    "\n\nWherever you gonna try to go deeper into all that 'soulforce' stuff or not at least you now got something to begin.  Although seems name of the manual is odd but it makes you remember something...but what and from where you not certain.  "
            ).hint("Many Birds Manual.");
        }
        if (player.findPerk(PerkLib.SoulWarrior) >= 0) {
            addButton(5, "MGSFRecovPill", buyItem,consumables.MG_SFRP,
                    sayLine(consumables.MG_SFRP,"It's quite useful item for all cultivators at Soul Personage or above stage, this small pill can help you restore some of used up soulforce and it would be much more than the low-grade one.")).hint("Mid-grade Soulforce Recovery Pill.");
            addButton(6, "Comet", buyItem,consumables.COMETMA,
                    sayLine(consumables.COMETMA,"It's manual for Comet, this technique allows to project a shard of soulforce, which will come crashing down upon your opponent as a crystalline comet.  Perfect when you fight group of enemies and it also becoming more powerful as long you would train your body and soul."),
                    "\n\nWherever you gonna try to go deeper into all that 'soulforce' stuff or not at least you now got something to use when figthing group of enemies.  Although you not meet often so far more than singular enemy at once you're sure that deeper in this forsaken realm you will face groups or maybe even hordes of demons at once and would need something to deal with them.  "
            ).hint("Comet Manual.");
            addButton(7, "V P Trans", buyItem,consumables.VPTRMAN,
                    sayLine(consumables.VPTRMAN,"It's manual for Violet Pupil Transformation, this advanced technique allows to channel soulforce into regenerative power that would fill whole body allowing recovering even from a brink of a death.  It only flaw is that it constantly drain cultivator soulforce so you could end in a tight situation without enough soulforce to use other skills."),
                    "\n\nSeems like it's similar to healing spell soul skill and on top of that the one which isn't one time used one time healed but with enough soulforce could be kept active for very long period of time.  It should give you another edge during your crusade against demons.  Additionaly ability to healing from brink of death could prove to be usefull in future fights.  "
            ).hint("Violet Pupil Transformation Manual.");
        }
        if (player.findPerk(PerkLib.SoulOverlord) >= 0) {
            addButton(10, "HGSFRecovPill", buyItem,consumables.HG_SFRP,
                    sayLine(consumables.HG_SFRP,"It's quite useful item for all cultivators at Soul Personage or above stage, this small pill can help you restore some of used up soulforce and it would be much more than the low-grade one.")).hint("High-grade Soulforce Recovery Pill.");
        }
        addButton(13, "IncenOfInsig", buyItem,consumables.INCOINS,
                sayLine(consumables.INCOINS,"These incenses are quite special. They will grant you visions if only for a moment while meditating. This should help you find the wisdom and insight you need.")).hint("Incense of Insight.");
        addButton(14, "Back", riverislandVillageStuff);
        statScreenRefresh();
    }
    private function debitItem(returnFunc:Function,shopKeep:String,priceRate:int,itype:ItemType,onBuy:String):void{
        var value:int = itype.value * priceRate;
        if (player.gems < value) {
            clearOutput();
            outputText("\n\n"+shopKeep+" shakes his head, indicating you need " + String(value - player.gems) + " more gems to purchase this item.");
            doNext(returnFunc);
        }
        else {
            player.gems -= value;
            outputText(onBuy);
            inventory.takeItem(itype, returnFunc);
            statScreenRefresh();
        }
    }
    private function confirmBuy(returnFunc:Function,shopKeep:String,priceRate:int,itype:ItemType,descString:String,onBuyString:String="\n"):void{
        clearOutput();
        outputText(descString);
        doYesNo(curry(debitItem,returnFunc,shopKeep,priceRate,itype,onBuyString),returnFunc);
    }

    public function mogahenmerchant():void {
        clearOutput();
        outputText("You enter a shop that got sign over the entrance titled 'Transformative Items and Exchanges'.  Inside you see few stalls with many types of the items put on the display.  Most of them you have already seen somewhere but few seems to been quite rare ones as you not seen many of them so far or at least never seen in such large amounts gathered in one place.");
        outputText("\n\nWhen you're looking over the stalls human owner almost silently approched you but compared to other shop you have seen in this islands Moga Hen by clearing his throat attracts your attention to himself.  After you turned toward him, smiling at you like a cat at the mouse, he first breaks the silence.");
        outputText("\n\n\"<i>Welcome to my humble shop dear and precious customer. What need bring you here today? To repair some damage by using casual picked item or some specific change to attain? Or maybe you need to exchange some gems or spirit stones? I could even give you a fair price on special items that are useless for non-cultivators.</i>\" Each word sounds almost like it was repeated endless times.\n\n");
        var buyItem:Function = curry(confirmBuy,mogahenmerchant,"Moga",3);
        var introText:String = "While you point toward the one of the items on the display merchant says, \"<i>It's item to embrace the ";
        var costText:String = " in you.  Interested?  It is merely <b>";
        var endText:String = " gems</b></i>.\"";
        var onBuyString:String="\n\nAfter you give Hen gems he hand over to you purchased transformative item. ";
        function sayLine(itype:ItemType,desc:String):String{
            return introText+desc+costText+(itype.value*3)+endText;
        }

        menu();
        addButton(0, "1st Stall", Tier1).hint("Check out first of stalls with a cheapest TF items.");
        addButton(1, "2nd Stall", Tier2).hint("Check out second of stalls with a cheapest TF items.");
        addButton(2, "3rd Stall", Tier3).hint("Check out stall with more expensive TF items.");
        addButton(3, "4th Stall", Tier4).hint("Check out stall with most expensive TF items.");
        addButton(5, "5th Stall", Tier5).hint("Check out stall with most exotic TF items.");		//specjalne type TF jak ectoplasm ^^
        //addButton(10, "Talk", TalkWithMogaHen).hint("Talk with shopkeeper.");
        addButton(11, "Sell", sellItemsForSpiritStones).hint("Sell items for spirit stones.");
        addButton(12, "Exchange", exchangeGemsToSpiritStonesorReverse).hint("Exchange gems to spirit stones or spirit stones to gems.");
        addButton(14, "Back", riverislandVillageStuff);
        statScreenRefresh();
        //buyItem,consumables.,sayLine(consumables.,""),onBuyString
        function Tier1():void {
            menu();
            addButton(0, "B.Gossr", buyItem,consumables.B_GOSSR,sayLine(consumables.B_GOSSR,"drider"),onBuyString).hint("Buy a bundle of black, gossamer webbing.");
            addButton(1, "BeeHony", buyItem,consumables.BEEHONY,sayLine(consumables.BEEHONY,"bee"),onBuyString).hint("Buy a small vial filled with giant-bee honey.");
            addButton(2, "BladeGrass", buyItem,consumables.BLADEGR,sayLine(consumables.BLADEGR,"mantis"),onBuyString).hint("Buy a blade shaped grass.");
            addButton(3, "CanineP", buyItem,consumables.CANINEP,sayLine(consumables.CANINEP,"dog"),onBuyString).hint("Buy a Canine pepper.");
            addButton(4, "Equinum", buyItem,consumables.EQUINUM,sayLine(consumables.EQUINUM,"horse"),onBuyString).hint("Buy a vial of Equinum.");
            addButton(5, "Fox Berry", buyItem,consumables.FOXBERY,sayLine(consumables.FOXBERY,"fox"),onBuyString).hint("Buy a fox berry.");
            addButton(6, "FerretFrt", buyItem,consumables.FRRTFRT,sayLine(consumables.FRRTFRT,"ferret"),onBuyString).hint("Buy a ferret fruit.");
            addButton(7, "GoldenRind", buyItem,consumables.GLDRIND,sayLine(consumables.GLDRIND,"deer"),onBuyString).hint("Buy a golden rind.");
            addButton(8, "GoldenSeed", buyItem,consumables.GLDSEED,sayLine(consumables.GLDSEED,"harpy"),onBuyString).hint("Buy a golden seed.");
            addButton(9, "Gob.Ale", buyItem,consumables.GOB_ALE,sayLine(consumables.GOB_ALE,"goblin"),onBuyString).hint("Buy a flagon of potent goblin ale.");
            addButton(10, "IncubiD", buyItem,consumables.INCUBID,sayLine(consumables.INCUBID,"incubus"),onBuyString).hint("Buy a flask of Incubi draft.");
            addButton(11, "KangaFruit", buyItem,consumables.KANGAFT,sayLine(consumables.KANGAFT,"kangaroo"),onBuyString).hint("Buy a piece of kanga fruit.");
            addButton(12, "La Bova", buyItem,consumables.LABOVA_,sayLine(consumables.LABOVA_,"cow"),onBuyString).hint("Buy a bottle containing a misty fluid labeled \"LaBova\".");
            addButton(13, "MouseCo", buyItem,consumables.MOUSECO,sayLine(consumables.MOUSECO,"mouse"),onBuyString).hint("Buy a handful of mouse cocoa.");
            addButton(14, "Back", mogahenmerchant);
            statScreenRefresh();
        }
        function Tier2():void {
            menu();
            addButton(0, "MinoBlo", buyItem,consumables.MINOBLO,sayLine(consumables.MINOBLO,"bull"),onBuyString).hint("Buy a vial of Minotaur blood.");
            addButton(1, "PigTruffle", buyItem,consumables.PIGTRUF,sayLine(consumables.PIGTRUF,"pig"),onBuyString).hint("Buy a pigtail truffle.");
            addButton(2, "Reptilum", buyItem,consumables.REPTLUM,sayLine(consumables.REPTLUM,"lizan"),onBuyString).hint("Buy a vial of Reptilum.");
            addButton(3, "RingFig", buyItem,consumables.RINGFIG,sayLine(consumables.RINGFIG,"raccoon"),onBuyString).hint("Buy a ringtail fig.");
            addButton(4, "S.Gossr", buyItem,consumables.S_GOSSR,sayLine(consumables.S_GOSSR,"spider"),onBuyString).hint("Buy a bundle of pink, gossamer webbing.");
            addButton(5, "SalamFW", buyItem,consumables.SALAMFW,sayLine(consumables.SALAMFW,"salamander"),onBuyString).hint("Buy a hip flask of Salamander Firewater.");
            addButton(6, "Scorpinum", buyItem,consumables.SCORICO,sayLine(consumables.SCORICO,"scorpion"),onBuyString).hint("Buy a vial of Scorpinum.");
            addButton(7, "Shark.T", buyItem,consumables.SHARK_T,sayLine(consumables.SHARK_T,"shark"),onBuyString).hint("Buy a sharp shark tooth.");
            addButton(8, "SnakeOil", buyItem,consumables.SNAKOIL,sayLine(consumables.SNAKOIL,"snake"),onBuyString).hint("Buy a vial of snake oil.");
            addButton(9, "SucMilk", buyItem,consumables.SUCMILK,sayLine(consumables.SUCMILK,"sucubus"),onBuyString).hint("Buy a bottle of Succubi milk.");
            addButton(10, "TSTooth", buyItem,consumables.TSTOOTH,sayLine(consumables.TSTOOTH,"tigershark"),onBuyString).hint("Buy a glowing tiger shark tooth.");
            addButton(11, "W.Fruit", buyItem,consumables.W_FRUIT,sayLine(consumables.W_FRUIT,"cat"),onBuyString).hint("Buy a piece of whisker-fruit.");
            addButton(12, "WetCloth", buyItem,consumables.WETCLTH,sayLine(consumables.WETCLTH,"goo"),onBuyString).hint("Buy a wet cloth dripping with slippery slime.");
            addButton(13, "YetiCum", buyItem,consumables.YETICUM,sayLine(consumables.YETICUM,"yeti"),onBuyString).hint("Buy a bottle of Yeti Cum.");
            addButton(14, "Back", mogahenmerchant);
            statScreenRefresh();
        }
        function Tier3():void {
            menu();
            addButton(0, "BlackInk", buyItem,consumables.BLACKIN,sayLine(consumables.BLACKIN,"female scylla"),onBuyString).hint("Buy a vial of black ink.");
            addButton(1, "BlackPp", buyItem,consumables.BLACKPP,sayLine(consumables.BLACKPP,"dog"),onBuyString).hint("Buy solid black canine pepper.");
            addButton(2, "BulbyPp", buyItem,consumables.BULBYPP,sayLine(consumables.BULBYPP,"dog"),onBuyString).hint("Buy a bulbous pepper.");
            addButton(3, "DblPepp", buyItem,consumables.DBLPEPP,sayLine(consumables.DBLPEPP,"dog"),onBuyString).hint("Buy a double canine pepper.");
            addButton(4, "KnottyP", buyItem,consumables.KNOTTYP,sayLine(consumables.KNOTTYP,"dog"),onBuyString).hint("Buy a knotty canine pepper.");
            addButton(5, "LargePp", buyItem,consumables.LARGEPP,sayLine(consumables.LARGEPP,"dog"),onBuyString).hint("Buy an overly large canine pepper.");
            addButton(6, "ChillyP", buyItem,consumables.CHILLYP,sayLine(consumables.CHILLYP,"winter wolf"),onBuyString).hint("Buy a Chilly pepper.");
            addButton(7, "MaraFruit", buyItem,consumables.MARAFRU,sayLine(consumables.MARAFRU,"plant"),onBuyString).hint("Buy an apple-shaped fruit.");
            //addButton(8, "B.Gossr", BGossr).hint("Buy .");
            //addButton(9, "B.Gossr", BGossr).hint("Buy .");
            addButton(14, "Back", mogahenmerchant);
            statScreenRefresh();
        }
        function Tier4():void {
            menu();
            addButton(0, "SpHoney", buyItem,consumables.SPHONEY,sayLine(consumables.SPHONEY,"bee"),onBuyString).hint("Buy a bottle of special bee honey.");
            addButton(1, "SatyrWine", buyItem,consumables.SATYR_W,sayLine(consumables.SATYR_W,"satyr"),onBuyString).hint("Buy a bottle of satyr wine.");
            addButton(2, "DrakeHeart", buyItem,consumables.DRAKHRT,sayLine(consumables.DRAKHRT,"dragon"),onBuyString).hint("Buy a drake's heart's flower.");
            addButton(4, "Hummus", buyItem,consumables.HUMMUS_,sayLine(consumables.HUMMUS_,"humanity"),onBuyString).hint("Buy a blob of cheesy-looking hummus.");
            addButton(14, "Back", mogahenmerchant);
            statScreenRefresh();
        }
        function Tier5():void {
            menu();
            addButton(0, "Coal", buyItem,consumables.COAL___,sayLine(consumables.COAL___,"heat or rut"),onBuyString).hint("Buy two pieces of coal.");
            addButton(1, "DryTent", buyItem,consumables.DRYTENT,sayLine(consumables.DRYTENT,"anemone"),onBuyString).hint("Buy a shriveled tentacle.");
            addButton(2, "EctoPls", buyItem,consumables.ECTOPLS,sayLine(consumables.ECTOPLS,"ghost"),onBuyString).hint("Buy a bottle of ectoplasm.");
            addButton(3, "TrapOil", buyItem,consumables.TRAPOIL,sayLine(consumables.TRAPOIL,"sand trap"),onBuyString).hint("Buy a vial of trap oil.");
            addButton(14, "Back", mogahenmerchant);
            statScreenRefresh();
        }
    }

    public function exchangeGemsToSpiritStonesorReverse():void {
        clearOutput();
        outputText("When you ask about this exchange that was mentioned on the sign over the entrance Moga  think for a moment before reaching to the desk near him. After handing you over a piece of paper he adds.");
        outputText("\n\n\"<i>Here are my exchange rates. Pick the one you want and let me know. If you don't like those rates you can go and try to find someone else... not like there is anyone else here that want to deal with those exchanges aside me.</i>\"");
        menu();
        if (player.gems >= 20) addButton(0, "20 Gems", exchange,1).hint("Exchange 20 gems to 1 spirit stone.");
        if (player.gems >= 100) addButton(1, "100 Gems", exchange,5).hint("Exchange 100 gems to 5 spirit stones.");
        if (player.gems >= 200) addButton(2, "200 Gems", exchange,10).hint("Exchange 200 gems to 10 spirit stones.");
        if (player.gems >= 1000) addButton(3, "1000 Gems", exchange,50).hint("Exchange 1000 gems to 50 spirit stones.");
        if (player.gems >= 2000) addButton(4, "2000 Gems", exchange, 100).hint("Exchange 2000 gems to 100 spirit stones.");
        if (flags[kFLAGS.SPIRIT_STONES] >= 1) addButton(5, "1 SS", exchange,1,false).hint("Exchange 1 spirit stone to 5 gems.");
        if (flags[kFLAGS.SPIRIT_STONES] >= 5) addButton(6, "5 SS", exchange,5,false).hint("Exchange 5 spirit stones to 25 gems.");
        if (flags[kFLAGS.SPIRIT_STONES] >= 10) addButton(7, "10 SS", exchange,10,false).hint("Exchange 10 spirit stones to 50 gems.");
        if (flags[kFLAGS.SPIRIT_STONES] >= 50) addButton(8, "50 SS", exchange,50,false).hint("Exchange 50 spirit stones to 250 gems.");
        if (flags[kFLAGS.SPIRIT_STONES] >= 100) addButton(9, "100 SS", exchange,100,false).hint("Exchange 100 spirit stones to 500 gems.");
        addButton(14, "Back", mogahenmerchant);
    }
    private function exchange(value:int,toStones:Boolean=true):void{
        if(toStones){
            switch(value){
                case 1:outputText("After picking the lowers one rate for gems to stones you count gems before giving them to the merchant. With noticable mumbling about customer been stingy he without haste finishing transaction by giving you one spirit stone.");break;
                case 5:outputText("After picking the low one rate for gems to stones you count gems before giving them to the merchant. With barely noticable mumbling about customer been stingy he without haste finishing transaction by giving you five spirit stones.");break;
                case 10:outputText("After picking the middle one rate for gems to stones you count gems before giving them to merchant. Without haste he finishing transaction by giving you ten spirit stones.");break;
                case 50:outputText("After picking the high one rate for gems to stones you count gems before giving them to merchant. With slight haste he finishing transaction by giving you fifty spirit stones.");break;
                case 100:outputText("After picking the highest one rate for gems to stones you count gems before giving them to merchant. With haste he finishing transaction by giving you hundred spirit stones.");break;
            }
            player.gems -= 20*value;
            flags[kFLAGS.SPIRIT_STONES]+=value;
        } else {
            switch(value){
                case 1:outputText("After picking the lowers one rate for stones to gems you hand over one stone to the merchant. With noticable mumbling about customer been stingy he without haste finishing transaction by giving you gems.");break;
                case 5:outputText("After picking the low one rate for stones to gems you hand over five stones to the merchant. With barely noticable mumbling about customer been stingy he without haste finishing transaction by giving you gems.");break;
                case 10:outputText("After picking the middle one rate for stones to gems you hand over ten stones to the merchant. Without haste he finishing transaction by giving you gems.");break;
                case 50:outputText("After picking the high one rate for stones to gems you hand over fifty stones to the merchant. With slight haste he finishing transaction by giving you gems.");break;
                case 100:outputText("After picking the highest one rate for stones to gems you hand over hundred stones to the merchant. With haste he finishing transaction by giving you gems.");break;
            }
            player.gems += 5*value;
            flags[kFLAGS.SPIRIT_STONES]-=value;
        }
        statScreenRefresh();
        doNext(exchangeGemsToSpiritStonesorReverse);

    }

    public function sellItemsForSpiritStones():void {
        clearOutput();
        outputText("\"<i>Let me look over what you got for sale. I promise I will give you a 'fair' price for those things,</i>\" Saying this the merchant calmly awaits what you will take out.");
        menu();
        if (player.hasItem(useables.GOLCORE, 1)) addButton(0, "Sell 1", sellOneGolemCore).hint("Sell 1 golem core.");
        if (player.hasItem(useables.GOLCORE, 5)) addButton(1, "Sell 5", sellFiveGolemCores).hint("Sell 5 golem cores.");
        addButton(14, "Back", mogahenmerchant);
    }

    public function sellOneGolemCore():void {
        clearOutput();
        outputText("\"<i>A single golem core. Still in good shape so that will be single spirit stone,</i>\" he states after examing core. Moment later after he went to put away core Moga gave you a single stone.");
        player.destroyItems(useables.GOLCORE, 1);
        flags[kFLAGS.SPIRIT_STONES]++;
        doNext(sellItemsForSpiritStones);
    }

    public function sellFiveGolemCores():void {
        clearOutput();
        outputText("\"<i>Golem cores. Let me check...yes the all seems to be in decent shape,</i>\" after examination he walks away to return shortly. \"<i>Here your five stones for them.</i>\"");
        player.destroyItems(useables.GOLCORE, 5);
        flags[kFLAGS.SPIRIT_STONES] += 5;
        doNext(sellItemsForSpiritStones);
    }

    public function soulequipmentmerchant():void {
        clearOutput();//później zamienić soulequipment na imie sprzedawczyni ^^ female siren npc
        outputText("After entering the shop with a sign saying 'Equipment' over the doors you see a few shelves filled with various weapons, shields, armors and even more rare items like rings or necklaces. Behind the desk that looks like a central point of the shop you see a woman that seems to have mixed races traits. A shark face and a tail that sometimes show up on either side of the desk which is contrasting to its feather covered arms that are not looking at all like shark ones and more similar to bird wings.");
        outputText("\n\n\"<i>Greeting dear customer.  Look around and if something catch your eyes let me know,</i>\" she say all that almost on one breath after noticing your near.");
        outputText("\n\n<b>Spirit Stones: </b>" + flags[kFLAGS.SPIRIT_STONES] + "\n");
        menu();
        addButton(1, "Shelf 1", soulequipmentshelf1);
        addButton(2, "Shelf 2", soulequipmentshelf2);
        //	addButton(3, "Shelf 3", soulequipmentshelf3);//armors
        //addButton(9, weapons.ERIBBON.shortName, weaponBuy, weapons.ERIBBON);//czy bedzie tu jako do sprzedaży czy jako nagroda za quest lub drop z mobka/bossa?
        //addButton(7, weapons.MACE.shortName, weaponBuy, weapons.MACE);//awl - wymagać bedzie możliwość lewitacji czy coś od PC aby to używać
        //addButton(8, weapons.MACE.shortName, weaponBuy, weapons.MACE);//bow made for soul cultivator xD
        //addButton(12, "Talk", ).hint("Tak with .");
        addButton(9, jewelries.SOULRNG.shortName, weaponBuy, jewelries.SOULRNG);
        addButton(14, "Back", riverislandVillageStuff);
        statScreenRefresh();
    }
    public function soulequipmentshelf1():void {
        menu();
        addButton(0, consumables.W_STICK.shortName, weaponBuy, consumables.W_STICK);
        addButton(1, consumables.BANGB_M.shortName, weaponBuy, consumables.BANGB_M);
        addButton(5, weapons.TRASAXE.shortName, weaponBuy, weapons.TRASAXE);
        addButton(6, weaponsrange.TRSXBOW.shortName, weaponBuy, weaponsrange.TRSXBOW);
        addButton(7, shields.TRASBUC.shortName, weaponBuy, shields.TRASBUC);
        addButton(8, armors.TRASARM.shortName, weaponBuy, armors.TRASARM);
        addButton(10, weapons.W_STAFF.shortName, weaponBuy, weapons.W_STAFF);
        addButton(11, shields.MABRACE.shortName, weaponBuy, shields.MABRACE);
        addButton(14, "Back", soulequipmentmerchant);
    }
    public function soulequipmentshelf2():void {
        menu();
        addButton(0, weapons.KATANA.shortName, weaponBuy, weapons.KATANA);
        addButton(1, weapons.NODACHI.shortName, weaponBuy, weapons.NODACHI);
        addButton(2, weapons.OTETSU.shortName, weaponBuy, weapons.OTETSU);
        addButton(3, weapons.RCLAYMO.shortName, weaponBuy, weapons.RCLAYMO);
        addButton(4, weapons.SCLAYMO.shortName, weaponBuy, weapons.SCLAYMO);
        addButton(5, weapons.RIBBON.shortName, weaponBuy, weapons.RIBBON);
        addButton(6, weapons.S_GAUNT.shortName, weaponBuy, weapons.S_GAUNT);
        addButton(7, weapons.CLAWS.shortName, weaponBuy, weapons.CLAWS);
        addButton(8, weapons.TCLAYMO.shortName, weaponBuy, weapons.TCLAYMO);
        addButton(9, weapons.ACLAYMO.shortName, weaponBuy, weapons.ACLAYMO);
        addButton(10, weapons.WHIP.shortName, weaponBuy, weapons.WHIP);
        addButton(11, weapons.PWHIP.shortName, weaponBuy, weapons.PWHIP);
        addButton(12, weapons.FRTAXE.shortName, weaponBuy, weapons.FRTAXE);
        addButton(14, "Back", soulequipmentmerchant);
    }
    public function soulequipmentshelf3():void {
        menu();
        //if (player.findPerk(PerkLib.SoulApprentice) >= 0) addButton(3, armors.LAYOARM.shortName, weaponBuy, armors.LAYOARM);
        //addButton(2, weapons.MACE.shortName, weaponBuy, weapons.MACE);//basic light armor made of soulmetal
        //addButton(0, weapons.MACE.shortName, weaponBuy, weapons.MACE);//basic heavy armor made of soulmetal
        //addButton(1, weapons.MACE.shortName, weaponBuy, weapons.MACE);//basic armor made of soulmetal that works with unhindered perk xD czyli coś ala bikini lub ogólnie tylko underwear z fragmentami zbroi lewitującymi wokół postaci i tylko w wypadku ataku wroga przesuwające sie aby przyjąć atak
        addButton(14, "Back", soulequipmentmerchant);
    }

    private function weaponBuy(itype:ItemType):void {
        clearOutput();
        outputText("\"<i>That'll be " + itype.value / 10 + " spirit stones.</i>\"");
        //outputText("The gruff metal-working husky gives you a slight nod and slams the weapon down on the edge of his stand.  He grunts, \"<i>That'll be " + itype.value + " gems.</i>\"");
        if(flags[kFLAGS.SPIRIT_STONES] < itype.value / 10) {
            outputText("\n\nYou count out your spirit stones and realize it's beyond your price range.");
            //Goto shop main menu
            doNext(soulequipmentmerchant);
            return;
        }
        else outputText("\n\nDo you buy it?\n\n");
        //Go to debit/update function or back to shop window
        doYesNo(curry(debitWeapon,itype), soulequipmentmerchant);
    }
    private function debitWeapon(itype:ItemType):void {
        flags[kFLAGS.SPIRIT_STONES] -= itype.value / 10;
        statScreenRefresh();
        inventory.takeItem(itype, soulequipmentmerchant);
    }

    public function soularrowmerchant():void {
        clearOutput();//później zamienić soulequipment na imie sprzedawczyni ^^ female centaur npc
        outputText("After entering the shop with a sign saying 'Soul Arrow' over the doors you see a few shelves filled with various range weapons of all sorts from bows, throu crossbows to some more exotic ones tat you not even sure how to name them. ");
        outputText("Behind the desk that looks like a central point of the shop you see a centauress. She have no fancy or provocative clothes, average body with which she moves quite gracesfully around stalls with items for sale despite her naturaly larger body than most of people living here have.");
        outputText("\n\n\"<i>Greeting dear customer.  Look around and if something catch your eyes let me know,</i>\" she say all that almost on one breath after noticing your near.");
        menu();
        addButton(0, weaponsrange.BOWLIGH.shortName, weaponrangeBuy, weaponsrange.BOWLIGH);
        addButton(1, weaponsrange.BOWHUNT.shortName, weaponrangeBuy, weaponsrange.BOWHUNT);
        addButton(2, weaponsrange.BOWLONG.shortName, weaponrangeBuy, weaponsrange.BOWLONG);
        addButton(3, weaponsrange.BOWKELT.shortName, weaponrangeBuy, weaponsrange.BOWKELT);
        addButton(5, weaponsrange.LCROSBW.shortName, weaponrangeBuy, weaponsrange.LCROSBW);
        addButton(6, weaponsrange.HUXBOW_.shortName, weaponrangeBuy, weaponsrange.HUXBOW_);
        addButton(7, weaponsrange.HEXBOW_.shortName, weaponrangeBuy, weaponsrange.HEXBOW_);
        addButton(10, weaponsrange.FLINTLK.shortName, weaponrangeBuy, weaponsrange.FLINTLK);
        addButton(11, weaponsrange.BLUNDER.shortName, weaponrangeBuy, weaponsrange.BLUNDER);
        addButton(12, weaponsrange.IVIARG_.shortName, weaponrangeBuy, weaponsrange.IVIARG_);
		//addButton(4, weapons.MACE.shortName, weaponBuy, weapons.MACE);
        //addButton(8, weapons.MACE.shortName, weaponBuy, weapons.MACE);//awl - wymagać bedzie możliwość lewitacji czy coś od PC aby to używać
        //addButton(9, weapons.MACE.shortName, weaponBuy, weapons.MACE);//bow made for soul cultivator xD
        //addButton(13, "Talk", ).hint("Tak with .");
        addButton(14, "Back", riverislandVillageStuff);
        statScreenRefresh();
    }

    private function weaponrangeBuy(itype:ItemType):void {
        clearOutput();
        outputText("\"<i>That'll be " + itype.value + " gems.</i>\"");
        //outputText("The gruff metal-working husky gives you a slight nod and slams the weapon down on the edge of his stand.  He grunts, \"<i>That'll be " + itype.value + " gems.</i>\"");
        if(player.gems < itype.value) {
            outputText("\n\nYou count out your gems and realize it's beyond your price range.");
            //Goto shop main menu
            doNext(soularrowmerchant);
            return;
        }
        else outputText("\n\nDo you buy it?\n\n");
        //Go to debit/update function or back to shop window
        doYesNo(curry(debitWeaponRange,itype), soularrowmerchant);
    }
    private function debitWeaponRange(itype:ItemType):void {
        player.gems -= itype.value;
        statScreenRefresh();
        inventory.takeItem(itype, soularrowmerchant);
    }

public function soularena():void {
	clearOutput();//arena do walk z przeciwnikami na exp tylko - zadnych sex scenes tylko walk do wygranej niewazne czy przez hp czy lust - przeciwnicy: dummy golem, grupa dummy golems, true golem, ?group of true golems, weak deviant golem?, niskopoziomowi przeciwnicy uzywajacy soul skills (moze po prostu wesje zwyklych przeciwnikow ale z dodanymi soul attakami?)
	if (flags[kFLAGS.CHI_CHI_AFFECTION] >= 10 && flags[kFLAGS.CHI_CHI_AFFECTION] < 15) chichiScene.EnterOfTheChiChi();
	else {
		outputText("Coming closer to the arena you see two muscular tigersharks standing on each side of the entrance, which only briefly glance at you the moment you pass by them. Inside after few a moment a tall slightly muscular male cat-morph approaches you. Most of its body is covered by armor yet two long tails waves behind him from time to time.");//osoba zarządzająca areną bedzie male nekomanta npc
		outputText("\n\n\"<i>Greeting to the Soul Arena. Don't pick up fights outside of the proper place or you will be thrown out. If you break any rule here you will be kicked out. Knowing this go pick the area where you want to train or maybe go to the challenges area,</i>\" without wasting time the nekomata overseer of this place explains you all that is needed and walk away.");
		outputText("\n\nSo which one of the three possible sub areas you gonna visit this time?");
		if (flags[kFLAGS.IGNIS_ARENA_SEER] >= 1) outputText("\n\nYou notice Ignis sitting in the stands, a notebook in his paws. The kitsune seems to be watching the fights and taking notes as he does so.");
		if (flags[kFLAGS.CHI_CHI_AFFECTION] < 1) flags[kFLAGS.CHI_CHI_AFFECTION] = 0;
		menu();//statuseffect(soulArena) dodać na początku walk co pozwoli dać inne dropy itp. w stosuku do spotkania podobnego wroga w innym miejscu a nawet łatwo pozwoli zrobić wersje soulforce niektórych ras bez tworzenia nowych opisów monsterów - zrobić to dla trybu challenge, w który walka z wrogie da określony drop a nawet można na niej grać aby uzyskać nagro...np. nowego camp member ^^
		addButton(0, "Solo", soularenaSolo).hint("Go to the section of soul arena for 1 on 1 fights.");
		addButton(1, "Group", soularenaGroup).hint("Go to the section of soul arena for group fights.");
		addButton(2, "Challenge", soularenaChallenge).hint("Go to the section of soul arena for challenges. (Who knows what reward you may get after winning any of the challenges there...)");
		if (flags[kFLAGS.IGNIS_ARENA_SEER] >= 1) addButton(10, "Ignis", ignisarenaseer.mainIgnisMenu);
		addButton(14, "Back", riverislandVillageStuff);
		statScreenRefresh();
	}
}

    public function soularenaSolo():void {
        clearOutput();
        outputText("Picking the one on the left prepared for solo fight you enter there and looking around checking who is currently avialable for sparring session.");
        menu();
        //addButton(0, "Goblin", );//Goblinka
        addButton(5, "D.Golem", arenaSelection,GolemDummy).hint("LVL 6");
        addButton(6, "I.D.Golem", arenaSelection,GolemDummyImproved).hint("LVL 12");
        addButton(7, "A.D.Golem", arenaSelection,GolemDummyAdvanced).hint("LVL 18");
        addButton(8, "S.D.Golem", arenaSelection,GolemDummySuperior).hint("LVL 24");
        addButton(10, "B.T.Golem", arenaSelection,GolemTrueBasic).hint("LVL 33");
        addButton(11, "I.T.Golem", arenaSelection,GolemTrueImproved).hint("LVL 42");
        addButton(12, "A.T.Golem", arenaSelection,GolemTrueAdvanced).hint("LVL 51");
        addButton(14, "Back", soularena);
    }

    public function soularenaGroup():void {
        clearOutput();
        outputText("Picking the one on the right prepared for group fight you enter there and looking around checking who is currently avialable for sparring session.");
        menu();
        //addButton(0, "Goblins", );//Córki goblinki z solo areny ^^
        addButton(5, "D.Golems", arenaSelection,GolemsDummy).hint("LVL 6");
        addButton(6, "I.D.Golems", arenaSelection,GolemsDummyImproved).hint("LVL 12");
        addButton(7, "A.D.Golems", arenaSelection,GolemsDummyAdvanced).hint("LVL 18");
        addButton(8, "S.D.Golems", arenaSelection,GolemsDummySuperior).hint("LVL 24");
        addButton(10, "B.T.Golems", arenaSelection,GolemsTrueBasic).hint("LVL 33");
        addButton(11, "I.T.Golems", arenaSelection,GolemsTrueImproved).hint("LVL 42");
        addButton(12, "A.T.Golems", arenaSelection,GolemsTrueAdvanced).hint("LVL 51");
        addButton(14, "Back", soularena);
    }

    public function soularenaChallenge():void {
        clearOutput();
        outputText("Picking the one in the middle prepared for challanges you enter there and looking around checking who if there is currently anyone up for a challange.");
        menu();
        addButton(0, "Gaunlet 1", gaunletchallange1fight1).hint("Fight 3 diff enemies one after another.");
        //if (flags[kFLAGS.SOUL_ARENA_FINISHED_GAUNLETS] == 1) addButton(1, "Gaunlet 2", gaunletchallange2fight1).hint("Fight 4 diff enemies one after another.");
        //addButton(2, "Gaunlet 3", gaunletchallange3).hint("Fight 5 diff enemies one after another.");
        //addButton(3, "Gaunlet 4", gaunletchallange4).hint("Fight 6 diff enemies one after another.");
        //addButton(4, "Gaunlet 5", gaunletchallange5).hint("Fight 7 diff enemies one after another.");
        //addButton(5, "Golemancer", arenaSelection,Jeniffer);
        //addButton(6, "AyotechManiac", arenaSelection,Jinx);
        //addButton(7, "MachoSalamander", arenaSelection,Syth);
        //addButton(8, "MissSalamander", arenaSelection,Rangiku);
        //addButton(9, "LvL 24 Gargoyle", arenaSelection,GargoyleBasic);
        addButton(10, "LvL 33 Golems", arenaSelection,GolemsBasic);
        addButton(11, "LvL 42 Golems", arenaSelection,GolemsImproved);
        addButton(12, "LvL 51 Golems", arenaSelection,GolemsAdvanced);
        //if (flags[kFLAGS.CHI_CHI_AFFECTION] < 15) addButton(13, "Chi Chi", chichiScene.EnterOfTheChiChi);
        addButton(14, "Back", soularena);
    }
    private function arenaSelection(mon:Class):void{
        player.createStatusEffect(StatusEffects.SoulArena, 0, 0, 0, 0);
        if (flags[kFLAGS.CHI_CHI_AFFECTION] < 10) flags[kFLAGS.CHI_CHI_AFFECTION]++;
        startCombat(new mon());
        monster.createStatusEffect(StatusEffects.NoLoot, 0, 0, 0, 0);
        monster.XP = Math.round(monster.XP / 2);
    }
    public function gaunletchallange1fight1():void {
        clearOutput();
        outputText("You register for the gauntlet challenge then when called, move out beyond the arena gate to face your opponent. The crowd is big, you sure will have quite the audience. A man with a necktie and a weird stick screams across the area.\n\n");
        outputText("\"<i>Ladies and gentlemen! Today a new gladiator enter the arena seeking glory of the gauntlet! A triple battle for gold and fame!</i>\"\n\n");
        outputText("The crowd cheers for you loudly.\n\n");
        outputText("\"<i>We start with an old timer everyone know about yet even if it is only the warm up do beware... the Dummy golems!!!</i>\"\n\n");
        outputText("A set of walking stone statues enter the arena, ready for battle. It seems you are to fight these first.\n\n");
        player.createStatusEffect(StatusEffects.SoulArena, 0, 0, 0, 0);
        player.createStatusEffect(StatusEffects.SoulArenaGaunlet, 0, 0, 0, 0);
        if (flags[kFLAGS.CHI_CHI_AFFECTION] < 10) flags[kFLAGS.CHI_CHI_AFFECTION]++;
        startCombat(new GolemsDummy());
    }
    public function gaunletchallange1fight2():void {
        clearOutput();
        outputText("As the last of the golem falls down, the commentator resumes.\n\n");
        outputText("\"<i>This one is straight from the woods. Freshly caught and horny to boot. Can our champion’s strength overcome the beast’s lust? LET'S FIND OUT!!</i>\"\n\n");
        outputText("A shadow moves out behind the gate, revealing the shape of a fluid starved tentacle beast.\n\n");
        startCombat(new TentacleBeast());
    }
    public function gaunletchallange1fight3():void {
        clearOutput();
        outputText("As the tentacle beast whimpers and crawls away, the crowd cheers for you. Here comes the final round.\n\n");
        outputText("\"<i>This contestant is smaller than the last two... Smarter too, and most of all extremely deadly. She’s paid a handsome sack of gems daily to kick the ass of anyone who reach this stage, yet is by far the deadliest combatant of her division. She’s your favorite and an expert huntress. Here she comes... Merisiel the dark elf!!!</i>\"\n\n");
        outputText("A woman with dark skin walks by the entrance of the arena with only a bow for a weapon. She sure does look like an elf, however. She’s nothing like the gentle creature from your childhood stories as she observes you with a cruel, calculative gaze. The dark elf readies her bow, smirking.\n\n");
        startCombat(new DarkElfScout());
    }
    public function gaunletchallange1postfight():void {
        clearOutput();
        outputText("You exit the arena, victorious, basking in the cheering of the crowd and go to the prize counter for your reward. A woman greets you.\n\n");
        if (flags[kFLAGS.SOUL_ARENA_FINISHED_GAUNLETS] >= 1) {
            outputText("\"<i>Good show, champion. As a reward for your performance, please accept these 15 spirit stones. Please do come back again and maybe next time you could even try the harder challenge.</i>\"\n\n");
            flags[kFLAGS.SPIRIT_STONES] += 15;
            cleanupAfterCombat();
        }
        else {
            outputText("\"<i>Good show, champion. As a reward for your performance, please accept this magical bow. Please do come back again and maybe next time you could even try the harder challenge.</i>\"\n\n");
            flags[kFLAGS.SOUL_ARENA_FINISHED_GAUNLETS] = 1;
            inventory.takeItem(weaponsrange.BOWGUID, cleanupAfterCombat);
        }
    }
	public function gaunletchallange2fight1():void {
		clearOutput();
		outputText("Placeholder.");
        player.createStatusEffect(StatusEffects.SoulArena, 0, 0, 0, 0);
        player.createStatusEffect(StatusEffects.SoulArenaGaunlet, 0, 0, 0, 0);
        if (flags[kFLAGS.CHI_CHI_AFFECTION] < 10) flags[kFLAGS.CHI_CHI_AFFECTION]++;
        startCombat(new GoblinAssassin());
	}
	public function gaunletchallange2fight2():void {
		clearOutput();
		outputText("Placeholder.");
        startCombat(new HellHound());
	}
	public function gaunletchallange2fight3():void {
		clearOutput();
		outputText("Placeholder.");
        startCombat(new CorruptedDrider());
	}
	public function gaunletchallange2fight4():void {
		clearOutput();
		outputText("Placeholder.");
        startCombat(new BossGolems());
	}
	public function gaunletchallange2postfight():void {
		clearOutput();
		outputText("Placeholder...");
        if (flags[kFLAGS.SOUL_ARENA_FINISHED_GAUNLETS] >= 2) {
			 outputText("\"<i>Good show, champion. As a reward for your performance, please accept these 20 spirit stones. Please do come back again and maybe next time you could even try the harder challenge.</i>\"\n\n");
			flags[kFLAGS.SPIRIT_STONES] += 20;
            cleanupAfterCombat();
		}
		else {
			outputText("Placeholder.");
			flags[kFLAGS.SOUL_ARENA_FINISHED_GAUNLETS] = 2;
            inventory.takeItem(weaponsrange.BOWGUID, cleanupAfterCombat);
		}
	}
    public function restaurantShiraOfTheEast():void {
        clearOutput();
        outputText("You enter the exotic food restaurant ‘Shira of the east’ and check up the menu. Would you like to eat there?");
        if (flags[kFLAGS.CHI_CHI_FOLLOWER] < 1) flags[kFLAGS.CHI_CHI_FOLLOWER] = 1;
        menu();
        addButton(0, "Yes", restaurant,true);
        addButton(1, "No", restaurant,false);
    }

    private function restaurant(selected:Boolean):void {
        if(!selected){
            outputText("You aren’t hungry at the time maybe you will eat later.");
            doNext(riverislandVillageStuff);
            return;
        } else if (flags[kFLAGS.SPIRIT_STONES] < 1){
            outputText("You would like to eat but you don’t have enough spirit stones to afford the food.");
            doNext(riverislandVillageStuff);
            return;
        }
        clearOutput();
        outputText("You take a seat and look at the menu. ");
        if (flags[kFLAGS.CHI_CHI_FOLLOWER] > 1) outputText("A dog morph that looks like a pekinese comes over to take your order.");
        else outputText("A literally blazing mouse girl come over to take your order. Blazing is actually an understatement as her arms, legs and even her tail are on fire. ");
        outputText("\n\n\"<i>Hello my name is ");
        if (flags[kFLAGS.CHI_CHI_FOLLOWER] > 1) outputText("Rin");
        else outputText("Chi Chi");
        outputText(" and I will be your waitress today. We have dumplings, Won ton soups and ramen offered in mild, spicy and inferno version of the dishes. What will it be?</i>\"");
        menu();
        addButton(0, "Dumpling", orderFood,0,5,0).hint("Effects: +Spe, +Tou", "Dumpling");
        addButton(1, "Soup", orderFood,0,0,5).hint("Effects: +Int, +Tou", "Soup");
        addButton(2, "Ramen", orderFood,5,0,0).hint("Effects: +Str, +Tou", "Ramen");
    }
    private function orderFood(str:int,spe:int,inte:int,tou:int=5):void{
        outputText("\n\nShe note your order on a paper.");
        outputText("\n\n\"<i>What spicing will it be?</i>\"");
        if (player.statusEffectv1(StatusEffects.ShiraOfTheEastFoodBuff1) < 25) {
            player.removeStatusEffect(StatusEffects.ShiraOfTheEastFoodBuff1);
            player.createStatusEffect(StatusEffects.ShiraOfTheEastFoodBuff1, 25, 0, 0, 0);
        }
        else player.createStatusEffect(StatusEffects.ShiraOfTheEastFoodBuff1, 25, 0, 0, 0);

        if (player.hasStatusEffect(StatusEffects.ShiraOfTheEastFoodBuff2)) {ResetFoodBuffStats();}
        player.createStatusEffect(StatusEffects.ShiraOfTheEastFoodBuff2, str, spe, inte, tou);

        menu();
        addButton(0, "Mild", restaurantSpicing,"mild");
        addButton(1, "Spicy", restaurantSpicing,"spicy");
        addButton(2, "Inferno", restaurantSpicing,"inferno");
    }
    private function ResetFoodBuffStats():void {
        if (player.statusEffectv1(StatusEffects.ShiraOfTheEastFoodBuff2) >= 1) {
            var tempStrength:int = player.statusEffectv1(StatusEffects.ShiraOfTheEastFoodBuff2);
            dynStats("str", -tempStrength);
        }
        if (player.statusEffectv2(StatusEffects.ShiraOfTheEastFoodBuff2) >= 1) {
            var tempSpeed:int = player.statusEffectv2(StatusEffects.ShiraOfTheEastFoodBuff2);
            dynStats("spe", -tempSpeed);
        }
        if (player.statusEffectv3(StatusEffects.ShiraOfTheEastFoodBuff2) >= 1) {
            var tempIntelligence:int = player.statusEffectv3(StatusEffects.ShiraOfTheEastFoodBuff2);
            dynStats("inte", -tempIntelligence);
        }
        var tempToughness:int = player.statusEffectv4(StatusEffects.ShiraOfTheEastFoodBuff2);
        dynStats("tou", -tempToughness);
        player.removeStatusEffect(StatusEffects.ShiraOfTheEastFoodBuff2);
    }
    private function restaurantSpicing(level:String):void{
        outputText("\n\nShe finish noting your order bow graciously then head to the kitchen. ");
        if (flags[kFLAGS.CHI_CHI_FOLLOWER] > 1) outputText("The waitress");
        else outputText("Chi Chi");
        outputText(" comes back with your order a few minutes later.");
        switch(level){
            case "mild":outputText("\n\nThe meal is comforting and its refreshing nature will likely help you resist hot temperature today.");break;
            case "spicy":outputText("\n\nThe meal is a little spicy but regardless leaves you feeling fortified. The weather won’t feel as harsh to you today.");break;
            case "inferno":outputText("\n\nWow, the meal is so spicy you almost breathe smoke and fire. You gulp down several glasses of water but still start to sweat as your inner temperature rises. It’s likely you won’t have much to fear of the cold today.");break;
        }
        outputText("\n\nRegardless the food is excellent and you leave in high spirits for the rest of the day.");
        if (player.statusEffectv1(StatusEffects.ShiraOfTheEastFoodBuff2) >= 1) {
            var tempStrength:int = player.statusEffectv1(StatusEffects.ShiraOfTheEastFoodBuff2);
            dynStats("str", tempStrength);
        }
        if (player.statusEffectv2(StatusEffects.ShiraOfTheEastFoodBuff2) >= 1) {
            var tempSpeed:int = player.statusEffectv2(StatusEffects.ShiraOfTheEastFoodBuff2);
            dynStats("spe", tempSpeed);
        }
        if (player.statusEffectv3(StatusEffects.ShiraOfTheEastFoodBuff2) >= 1) {
            var tempIntelligence:int = player.statusEffectv3(StatusEffects.ShiraOfTheEastFoodBuff2);
            dynStats("inte", tempIntelligence);
        }
        var tempToughness:int = player.statusEffectv4(StatusEffects.ShiraOfTheEastFoodBuff2);
        dynStats("tou", tempToughness);
        flags[kFLAGS.SPIRIT_STONES]--;
        statScreenRefresh();
        doNext(camp.returnToCampUseOneHour);
    }
}
}