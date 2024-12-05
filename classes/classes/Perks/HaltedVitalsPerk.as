package classes.Perks
{
	import classes.PerkClass;
	import classes.PerkType;
	import classes.CoC;
	
	public class HaltedVitalsPerk extends PerkType
	{
		
		override public function desc(params:PerkClass = null):String
		{
			if (!player || !params) return _desc;
			var descS:String = "Your vitals are frozen in time by ";
			if (params.value1 > 0) descS += "mummification which is the result of an anubis curse. This allows";
			else descS += "the magic of the curse tag, allowing";
            descS += " you to live without the need for breathing, eating and a heartbeat. It also reduces damage taken from physical attacks by 20%. Furthermore your vitality is based on your libido rather than your toughness.";
			return descS;
		}
		
		public function HaltedVitalsPerk() 
		{
			super("Halted vitals", "Halted vitals", "Your vitals are frozen in time by the magic of the curse tag, allowing you to live without the need for breathing, eating and a heartbeat. It also reduces damage taken from physical attacks by 20%. Furthermore your vitality is based on your libido rather than your toughness.");
		}
	}
}
