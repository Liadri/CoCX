package classes.Scenes.Places.Ingnam
{
import classes.*;
import classes.BodyParts.Butt;
import classes.BodyParts.Hips;
import classes.GlobalFlags.*;
import classes.Scenes.SceneLib;
import classes.internals.*;

public class Thief extends Monster
	{
		override protected function performCombatAction():void
		{
			//1/3 chance of base attack + bonus if in acid mode
			if (flags[kFLAGS.INGNAM_ENEMIES] == 2) eAttack();
			eAttack();
		}
		
		override public function defeated(hpVictory:Boolean):void
		{
			SceneLib.ingnam.thiefScene.winAgainstThief();
		}
		
		public function Thief()
		{
			if (flags[kFLAGS.INGNAM_ENEMIES] == 0) {
				this.short = "thief associate";
				this.long = "The thief associate standing before you is a human.  His skin is fairly pale and his hair is brown.  He's wearing a set of leather armor and wielding a knife in his right hand.  He's intent on knocking you out so he can take your gems.";
				this.bodyColor = "light";
				this.hairColor = "brown";
				this.hairLength = 4;
				initStrTouSpeInte(9, 5, 5, 8);
				initWisLibSensCor(8, 7, 9, -40);
				this.weaponName = "knife";
				this.weaponVerb = "slash";
				this.weaponAttack = 1;
				this.armorName = "leather armor";
				this.armorDef = 2;
				this.armorMDef = 0;
				this.bonusLust = 17;
				this.lust = 10;
				this.level = 1;
				this.gems = 5 + rand(3);
				this.drop = new WeightedDrop()
						.add(armors.LEATHRA,4)
						.add(null, 6);
				this.createPerk(PerkLib.EnemyForBeginnersType, 0, 0, 0, 0);
			}
			if (flags[kFLAGS.INGNAM_ENEMIES] == 1) {
				this.short = "thief";
				this.long = "The thief standing before you is a human.  His skin is fairly pale and his hair is black.  He's wearing a set of leather armor and wielding a dagger in his right hand.  He's intent on knocking you out so he can take your gems.";
				this.bodyColor = "light";
				this.hairColor = "black";
				this.hairLength = 4;
				initStrTouSpeInte(25, 11, 11, 15);
				initWisLibSensCor(15, 12, 25, -10);
				this.weaponName = "dagger";
				this.weaponVerb = "slash";
				this.weaponAttack = 4;
				this.armorName = "leather armor";
				this.armorDef = 7;
				this.armorMDef = 0;
				this.bonusHP = 20;
				this.bonusLust = 42;
				this.lust = 15;
				this.level = 5;
				this.gems = 10 + rand(5);
				this.drop = new WeightedDrop()
						.add(armors.LEATHRA,2)
						.add(weapons.DAGGER,3)
						.add(null, 5);
				this.createPerk(PerkLib.TankI, 0, 0, 0, 0);
				this.createPerk(PerkLib.EnemyForBeginnersType, 0, 0, 0, 0);
			}
			if (flags[kFLAGS.INGNAM_ENEMIES] == 2) {
				this.short = "thief captain";
				this.long = "The thief standing before you is a human.  His skin is extremly pale and his hair is white.  He's wearing a set of enhanced leather armor and wielding twin daggers in his hands.  He's intent on knocking you out so he can take your gems.";
				this.bodyColor = "pale";
				this.hairColor = "white";
				this.hairLength = 2;
				initStrTouSpeInte(41, 16, 16, 22);
				initWisLibSensCor(22, 17, 41, 20);
				this.weaponName = "twin daggers";
				this.weaponVerb = "slash";
				this.weaponAttack = 7;
				this.armorName = "enhanced leather armor";
				this.armorDef = 12;
				this.armorMDef = 3;
				this.bonusHP = 50;
				this.bonusLust = 67;
				this.lust = 20;
				this.level = 9;
				this.gems = 15 + rand(7);
				this.drop = new WeightedDrop()
						.add(armors.LEATHRA,2)
						.add(weapons.DAGGER,4)
						.add(consumables.H_PILL,4);
				this.createPerk(PerkLib.TankI, 0, 0, 0, 0);
				this.createPerk(PerkLib.EnemyEliteType, 0, 0, 0, 0);
			}
			if (flags[kFLAGS.INGNAM_ENEMIES] == 3) {
				this.short = "thief underboss";
				
				this.createPerk(PerkLib.TankI, 0, 0, 0, 0);
				this.createPerk(PerkLib.RefinedBodyI, 0, 0, 0, 0);
				this.createPerk(PerkLib.EnemyChampionType, 0, 0, 0, 0);
			}
			if (flags[kFLAGS.INGNAM_ENEMIES] == 4) {
				this.short = "thief boss";
				
				this.createPerk(PerkLib.TankI, 0, 0, 0, 0);
				this.createPerk(PerkLib.RefinedBodyI, 0, 0, 0, 0);
				this.createPerk(PerkLib.EnemyBossType, 0, 0, 0, 0);
			}
			this.a = "the ";
			this.imageName = "thief";
			// this.plural = false;
			this.createCock();
			createBreastRow(Appearance.breastCupInverse("flat"));
			this.ass.analLooseness = AssClass.LOOSENESS_NORMAL;
			this.ass.analWetness = AssClass.WETNESS_NORMAL;
			this.tallness = 5*12 + 5 + rand(4);
			this.hips.type = Hips.RATING_BOYISH;
			this.butt.type = Butt.RATING_TIGHT;
			checkMonster();
		}
	}
}