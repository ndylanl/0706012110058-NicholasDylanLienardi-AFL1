//
//  Equipment.swift
//  0706012110058-NicholasDylanLienardi-AFL-1
//
//  Created by MacBook Pro on 28/03/23.
//

import Foundation

struct Equipment{
    var name: String
    var atkBonus: Int
    var defBonus: Int
    var price: Int
    var quality: Int
    
    init(name: String, quality: Int) {
        self.name = name
        self.quality = quality
        let decide = Int.random(in: 0...1)
        if(decide == 0){
            atkBonus = Int.random(in: 5...10) * quality
            defBonus = 0
            price = 10 * atkBonus + Int.random(in: 50...100)*quality
        }else{
            atkBonus = 0
            defBonus = Int.random(in: 5...10) * quality
            price = 10 * defBonus + Int.random(in: 50...100)*quality
        }
    }
}
