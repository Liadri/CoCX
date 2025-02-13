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

	public final class LightAyoArmor extends Armor {
		
		public function LightAyoArmor() {//80 * armor + mres
			super("LAyoArm","LAyoArm","light ayo armor","a light ayo armor",60,10,5600,"This suit of armor is more than typical heavy armor—it has added pieces of Ayo Tech that increase its properties, as long as the user regularly feeds it with soulforce.","Light Ayo");
		}
		
		override public function get def():Number {
			var baseP:Number = 36;
			if (game.flags[kFLAGS.SOULFORCE_STORED_IN_AYO_ARMOR] > 0) baseP += 24;
			if (game.player.hasPerk(PerkLib.EfficientUsageOfSoulforce)) {
				if (game.player.touStat.core.value > 300) baseP *= 3;
				else baseP *= (1 + (game.player.touStat.core.value * 0.01));
			}
			return baseP;
		}
		
		override public function get mdef():Number {
			var baseM:Number = 6;
			if (game.flags[kFLAGS.SOULFORCE_STORED_IN_AYO_ARMOR] > 0) baseM += 4;
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
				game.player.buff("Ayo Armor").addStats( {"str.mult":-0.10, "spe.mult":-0.10} );
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
			if (game.player.str >= 20 && game.player.spe >= 20) return super.canEquip(doOutput, slot);
			if (doOutput) outputText("You aren't strong and agile enough to wear this armor!  Unless you like moving slower than a snail and hit weaker than a wet noddle!  ");
			return false;
		}
	}
}
