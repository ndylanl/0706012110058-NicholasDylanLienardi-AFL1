//
//  HeroFunctions.swift
//  0706012110058-NicholasDylanLienardi-AFL-1
//
//  Created by MacBook Pro on 04/04/23.
//

import Foundation

protocol HeroAction{
    func takeDamage(amount: Int)
    
    func lvlUp(levels: Int)
    
    func useMana(amount: Int)
    
    func userDefend()
    
    func usePotion()
    
    func useElixir()
    
    func Equip(equip: Equipment)
    
    func healWounds()
    
    func drinkElixir()
}
