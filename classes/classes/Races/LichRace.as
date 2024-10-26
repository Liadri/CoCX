package classes.Races {
import classes.BodyParts.*;
import classes.GeneticMemories.RaceMem;
import classes.PerkLib;
import classes.Race;

public class LichRace extends Race {
	
	//public static const JiangshiSkinColors:/*String*/Array = ["ghostly pale", "light blue", "snow white"];
    public static const RaceBody:/*String*/Array = [
        /*Antenna*/		"Human",
        /*Arms*/		"Human",
        /*Balls*/		"Human",
        /*Breasts*/		"Human",
        /*Nips*/		"Human",
        /*Ears*/		"Human",
        /*Eyes*/		"Mummy",
        /*Face*/		"Human",
        /*Gills*/		"None",
        /*Hair*/		"Human",
        /*Horns*/		"Human",
        /*LowerBody*/	"Human",
        /*RearBody*/	"Human",
        /*Skin*/		"Human",
        /*Ovipositor*/	"Human",
        /*Oviposition*/	"Human",
        /*GlowingAss*/	"Human",
        /*Tail*/		"Human",
        /*Tongue*/		"Human",
        /*Wings*/		"Human",
        /*Penis*/		"Human",
        /*Vagina*/		"Human",
        /*Perks*/		"Lich"];
	
	public function LichRace(id:int) 
	{
		super("Lich", id, RaceBody);
		chimeraTier = 0;
		grandChimeraTier = 0;
	}
	
	public override function setup():void {
		
		addScores()
				//.skinPlainOnly(+1)
				//.skinBaseAdj(NOT("slippery"), 0, -1)
				//.skinColor1(ANY(JiangshiSkinColors), +1)
				//.hairType(Hair.NORMAL, +1)
				.faceType(Face.DEMON, +1)
				//.eyeType(Eyes.JIANGSHI, +1)
				//.eyeColor("red", +1)
				.earType(Ears.HUMAN, +1)
				.tongueType(Tongue.DEMONIC, +1)
				//.noGills(+1)
				.noAntennae(+1)
				.noHorns(+1)
				//.noWings(+2)
				//.noTail(+1)
				//.armType(Arms.MUMMY, +1)
				//.legType(LowerBody.MUMMY, +1)
				//.noRearBody(+1)
				//.skinBasePattern(Skin.PATTERN_NONE, +1)
				.corruption(AT_LEAST(100), +4)
				.hasPerk(PerkLib.Phylactery, +4);
		
		buildTier(40, "Lich")
                .requirePerk(PerkLib.Phylactery)
				.buffs({
					"str.mult": +0.10,
					"spe.mult": -0.10,
					"int.mult": -0.10,
					"wis.mult": +0.10,
					"lib.mult": +0.10,
					"sens": +10
				})
				.end();
	}
}
}
