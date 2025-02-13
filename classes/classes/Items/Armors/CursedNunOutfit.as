/**
 * @author Liadri
 */
package classes.Items.Armors
{
	import classes.Items.Armor;
	import classes.Items.Equipable;
	import classes.PerkLib;
	import classes.Player;
	import classes.StatusEffects;

	public class CursedNunOutfit extends Armor
	{
		
		public function CursedNunOutfit()
		{
			super("Prayer.0", "PrayerOutfit","prayer outfit","a prayer outfit",0,8,1600,"A religious outfit made for worshipers of a certain deity, typically worn by" +
					" nuns and monks. It is immaculate white with silver embroidery." +
					" This outfit empowers healing magic and strangely perhaps... tease?","Light");
			withBuffs({'spellcost': -0.40},{'teasedmg': +10});
			withTag(A_REVEALING);
		}
		
	}
}
