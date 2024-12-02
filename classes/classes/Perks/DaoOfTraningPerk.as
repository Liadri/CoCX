/**
 * ...
 * @author Ormael
 */
package classes.Perks
{
	import classes.PerkClass;
	import classes.PerkType;
	import classes.PerkLib;
	import classes.GlobalFlags.kFLAGS;
	import classes.CoC;
	
	public class DaoOfTraningPerk extends PerkType
	{
		override public function desc(params:PerkClass = null):String
		{
			if (!player || !params) return _desc;
			var pVal:Number = player.perkv1(PerkLib.DaoOfTraning);
			var descS:String = "Add " + flags[kFLAGS.SOULFORCE_GAINED_FROM_CULTIVATING] + "% to Magical";
			if (pVal > 1) descS += " Soulskill Effect Multiplier and " + flags[kFLAGS.SOULFORCE_GAINED_FROM_CULTIVATING]*0.1 + "% to ";
			descS += " Soulskill Effect Multiplier. (Rank: " + params.value1 + ")";
            return descS;
		}
		
		public function DaoOfTraningPerk() 
		{
			super("Dao of Training", "Dao of Training",
					"Dao of Training is endless.");
		}
	}
}
