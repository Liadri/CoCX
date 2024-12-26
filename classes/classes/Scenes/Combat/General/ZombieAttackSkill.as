package classes.Scenes.Combat.General {
import classes.PerkLib;
import classes.Monster;
import classes.Scenes.Combat.Combat;
import classes.Scenes.Combat.AbstractGeneral;
import classes.GlobalFlags.kFLAGS;

public class ZombieAttackSkill extends AbstractGeneral {

    public function ZombieAttackSkill() {
        super(
            "Zombie Attack",
            "Attack the oppenent with your zombies",
            TARGET_ENEMY,
            TIMING_INSTANT,
            [TAG_DAMAGING, TAG_PHYSICAL],
            PerkLib.UndeadLord
        )
		lastAttackType = Combat.LAST_ATTACK_PHYS;
    }

    override public function get isKnown():Boolean {
        return super.isKnown && player.perkv1(PerkLib.UndeadLord) > 0;
    }

	override public function describeEffectVs(target:Monster):String {
		return "Deals ~" + numberFormat(calcDamage(target)) + " physical damage.";
	}

	public function calcDamage(monster:Monster):Number {
		var zummyDamage:Number = 10;
        zummyDamage += (scalingBonusIntelligence() + scalingBonusWisdom()) * 0.4;
        zummyDamage *= player.perkv1(PerkLib.UndeadLord);
		zummyDamage *= soulskillMod();
        if (player.hasPerk(PerkLib.HistoryTactician) || player.hasPerk(PerkLib.PastLifeTactician)) zummyDamage *= combat.historyTacticianBonus();
        var zummyamplification:Number = 1;
        if (player.weapon == weapons.SCECOMM) zummyamplification += 0.5;
		if (player.hasPerk(PerkLib.CommandingTone)) zummyamplification += 0.1;
		if (player.hasPerk(PerkLib.DiaphragmControl)) zummyamplification += 0.1;
		if (player.hasPerk(PerkLib.VocalTactician)) zummyamplification += 0.15;
		if (flags[kFLAGS.WILL_O_THE_WISP] == 2) {
            zummyamplification += 0.1;
            if (player.hasPerk(PerkLib.WispLieutenant)) zummyamplification += 0.2;
            if (player.hasPerk(PerkLib.WispCaptain)) zummyamplification += 0.3;
            if (player.hasPerk(PerkLib.WispMajor)) zummyamplification += 0.4;
            if (player.hasPerk(PerkLib.WispColonel)) zummyamplification += 0.5;
        }
		//if (player.perkv2(PerkLib.MummyLord) > 0) zummyamplification *= 2;
        zummyDamage *= zummyamplification;

		return Math.round(zummyDamage);
	}

    override public function doEffect(display:Boolean = true):void {
    	var damage:Number = calcDamage(monster);

		//Determine if critical hit!
        var crit:Boolean = false;
        var critChance:int = 5;
        var critChanceMulti:int = 1.75;
        critChance += combatMagicalCritical();
        if (monster.isImmuneToCrits() && !player.hasPerk(PerkLib.EnableCriticals)) critChance = 0;
        if (rand(100) < critChance) {
            crit = true;
            damage *= critChanceMulti;
        }

		damage = Math.round(damage);

		if (display) outputText("\n\nYour zombie servants swarm, punch and bite at [themonster] trying to immobilize it so they can feast on [monster his] energy. ");
		doPhysicalDamage(damage, true, display);
		if (display) {
			if (crit) outputText(" <b>Critical! </b>");
			outputText("\n\n");
		}
    }
}
}