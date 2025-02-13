/**
 * ...
 * @author Zavos
 */
package classes.Perks
{
	import classes.PerkClass;
	import classes.PerkType;

	public class ObsessionPerk extends PerkType
	{
		
		override public function desc(params:PerkClass = null):String
		{
			if (!player || !params) return _desc;
			return "Increases spell power by " + (params.value1 * 100) + "% and increases power and lowers the cost of black magic by " + (params.value2 * 100) + "%.";
		}

		public function ObsessionPerk()
		{
			super("Obsession", "Obsession",
					"Your equipment boosts your spells power and augment your black magic at the same time lowering it costs!");
		}
		
		override public function keepOnAscension(respec:Boolean = false):Boolean
		{
			return true;
		}
		
	}

}
