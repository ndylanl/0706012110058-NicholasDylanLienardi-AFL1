//
//  Equipment.swift
//  0706012110058-NicholasDylanLienardi-AFL-1
//
//  Created by MacBook Pro on 28/03/23.
//

import Foundation

class Equipment{
    var name: String
    var atkBonus: Int
    var defBonus: Int
    var price: Int
    
    init(name: String) {
        self.name = name
        let decide = Int.random(in: 0...1)
        if(decide == 0){
            atkBonus = Int.random(in: 10...20)
            defBonus = 0
            price = 10 * atkBonus + Int.random(in: 50...200)
        }else{
            atkBonus = 0
            defBonus = Int.random(in: 10...20)
            price = 10 * defBonus + Int.random(in: 50...200)
        }
    }
}
