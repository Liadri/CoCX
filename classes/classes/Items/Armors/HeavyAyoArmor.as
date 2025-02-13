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

	public class HeavyAyoArmor extends Armor {
		
		public function HeavyAyoArmor() {//100 * armor + mres
			super("HAyoArm","HAyoArm","heavy ayo armor","a heavy ayo armor",120,20,14000,"This suit of armor is more than typical heavy armor — It has added pieces of Ayo Tech that greatly enhance its properties, as long as the user regularly feeds it with soulforce.","Heavy Ayo");
		}
		
		override public function get def():Number {
			var baseP:Number = 72;
			if (game.flags[kFLAGS.SOULFORCE_STORED_IN_AYO_ARMOR] > 0) baseP += 48;
			if (game.player.hasPerk(PerkLib.EfficientUsageOfSoulforce)) {
				if (game.player.touStat.core.value > 300) baseP *= 3;
				else baseP *= (1 + (game.player.touStat.core.value * 0.01));
			}
			return baseP;
		}
		
		override public function get mdef():Number {
			var baseM:Number = 12;
			if (game.flags[kFLAGS.SOULFORCE_STORED_IN_AYO_ARMOR] > 0) baseM += 8;
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
				game.player.buff("Ayo Armor").addStats( {"str.mult":-0.20, "spe.mult":-0.20} );
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
			game.player.buff("Ayo Armor").remove();
			super.afterUnequip(doOutput, slot);
		}
		
		override public function canEquip(doOutput:Boolean, slot:int):Boolean {
			if (game.player.str >= 40 && game.player.spe >= 40) return super.canEquip(doOutput, slot);
			if(doOutput) outputText("You aren't strong or agile enough to wear this armor!  Unless you like moving slower than a snail and hitting weaker than a wet noodle!  ");
			return false;
		}
	}
}
