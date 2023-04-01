//
//  Enemy.swift
//  0706012110058-NicholasDylanLienardi-AFL-1
//
//  Created by MacBook Pro on 28/03/23.
//

import Foundation

//stats musuh
class Enemy : Entity{
    var goldDrop: Int = 0
    var charged: Int = 1
    

    init(Health: Int, maxHealth: Int, Attack: Int, Name: String, goldDrop: Int) {
        super .init(Health: Health, maxHealth: maxHealth, Attack: Attack, Name: Name)
        self.goldDrop = goldDrop
    }
    
    func decideAction(special: Int){
        
        //charge attack for next turn
        if(special == 6){
            if(Name == "Troll"){
                print("The Ogre is charging his attack!")
            }else if(Name == "Golem"){
                print("The Golem is preparing for huge attack!")
            }else if(Name == "BIG BOSS"){
                print("The BOSS is preparing a huge attack!")
            }
            print("\nYou have to block this attack!!!\n")
            charged = 3
            while true{
                print("Press [return] to continue.")
                let input = String(readLine() ?? "")
                if(input == ""){
                    break
                }
            }
        }else{
            //no damage if player had used guard the previous turn
            if(hero.shield){
                hero.shield = false
                if(Name == "Troll"){
                    print("The Ogre Slammed his club at you! \nYou blocked the Attack!")
                }else if(Name == "Golem"){
                    print("The Golem threw a rock at you! \nYou blocked the Attack!")
                }else if(Name == "BIG BOSS"){
                    print("The BOSS threw a left hook! \nYou blocked the Attack!")
                }
                
                charged = 1
                
                while true{
                    print("Press [return] to continue.")
                    let input = String(readLine() ?? "")
                    if(input == ""){
                        break
                    }
                }
            }else{
                //enemy attack, use multiplier if charged the previous turn
                let ouch = calcDamage()
                charged = 1
                hero.takeDamage(amount: ouch)
                var dmg = ouch - hero.Defense
                if(dmg < 0){
                    dmg = 0
                }
                if(Name == "Troll"){
                    print("The Ogre Slammed his club at you! \nYou take \(dmg) Damage!")
                }else if(Name == "Golem"){
                    print("The Golem threw a rock at you! \nYou take \(dmg) Damage!")
                }else if(Name == "BIG BOSS"){
                    print("The BOSS threw a left hook! \nYou take \(dmg) Damage!")
                }
                
                while true{
                    print("Press [return] to continue.")
                    let input = String(readLine() ?? "")
                    if(input == ""){
                        break
                    }
                }
            }
        }
    }
    
    func calcDamage() -> Int{
        return charged*Attack
    }
    
    func reward(name: String, hero: Player){
        hero.gold += goldDrop
        if(name == "Troll"){
            //call function to increase user strength and deciding what reward to give the player
            hero.lvlUp(levels: 2)
            let prob = Int.random(in: 1...10)
            if(prob >= 6){
                print("Nice! You found some Potions!")
                let p = Int.random(in: 2...3)
                print("Gained \(p) Potions!")
                hero.pots += p
            }else if(prob <= 3){
                //gives player items, if rediscovered then it gives the player item rewards.
                if(hero.hasGun == false){
                    print("You found a treasure chest nearby and find a gun!")
                    while true{
                        print("Will you equip the gun? [Y/N]\n")
                        let input = readLine()?.lowercased() ?? ""
                
                        if(input == "y"){
                            print("You have equipped the gun!\n")
                            hero.Attack += 25
                            hero.hasGun = true
                            break
                        }else if(input == "n"){
                            print("You decide a gun does not belong in this game :(\n")
                            break
                        }else{
                            print("\nINPUT A PROPER INPUT!\n")
                        }
                    }
                }else{
                    let p = Int.random(in: 1...3)
                    let e = Int.random(in: 2...5)
                    print("Jackpot! You found a lot of items!")
                    print("Gained \(p) Potions!")
                    print("Gained \(e) Elixirs!")
                    hero.pots += p
                    hero.elixirs += e
                }
            }else{
                print("Nice! You found some Elixirs!")
                let p = Int.random(in: 3...5)
                print("Gained \(p) Elixirs!")
                hero.elixirs += p
            }
        }else if(name == "Golem"){
            hero.lvlUp(levels:8)
            let prob = Int.random(in: 1...10)
            if(prob >= 6){
                print("Nice! You found some Potions!")
                let p = Int.random(in: 4...6)
                print("Gained \(p) Potions!")
                hero.pots += p
            }else if(prob <= 3){
                if(hero.hasArmor == false){
                    print("You found a treasure chest nearby and find Armor!")
                    while true{
                        print("Will you equip the Armor? [Y/N]\n")
                        let input = readLine()?.lowercased() ?? ""
                        if(input == "y"){
                            print("You have equipped the gun!\n")
                            hero.Defense += 20
                            hero.hasArmor = true
                            break
                        }else if(input == "n"){
                            print("You decide you don't need Armor!\n")
                            break
                        }else{
                            print("\nINPUT A PROPER INPUT!\n")
                        }
                    }
                }else{
                    let p = Int.random(in: 3...6)
                    let e = Int.random(in: 4...7)
                    print("Jackpot! You found a lot of items!")
                    print("Gained \(p) Potions!")
                    print("Gained \(e) Elixirs!")
                    hero.pots += p
                    hero.elixirs += e
                }
            }else{
                print("Nice! You found some Elixirs!")
                let p = Int.random(in: 4...6)
                print("Gained \(p) Elixirs!")
                hero.elixirs += p
            }
        }else{
            //reward for defeating boss is win, then exit system.
            print("\n\n\n\nYou have saved humanity from Bob! The day is saved!")
            print("This is the end of your adventure! \(name) is a hero for all!")
            print("Adventurer Score : \(hero.lvl * 1000 + 50000 + hero.gold * 10)\n\n\n\n")
            exit(0)
        }
    }
}
