/**
 * Original code by aimozg on 27.01.14.
 * Extended for Mutations by Jtecx on 14.03.22.
 */
package classes.IMutations
{
import classes.PerkClass;
import classes.IMutationPerkType;
import classes.Creature;
import classes.Player;
import classes.Races;

public class TwinHeartMutation extends IMutationPerkType
    {
        override public function get mName():String {
            return "Twin Heart";
        }
        //v1 contains the mutation tier
        override public function mDesc(params:PerkClass, pTier:int = -1):String {
            var descS:String = "";
            pTier = (pTier == -1)? currentTier(this, player): pTier;
            descS += "+"+(pTier*4)+"0% fatigue recovery, with tauric/drider body: +"+pTier+"00% fatigue recovery, reduce Charge fatigue cost by ~"+pTier+"0% as well as its cooldown by "+pTier+", reduce Gallop fatigue cost by ~"+(pTier*5)+"%";
            if (pTier == 2) descS += ", increase damage by 20%";
            if (pTier == 3) descS += ", increase damage by 80%";
            if (pTier == 4) descS += ", increase damage by 200%";
			descS += ".";
            return descS;
        }

        //Mutation Requirements
        override public function pReqs(pCheck:int = -1):void{
            try{
                var pTier:int = (pCheck != -1 ? pCheck : currentTier(this, player));
                //This helps keep the requirements output clean.
                this.requirements = [];
                if (pTier == 0){
                    this.requireAdaptationsMutationSlot()
                    .requireCustomFunction(function (player:Player):Boolean {
                        return player.isRace(Races.CENTAUR) || player.isRace(Races.UNICORN, 2) || player.isRace(Races.SPHINX) || player.isRace(Races.CANCER) || player.isRace(Races.SANDWORM) || player.isTaur() || player.isDrider();
                    }, "Taur/Drider or Unicorn/Bicorn race");
                }
                else{
                    var pLvl:int = pTier * 30;
                    this.requireLevel(pLvl);
                }
            }catch(e:Error){
                trace(e.getStackTrace());
            }
        }

        //Mutations Buffs
        override public function buffsForTier(pTier:int, target:Creature):Object {
            var pBuffs:Object = {};
            if (pTier == 1) {
                pBuffs['tou.mult'] = 0.05;
                pBuffs['spe.mult'] = 0.05;
            }
            else if (pTier == 2) {
                pBuffs['tou.mult'] = 0.15;
                pBuffs['spe.mult'] = 0.15;
            }
            else if (pTier == 3) {
                pBuffs['tou.mult'] = 0.35;
                pBuffs['spe.mult'] = 0.35;
            }
            else if (pTier == 4) {
                pBuffs['tou.mult'] = 0.75;
                pBuffs['spe.mult'] = 0.75;
            }
            return pBuffs;
        }

        public function TwinHeartMutation() {
            super(mName + " IM", mName, SLOT_ADAPTATIONS, 4);
        }

    }
}
