package classes.Races {
import classes.BodyData;
import classes.BodyParts.*;
import classes.CockTypesEnum;
import classes.IMutations.IMutationsLib;
import classes.PerkLib;
import classes.Race;
import classes.VaginaClass;

public class BlackOracleRace extends Race {
	public static const BlackOracleSkinColors:/*String*/Array = ["dark", "light","tan", "olive", "light", "ghostly pale", "light purple"];
	
	public function BlackOracleRace(id:int) {
		super("Fetish Cultist", id, []);
		disabled = true;
	}
	
	public override function setup():void {
		
		addScores()
				.hairType(Hair.NORMAL, +1)
				.tongueType(Tongue.DEMONIC, +1)
				.faceType(Face.HUMAN, +1)
				.armType(Arms.HUMAN, +1)
				.legType(LowerBody.HUMAN, +1)
				.skinBaseType(Skin.PLAIN, +1, -3)
				.skinColor1(ANY(BlackOracleSkinColors), +1)
				.tongueType(Tongue.DEMONIC, +1)
				.faceType(Face.HUMAN, +1)
				.eyeTypeAndColor(Eyes.DEMON, "red", +2)
				.earType(Ears.ELFIN, +1)
				.rearType(RearBody.MINDWARP, +1)
				.wingType(ANY(Wings.BAT_LIKE_LARGE, Wings.FEATHERED_LARGE), +4)
				.tailType(Tail.DEMONICCHAINED, +1)
				.cockOrVaginaOfType(CockTypesEnum.DEMON, VaginaClass.DEMONIC, +1)
				.corruption(AT_LEAST(20), +1)
				.corruption(AT_LEAST(50), +1)
				.corruption(AT_LEAST(100), +2)
				.hasPerk(PerkLib.DemonicLethicite, +1)
				.hasPerk(PerkLib.Soulless, +4);

		addBloodline(PerkLib.DemonsDescendant, PerkLib.BloodlineDemon);
		addMutation(IMutationsLib.BlackHeartIM);
		addMutation(IMutationsLib.FiendishMetabolismIM);
		addMutation(IMutationsLib.FiendishBallsIM);
		addMutation(IMutationsLib.FiendishOvariesIM);
		
		buildTier(8, "fetish cultist")
				.buffs({
					"wis.mult": +0.70,
					"lib.mult": +0.70,
					"sens": +20
				})
				.end();

		buildTier(15, "dark nun")
				.buffs({
					"int.mult": +0.75,
					"wis.mult": +1.00,
					"lib.mult": +1.00,
					"sens": +50
				})
				.end();
		
		buildTier(30, "black oracle")
				.buffs({
					"str.mult": +5.50,
					"tou.mult": +3.50,
					"lib.mult": +6.00,
					"sens": +150
				})
				.end();
	}
}
}
