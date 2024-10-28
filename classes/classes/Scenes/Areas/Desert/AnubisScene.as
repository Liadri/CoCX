/**
 * ...
 * @author Liadri
 */
package classes.Scenes.Areas.Desert 
{
import classes.*;
import classes.BodyParts.*;
import classes.GlobalFlags.kACHIEVEMENTS;
import classes.GlobalFlags.kFLAGS;
	
public class AnubisScene extends BaseContent
	{
		
		public function AnubisScene() 
		{}

public function anubisEncounter():void {
	clearOutput();
	var genderA:Number = 0;//male
	if (rand(2) == 0) genderA = 1;
	var skinA:Number = 0;//dark-skinned
	if (rand(2) == 0) skinA = 1;
	outputText("As you wander the desert, the sound of multiple moans and lumbering feet catches your attention. Coming from your left is a group of mummies led by an animal morph, not unlike a jackal with ornamented cloths and a casting staff. "+(genderA == 1 ? "Sh" : "H")+"e walks the desert bare-chested");
	if (genderA == 1) outputText(", her "+(skinA == 1 ? "obsidian" : "dark-skinned")+" breast exposed to the wind. ");
	else outputText(". His "+(skinA == 1 ? "obsidian" : "dark-skinned")+" chest glistening with sweat, exposed to the wind. ");
	outputText("Upon seeing you, the necromantic leader points a finger, unleashing what appears to be a spell. You dodge what appears to be a skull-like energy projectile with a spectral trail as it passes right next to you before vanishing into the sand. Your jackal-headed foe makes a sneer before sternly declaring.\n\n");
	outputText("\"<i>Slaves should obey their masters. You need to be thoroughly educated so your body can properly serve those in charge</i>\" "+(genderA == 1 ? "Sh" : "H")+"e surveys you briefly with a slow nod, \"<i>You will look quite good in bandages.</i>\"\n\n");
	outputText("Looks like there's no avoiding this opponent, as "+(genderA == 1 ? "s" : "")+"he just admitted to wanting to make a slave out of you!\n\n");
    player.createStatusEffect(StatusEffects.LockingCurse, 0, 0.05, 0, 0);
	startCombat(new Anubis(genderA, skinA));
}

public function anubisDefeated(genderA:Number = 0):void {
	clearOutput();
	if (monster.HP < 1) {
		outputText("Beaten and bruised, the Anubi collapses to h"+(genderA == 1 ? "er" : "is")+" knees. The horde of sex-starved mummies quickly encroaches upon the weakened jackal.\n\n");
		outputText(""+(genderA == 1 ? "Sh" : "H")+"e cries in protest, \"<i>Wait, no, you... you can't! I am... your master!</i>\"  Yet h"+(genderA == 1 ? "er" : "is")+" words fall upon the ears of mindless cretins. In a matter of seconds, the mummies toss their master onto the ground, tearing h"+(genderA == 1 ? "er" : "is")+" clothes to shreds ");
		outputText("as "+(genderA == 1 ? "s" : "")+"he desperately attempts to fight back in a weak attempt. The slaves have usurped their master for now and amid the chaos, you spot a small haversack filled with gems. Spoils of war before you head back to camp.\n\n");
	}
	else {
		outputText(""+(genderA == 1 ? "Sh" : "H")+"e slowly collapses, rubbing h"+(genderA == 1 ? "er" : "is")+" bare chest eagerly as "+(genderA == 1 ? "s" : "")+"he clutches onto h"+(genderA == 1 ? "er" : "is")+" staff for support. H"+(genderA == 1 ? "er" : "is")+" pants fill the air as the horde of sex-starved mummies quickly encroach upon the weakened jackal.\n\n");
		outputText(""+(genderA == 1 ? "Sh" : "H")+"e glances up but with a mind clouded by lust, the jackal is helpless before the horde. "+(genderA == 1 ? "Sh" : "H")+"e hangs h"+(genderA == 1 ? "er" : "is")+" head low, submitting to the mindless cretins. In a matter of seconds, the mummies toss their master onto the ground, ");
		outputText("tearing h"+(genderA == 1 ? "er" : "is")+" clothes to shreds as "+(genderA == 1 ? "s" : "")+"he embraces the onslaught. The slaves have usurped their master for now and amid the chaos, you spot a small haversack filled with gems. Spoils of war before you head back to camp.\n\n");
	}
	cleanupAfterCombat();
}

public function anubisWon(genderA:Number = 0):void {
	clearOutput();
	if (rand(4) == 0 && !player.blockingBodyTransformations()) anubisWonAndMummifyPC(genderA);
	else {
		outputText("As you fall to the ground, defeated, the Anubi sizes you up as "+(genderA == 1 ? "s" : "")+"he sighs in disappointment. \"<i>Not even a good piece of material. Though, it'd be a waste… Suppose you'll suffice as mummy chow.</i>\"\n\n");
		outputText("You fall unconscious as the jackal-headed humanoid lets loose h"+(genderA == 1 ? "er" : "is")+" mummy slaves on you. When you wake up you feel drained and exhausted, as if you've just walked for days without eating or sleeping. Greatly weakened, you head back to camp.");
		player.addCurse("str", 50,1);
		player.addCurse("tou", 50,1);
		cleanupAfterCombat();
	}
}
public function anubisWonAndMummifyPC(genderA:Number = 0):void {
	outputText("As you fall defeated to the ground the Anubis walks toward you amused.\n\n");
	outputText("\"<i>Not a bad struggle but your defiance ends there. You are strong enough to put up a token fight, you are worthy of becoming one of my pets.</i>\"\n\n");
	outputText(""+(genderA == 1 ? "Sh" : "H")+"e runs h"+(genderA == 1 ? "er" : "is")+" hand across your skin making you moan uncontrollably as h"+(genderA == 1 ? "er" : "is")+" dark magic causes your sensitivity to spike to an absurd degree. You orgasm over and over again drenching the sand in your fluids as your brain turns to mush. Thinking is hard, cuming is easy, you only want to keep cuming over and over again. The gentle touch of your jackal tormentor ");
	outputText("is the only thing you care about right now. Suddenly out of nowhere h"+(genderA == 1 ? "er" : "is")+" pawed hand that was caressing your head a few seconds ago runs straight through it. You watch spellbound as "+(genderA == 1 ? "s" : "")+"he pulls something not unlike a spectral duplicate of your own body right out of you before flashing h"+(genderA == 1 ? "er" : "is")+" khopesh and slicing right through it, half of the ghostly energy being forcefully cut from you. ");
	outputText("Something weird is happening to you… you feel hungry… so damn hungry all you can think now is sex. Eyes vacant, mind empty your next move is to crawl between your m"+(genderA == 1 ? "istress" : "aster")+" leg and desperately suckle on h"+(genderA == 1 ? "er clit" : "is balls")+" in order to draw the nourishment you instinctively crave to be whole again yet "+(genderA == 1 ? "s" : "")+"he feeds it to you at the rate of water drops. Far too slowly for you to ever achieve fullness again.\n\n");
	outputText("\"<i>Ah that's a good and eager pet right there… well I need to dress you properly, stay still you sexy undead idiot while I bandage you.</i>\"\n\nUnable to resist the m"+(genderA == 1 ? "istress" : "aster")+"' order, ");
	outputText("you stand still while "+(genderA == 1 ? "s" : "")+"he proceeds to remove your equipment leaving you naked. The teasing contact of the desert wind on your exposed skin makes you cum again to your anubi m"+(genderA == 1 ? "istress" : "aster")+" amusement but "+(genderA == 1 ? "s" : "")+"he quickly get down to work bandaging your body so that the important parts like your hand and feet are properly covered though "+(genderA == 1 ? "s" : "")+"he leaves most of your torso and head exposed so ");
	if (player.biggestTitSize() > 0) outputText(""+(genderA == 1 ? "s" : "")+"he can grope your breast to h"+(genderA == 1 ? "er" : "is")+" heart content and ");
	outputText("you can still use your horny tongue to pleasure h"+(genderA == 1 ? "er" : "im")+" when "+(genderA == 1 ? "s" : "")+"he needs it. At least you won’t cum from walking or milking dicks with your hands now. Speaking of the latter you can’t help but stare at the "+(genderA == 1 ? "newly grown" : "now throbbing")+" doggy cock that slid right out of your master's "+(genderA == 1 ? "cunny, probably a product of her black magic as well" : "sheath")+".\n\n");
	outputText("\"<i>Well what are you waiting for, slave… get to work I won’t reward you often and you should get a taste so you can get the full picture in your brain damaged head of how delicious it is to suck me off. Then I’m going to fuck you anally and train your butt to match my tastes.</i>\"\n\n");
	outputText("What happens next is a whirlwind of cum and mind bending pleasure. For the next few days your memory is quite hazy. Everytime you begin to remember something it fades away a second later and you’re back to being a vapid slut. Time passes but eventually a tiny miracle happens and somehow amidst an orgy you manage to regain barely enough of yourself to break away from your master and run for it. ");
	outputText("Too lost in the pleasure, your anubi overlord is too preoccupied to realize "+(genderA == 1 ? "s" : "")+"he just lost a mummy perhaps "+(genderA == 1 ? "s" : "")+"he just doesn’t care.\n\n");
	outputText("You make it back to camp servicing opponents left and right and somehow recover enough of your mind to begin thinking again. This was a rather weird adventure and it could have ended very poorly for you but thanks to negligence you broke free ");
	outputText("from your m"+(genderA == 1 ? "istress" : "aster")+" and became a free person again. Well… not exactly a person, you are still a mummy and the constant thirst for sex is going to be one hell of a problem in the future.\n\n");
	outputText("(<b>Gained Perks: Halted vitals, Super strength, Rigidity, Life leech, Undeath, Energy dependent</b>)\n\n");
	CoC.instance.transformations.HairHuman.applyEffect(false);
	player.skinColor = randomChoice("tan", "olive", "dark");
	CoC.instance.transformations.FaceJiangshi.applyEffect(false);
	player.eyes.type = Eyes.JIANGSHI;
	CoC.instance.transformations.EyesChangeColor(["red"]).applyEffect(false);
	player.horns.type = Horns.BANDAGED_HEAD;
	player.horns.count = 1;
	player.arms.type = Arms.MUMMY;
	player.lowerBody = LowerBody.MUMMY;
	player.antennae.type = Antennae.NONE;
	player.wings.type = Wings.NONE;
	player.tailType = Tail.NONE;
	player.tailRecharge = 0;
	player.ears.type = Ears.HUMAN;
	CoC.instance.transformations.SkinPlain.applyEffect(false);
	CoC.instance.transformations.SkinPatternNone.applyEffect(false);
	player.tongue.type = Tongue.HUMAN;
	player.gills.type = Gills.NONE;
	player.rearBody.type = RearBody.NONE;
	player.createPerk(PerkLib.HaltedVitals, 1, 0, 0, 0);
	player.createPerk(PerkLib.SuperStrength, 0, 0, 0, 0);
	player.createPerk(PerkLib.Rigidity, 0, 0, 0, 0);
	player.createPerk(PerkLib.LifeLeech, 0, 0, 0, 0);
	player.createPerk(PerkLib.Undeath, 0, 0, 0, 0);
	if (player.hasPerk(PerkLib.RacialParagon))
		flags[kFLAGS.APEX_SELECTED_RACE] = Races.MUMMY;
	player.createPerk(PerkLib.EnergyDependent, 0, 0, 0, 0);
	if (flags[kFLAGS.HAIR_GROWTH_STOPPED_BECAUSE_LIZARD] == 0) flags[kFLAGS.HAIR_GROWTH_STOPPED_BECAUSE_LIZARD]++;
	var item:ItemType;
	if (!player.weapon.isNothing) {
		item = player.unequipWeapon(false,true);
		if (item && !item.isNothing) flags[kFLAGS.PLAYER_DISARMED_WEAPON_ID] = item.id;
	}
	if (!player.weaponRange.isNothing) {
		item = player.unequipWeaponRange(false,true);
		if (item && !item.isNothing) flags[kFLAGS.PLAYER_DISARMED_WEAPON_R_ID] = item.id;
	}
	if (!player.shield.isNothing) {
		item = player.unequipShield(false,true);
		if (item && !item.isNothing) flags[kFLAGS.PLAYER_DISARMED_SHIELD_ID] = item.id;
	}
	if (!player.armor.isNothing) {
		item = player.unequipArmor(false, true);
		if (item && !item.isNothing) flags[kFLAGS.PLAYER_DISARMED_ARMOR_ID] = item.id;
	}
	if (!player.lowerGarment.isNothing) {
		item = player.unequipUnderBottom(false, true);
		if (item && !item.isNothing) flags[kFLAGS.PLAYER_DISARMED_UNDERWEAR_BOTTOM_ID] = item.id;
	}
	if (!player.upperGarment.isNothing) {
		item = player.unequipUnderTop(false, true);
		if (item && !item.isNothing) flags[kFLAGS.PLAYER_DISARMED_UNDERWEAR_UPPER_ID] = item.id;
	}
	if (!player.headJewelry.isNothing) {
		item = player.unequipHeadJewelry(false, true);
		if (item && !item.isNothing) flags[kFLAGS.PLAYER_DISARMED_HEAD_ACCESORY_ID] = item.id;
	}
	if (player.hasPerk(PerkLib.BimboBody)) player.removePerk(PerkLib.BimboBody);
	if (player.hasPerk(PerkLib.BimboBrains)) player.removePerk(PerkLib.BimboBrains);
	if (player.hasPerk(PerkLib.BroBody)) player.removePerk(PerkLib.BroBody);
	if (player.hasPerk(PerkLib.BroBrains)) player.removePerk(PerkLib.BroBrains);
	if (player.hasPerk(PerkLib.FutaForm)) player.removePerk(PerkLib.FutaForm);
	if (player.hasPerk(PerkLib.FutaFaculties)) player.removePerk(PerkLib.FutaFaculties);
	player.updateRacialAndPerkBuffs();
	//awardAchievement("Thriller", kACHIEVEMENTS.EPIC_THRILLER);
	CoC.instance.mainViewManager.updateCharviewIfNeeded();
	model.time.days += 3;
	cleanupAfterCombat();
}

	}

}