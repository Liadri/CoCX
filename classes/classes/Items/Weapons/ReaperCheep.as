package classes.Items.Weapons {
import classes.CoC;
import classes.Items.Weapon;
import classes.Items.IELib;
import classes.Scenes.Places.RuinedTownRebuilt;

public class ReaperCheep extends Weapon{
    public function ReaperCheep() { super("ReaperCheep", "ReaperCheep", "Reapercheep", "The Reapercheep Rapier", "stab", 20, 2000, "This wondrous sword pulses with energy, the razor-thin blade glowing as you remove it from its sheath. The blade ripples, folded metal reflecting its own light. The handguard is large, carved steel brushed with gold, and as you turn it over, you realise that its guard is shaped like Amily's head, with Sapphires for eyes. The pommel counterbalances the blade perfectly, and your body feels lighter as you hold it. ", WT_DUELING, WSZ_MEDIUM);
        withTags(W_RAPIER, W_PURE_TYPE);
        withEffect(IELib.ArmorPenetration, 100);
        withEffect(IELib.ScaleAttack_Spe, 50);
        withBuff('evasion', +4.0);
    }
    override public function get attack():Number{
        var mod:int = 0;
        mod = (RuinedTownRebuilt.prosperityvar);
        return 14 + mod;
    }
}
}
