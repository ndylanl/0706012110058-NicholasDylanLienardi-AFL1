//
//  Hero.swift
//  0706012110058-NicholasDylanLienardi-AFL-1
//
//  Created by MacBook Pro on 28/03/23.
//

import Foundation
//stats player

class Player: Entity{
    var mxMP = 50
    var maxMana = 50
    var pots = 10
    var elixirs = 10
    var shield = false
    var lvl = 1
    var hasGun = false
    var hasArmor = false
    var equips: Array<Equipment> = []
    var gold: Int = 100
    
    override func takeDamage(amount: Int){
        //only run the function if player dont have shield
        if(shield == true){
            print("\nYou have defended yourself!\n")
        }else{
            let dmg = amount - Defense
            Health -= dmg
            if Health < 0 {
                Health = 0
            }
        }
    }
    
    func lvlUp(levels: Int){
        //increase lvl increases other stats.
        for _ in Range(1...levels) {
            lvl += 1
            Attack += 2
            maxHealth += 2
            mxMP += 1
        }
    }

    func useMana(amount: Int){
        maxMana -= amount
    }

    func userdefend(){
        shield = true
    }
    
    func usePotion() {
        if pots > 0 {
            Health += 20
            if (Health >= maxHealth){
                Health = maxHealth
            }
            pots -= 1
            print("Player used a potion. Health is now \(Health). Potions left: \(pots).")
        } else {
            print("No potions left!")
        }
    }

    func useElixir() {
        if elixirs > 0 {
            maxMana += 10
            if (maxMana > mxMP){
                maxMana = mxMP
            }
            elixirs -= 1
            print("Player used an elixir. Mana is now \(maxMana). Elixirs left: \(elixirs).")
        } else {
            print("No elixirs left!")
        }
    }
    
    func Equip(equip: Equipment){
        for item in equips{
            if(item.name == equip.name){
                while true{
                    print("\n=============")
                    print("  !WARNING!  ")
                    print("=============")
                    print("You already own a version of this item!")
                    print("Old \(item.name) AtkBonus = \(item.atkBonus) DefBonus = \(item.defBonus)")
                    print("New \(equip.name) AtkBonus = \(equip.atkBonus) DefBonus = \(equip.defBonus)")
                    print("Confirm replacing the \(item.name)? [Y/N]")
                    let confirm = readLine()?.lowercased()
                    if(confirm == "y"){
                        Attack -= item.atkBonus
                        Defense -= item.defBonus
                        Attack += equip.atkBonus
                        Defense += equip.defBonus
                        gold -= equip.price
                        print("Purchase completed.")
                    }else if(confirm == "n"){
                        print("Purchase cancelled.")
                        break
                    }else{
                        print("INVALID INPUT!!!")
                    }
                }
            }else{
                Attack += equip.atkBonus
                Defense += equip.defBonus
                gold -= equip.price
                print("Purchase completed.")
            }
        }
    }
    
    func healWounds(){
        var input = "dylanganteng"
        var onrepeat = false
        repeat{
            if(pots == 0){
                while true{
                    print("\nYou don't have anymore potions left. Be careful from here on out.")
                    print("Press [return] to continue.")
                    input = String(readLine() ?? "")
                    if(input == ""){
                        break
                    }else{
                        print("\nINPUT A PROPER INPUT!\n")
                    }
                }
                if(input == ""){
                    break
                }
            }
            print("\nYour HP is \(Health)/\(maxHealth).")
            print("You have \(pots) potions left.")
            if(onrepeat){
                print("\nStill want to use 1 potion to heal again?  [Y/N]")
            }else{
                print("\nAre you sure you want to use 1 potion to heal?  [Y/N]")
            }
            
            input = readLine()?.lowercased() ?? ""
            
            if(input == "y"){
                usePotion()
                onrepeat = true
            }else if(input == "n"){
                
            }else{
                print("\nINPUT A PROPER INPUT!\n")
            }
        }while(input != "n")
    }

    func drinkElixir(){
        var input = "dylanganteng"
        var onrepeat = false
        repeat{
            if(elixirs == 0){
                while true{
                    print("\nYou don't have anymore elixirs left. Be careful from here on out.")
                    print("Press [return] to continue.")
                    input = String(readLine() ?? "")
                    if(input == ""){
                        break
                    }else{
                        print("\nINPUT A PROPER INPUT!\n")
                    }
                }
                if(input == ""){
                    break
                }
            }
            print("\nYour MP is \(maxMana)/\(mxMP).")
            print("You have \(elixirs) elixirs left.")
            if(onrepeat){
                print("\nStill want to use 1 elixir to heal again?  [Y/N]")
            }else{
                print("\nAre you sure you want to use 1 elixir to heal?  [Y/N]")
            }
            
            input = readLine()?.lowercased() ?? ""
            
            if(input == "y"){
                useElixir()
                onrepeat = true
            }else if(input == "n"){
                
            }else{
                print("\nINPUT A PROPER INPUT!\n")
            }
        }while(input != "n")
    }
}
