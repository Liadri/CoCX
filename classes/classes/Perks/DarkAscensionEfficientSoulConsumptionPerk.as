/**
 * ...
 * @author Liadri
 */
package classes.Perks
{
	import classes.PerkClass;
	import classes.PerkType;
	import classes.CoC;
	
	public class DarkAscensionEfficientSoulConsumptionPerk extends PerkType
	{
		
		override public function desc(params:PerkClass = null):String
		{
			if (!player || !params) return _desc;
			return "(Rank: " + params.value1 + "/" + CoC.instance.charCreation.MAX_EFFICIENT_SOUL_CONSUMPTION_LEVEL + ") Decrease the cost of upgrading yourself through demonic energy by " + params.value1 * 5 + "%.";
		}
		
		public function DarkAscensionEfficientSoulConsumptionPerk() 
		{
			super("Dark Ascension: Efficient Soul Consumption", "Dark Ascension: Efficient Soul Consumption", "", "Decrease the cost of upgrading yourself through demonic energy by 5%.");
		}
		
		override public function keepOnAscension(respec:Boolean = false):Boolean
		{
			return true;
		}
	}

}
