/**
 * ...
 * @author Ormael
 */
package classes.Items.Armors
{
	import classes.GlobalFlags.kFLAGS;
	import classes.ItemType;
	import classes.Items.Armor;
	import classes.PerkLib;
	import classes.Player;
	import classes.EngineCore;

	public class HBArmor extends Armor {
		
		public function HBArmor() {//160 * armor + mres
			super("HBArmor","HBArmor","HB armor","a HB armor",100,80,28800,"This white suit of armor is more than just platemail - it was reverse-engineered from the nearly intact armor of an elf-like offworlder. Its protective properties increase as long as the user regularly feeds it with soulforce. (Req. to be 7+ feet tall)","Light Ayo");
		}
		
		override public function get def():Number {
			var baseP:Number = 60;
			if (game.flags[kFLAGS.SOULFORCE_STORED_IN_AYO_ARMOR] > 0) baseP += 40;
			if (game.player.hasPerk(PerkLib.EfficientUsageOfSoulforce)) {
				if (game.player.touStat.core.value > 300) baseP *= 3;
				else baseP *= (1 + (game.player.touStat.core.value * 0.01));
			}
			return baseP;
		}
		
		override public function get mdef():Number {
			var baseM:Number = 48;
			if (game.flags[kFLAGS.SOULFORCE_STORED_IN_AYO_ARMOR] > 0) baseM += 32;
			if (game.player.hasPerk(PerkLib.EfficientUsageOfSoulforce)) {
				if (game.player.touStat.core.value > 300) baseM *= 3;
				else baseM *= (1 + (game.player.touStat.core.value * 0.01));
			}
			return baseM;
		}

		override public function afterEquip(doOutput:Boolean, slot:int):void {
			if (!game.isLoadingSave) {
				var oldHPratio:Number = game.player.hp100/100;
				game.flags[kFLAGS.SOULFORCE_STORED_IN_AYO_ARMOR] = 0;
				game.player.buff("Ayo Armor").remove();
				game.player.buff("Ayo Armor").addStats( {"str.mult":-0.18, "spe.mult":-0.60} );
				game.player.HP = oldHPratio*game.player.maxHP();
				EngineCore.statScreenRefresh();
			}
			super.afterEquip(doOutput, slot);
		}
		
		override public function afterUnequip(doOutput:Boolean, slot:int):void {
			if (game.flags[kFLAGS.SOULFORCE_STORED_IN_AYO_ARMOR] > 0) {
				game.player.soulforce += game.flags[kFLAGS.SOULFORCE_STORED_IN_AYO_ARMOR];
				if (game.player.soulforce > game.player.maxOverSoulforce()) game.player.soulforce = game.player.maxOverSoulforce();
				game.flags[kFLAGS.SOULFORCE_STORED_IN_AYO_ARMOR] = 0;
			}
			super.afterUnequip(doOutput, slot);
		}
		
		override public function canEquip(doOutput:Boolean, slot:int):Boolean {
			if (game.player.str >= 60 && game.player.spe >= 60 && game.player.tallness >= 84) return super.canEquip(doOutput, slot);
			if (doOutput) {
				if (game.player.tallness < 84) outputText("You aren't tall enough to wear this armor!  ");
				else outputText("You aren't strong and agile enough to wear this armor!  Unless you likes moving slower than a snail and hitting weaker than a wet noddle!  ");
			}
			return false;
		}
	}
}
