package classes.Races {
import classes.BodyParts.*;
import classes.GeneticMemories.RaceMem;
import classes.IMutations.IMutationsLib;
import classes.PerkLib;
import classes.Race;

public class LichRace extends Race {
	
	public static const LichSkinColors:/*String*/Array = ["ghostly pale", "light blue", "snow white", "ghostly white"];
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
				.skinPlainOnly(+1)
				.plainSkinOfAdj("flawless", +1)
				.skinColor1(ANY(LichSkinColors), +1)
				.hairType(Hair.NORMAL, +1)
				.faceType(Face.DEMON, +1)
				.eyeType(Eyes.LICH, +1)
				.eyeColor("light blue", +1)
				.earType(Ears.HUMAN, +1)
				.tongueType(Tongue.DEMONIC, +1)
				//.noGills(+1)
				.noAntennae(+1)
				.noHorns(+1)
				//.noTail(+1)
				.wingType(Wings.LEVITATION, +4)
				.armType(Arms.LICH, +1)
				.legType(LowerBody.LICH, +1)
				//.noRearBody(+1)
				//.skinBasePattern(Skin.PATTERN_NONE, +1)
				.corruption(AT_LEAST(100), +4)
				.hasPerk(PerkLib.Phylactery, +20);
		
		//addMutation(IMutationsLib.);
		
		buildTier(40, "Lich")
                .requirePerk(PerkLib.Phylactery)
				.requireEyeType(Eyes.LICH)
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
