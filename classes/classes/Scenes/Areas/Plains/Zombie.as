/**
 * ...
 * @author Liadri
 */
package classes.Scenes.Areas.Plains 
{
import classes.*;
import classes.BodyParts.Butt;
import classes.BodyParts.Hips;
import classes.GlobalFlags.kFLAGS;
import classes.Scenes.SceneLib;
import classes.internals.*;

	public class Zombie extends Monster
	{
		private var hopping:Number = 0;
		
		private function ZombieHop():void {
			outputText("The zombie tries to get closer by hopping toward you.");
			hopping += 1;
		}
		
		public function ZombieUndyingFlurry():void {
			outputText("The zombie flails wildly attempting to strike you with its claw like nails.");
			var zuf:Number = 25;
			while (zuf-->0) ZombieUndyingFlurryH();
			outputText("You hastily back away from your opponent after the attack, not eager to take more of this beating so soon.");
		}
		private function ZombieUndyingFlurryH():void {
			if (player.getEvasionRoll()) outputText("<b>Miss</b> ");
			else {
				var zuf1:Number = 0;
				zuf1 += this.str;
				zuf1 += eBaseStrengthDamage()
				zuf1 = player.takePhysDamage(zuf1, true);
				var damageLust:Number = Math.round(this.lib / 50);
				player.takeLustDamage(damageLust, true);
				outputText(" ");
			}
		}
		
		public function ZombieDrainingKiss():void {
			outputText("The zombie stumbles over and attempts to grab you. ");
			if (player.hasPerk(PerkLib.TitanicSize)) {
				outputText("Well it tries… your frame is kind of massive so you just shrug the zombie off.");
				hopping = 0;
			}
			else {
				if (player.getEvasionRoll()) outputText("You manage to duck out of the walking dead’s embrace.");
				else {
					outputText("It closes its arms into a mighty embrace which, to your horror, you find very hard to break out of. While you struggle, the zombie forces in a kiss. Your head spins as your energy is being drained by the zombie. In a last ditch effort, you manage to shove the undead off a few feet back.");
					var damageLust:Number = Math.round(player.lib * 2);
					player.takeLustDamage(damageLust, true, false);
					EngineCore.changeFatigue(Math.round(player.maxFatigue()*0.2));
					EngineCore.ManaChange(-Math.round(player.maxMana()*0.2));
					EngineCore.SoulforceChange( -Math.round(player.maxSoulforce() * 0.2));
					var curseTou:Number = player.tou * 0.1;
					if (curseTou < 1) curseTou = 1;
					else curseTou = Math.round(curseTou);
					player.addCurse("tou", curseTou, 2);
					addHP(Math.round(maxHP() * 0.25));
					hopping = 0;
				}
			}
		}
		
		override protected function performCombatAction():void
		{
			if (hopping < 2) ZombieHop();
			else {
				if (rand(2) == 0) ZombieUndyingFlurry();
				else ZombieDrainingKiss();
			}
		}
		
		override public function defeated(hpVictory:Boolean):void
		{
			SceneLib.zombiesmummies.defeatZombieMummy();
		}
		
		override public function won(hpVictory:Boolean,pcCameWorms:Boolean):void
		{
			if (flags[kFLAGS.ZOMBIE_MUMMY_GENDER] == 0 || flags[kFLAGS.ZOMBIE_MUMMY_GENDER] == 2) SceneLib.zombiesmummies.loseToZombie();
			else SceneLib.zombiesmummies.loseToZombie(true);
		}
		
		public function Zombie() 
		{
			if (flags[kFLAGS.ZOMBIE_MUMMY_GENDER] == 1 || flags[kFLAGS.ZOMBIE_MUMMY_GENDER] == 3) {
				this.long = "This pale naked woman slowly hops toward you with unwavering determination, her greedy hands hanging in front of her as she tries to grab you. Her mouth sports a set of fiendish canines more at home on a monster then a human and regularly lets out a dim-witted moan. This zombie, for lacking of a better word, is starved for sex and intends to rape you to satisfy its craving for life.";
				this.createVagina(false, VaginaClass.WETNESS_NORMAL, VaginaClass.LOOSENESS_LOOSE);
				createBreastRow(Appearance.breastCupInverse("B"));
				this.hips.type = Hips.RATING_AMPLE;
				this.butt.type = Butt.RATING_AVERAGE;
			}
			else {
				this.long = "This pale naked man slowly hops toward you with unwavering determination, his greedy hands hanging in front of him as he tries to grab you. His mouth sports a set of fiendish canines more at home on a monster then a human and regularly lets out a dim-witted moan. This zombie, for lacking of a better word, is starved for sex and intends to rape you to satisfy its craving for life.";
				this.createCock(15,2,CockTypesEnum.HUMAN);
				this.balls = 2;
				this.ballSize = 1;
				this.cumMultiplier = 3;
				createBreastRow(0);
				this.hips.type = Hips.RATING_SLENDER;
				this.butt.type = Butt.RATING_TIGHT;
			}
			if (flags[kFLAGS.ZOMBIE_MUMMY_GENDER] == 2 || flags[kFLAGS.ZOMBIE_MUMMY_GENDER] == 3) {
				initStrTouSpeInte(383, 453, 50, 42);
				initWisLibSensCor(42, 420, 420, 0);
				this.weaponAttack = 50;
				this.armorDef = 200;
				this.armorMDef = 1000;
				this.bonusHP = 1000;
				this.bonusLust = 893;
				this.level = 53;
			}
			else {
				initStrTouSpeInte(283, 305, 30, 27);
				initWisLibSensCor(27, 270, 270, 0);
				this.weaponAttack = 30;
				this.armorDef = 120;
				this.armorMDef = 600;
				this.bonusHP = 500;
				this.bonusLust = 576;
				this.level = 36;
			}
			this.a = "the ";
			this.short = "zombie";
			this.imageName = "zombie";
			this.plural = false;
			this.ass.analLooseness = AssClass.LOOSENESS_TIGHT;
			this.ass.analWetness = AssClass.WETNESS_NORMAL;
			this.tallness = 78;
			this.bodyColor = "pale blue";
			this.hairColor = "white";
			this.hairLength = 4;
			this.weaponName = "glowing purple nails";
			this.weaponVerb="claws";
			this.armorName = "skin";
			this.gems = 10 + rand(5);
			this.drop = NO_DROP;
			this.createPerk(PerkLib.EnemyUndeadType, 0, 0, 0, 0);
			checkMonster();
		}
		
	}

}
