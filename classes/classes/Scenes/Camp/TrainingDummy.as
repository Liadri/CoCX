/**
 * ...
 * @author Ormael
 */
package classes.Scenes.Camp 
{
	import classes.*;
	import classes.internals.*;
	import classes.GlobalFlags.kFLAGS;
	
	public class TrainingDummy extends Monster
	{
		
		public function TrainingDummy(lvl:int = 0, lustImmune:Boolean = true, isGroup:Boolean = false) 
		{
			switch(lvl) {
				case 4: initStrTouSpeInte(9, 450, 34, 10);
						initWisLibSensCor(10, 34, 5, 0);
						this.bonusHP = 500000;
						this.bonusLust = 279;
						this.armorDef = 25000;
						this.armorMDef = 25000;
						this.level = 240;
						break;
				case 3: initStrTouSpeInte(7, 350, 26, 10);
						initWisLibSensCor(10, 26, 5, 0);
						this.bonusHP = 380000;
						this.bonusLust = 211;
						this.armorDef = 19000;
						this.armorMDef = 19000;
						this.level = 180;
						break;
				case 2: initStrTouSpeInte(5, 250, 18, 10);
						initWisLibSensCor(10, 18, 5, 0);
						this.bonusHP = 260000;
						this.bonusLust = 143;
						this.armorDef = 13000;
						this.armorMDef = 13000;
						this.level = 120;
						break;
				case 1: initStrTouSpeInte(3, 150, 10, 10);
						initWisLibSensCor(10, 10, 5, 0);
						this.bonusHP = 140000;
						this.bonusLust = 75;
						this.armorDef = 7000;
						this.armorMDef = 7000;
						this.level = 60;
						break;
				case 0:
				default:initStrTouSpeInte(1, 50, 2, 10);
						initWisLibSensCor(10, 2, 5, 0);
						this.bonusHP = 20000;
						this.bonusLust = 7;
						this.armorDef = 1000;
						this.armorMDef = 1000;
						this.level = 0;
						this.createPerk(PerkLib.EnemyForBeginnersType, 0, 0, 0, 0);
				break;
			}
			if (isGroup) {
				this.short = "training dummies";
				this.long = "You're currently facing training dummies. Maybe they can't harm a fly (too much), but they can still take quite a beating before falling apart...";
			}
			else {
				this.short = "training dummy";
				this.long = "You're currently facing a training dummy. It can't harm a fly (too much), but it can still take a beating before it falls apart...";
			}
			this.a = "the ";
			this.imageName = "trainingdummy";
			this.plural = isGroup;
			this.lustVuln = lustImmune? 0: 1;
			this.tallness = 144;
			this.createBreastRow(0, 1);
			initGenderless();
			this.drop = NO_DROP;
			this.weaponName = "dummy stick";
			this.weaponVerb = "smash";
			this.weaponAttack = 1;
			this.armorName = "dummy stick";
			this.createPerk(PerkLib.TankI, 0, 0, 0, 0);
			this.createPerk(PerkLib.CheetahI, 0, 0, 0, 0);
			this.createPerk(PerkLib.NoDodges, 0, 0, 0, 0);
			this.createPerk(PerkLib.NoExpGained, 0, 0, 0, 0);
			this.createPerk(PerkLib.NoItemsGained, 0, 0, 0, 0);
			this.createPerk(PerkLib.EnemyConstructType, 0, 0, 0, 0);
			this.createPerk(PerkLib.AlwaysSuccesfullRunaway, 0, 0, 0, 0);
			if (lvl >= 1) {
				this.createPerk(PerkLib.EpicToughness, 0, 0, 0, 0);
				this.createPerk(PerkLib.EpicSpeed, 0, 0, 0, 0);
				this.createPerk(PerkLib.EpicLibido, 0, 0, 0, 0);
			}
			if (lvl >= 2) {
				this.createPerk(PerkLib.LegendaryToughness, 0, 0, 0, 0);
				this.createPerk(PerkLib.LegendarySpeed, 0, 0, 0, 0);
				this.createPerk(PerkLib.LegendaryLibido, 0, 0, 0, 0);
			}
			if (lvl >= 3) {
				this.createPerk(PerkLib.GoliathI, 0, 0, 0, 0);
				this.createPerk(PerkLib.EpicStrength, 0, 0, 0, 0);
				this.createPerk(PerkLib.EnemyBossType, 0, 0, 0, 0);
			}
			if (lvl >= 4) {
				this.createPerk(PerkLib.MythicalStrength, 0, 0, 0, 0);
				this.createPerk(PerkLib.MythicalToughness, 0, 0, 0, 0);
				this.createPerk(PerkLib.MythicalSpeed, 0, 0, 0, 0);
				this.createPerk(PerkLib.MythicalIntelligence, 0, 0, 0, 0);
				this.createPerk(PerkLib.MythicalWisdom, 0, 0, 0, 0);
				this.createPerk(PerkLib.MythicalLibido, 0, 0, 0, 0);
				this.createPerk(PerkLib.EnemyHugeType, 0, 0, 0, 0);
			}
			if (isGroup) this.createPerk(PerkLib.EnemyGroupType, 0, 0, 0, 0);
			if (lvl == 1) {
				this.createPerk(PerkLib.DieHardHP, 60, 0, 0, 0);
				this.createPerk(PerkLib.OverMaxHP, 60, 0, 0, 0);
				this.createPerk(PerkLib.OverMaxLust, 60, 0, 0, 0);
				this.createPerk(PerkLib.EnemyEliteType, 0, 0, 0, 0);
			}
			else if (lvl == 2) {
				this.createPerk(PerkLib.DieHardHP, 120, 0, 0, 0);
				this.createPerk(PerkLib.OverMaxHP, 120, 0, 0, 0);
				this.createPerk(PerkLib.OverMaxLust, 120, 0, 0, 0);
				this.createPerk(PerkLib.EnemyChampionType, 0, 0, 0, 0);
			}
			else if (lvl == 3) {
				this.createPerk(PerkLib.DieHardHP, 180, 0, 0, 0);
				this.createPerk(PerkLib.OverMaxHP, 180, 0, 0, 0);
				this.createPerk(PerkLib.OverMaxLust, 180, 0, 0, 0);
			}
			else if (lvl == 4) {
				this.createPerk(PerkLib.DieHardHP, 240, 0, 0, 0);
				this.createPerk(PerkLib.OverMaxHP, 240, 0, 0, 0);
				this.createPerk(PerkLib.OverMaxLust, 240, 0, 0, 0);
			}
			checkMonster();
		}
		
	}

}