/**
 * ...
 * @author Liadri
 */
package classes.Perks
{
	import classes.PerkClass;
	import classes.PerkType;
	import classes.CoC;
	
	public class DarkAscensionBottomlessHungerPerk extends PerkType
	{
		
		override public function desc(params:PerkClass = null):String
		{
			if (!player || !params) return _desc;
			return "(Rank: " + params.value1 + "/" + CoC.instance.charCreation.MAX_BOTTOMLESS_HUNGER_LEVEL + ") Raise max demonic energy capacity by " + params.value1 * 5 + "%.";
		}
		
		public function DarkAscensionBottomlessHungerPerk() 
		{
			super("Dark Ascension: Bottomless hunger", "Dark Ascension: Bottomless hunger", "", "Raise max demonic energy capacity by 5% per level.");
		}
		
		override public function keepOnAscension(respec:Boolean = false):Boolean
		{
			return true;
		}
	}

}
