//
//  Entity.swift
//  0706012110058-NicholasDylanLienardi-AFL-1
//
//  Created by MacBook Pro on 31/03/23.
//

import Foundation

class Entity{
    var Health: Int = 0
    var maxHealth: Int = 0
    var Attack: Int = 0
    var Defense: Int = 0
    var Name: String = ""
    
    func takeDamage(amount: Int) {
        Health -= amount
        if Health < 0 {
            Health = 0
        }
    }
    
    init(Health: Int, maxHealth: Int, Attack: Int, Name: String) {
        self.Health = Health
        self.maxHealth = maxHealth
        self.Attack = Attack
        self.Name = Name
    }
}
