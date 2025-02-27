﻿package classes.Scenes.Areas.Mountain
{
import classes.*;
import classes.BodyParts.Butt;
import classes.BodyParts.Hips;
import classes.BodyParts.Tail;
import classes.Scenes.SceneLib;
import classes.internals.*;

/**
	 * ...
	 * @author Fake-Name
	 */


	public class InfestedHellhound extends HellHound
	{
		//[Extra special attack]
		private function hellHoundWormCannon():void
		{
			outputText("The thing rears up onto its hind legs, revealing its more humanoid stature, and allowing it to use its flexible paws to caress its twinned-penises.  It lurches forwards powerfully, its thickness twitching and flaring as it launches a wave of worm-filled canine cum at you.");
			outputText("\n");
			if (rand(2) == 0) {
				//Get hit – 10+ lust
				player.takeLustDamage(5 + player.lib / 20, true);
				outputText("Taken off-guard by the unexpected sexual display, you fail to move out of the way, and the wormy jism splatters you from the chest down.");
				if (player.hasStatusEffect(StatusEffects.Infested) && player.cockTotal() > 0) {
					outputText("  The worms inside you begin moving and squirming. A few of your cum-soaked parasites crawl out from your shivering [cocks] as if attempting to meet the new arrivals.  You desperately want to brush them away, but the pleasure in your crotch is too good to fight, and you find yourself staying your hand as each and every one of the new worms makes it way into your [cocks].");
					if (player.hasBalls()) outputText("  Your [balls] grow weightier as the worms settle into their new home, arousing you beyond measure.");
					else outputText("  You can feel them shifting around inside you as they adjust to their new home, arousing you beyond measure.");
					player.takeLustDamage(10, true);
				}
				else if (player.cockTotal() > 0) {
					outputText("  The worms wriggle and squirm all over you, working their way towards your groin.  It tickles pleasantly, but you brush them away before they can get inside you.  The thought of being turned into a worm-dispensing cum fountain is horrifying, but it leaves you hard.");
					player.takeLustDamage((5 + Math.round(player.cor / 20)), true);
				}
				else if (player.hasVagina()) outputText("  Thankfully, the worms don't seem to want anything to do with you, and rapidly drop down to the ground.");
			}
			//Sidestep
			else {
				outputText("You sidestep the gush of wormy fluid, letting it splatter against the rocks behind you.");
				//(If infested +10 lust:  
				if (player.hasStatusEffect(StatusEffects.Infested) && player.hasCock()) {
					if (player.hasCock()) {
						outputText("  Despite avoiding the torrent of infected seed, your own wormy ");
						if (player.hasBalls()) outputText(ballsDescriptLight());
						else outputText(multiCockDescriptLight());
						outputText(" wriggle");
						if (player.balls == 0 && player.cockTotal() == 1) outputText("s");
						outputText(" hotly, expelling a few of your own worms in response along with a dribble of thick pre-cum.   You wonder what it would feel like to let his worms crawl inside you...");
						player.takeLustDamage(10, true);
					} else {
						CoC_Settings.error("Infested but no cock!");
						player.takeLustDamage(5, true);
						outputText("  The idea of being covered in the beast's infested seed arouses you slightly, but you shake your head violently and clear away the unwelcome thought.");
					}
				}
				//if aroused by worms +5 lust:
				else if (player.hasStatusEffect(StatusEffects.WormsOn) && !player.hasStatusEffect(StatusEffects.WormsHalf)) {
					player.takeLustDamage(5, true);
					outputText("  The idea of being covered in the beast's infested seed arouses you slightly, but you shake your head violently and clear away the unwelcome thought.");
				}
			}
			lust -= 25;
			if (lust < 40) lust = 40;
		}

		override public function defeated(hpVictory:Boolean):void
		{
			SceneLib.mountain.hellHoundScene.hellHoundPostFightOptions(hpVictory);
		}

		override public function won(hpVictory:Boolean, pcCameWorms:Boolean):void
		{
			if (pcCameWorms) {
				outputText("\n\nThe infested hellhound's heads both grin happily as it advances towards you...");
				doNext(SceneLib.mountain.infestedHellhoundScene.infestedHellhoundLossRape);
			} else if (hpVictory) {
				SceneLib.mountain.infestedHellhoundScene.infestedHellhoundLossRape();
			} else {
				SceneLib.mountain.infestedHellhoundScene.infestedHellhoundLossRape();
			}
		}

		public function InfestedHellhound()
		{
			super(true);
			trace("InfestedHellhound Constructor!");
			this.a = "the ";
			this.short = "infested hellhound";
			this.imageName = "infestedhellhound";
			this.long = "It looks like a large four-legged demon with two heads placed side-by-side. Its eyes and mouth are filled with flames, and covering each of its paws are large and menacing claws. A thick layer of dark fur covers his entire body like armor.  Both heads are looking at you hungrily as the hellhound circles around you.  A pair of black, slightly pointed cocks hang exposed, dripping with cum and worms.  You get the feeling reasoning with this beast will be impossible.";
			// this.plural = false;
			this.createCock(9, 2);
			this.createCock(9, 2);
			this.balls = 2;
			this.ballSize = 5;
			this.cumMultiplier = 8;
			this.createBreastRow();
			this.createBreastRow();
			this.createBreastRow();
			this.ass.analLooseness = AssClass.LOOSENESS_NORMAL;
			this.ass.analWetness = AssClass.WETNESS_NORMAL;
			this.tallness = 47;
			this.hips.type = Hips.RATING_AVERAGE;
			this.butt.type = Butt.RATING_AVERAGE + 1;
			this.skin.growFur({color:"black"});
			this.hairColor = "red";
			this.hairLength = 3;
			initStrTouSpeInte(287, 254, 218, 1);
			initWisLibSensCor(1, 295, 70, 100);
			this.weaponName = "claws";
			this.weaponVerb="claw";
			this.weaponAttack = 30;
			this.armorName = "thick fur";
			this.armorDef = 330;
			this.armorMDef = 60;
			this.bonusLust = 412;
			this.lust = 50;
			this.lustVuln = 0.87;
			this.level = 47;
			this.gems = 15 + rand(12);
            this.drop = new WeightedDrop().add(consumables.CANINEP, 3)
            					.addMany(1, consumables.BULBYPP,
            							consumables.KNOTTYP,
            							consumables.BLACKPP,
            							consumables.DBLPEPP,
            							consumables.LARGEPP);
			this.special1 = hellhoundFire;
			this.special2 = hellhoundScent;
			this.special3 = hellHoundWormCannon;
			this.tailType = Tail.DOG;
			this.createPerk(PerkLib.IceVulnerability, 0, 0, 0, 0);
			this.createPerk(PerkLib.EnemyBeastOrAnimalMorphType, 0, 0, 0, 0);
			checkMonster();
		}

	}

}
