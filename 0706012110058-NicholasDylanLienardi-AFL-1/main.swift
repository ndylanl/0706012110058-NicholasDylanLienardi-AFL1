//
//  main.swift
//  0706012110058-NicholasDylanLienardi-AFL-1
//
//  Created by MacBook Pro on 28/02/23.
//

import Foundation

let user = Player()
var enemy = Enemy(health: 1000, name: "Dylan")

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
            print("Nice to meet you, \(name)! \n")
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
        print("[H]eal your wounds with ginseng \n")
        print("Or choose where you want to go \n")
        print("[F]orest of Trolls")
        print("[M]ountain of Golems")
        print("[Q]uit Game \n")
        print("Your Choice?")
        
        let input = readLine()?.lowercased()
        
        if(input == "c"){
            showStats()
        }else if(input == "h"){
            healWounds()
        }else if(input == "f"){
            enemy = Enemy(health: 1000, name: "Troll")
            forestTrolls()
        }else if(input == "m"){
            enemy = Enemy(health: 1000, name: "Golem")
            mountainGolems()
        }else if(input == "q"){
            print("\nThat will be the end of our adeventure today! Fare thee well young martial artist!   \n\n")
            break
        }
    }
}

func showStats(){
    print("\n===========================================")
    print("Player Name  : \(user.name)")
    print("\nPlayer Health: \(user.maxHealth)")
    print("Player Mana  : \(user.maxMana)")
    print("\nMagic:")
    print("- Bludgeon. No Mana Required. Deal 5 points of damage.")
    print("- Blind Tiger Strike. 10 Mana Required. Deal 50 points of damage.")
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
        print("\nYour HP is \(user.maxHealth).")
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

func forestTrolls(){
    var scanned = false
    while true{
        print("\nAs you arrive in the forest of trolls, you feel a sense of unease wash over you.")
        print("Suddenly you hear the sounds of twigs snapping behind you. You quickly spin around and find a Troll looming over you.")
        print("\n😈 Name  : \(enemy.name)")
        if(scanned){
            print("😈 Health: \(enemy.health)")
        }else{
            print("😈 Health: ????")
        }
        print("\nChoose your action:")
        print("[1] Bludgeon. No Mana Required. Deal 5 points of damage.")
        print("[2] Blind Tiger Strike. 10 Mana Required. Deal 50 points of damage.")
        print("[3] Black Turtle Formation. 10 Mana Required. Block enemy's attack for 1 turn.")
        print("\n[4] Use potion to heal")
        print("[5] Scan enemy's vitals")
        print("[6] Flee from battle")
        print("\nYour choice?")
        
        let input = readLine()?.lowercased()
        
        if(input == "1"){
            enemy.takeDamage(amount: 5)
        }else if(input == "2"){
            if(user.maxMana < 10){
                print("You do not have enough mana! \n")
            }else{
                user.useMana(amount: 10)
                enemy.takeDamage(amount: 50)
                print("\nYou dealt 50 damage!\n")
            }
        }else if(input == "3"){
            
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
    }
}

func mountainGolems(){
    
}


class Player {
    var maxHealth = 100
    var maxMana = 50
    var pots = 10
    var elixirs = 10
    var name = ""
        
    func takeDamage(amount: Int) {
        maxHealth -= amount
        if maxHealth < 0 {
            maxHealth = 0
        }
        print("Player took \(amount) damage. Health is now \(maxHealth).")
    }
    
    func useMana(amount: Int){
        maxMana -= amount
        
    }
        
    func usePotion() {
        if pots > 0 {
            maxHealth += 20
            if (maxHealth > 100){
                maxHealth = 100
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
            if (maxMana > 50){
                maxMana = 50
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
    var name: String
    
    init(health: Int, name: String) {
        self.health = health
        self.name = name
    }
    
    func takeDamage(amount: Int) {
        health -= amount
        if health < 0 {
            health = 0
        }
        print("\(name) took \(amount) damage. Health is now \(health).")
    }
}


