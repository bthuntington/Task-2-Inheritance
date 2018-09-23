//
//  Hero.swift
//  Task 2: Inheritance
//
//  Created by Brooke Huntington on 9/21/18.
//  Copyright © 2018 Brooke Huntington. All rights reserved.
//

import Foundation

class Hero: DungeonCharacter {
    var block: Double
    //number of attacks/special operations a Hero gets to perform per round
    var turns_per_round: Int
    
    init(name: String, hit_points: Int, attackSpeed: Int, damageMax: Int, damageMin: Int, chanceToHit: Double,  block: Double, turns_per_round: Int) {
        self.block = block
        self.turns_per_round = turns_per_round
        super.init(name: name, hit_points: hit_points, attackSpeed: attackSpeed, damageMax: damageMax, damageMin: damageMin, chanceToHit: chanceToHit)
    }
    
    static func getCharacterName () -> String {
        
        print("What is the name of your hero?")
        let response = readLine()
        var characterName = ""
        while (characterName == "") {
            if let name = response {
                characterName = name
                print("Great, you named your hero \(characterName)")
            } else {
                print("That name doesn't work")
            }
        }
        return characterName
    }
}
