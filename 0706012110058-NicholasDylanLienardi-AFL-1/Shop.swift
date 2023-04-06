//
//  Shop.swift
//  0706012110058-NicholasDylanLienardi-AFL-1
//
//  Created by MacBook Pro on 04/04/23.
//

import Foundation

struct Shop{
    var stars: Int
    var items: Array<Equipment> = []
    
    init(stars: Int) {
        self.stars = stars
    }
    
    func visit(visitor: Player){
        var exit = false
        let a = Equipment(name: "Ancient Glove", quality: stars)
        let b = Equipment(name: "Ancient Scarf", quality: stars)
        let c = Equipment(name: "Ancient Boots", quality: stars)
        let shopitems = [a, b, c]
        while true{
            print("\n===========================================")
            print("Welcome to our \(stars) star Shop! Here you can use your hard-earned gold and buy equipment and items for your long adventure!\n")
            var counter = 0
            for item in shopitems {
                counter += 1
                print("[\(counter)] \(item.name) [\(item.atkBonus) AtkBonus] [\(item.defBonus) DefBonus] [\(item.price) Gold]")
            }
            print("[E]xit")
            print("\nYour Money: \(hero.gold)")
            print("What will your purchase be: ")
            let input = readLine()?.lowercased()
            switch(input){
            case "1":
                if(hero.gold >= a.price){
                    while true{
                        print("Confirm purchase of \(a.name) for \(a.price)? [Y/N]")
                        let confirm = readLine()?.lowercased()
                        if(confirm == "y"){
                            hero.Equip(equip: a)
                            print("Thanks for shopping! Come again soon!\n")
                            exit = true
                            break
                        }else if(confirm == "n"){
                            print("Purchase cancelled.")
                            break
                        }else{
                            print("INVALID INPUT!!!")
                        }
                    }
                }else{
                    print("Young Adventurer! You don't have enough Gold for this purchase!!\n")
                }
                break
            case "2":
                if(hero.gold >= b.price){
                    while true{
                        print("Confirm purchase of \(b.name) for \(b.price)? [Y/N]")
                        let confirm = readLine()?.lowercased()
                        if(confirm == "y"){
                            hero.Equip(equip: b)
                            print("Thanks for shopping! Come again soon!\n")
                            exit = true
                            break
                        }else if(confirm == "n"){
                            print("Purchase cancelled.")
                            break
                        }else{
                            print("INVALID INPUT!!!")
                        }
                    }
                }else{
                    print("Young Adventurer! You don't have enough Gold for this purchase!!\n")
                }
                break
            case "3":
                if(hero.gold >= c.price){
                    while true{
                        print("Confirm purchase of \(c.name) for \(c.price)? [Y/N]")
                        let confirm = readLine()?.lowercased()
                        if(confirm == "y"){
                            hero.Equip(equip: c)
                            print("Thanks for shopping! Come again soon!\n")
                            exit = true
                            break
                        }else if(confirm == "n"){
                            print("Purchase cancelled.")
                            break
                        }else{
                            print("INVALID INPUT!!!")
                        }
                    }
                }else{
                    print("Young Adventurer! You don't have enough Gold for this purchase!!\n")
                }
                break
            case "e":
                print("Thanks for shopping! Come again soon!\n")
                exit = true
                break
            default:
                print("Invalid Input!")
                break
            }
            if(exit){
                break
            }
        }
    }
}
