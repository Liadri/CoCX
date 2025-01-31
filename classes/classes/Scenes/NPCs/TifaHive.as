package classes.Scenes.NPCs
{
import classes.*;
import classes.GlobalFlags.kFLAGS;
import classes.Items.WeaponLib;
import classes.Items.ShieldLib;
import classes.Items.Consumables.BeeHoney;
import classes.Scenes.SceneLib;
import classes.internals.SaveableState;

import coc.view.ButtonDataList;

use namespace CoC;

public class TifaHive extends NPCAwareContent implements SaveableState, TimeAwareInterface {

/* PC needs to oviposit at least 5 clutches */

public static const BEES_FOR_HIVE:int = 101;
public static const BEES_FOR_BREWERS:int = 226;
public static const BEES_FOR_FORGE:int = 351;
public static const BEE_CLUTCH_MIN:int = 21;
public static const BEE_CLUTCH_MAX:int = 25;

public static const BEE_ITEM_UPGRADE_BEEHONY:int = 5;
public static const BEE_ITEM_UPGRADE_RAUNECT:int = 5;
public static const BEE_ITEM_UPGRADE_GEMS:int = 3000;


public const BEE_FORGE_ITEMS:Array = [
	//Item, Chitin req., Nectar req., Gems req.
	[weapons.CHITSPR, 5, 0, 100],
	[shields.CHISHLD, 3, 0, 100]
]

public var HiveComplete:Boolean   = false;
public var ForgeVisited:Boolean   = false;
public var ClutchesOviposited:int = 0;
public var ClutchesGrowing:Array  = [];
public var BeesHatched:int        = 0;
public var HiveTimeout:int        = -1;
public var BrewersTimeout:int     = -1;
public var ForgeTimeout:int       = -1;

public function stateObjectName():String {
	return "TifaHive";
}

public function resetState():void {
	HiveComplete = false;
	ForgeVisited = false;
	ClutchesOviposited = 0;
	ClutchesGrowing = [];
	BeesHatched = 0;
	HiveTimeout = -1;
	BrewersTimeout = -1;
	ForgeTimeout = -1;
}

public function saveToObject():Object {
	return {
		HiveComplete:       HiveComplete,
		ForgeVisited:       ForgeVisited,
		ClutchesOviposited: ClutchesOviposited,
		ClutchesGrowing:    ClutchesGrowing,
		BeesHatched:        BeesHatched,
		HiveTimeout:        HiveTimeout,
		BrewersTimeout:     BrewersTimeout,
		ForgeTimeout:       ForgeTimeout
	};
}

public function loadFromObject(o:Object, ignoreErrors:Boolean):void {
	if (o) {
		HiveComplete =       o.HiveComplete;
		ForgeVisited =       o.ForgeVisited;
		ClutchesOviposited = o.ClutchesOviposited;
		ClutchesGrowing =    o.ClutchesGrowing;
		BeesHatched =        o.BeesHatched;
		HiveTimeout=         o.HiveTimeout;
		BrewersTimeout=      o.BrewersTimeout;
		ForgeTimeout=        o.ForgeTimeout;
	}
}

public function TifaHive(){
	Saves.registerSaveableState(this);
	EventParser.timeAwareClassAdd(this);
}

public function timeChange():Boolean{

	if(HiveTimeout > 0)
		HiveTimeout--;

	if(BrewersTimeout > 0)
		BrewersTimeout--;

	if(ForgeTimeout > 0)
		ForgeTimeout--;

	if(ClutchesGrowing.length > 0){
		for (var i:int = 0; i < ClutchesGrowing.length; ++i) {
			ClutchesGrowing[i]--;
		}

		//In case of PC ovipositing multiple times in a hour you have a while loop there instead of simple if
		while(ClutchesGrowing.length > 0 && ClutchesGrowing[0] <= 0){
			ClutchesGrowing.pop();
			BeesHatched += BEE_CLUTCH_MIN + Math.random() * (BEE_CLUTCH_MAX - BEE_CLUTCH_MIN + 1);
		}

		if(HiveTimeout < 0 && BeesHatched > BEES_FOR_HIVE){
			HiveTimeout = 24*7;
		}

		if(BrewersTimeout < 0 && BeesHatched > BEES_FOR_BREWERS){
			BrewersTimeout = 24*14;
		}

		if(ForgeTimeout < 0 && BeesHatched > BEES_FOR_FORGE){
			ForgeTimeout = 24*21;
		}
	}

	return false;
};

public function timeChangeLarge():Boolean {
	return false
};

public function ovipositClutch():void {
	ClutchesGrowing.push(PregnancyStore.INCUBATION_BEE);
	ClutchesOviposited++;
}

public function seeFirstTime():void {
	clearOutput();
	outputText("As you check on the camp, you discover a brand new structure has appeared that wasn’t there before. Turns out, Tifa has been busy. Now there’s enough bees around that a whole hive was built next to the camp. It’s not as impressive as the previous hive you visited but it's big enough to be spotted from far away. You were worried demons would use this landmark to find your camp, but turns out, the bee honour guards are rather effective at dispatching the imps that come close to see what's going on here.");
	HiveComplete = true;
	doNext(playerMenu);
}

public function enterTheHive():void {
	clearOutput();
	outputText("You enter the beehive and take a good look inside. Your sisters are actively working to shape new rooms all over the hive. Already, a big forum has been made from which a long corridor spans to Tifa throne. From the forum, you have access to many side rooms.");
	menu();
	addButton(0, "Honeybrewers", honeybrewers).hint("The hive honey brewers are constantly producing vast amounts of bee honey, which is then refined into potions or nutrition.").disableIf(BrewersTimeout != 0,"This area is under construction by the hive, come back later after performing your duty to the queen a few more times." + (BeesHatched < BEES_FOR_BREWERS ? "(Not enough sizzterz born yet)" : "(Not enough time passed yet)"));
	addButton(1, "Armory", amberforgeMain).hint("The hive workers use various materials such as Chitin and amber to produce weapons and armors of high quality.").disableIf(ForgeTimeout != 0,"This area is under construction by the hive, come back later after performing your duty to the queen a few more times." + (BeesHatched < BEES_FOR_FORGE ? "(Not enough sizzterz born yet)" : "(Not enough time passed yet)"));
	addButton(2, "Tifa", SceneLib.tifaFollower.tifaMainMenu);
	addButton(3, "Back", camp.campLoversMenu);
}

public function honeybrewers():void {
	clearOutput();
	outputText("As you approach the Honey Brewer Alcove, a busty sister walks up to greet you.\n\n")
	outputText("<i>\"Hail zzzister are you here to order zzzome honey? We happen to have a surplus in the production so the queen gave the permission to zzztart exporting outside the hive. However, nothingzzz free. We need gemzzz to trade with the outside world, zzzo you will need to pay for the product with gemzzz. That said, we alzzzo accept payment in the form of alraune nectar… alwayzzz running out on that one.\"</i>");
	menu();
	addButton(0, "Honey",    curry(beestSeller, consumables.BEEHONY));
	addButton(1, "PurHoney", curry(beestSeller, consumables.PURHONY));
	addButton(2, "SpeHoney", curry(beestSeller, consumables.SPHONEY));
	addButton(3, "Back", enterTheHive);
}

public function beestSeller(honey:BeeHoney):void {
	clearOutput();
	outputText("<i>Oh you thizzz one? Zzzure it'll only be " + honey.value/5 + " gemzzz. Or a bottle of nectar.</i>\n\n");
	outputText("Will you buy " + honey.longName + "?\n\n\n");
	menu();
	addButton(0, "Yes(Gems)",   curry(beestBuy, true, honey)).disableIf(!(player.gems > honey.value / 5), "You need at least " +honey.value/5+" gems or a bottle of Alraune nectar");
	addButton(1, "Yes(Nectar)", curry(beestBuy, false, honey)).disableIf(!player.hasItem(consumables.RAUNENECT), "You need a bottle of Alraune nectar");
	addButton(2, "Back", honeybrewers);
}

public function beestBuy(gems:Boolean,honey:BeeHoney):void
{
	clearOutput();
	if(gems) {
		outputText("You pay with the gems and get " + honey.longName + " in return.\n\n");
		player.gems -= honey.value/5;
        statScreenRefresh();
		inventory.takeItem(honey, curry(beestSeller, honey));
	} else {
		outputText("You give a bottle of Alraune nectar to the bee and get " + honey.longName + " in return.\n\n");
        player.consumeItem(consumables.RAUNENECT);
		inventory.takeItem(honey, curry(beestSeller, honey));
	}
}

public function amberforgeMain():void {
	clearOutput();
	outputText("As you enter the armory, you begin to hear the distinct buzz of the forge bee. Warmth in the forge is produced by the extremely rapid flapping of those bee wings generating a source of heat strong enough to melt and alter the materials used in the creation of bee girl weaponry. The material used for the process is harvested from particularly magically resonant trees and refined by the bee girls into what is known as magical amber, a material tougher than steel.\n\n");
	outputText("A well built bee with a muscular shape approaches you from the side of the amber forge and welcomes you.\n\n");
	if(ForgeVisited){
		outputText("<i>\"Good day, sizzzter. Rather strange of a handmaiden to enter the amberforge. Izzzn’t your job to go out there and lay eggs? What use could a cutie like you have for weapon and armour?\"</i>\n\n");
		outputText("Well, sure, you are not a soldier bee, but since you have been awarded extra privilege from the queen, you are free to go adventuring amidst your duty.\n\n");
		outputText("<i>\"Well, not for me to judge sizzzter if the queen vouch for you, I will craft you weapons and armour regardless of your duty. Normally, soldier bees are taller, so the equipment matches thizzz, but that doesn't mean I can’t make gear for a smaller bee, provided you bring in the materials, get me some chitin, alraune nectar and gems to pay for the refined amber and I’ll make you itemzzz.\"</i>\n\n");
	} else {
		outputText("<i>\"Hey sizzzter it’s you again! Here to craft something?\"</i>")
	}
	menu();
	addButton(0, "Craft",   amberforgeCraft);
	addButton(1, "Upgrade", amberforgeUpgrade);
	addButton(2, "Back",    enterTheHive);
}

public function amberforgeBack():void {
	clearOutput();
	outputText("You decide not to get anything crafted today.\n\n");
	outputText("A well built bee with a muscular shape approaches you from the side of the amber forge and welcomes you.\n\n");
	outputText("<i>\"Well, all fine, just let us know if you ever need zzzomething. The amberforge is always hot.\"</i>")
	menu();
	addButton(0, "Craft",   amberforgeCraft);
	addButton(1, "Upgrade", amberforgeUpgrade);
	addButton(2, "Back",    enterTheHive);
}

protected function rgf(s:String, b:Boolean):String{
	return '<font color="'+ (b ? "#008000" : "#800000") + '">' + s + "</font>"
}

public function amberforgeCraft():void {
	clearOutput();
	outputText("You review a list of potential items with the ambersmith. This list includes multiple piercing weapons as well as armors and even magic staves.\n\n");
	outputText("<i>\"So, sizzzter, what weapon or armour would you like me to make for you?\"</i>")
	var buttons:ButtonDataList = new ButtonDataList();
	for each(var i:Array in BEE_FORGE_ITEMS){
		var a:Boolean = player.hasItem(useables.B_CHITN,i[1]);
		var b:Boolean = player.hasItem(consumables.RAUNENECT,i[2]);
		var c:Boolean = player.gems > i[3];
		var d:String = i[0].description
		if(a && b && c){
			d += "\n\nYou will spend " + (i[1] ? (i[1] + " chitin, ") : "") + (i[2] ? (i[2] + " nectar, ") : "") + "and " + i[3] + " gems.";
		} else {
			d += "\n\nYou need ";
			if(i[1]) d += rgf(i[1]+" chitin", a) + ", "
			if(i[2]) d += rgf(i[2]+" nectar", b) + ",  "
			if(i[3]) d += rgf(i[3]+" gems", c) + ".";
		}
		buttons.add(i[0].shortName, curry(forgeBeestStuff, i), d).disableIf(!(a && b && c));
	}
	submenu(buttons, amberforgeBack);
}

public function amberforgeUpgrade():void {
	clearOutput();
	outputText("You could use an improvement of your gear and thus present the forge sister with what you have.\n\n");
	outputText("<i>\"You have notzzing that I cold upgrade, zzorry.\"</i>")
	/*
	outputText("<i>\"Want me to upgrade an item sizzzter? Hope you got the materials for it then.\"</i>")
	
	var buttons:ButtonDataList = new ButtonDataList();
	for each(var i:Array in BEE_FORGE_ITEMS){
		var a:Boolean = player.hasItem(consumables.BEEHONY, BEE_ITEM_UPGRADE_BEEHONY);
		var b:Boolean = player.hasItem(consumables.RAUNENECT, BEE_ITEM_UPGRADE_RAUNECT);
		var c:Boolean = player.gems > BEE_ITEM_UPGRADE_GEMS;
		var d:String = i[0].description
		if(a && b && c){
			d += "\n\nYou will spend " + (i[1] ? (i[1] + " honey, ") : "") + (i[2] ? (i[2] + " nectar, ") : "") + "and " + i[3] + " gems.";
		} else {
			d += "\n\nYou need ";
			if(i[1]) d += rgf(i[1]+" honey", a) + ", "
			if(i[2]) d += rgf(i[2]+" nectar", b) + ",  "
			if(i[3]) d += rgf(i[3]+" gems", c) + ".";
		}
	}
	submenu(buttons, amberforgeBack);
	*/
	doNext(amberforgeBack);
}

public function forgeBeestStuff(i:Array):void
{
	outputText("The bees get to work melting and hammering the amber. Within an hour at most a brand new " + i[0].longName + " is tailor made just for you!\n\n");
	if(i[1]) player.consumeItem(useables.B_CHITN, i[1]);
	if(i[2]) player.consumeItem(consumables.RAUNENECT, i[2]);
	if(i[3]) player.gems -= i[3];
	inventory.takeItem(i[0], camp.returnToCampUseOneHour);
}

}
}