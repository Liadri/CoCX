package classes.Races {
import classes.BodyData;
import classes.BodyParts.*;
import classes.CockTypesEnum;
import classes.IMutations.IMutationsLib;
import classes.Race;
import classes.VaginaClass;

public class BlackOracleRace extends Race {
	public static const BlackOracleSkinColors:/*String*/Array = ["dark", "light","tan", "olive", "light", "ghostly pale", "light purple"];
	
	public function BlackOracleRace(id:int) {
		super("Apophis", id);
		disabled = true;
		chimeraTier = 0;
		grandChimeraTier = 0;
	}
	
	public override function setup():void {
		
		addScores()
				.hairType(Hair.NORMAL, +1)
				.tongueType(Tongue.DEMONIC, +1)
				.faceType(Face.HUMAN, +1)
				.armType(Arms.HUMANCHAINED, +1)
				.legType(LowerBody.HUMANCHAINED, +1)
				.skinBaseType(Skin.PLAIN, +1, -3)
				.skinBaseColor(ANY(BlackOracleSkinColors), +1)
				.tongueType(Tongue.DEMONIC, +1)
				.faceType(Face.HUMAN, +1)
				.eyeTypeAndColor(Eyes.FIENDISH, "red", +2)
				.earType(Ears.ELFIN, +1)
				.rearType(RearBody.MINDWARP, +1)
				.wingType(ANY(Wings.BAT_LIKE_LARGE, Wings.FEATHERED_LARGE), +4)
				.cockOrVaginaOfType(CockTypesEnum.DEMON, VaginaClass.DEMONIC, +1)
				.corruption(AT_LEAST(20), +1)
				.corruption(AT_LEAST(50), +1)
				.corruption(AT_LEAST(100), +2);

		addMutation(IMutationsLib.BlackHeartIM);
		
		buildTier(23, "apophis")
				.buffs({
					"str.mult": +0.70,
					"tou.mult": +0.70,
					"spe.mult": +1.00,
					"lib.mult": +1.05
				})
				.end();
		
		buildTier(26, "unhallowed apophis")
				.buffs({
					"str.mult": +0.80,
					"tou.mult": +0.80,
					"spe.mult": +1.00,
					"lib.mult": +1.30
				})
				.end();
	}
}
}
