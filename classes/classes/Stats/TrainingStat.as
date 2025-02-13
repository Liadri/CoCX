package classes.Stats {
import classes.Creature;
import classes.PerkLib;
import classes.IMutations.IMutationsLib;

public class TrainingStat extends RawStat {
	public function TrainingStat(host:Creature, name:String) {
		super(host, name, {min:1, value: 0, max: 100});
	}
	
	override public function get max():Number {
		var train:Number = 100;
		//train += 2 * host.perkv1(PerkLib.AscensionTranshumanism);
		if (host.hasPerk(PerkLib.MunchkinAtBioLab)) train += 10;
		if (host.hasPerk(PerkLib.BasicAllRounderTraining)) train += 5;
		if (host.hasPerk(PerkLib.IntermediateAllRounderTraining)) train += 5;
		if (host.hasPerk(PerkLib.AdvancedAllRounderTraining)) train += 5;
		if (host.hasPerk(PerkLib.ExpertAllRounderTraining)) train += 5;
		if (host.hasPerk(PerkLib.MasterAllRounderTraining)) train += 10;
		if (host.hasPerk(PerkLib.GrandMasterAllRounderTraining)) train += 10;
		if (host.hasPerk(PerkLib.SemiEpicAllRounderTraining)) train += 15;
		if (host.hasPerk(PerkLib.EpicAllRounderTraining)) train += 15;
		switch (statName) {
			case 'str.train':
				if (host.hasPerk(PerkLib.AllRounderPhysicalTraining)) train += 10;
				var str:Number = 1;
				if (host.perkv1(IMutationsLib.HumanBonesIM) >= 3) str += 0.2;
				if (host.perkv1(IMutationsLib.HumanBonesIM) >= 4) str += 0.1;
				train *= str;
				train = Math.round(train);
				break;
			case 'tou.train':
				if (host.hasPerk(PerkLib.AllRounderPhysicalTraining)) train += 10;
				var tou:Number = 1;
				if (host.perkv1(IMutationsLib.HumanBonesIM) >= 3) tou += 0.2;
				if (host.perkv1(IMutationsLib.HumanBonesIM) >= 4) tou += 0.1;
				train *= tou;
				train = Math.round(train);
				break;
			case 'spe.train':
				if (host.hasPerk(PerkLib.AllRounderPhysicalTraining)) train += 10;
				var spe:Number = 1;
				if (host.perkv1(IMutationsLib.HumanBloodstreamIM) >= 3) spe += 0.2;
				if (host.perkv1(IMutationsLib.HumanBloodstreamIM) >= 4) spe += 0.1;
				train *= spe;
				train = Math.round(train);
				break;
			case 'int.train':
				if (host.hasPerk(PerkLib.AllRounderMentalTraining)) train += 10;
				var inte:Number = 1;
				if (host.perkv1(IMutationsLib.HumanSmartsIM) >= 3) inte += 0.2;
				if (host.perkv1(IMutationsLib.HumanSmartsIM) >= 4) inte += 0.1;
				train *= inte;
				train = Math.round(train);
				break;
			case 'wis.train':
				if (host.hasPerk(PerkLib.AllRounderMentalTraining)) train += 10;
				//train += 16 * host.perkv1(PerkLib.AscensionTranshumanismWis);
				//train += host.perkv1(PerkLib.SoulTempering);
				var wis:Number = 1;
				if (host.perkv1(IMutationsLib.HumanSmartsIM) >= 3) wis += 0.2;
				if (host.perkv1(IMutationsLib.HumanSmartsIM) >= 4) wis += 0.1;
				train *= wis;
				train = Math.round(train);
				break;
			case 'lib.train':
				if (host.hasPerk(PerkLib.AllRounderMentalTraining)) train += 10;
				var lib:Number = 1;
				if (host.perkv1(IMutationsLib.HumanBloodstreamIM) >= 3) lib += 0.2;
				if (host.perkv1(IMutationsLib.HumanBloodstreamIM) >= 4) lib += 0.1;
				train *= lib;
				train = Math.round(train);
				break;
		}
		return train;
	}
}
}
