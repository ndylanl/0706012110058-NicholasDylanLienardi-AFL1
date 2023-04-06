//
//  main.swift
//  0706012110058-NicholasDylanLienardi-AFL-1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation



var hero = Player(Health: 100, maxHealth: 100, Attack: 10, Name: "")

var enemy = Enemy(Health: 1000, maxHealth: 1000, Attack: 50, Name: "dylanganteng", goldDrop: 1000, intro: "")

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
        let gg = readLine() ?? ""
        let nameRegex = "^[a-zA-Z]+$"
        let namePredicate = NSPredicate(format:"SELF MATCHES %@", nameRegex)
        
        if namePredicate.evaluate(with: gg) {
            // Valid input, name only contains characters a-z and A-Z
            print("\nNice to meet you, \(gg)!")
            hero.Name = gg
            journeyScreen()
            break // Exit the loop
        }else{
            print("\nINPUT A PROPER INPUT!\n")
        }
    }
}

func journeyScreen(){
    while true {
        //main menu
        print("\nFrom here you can... \n")
        print("[C]heck your health and stats")
        print("[H]eal your wounds with potions")
        print("[D]rink elixirs to fill your mana \n")
        print("Choose where you want to go \n")
        print("[F]orest of Trolls (Recommended Lvl 1 Hunting Grounds)")
        print("[M]ountain of Golems (Recommended Lvl 5 Hunting Grounds)")
        print("[E]vil Island (Recommended Lvl 10 Hunting Grounds)")
        print("[Q]uit Game \n")
        print("Or spend your day shopping!")
        print("[S]hop")
        print("\nYour Choice?")
        
        let input = readLine()?.lowercased()
        
        if(input == "c"){
            hero.showStats()
        }else if(input == "h"){
            hero.healWounds()
        }else if(input == "d"){
            hero.drinkElixir()
        }else if(input == "f"){
            //setting the enemy stats
            enemy = Enemy(Health :300, maxHealth: 300, Attack: 10, Name: "Troll", goldDrop: 100, intro: "\nAs you arrive in the forest of trolls, you feel a sense of unease wash over you.\nSuddenly you hear the sounds of twigs snapping behind you. You quickly spin around and find a Troll looming over you.")
            battle()
        }else if(input == "m"){
            //setting the enemy stats
            enemy = Enemy(Health :600, maxHealth: 600, Attack: 20, Name: "Golem", goldDrop: 200, intro: "\nAs you make your way through the rugged mountain terrain, you can feel the hill of the wind biting at your  skin.\nSuddenly, you hear you hear a sound that makes you freeze in your tracks. That's when you see it - a massive ,snarling Golem emerges from the shadows.")
            battle()
        }else if(input == "e"){
            //setting the enemy stats
            enemy = Enemy(Health :1000, maxHealth: 1000, Attack: 40, Name: "BIG BOSS", goldDrop: 500, intro: "\nThe BOSS looms over you ready to end this all! \nDefeat him and end his reign!!!")
            battle()
        }else if(input == "q"){
            print("\nThat will be the end of our adventure today! Fare thee well young martial artist!   \n\n")
            break
        }else if(input == "s"){
            shop()
        }else{
            print("\nINPUT A PROPER INPUT!\n")
        }
    }
}

func shop(){
    let newShop = Shop(stars:Int.random(in: 1...5))
    newShop.visit(visitor: hero)
}

func battle(){
    var scanned = false
    var leave = false
    
    //small intro based on enemy name
    
    print(enemy.intro)
    
    //looping main battle logic
    while true{
        var special = Swift.Int.random(in: 1...6)
        if(enemy.charged == 3){
            special = 3
        }
        while true{
            print("\n😈 Name  : \(enemy.Name)")
            if(scanned){
                print("😈 Health: \(enemy.Health)/\(enemy.maxHealth)")
            }else{
                print("😈 Health: ????")
            }
            print("==============\n")
            print("💩 Name  : Lvl.\(hero.lvl) \(hero.Name)")
            print("💩 Health: \(hero.Health)/\(hero.maxHealth)")
            print("💩 Mana  : \(hero.maxMana)/\(hero.mxMP)")
            print("\nChoose your action:")
            if(hero.hasGun){
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
                let dmg = hero.Attack + 15
                enemy.takeDamage(amount: dmg)
                print("\nYour normal attack dealt \(dmg) damage!\n")
                break
            }else if(input == "2"){
                if(hero.maxMana < 10){
                    print("You do not have enough mana! \n")
                }else{
                    hero.useMana(amount: 10)
                    let dmg = hero.Attack * 2 + 50
                    enemy.takeDamage(amount: dmg)
                    print("\nYour skill dealt \(dmg) damage!\n")
                }
                break
            }else if(input == "3"){
                if(hero.maxMana < 10){
                    print("You do not have enough mana! \n")
                }else{
                    hero.useMana(amount: 10)
                    hero.userDefend()
                }
                break
            }else if(input == "4"){
                hero.healWounds()
                break
            }else if(input == "5"){
                scanned = true
                break
            }else if(input == "6"){
                print("You feel that if you don't escape soon enough, you won't be able to continue the fight.")
                print("You look around frantically, searching for a way out. You sprint towards the exit, your heart pounding in your chest.")
                print("\n You are safe for now.")
                print("Press [return] to continue: ")

                let input = String(readLine() ?? "")
               
                if(input == ""){
                    leave = true
                }
                break
                
            }else{
                print("\nINPUT A PROPER INPUT!\n")
            }
        }
        
        if(enemy.Health <= 0){
            print("You have slain \(enemy.Name)! You have leveled up! 🏆\n")
            
            //call function for battle rewards
            enemy.reward(name: enemy.Name, hero: hero)
            while true{
                print("Press [return] to continue.")
                let input = String(readLine() ?? "")
                if(input == ""){
                    break
                }
            }
            break
        }
        if(leave == false){
            enemy.decideAction(special: special)
        }
        
        //check for player death after enemy attack
        if(hero.Health <= 0){
            print("\n\n\n\n\nYou died :(")
            print("That is the end of \(hero.Name)'s adventure.")
            print("Adventurer Score : \(hero.lvl * 1000 - 10000 + hero.gold * 10)")
            exit(0)
        }
        //this leaves the battle loop and returns to the previous menu.
        if(leave){
            break
        }
        
    }
}
