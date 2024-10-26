package classes.Races {
import classes.BodyParts.*;
import classes.GeneticMemories.RaceMem;
import classes.PerkLib;
import classes.Race;

public class MummyRace extends Race {
	
	public static const MummySkinColors:/*String*/Array = ["tan", "olive", "dark"];
    public static const RaceBody:/*String*/Array = [
        /*Antenna*/		"Human",
        /*Arms*/		"Mummy",
        /*Balls*/		"Human",
        /*Breasts*/		"Human",
        /*Nips*/		"Human",
        /*Ears*/		"Human",
        /*Eyes*/		"Mummy",
        /*Face*/		"Mummy",
        /*Gills*/		"None",
        /*Hair*/		"Human",
        /*Horns*/		"Mummy",
        /*LowerBody*/	"Mummy",
        /*RearBody*/	"Human",
        /*Skin*/		"Mummy",
        /*Ovipositor*/	"Human",
        /*Oviposition*/	"Human",
        /*GlowingAss*/	"Human",
        /*Tail*/		"Human",
        /*Tongue*/		"Human",
        /*Wings*/		"Human",
        /*Penis*/		"Human",
        /*Vagina*/		"Human",
        /*Perks*/		"Mummy"];
	
	public function MummyRace(id:int) 
	{
		super("Mummy", id, RaceBody);
		chimeraTier = 0;
		grandChimeraTier = 0;
	}
	
	public override function setup():void {
		
		addScores()
				.skinPlainOnly(+1)
				.skinBaseAdj(NOT("slippery"), 0, -1)
				.skinColor1(ANY(MummySkinColors), +1)
				.hairType(Hair.NORMAL, +1)
				.faceType(Face.JIANGSHI, +1)
				.eyeType(Eyes.JIANGSHI, +1)
				.eyeColor("red", +1)
				.earType(Ears.HUMAN, +1)
				.tongueType(Tongue.HUMAN, +1)
				.noGills(+1)
				.noAntennae(+1)
				.hornType(Horns.BANDAGED_HEAD, +1)
				.noWings(+2)
				.noTail(+1)
				.armType(Arms.MUMMY, +1)
				.legType(LowerBody.MUMMY, +1)
				.noRearBody(+1)
				.skinBasePattern(Skin.PATTERN_NONE, +1)
				.hasPerk(PerkLib.Undeath, +2);
		
		buildTier(20, "Mummy")
                .requirePerk(PerkLib.Undeath)
				.buffs({
					"str.mult": +2.50,
					"spe.mult": -0.90,
					"int.mult": -0.90,
					"wis.mult": +1.30,
					"lib.mult": +3.00,
					"sens": +200
				})
				.end();
	}
}
}
