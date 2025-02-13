/**
 * Created by Kitteh6660 on 01.29.15.
 */
package classes.Items
{
	/**
	 * ...
	 * @author Kitteh6660
	 */
	import classes.ItemType;
	import classes.PerkLib;
	import classes.Player;
	import classes.Scenes.SceneLib;
	import classes.GlobalFlags.kFLAGS
	
public class Shield extends Equipable
	{
		private var _block:Number;
		private var _perk:String;
		
		override public function get category():String {
			return CATEGORY_SHIELD;
		}
		
		public function Shield(id:String, shortName:String, name:String, longName:String, block:Number, value:Number = 0, description:String = null, perk:String = "") {
			super(id, shortName, name, longName, value, description);
			this._block = block;
			this._perk = perk;
		}
		
		private static const SLOTS:Array = [SLOT_SHIELD];
		override public function slots():Array {
			return SLOTS; // don't recreate every time
		}
		
		public function get block():Number { return _block; }
		
		public function get perk():String { return _perk; }
		
		override public function effectDescriptionParts():Array {
			var list:Array = super.effectDescriptionParts();
			// Type
			list.push([10,"Type: Shield"]);
			// Attack
			var block:Number = this.block;
			list.push([20, "Block: " + block ]);
			return list;
		}
		
		override public function canEquip(doOutput:Boolean, slot:int):Boolean {
			if (game.player.weaponRangePerk == "Dual Firearms" || game.player.weaponRangePerk == "Dual 2H Firearms") {
				if (doOutput) outputText("Your current range weapons requires two hands. Unequip your current range weapons or switch to one-handed before equipping this shield. ");
				return false;
			}
			else if (game.player.weaponRangePerk == "2H Firearm") {
				if (doOutput) outputText("Your current range weapon requires two hands. Unequip your current range weapon or switch to one-handed before equipping this shield. ");
				return false;
			}
			else if ((game.player.weapon.isSingleLarge() && !game.player.hasPerk(PerkLib.GigantGrip)) || (game.player.weapon.isSingleMassive() && !game.player.hasPerk(PerkLib.TitanGrip))) {
				if (doOutput) outputText("Your current melee weapon requires two hands. Unequip your current melee weapon or switch to one-handed before equipping this shield. ");
				return false;
			}
			else if ((game.player.weapon.isDualWielded() && game.player.weapon != WeaponLib.FISTS && game.player.weapon.isGauntletType() && game.player.weapon != game.weapons.AETHERD) || game.player.weaponName == "Daisho") {
				if (doOutput) outputText("Your current melee weapons requires both hands. Unequip your current melee weapons or switch to one-handed before equipping this shield. ");
				return false;
			}
			else if (!game.player.weaponOff.isNothing) {
				if (doOutput) outputText("You can't hold both an off-hand weapon and a shield with one hand. Unequip your current melee off-hand weapon before equipping this shield. ");
				return false;
			}
			else if (game.player.hasPerk(PerkLib.Rigidity)) {
				if (doOutput) outputText("You would very much like to equip this item but your body stiffness prevents you from doing so.");
				return false;
			}
			else if (game.player.shieldPerk == "Massive" && !game.player.hasPerk(PerkLib.GigantGrip)) {
				if (doOutput) outputText("This shield requires the use of both your hands. Unequip your current melee weapon before equipping it. ");
				return false;
			}
			return super.canEquip(doOutput, slot);
		}
		
		override public function afterEquip(doOutput:Boolean, slot:int):void {
			if (!game.isLoadingSave) {
				if ((perk == "Massive" && game.player.weapon != WeaponLib.FISTS && !game.player.hasPerk(PerkLib.GigantGrip))
						|| (game.player.weapon.isSingleLarge() && !game.player.hasPerk(PerkLib.GigantGrip))
						|| (game.player.weapon.isSingleMassive() && !game.player.hasPerk(PerkLib.TitanGrip))
						|| ((game.player.weapon.isDualWielded() && game.player.weapon != WeaponLib.FISTS) && game.player.weapon.isGauntletType()) || game.player.weaponName == "Daisho") {
					SceneLib.inventory.unequipWeapon();
				}
				if (!game.player.weaponOff.isNothing) SceneLib.inventory.unequipWeaponOff();
				if (game.player.weaponRangePerk == "Dual Firearms" || game.player.weaponRangePerk == "2H Firearm" || game.player.weaponRangePerk == "Dual 2H Firearms") SceneLib.inventory.unequipWeaponRange();
			}
			super.afterEquip(doOutput, slot);
		}
		
		override public function getItemText(textid:String):String {
			if (textid == "legendary_fail") return "You try to equip the legendary shield, but to your disappointment the item simply refuses to stay in your hands. It seems you still lack the right to wield this item.";
			return super.getItemText(textid);
		}
	}
}
