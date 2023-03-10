//
//  main.swift
//  0706012110058-NicholasDylanLienardi-AFL-1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation

let user = Player()
var enemy = Enemy(maxHealth: 3000, strength: 50, name: "Dylan")

startGame()

func startGame(){
    var input = ""
    repeat{
        print("Welcome to the world of Murim! 🥊 \n")
        print("You have been chosen as a young martial artist to embark on a long journey to become the Dragon Warrior. Your adventure will take you through caves, forests, mountains, and dungeons where you will face enemies, make allies, and face challenges! \n")
        print("Press [return] to continue: ")
        
        input = String(readLine() ?? "")
       
        if(input == ""){
            welcomeScreen()
        }
    }while(input != "")
    
}

func welcomeScreen(){
    while true {
        print("May I ask your name young martial artist?")
        let name = readLine() ?? ""
        let nameRegex = "^[a-zA-Z]+$"
        let namePredicate = NSPredicate(format:"SELF MATCHES %@", nameRegex)
        
        if namePredicate.evaluate(with: name) {
            // Valid input, name only contains characters a-z and A-Z
            print("\nNice to meet you, \(name)!")
            user.name = name
            journeyScreen()
            break // Exit the loop
        }
    }
}

func journeyScreen(){
    while true {
        print("\nFrom here you can... \n")
        print("[C]heck your health and stats")
        print("[H]eal your wounds with potions")
        print("[D]rink elixirs to fill your mana \n")
        print("Or choose where you want to go \n")
        print("[F]orest of Trolls")
        print("[M]ountain of Golems")
        print("[E]vil Island")
        print("[Q]uit Game \n")
        print("Your Choice?")
        
        let input = readLine()?.lowercased()
        
        if(input == "c"){
            showStats()
        }else if(input == "h"){
            healWounds()
        }else if(input == "d"){
            drinkElixir()
        }else if(input == "f"){
            enemy = Enemy(maxHealth: 300, strength: 10, name: "Troll")
            battle()
        }else if(input == "m"){
            enemy = Enemy(maxHealth: 600, strength: 20, name: "Golem")
            battle()
        }else if(input == "e"){
            enemy = Enemy(maxHealth: 1000, strength: 40, name: "The Pedophile")
            battle()
        }else if(input == "q"){
            print("\nThat will be the end of our adeventure today! Fare thee well young martial artist!   \n\n")
            break
        }
    }
}

func showStats(){
    print("\n===========================================")
    print("Player Name  : \(user.name)")
    print("Player Level : \(user.lvl)")
    print("\nPlayer Health: \(user.maxHealth)/\(user.mxHP)")
    print("Player Mana  : \(user.maxMana)/\(user.mxMP)")
    print("Strength     : \(user.strength)")
    print("Defense      : \(user.defense)")
    print("\nMagic:")
    if(user.hasGun){
        print("- Shoot. No Mana Required. Deal light damage.")
        print("- Headshot!. 10 Mana Required. Deal heavy damage.")
    }else{
        print("- Bludgeon. No Mana Required. Deal light damage.")
        print("- Blind Tiger Strike. 10 Mana Required. Deal heavy damage.")
    }
    print("- Black Turtle Formation. 10 Mana Required. Block enemy's attack for 1 turn.")
    print("\nItems:")
    print("- Potion x\(user.pots). Heal 20 HP.")
    print("- Elixir x\(user.elixirs). Heal 10 MP")
    while true{
        print("Press [return] to go back.")
        let input = String(readLine() ?? "")
        if(input == ""){
            break
        }
    }
    print("\n===========================================")
}

func healWounds(){
    var input = "dylanganteng"
    var onrepeat = false
    repeat{
        if(user.pots == 0){
            while true{
                print("\nYou don't have anymore potions left. Be careful from here on out.")
                print("Press [return] to continue.")
                input = String(readLine() ?? "")
                if(input == ""){
                    break
                }
            }
            if(input == ""){
                break
            }
        }
        print("\nYour HP is \(user.maxHealth)/\(user.mxHP).")
        print("You have \(user.pots) potions left.")
        if(onrepeat){
            print("\nStill want to use 1 potion to heal again?  [Y/N]")
        }else{
            print("\nAre you sure you want to use 1 potion to heal?  [Y/N]")
        }
        
        input = readLine()?.lowercased() ?? ""
        
        if(input == "y"){
            user.usePotion()
            onrepeat = true
        }
    }while(input != "n")
}

func drinkElixir(){
    var input = "dylanganteng"
    var onrepeat = false
    repeat{
        if(user.elixirs == 0){
            while true{
                print("\nYou don't have anymore elixirs left. Be careful from here on out.")
                print("Press [return] to continue.")
                input = String(readLine() ?? "")
                if(input == ""){
                    break
                }
            }
            if(input == ""){
                break
            }
        }
        print("\nYour MP is \(user.maxMana)/\(user.mxMP).")
        print("You have \(user.elixirs) elixirs left.")
        if(onrepeat){
            print("\nStill want to use 1 elixir to heal again?  [Y/N]")
        }else{
            print("\nAre you sure you want to use 1 elixir to heal?  [Y/N]")
        }
        
        input = readLine()?.lowercased() ?? ""
        
        if(input == "y"){
            user.useElixir()
            onrepeat = true
        }
    }while(input != "n")
}

func battle(){
    var scanned = false
    var charged = 1
    if(enemy.name == "Troll"){
        print("\nAs you arrive in the forest of trolls, you feel a sense of unease wash over you.")
        print("Suddenly you hear the sounds of twigs snapping behind you. You quickly spin around and find a Troll looming over you.")
    }else if(enemy.name == "Golem"){
        print("\nAs you make your way through the rugged mountain terrain, you can feel the hill of the wind biting at your skin.")
        print("Suddenly, you hear you hear a sound that makes you freeze in your tracks. That's when you see it - a massive , snarling Golem emerges from the shadows.")
    }else if(enemy.name == "The Pedophile"){
        print("Bob the neighbor is harrasing children! \nSave the children at all costs!!!")
    }
    while true{
        var special = Int.random(in: 1...6)
        if(charged == 3){
            special = 3
        }
        print("\n😈 Name  : \(enemy.name)")
        if(scanned){
            print("😈 Health: \(enemy.health)/\(enemy.maxHealth)")
        }else{
            print("😈 Health: ????")
        }
        print("==============\n")
        print("💩 Name  : \(user.name)")
        print("💩 Health: \(user.maxHealth)/\(user.mxHP)")
        print("💩 Mana  : \(user.maxMana)/\(user.mxMP)")
        print("\nChoose your action:")
        if(user.hasGun){
            print("[1] Shoot. No Mana Required. Deal light damage.")
            print("[2] Headshot!. 10 Mana Required. Deal heavy damage.")
        }else{
            print("[1] Bludgeon. No Mana Required. Deal light damage.")
            print("[2] Blind Tiger Strike. 10 Mana Required. Deal heavy damage.")
        }
        print("[3] Black Turtle Formation. 10 Mana Required. Block enemy's attack for 1 turn.")
        print("\n[4] Use potion to heal")
        print("[5] Scan enemy's vitals")
        print("[6] Flee from battle")
        print("\nYour choice?")
        
        let input = readLine()?.lowercased()
        
        if(input == "1"){
            let dmg = user.strength + 15
            enemy.takeDamage(amount: dmg)
            print("\nYour normal attack dealt \(dmg) damage!\n")
        }else if(input == "2"){
            if(user.maxMana < 10){
                print("You do not have enough mana! \n")
            }else{
                user.useMana(amount: 10)
                let dmg = user.strength * 2 + 50
                enemy.takeDamage(amount: dmg)
                print("\nYour skill dealt \(dmg) damage!\n")
            }
        }else if(input == "3"){
            user.defend()
        }else if(input == "4"){
            healWounds()
        }else if(input == "5"){
            scanned = true
        }else if(input == "6"){
            print("You feel that if you don't escape soon enough, you won't be able to continue the fight.")
            print("You look around frantically, searching for a way out. You sprint towards the exit, your heart pounding in your chest.")
            print("\n You are safe for now.")
            print("Press [return] to continue: ")

            let input = String(readLine() ?? "")
           
            if(input == ""){
                break
            }
            
        }
        
        if(enemy.health <= 0){
            print("You have slain \(enemy.name)! You have leveled up! 🏆\n")
            reward(name: enemy.name)
            while true{
                print("Press [return] to continue.")
                let input = String(readLine() ?? "")
                if(input == ""){
                    break
                }
            }
            break
        }
        
        if(special == 6){
            if(enemy.name == "Troll"){
                print("The Ogre is charging his attack!")
            }else if(enemy.name == "Golem"){
                print("The Golem is preparing for huge attack!")
            }else if(enemy.name == "The Pedophile"){
                print("The Pedophile is preparing a huge attack!")
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
            if(user.shield){
                user.shield = false
                if(enemy.name == "Troll"){
                    print("The Ogre Slammed his club at you! \nYou blocked the Attack!")
                }else if(enemy.name == "Golem"){
                    print("The Golem threw a rock at you! \nYou blocked the Attack!")
                }else if(enemy.name == "The Pedophile"){
                    print("The Pedophile threw a left hook! \nYou blocked the Attack!")
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
                let ouch = enemy.strength * charged
                charged = 1
                user.takeDamage(amount: ouch)
                var dmg = ouch - user.defense
                if(dmg < 0){
                    dmg = 0
                }
                if(enemy.name == "Troll"){
                    print("The Ogre Slammed his club at you! \nYou take \(dmg) Damage!")
                }else if(enemy.name == "Golem"){
                    print("The Golem threw a rock at you! \nYou take \(dmg) Damage!")
                }else if(enemy.name == "The Pedophile"){
                    print("The Pedophile threw a left hook! \nYou take \(dmg) Damage!")
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
        
        if(user.maxHealth <= 0){
            print("/n/n/n/n/n/nYou died :(")
            print("That is the end of \(user.name)'s adventure.")
            print("Adventurer Score : \(user.lvl * 1000 - 10000)")
            exit(0)
        }
        
    }
}

func reward(name: String){
    if(name == "Troll"){
        user.lvlup()
        let prob = Int.random(in: 1...10)
        if(prob >= 6){
            print("Nice! You found some Potions!")
            let p = Int.random(in: 2...3)
            print("Gained \(p) Potions!")
            user.pots += p
        }else if(prob <= 3){
            if(user.hasGun == false){
                print("You found a treasure chest nearby and find a gun!")
                while true{
                    print("Will you equip the gun? [Y/N]\n")
                    let input = readLine()?.lowercased() ?? ""
            
                    if(input == "y"){
                        print("You have equipped the gun!\n")
                        user.strength += 25
                        user.hasGun = true
                        break
                    }
                    if(input == "n"){
                        print("You decide a gun does not belong in this game :(\n")
                        break
                    }
                }
            }else{
                let p = Int.random(in: 1...3)
                let e = Int.random(in: 2...5)
                print("Jackpot! You found a lot of items!")
                print("Gained \(p) Potions!")
                print("Gained \(e) Elixirs!")
                user.pots += p
                user.elixirs += e
            }
        }else{
            print("Nice! You found some Elixirs!")
            let p = Int.random(in: 3...5)
            print("Gained \(p) Elixirs!")
            user.elixirs += p
        }
    }else if(name == "Golem"){
        user.lvlup()
        user.lvlup()
        user.lvlup()
        user.lvlup()
        user.lvlup()
        user.lvlup()
        user.lvlup()
        user.lvlup()
        user.lvlup()
        user.lvlup()
    
        
        let prob = Int.random(in: 1...10)
        if(prob >= 6){
            print("Nice! You found some Potions!")
            let p = Int.random(in: 4...6)
            print("Gained \(p) Potions!")
            user.pots += p
        }else if(prob <= 3){
            if(user.hasArmor == false){
                print("You found a treasure chest nearby and find Armor!")
                while true{
                    print("Will you equip the Armor? [Y/N]\n")
                    let input = readLine()?.lowercased() ?? ""
            
                    if(input == "y"){
                        print("You have equipped the gun!\n")
                        user.defense += 20
                        user.hasArmor = true
                        break
                    }
                    if(input == "n"){
                        print("You decide you don't need Armor!\n")
                        break
                    }
                }
            }else{
                let p = Int.random(in: 3...6)
                let e = Int.random(in: 4...7)
                print("Jackpot! You found a lot of items!")
                print("Gained \(p) Potions!")
                print("Gained \(e) Elixirs!")
                user.pots += p
                user.elixirs += e
            }
        }else{
            print("Nice! You found some Elixirs!")
            let p = Int.random(in: 4...6)
            print("Gained \(p) Elixirs!")
            user.elixirs += p
        }
    }else{
        
        print("\n\n\n\nYou have saved humanity from Bob! The day is saved!")
        print("This is the end of your adventure! \(user.name) is a hero for all!")
        print("Adventurer Score : \(user.lvl * 1000 + 50000)\n\n\n\n\n\n\n")
        exit(0)
    }
    
    
}
class Player {
    var mxHP = 100
    var maxHealth = 100
    var mxMP = 50
    var maxMana = 50
    var pots = 10
    var elixirs = 10
    var shield = false
    var name = ""
    var lvl = 1
    var strength = 10
    var hasGun = false
    var defense = 0
    var hasArmor = false
        
    func takeDamage(amount: Int) {
        if(shield == true){
            print("\nYou have defended yourself!\n")
        }else{
            let dmg = amount - defense
            maxHealth -= dmg
            if maxHealth < 0 {
                maxHealth = 0
            }
        }
        
    }
    
    func lvlup(){
        lvl += 1
        strength += 2
        mxHP += 2
        mxMP += 1
    }
    
    func useMana(amount: Int){
        maxMana -= amount
        
    }
    
    func defend(){
        shield = true
    }
        
    func usePotion() {
        if pots > 0 {
            maxHealth += 20
            if (maxHealth > mxHP){
                maxHealth = mxHP
            }
            pots -= 1
            print("Player used a potion. Health is now \(maxHealth). Potions left: \(pots).")
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
}

class Enemy{
    var health: Int
    var maxHealth: Int
    var strength: Int
    var name: String
    
    init(maxHealth: Int, strength: Int, name: String) {
        self.maxHealth = maxHealth
        self.strength = strength
        self.name = name
        health = maxHealth
    }
    
    func takeDamage(amount: Int) {
        health -= amount
        if health < 0 {
            health = 0
        }
    }
}


