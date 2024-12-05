package classes.Races {
import classes.BodyParts.*;
import classes.GeneticMemories.RaceMem;
import classes.IMutations.IMutationsLib;
import classes.PerkLib;
import classes.Race;

public class LichRace extends Race {
	
	public static const LichSkinColors:/*String*/Array = ["ghostly pale", "light blue", "snow white", "ghostly white"];
    public static const LichHairColors:/*String*/Array = ["silver white", "silver", "snow white", "ghostly white"];
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
				.hairColor1(ANY(LichHairColors), +1)
				.faceType(Face.DEMON, +1)
				.eyeType(Eyes.LICH, +1)
				.eyeColor("light blue", +1)
				.earType(Ears.HUMAN, +1)
				.tongueType(Tongue.DEMONIC, +1)
				.noAntennae(+1)
				.noHorns(+1)
				.wingType(Wings.LEVITATION, +4)
				.armType(Arms.LICH, +1)
				.legType(LowerBody.LICH, +1)
				.skinBasePattern(Skin.PATTERN_NONE, +1)
				.corruption(AT_LEAST(100), +2)
				.hasPerk(PerkLib.Phylactery, +4)
				.hasPerk(PerkLib.TransformationImmunity2, +3);
		
		addMutation(IMutationsLib.BlackBloodIM, +3);
		addMutation(IMutationsLib.StillHeartIM, +3);
		
		buildTier(28, "Lich")
                .requirePerk(PerkLib.Phylactery)
				.requireEyeType(Eyes.LICH)
				.buffs({
					"str.mult": +1.50,
					"spe.mult": -0.90,
					"int.mult": +6.00,
					"wis.mult": +2.00,
					"lib.mult": +6.00,
					"sens": +200
				})
				.end();
		
		buildTier(34, "Greater Lich")
				.requirePreviousTier()
				.buffs({
					"str.mult": +2.00,
					"spe.mult": -0.90,
					"int.mult": +7.30,
					"wis.mult": +2.10,
					"lib.mult": +7.30,
					"sens": +250
				})
				.end();
	}
}
}
