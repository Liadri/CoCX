/**
 * ...
 * @author Zavos
 */
package classes.Items.HeadJewelries
{
	import classes.Items.HeadJewelry;
	import classes.PerkLib;

	public class SeersHairpin extends HeadJewelry
	{
		
		public function SeersHairpin()
		{
			super("SeerPin", "Seer’s Hairpin", "seer’s hairpin", "a seer’s hairpin", 0, 0, 1600, "This hairpin is made from silver, the tip twisted into the shape of an eye and fitted with a crystal lens. Both an ornament and a tool, this pin will empower sorcery and soulforce.",HJT_HAIRPIN);
		}
		
		override public function get description():String {
			var desc:String = _description;
			//Type
			desc += "\n\nType: Jewelry (Hairpin)";
			//Value
			desc += "\nBase value: " + String(value);
			//Perk
			desc += "\nSpecial: Seer’s Insight (+20% spell effect/magical soulspell power multiplier, 20% fatigue/soulforce costs reduction)";
			return desc;
		}
		
		override public function afterEquip(doOutput:Boolean):void {
			if (!game.isLoadingSave) {
				while (game.player.hasPerk(PerkLib.SeersInsight)) game.player.removePerk(PerkLib.SeersInsight);
				game.player.createPerk(PerkLib.SeersInsight, 0.2, 0, 0, 0);
			}
			super.afterEquip(doOutput);
		}
		
		override public function afterUnequip(doOutput:Boolean):void {
			while (game.player.hasPerk(PerkLib.SeersInsight)) game.player.removePerk(PerkLib.SeersInsight);
			super.afterUnequip(doOutput);
		}
		
	}

}
