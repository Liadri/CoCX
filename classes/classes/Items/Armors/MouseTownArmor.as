package classes.Items.Armors {
import classes.Items.Armor;
import classes.Scenes.Places.RuinedTownRebuilt;

public class MouseTownArmor extends Armor {
    public function MouseTownArmor() {
        super("ShuRatto", "ShuRatto", "Mouse-made Chainmail", "a set of ornate, enchanted Chainmail from Mousetown", 80, 40, 4800, "This silvery set of mail is thin and light, silvered links shining with their own light. The pauldrons are plate, made from the same silvered steel, and gauntlets are similar, with an ebonweave interior. The armor is lightweight, but very protective, and shines with a clear light. When you touch the mail, it lights up depending on how hard you touched it, and you can barely feel the touch at all. \n" +
                "\n" +
                "A thin metal helm comes with the armor, with thin strips of metal extending from the sides and rear. While adding next to no weight, the ‘whiskers’ of silvery steel give you an increased sense of the air around you. ", "Light", false, false);
        withTag(A_AGILE);
    }
    override public function get def():Number{
        var mod:int = 0;
        mod = (RuinedTownRebuilt.prosperityvar/5);
        return 14 + mod;
    }
    override public function get mdef():Number{
        var mod:int = 0;
        mod = (RuinedTownRebuilt.prosperityvar/5);
        return 14 + mod;
    }
}
}
