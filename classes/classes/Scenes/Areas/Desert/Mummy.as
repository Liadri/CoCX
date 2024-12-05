/**
 * ...
 * @author Liadri
 */
package classes.Scenes.Areas.Desert 
{
import classes.*;
import classes.BodyParts.Butt;
import classes.BodyParts.Hips;
import classes.GlobalFlags.kFLAGS;
import classes.Scenes.SceneLib;
import classes.internals.*;

	public class Mummy extends Monster
	{
		private var lumbering:Number = 0;
		
		private function MummyLumbering():void {
			outputText("The mummy tries to get closer by lumbering toward you.");
			lumbering += 1;
		}
		
		public function MummyUndyingFlurry():void {
			outputText("The mummy flails wildly attempting to strike you with its claw like nails.");
			var muf:Number = 25;
			while (muf-->0) MummyUndyingFlurryH();
			outputText("You hastily back away from your opponent after the attack, not eager to take more of this beating so soon.");
		}
		private function MummyUndyingFlurryH():void {
			if (player.getEvasionRoll()) outputText("<b>Miss</b> ");
			else {
				var muf1:Number = 0;
				muf1 += this.str;
				muf1 += eBaseStrengthDamage()
				muf1 = player.takePhysDamage(muf1, true);
				var damageLust:Number = Math.round(this.lib / 50);
				player.takeLustDamage(damageLust, true);
				outputText(" ");
			}
		}
		
		public function MummyDrainingKiss():void {
			outputText("The mummy stumbles over and attempts to grab you. ");
			if (player.hasPerk(PerkLib.TitanicSize)) {
				outputText("Well it tries… your frame is kind of massive so you just shrug the zombie off.");
				lumbering = 0;
			}
			else {
				if (player.getEvasionRoll()) outputText("You manage to duck out of the walking dead’s embrace.");
				else {
					outputText("It closes its arms into a mighty embrace which, to your horror, you find very hard to break out of. While you struggle, the mummy forces in a kiss. Your head spins as your energy is being drained by the mummy. In a last ditch effort, you manage to shove the undead off a few feet back.");
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
					lumbering = 0;
				}
			}
		}
		
		override protected function performCombatAction():void
		{
			if (lumbering < 2) MummyLumbering();
			else {
				if (rand(2) == 0) MummyUndyingFlurry();
				else MummyDrainingKiss();
			}
		}
		
		override public function defeated(hpVictory:Boolean):void
		{
			SceneLib.zombiesmummies.defeatZombieMummy();
		}
		
		override public function won(hpVictory:Boolean,pcCameWorms:Boolean):void
		{
			if (flags[kFLAGS.ZOMBIE_MUMMY_GENDER] == 4 || flags[kFLAGS.ZOMBIE_MUMMY_GENDER] == 6) SceneLib.zombiesmummies.loseToMummy();
			else SceneLib.zombiesmummies.loseToMummy(true);
		}
		
		public function Mummy() 
		{
			if (flags[kFLAGS.ZOMBIE_MUMMY_GENDER] == 5) {
				this.long = "This tan naked woman lumbers toward you with unwavering determination, her greedy hands hanging in front of her as she tries to grab you. Her mouth groans with unrestrained hunger as it tries to get closer. This mummy is starved for sex and intends to rape you to satisfy its craving for life. You do notice that its body is also covered with various protective amulets which you assume grants it a good amount of resistance to spells.";
				this.createVagina(false, VaginaClass.WETNESS_NORMAL, VaginaClass.LOOSENESS_LOOSE);
				createBreastRow(Appearance.breastCupInverse("E"));
				this.hips.type = Hips.RATING_CURVY;
				this.butt.type = Butt.RATING_JIGGLY;
			}
			else if (flags[kFLAGS.ZOMBIE_MUMMY_GENDER] == 7) {
				this.long = "This tan naked woman lumbers toward you with unwavering determination, her greedy hands hanging in front of her as she tries to grab you. Her mouth groans with unrestrained hunger as it tries to get closer. This mummy is starved for sex and intends to rape you to satisfy its craving for life. You do notice that its body is also covered with various protective amulets which you assume grants it a good amount of resistance to spells.";
				this.createVagina(false, VaginaClass.WETNESS_WET, VaginaClass.LOOSENESS_GAPING);
				createBreastRow(Appearance.breastCupInverse("F"));
				this.hips.type = Hips.RATING_CURVY + 2;
				this.butt.type = Butt.RATING_JIGGLY + 2;
			}
			else if (flags[kFLAGS.ZOMBIE_MUMMY_GENDER] == 4) {
				this.long = "This tan naked man lumbers toward you with unwavering determination, his greedy hands hanging in front of him as he tries to grab you. His mouth groans with unrestrained hunger as it tries to get closer. This mummy is starved for sex and intends to rape you to satisfy its craving for life. You do notice that its body is also covered with various protective amulets which you assume grants it a good amount of resistance to spells.";
				this.createCock(18,2.5,CockTypesEnum.HUMAN);
				this.balls = 2;
				this.ballSize = 2;
				this.cumMultiplier = 4;
				createBreastRow(0);
				this.hips.type = Hips.RATING_AVERAGE;
				this.butt.type = Butt.RATING_AVERAGE;
			}
			else {
				this.long = "This tan naked man lumbers toward you with unwavering determination, his greedy hands hanging in front of him as he tries to grab you. His mouth groans with unrestrained hunger as it tries to get closer. This mummy is starved for sex and intends to rape you to satisfy its craving for life. You do notice that its body is also covered with various protective amulets which you assume grants it a good amount of resistance to spells.";
				this.createCock(21,3,CockTypesEnum.HUMAN);
				this.balls = 2;
				this.ballSize = 3;
				this.cumMultiplier = 5;
				createBreastRow(0);
				this.hips.type = Hips.RATING_AVERAGE;
				this.butt.type = Butt.RATING_AVERAGE;
			}
			if (flags[kFLAGS.ZOMBIE_MUMMY_GENDER] == 4 || flags[kFLAGS.ZOMBIE_MUMMY_GENDER] == 5) {
				initStrTouSpeInte(173, 165, 15, 17);
				initWisLibSensCor(17, 170, 170, 0);
				this.weaponAttack = 5;
				this.armorDef = 60;
				this.armorMDef = 300;
				this.bonusHP = 250;
				this.bonusLust = 358;
				this.level = 18;
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
			this.short = "mummy";
			this.imageName = "mummy";
			this.plural = false;
			this.ass.analLooseness = AssClass.LOOSENESS_TIGHT;
			this.ass.analWetness = AssClass.WETNESS_NORMAL;
			this.tallness = 78;
			this.bodyColor = "tan";
			this.hairColor = "white";
			this.hairLength = 4;
			this.weaponName = "glowing purple nails";
			this.weaponVerb="claws";
			this.armorName = "skin";
			this.gems = 10 + rand(5);
			this.drop = NO_DROP;
			this.createPerk(PerkLib.EnemyUndeadType, 0, 0, 0, 0);
			createStatusEffect(StatusEffects.LowtierMagicImmunity, 0, 0, 0, 0);
			checkMonster();
		}
		
	}

}