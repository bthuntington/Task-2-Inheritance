//
//  DungeonCharacter .swift
//  Task 2: Inheritance
//
//  Created by Brooke Huntington on 9/14/18.
//  Copyright © 2018 Brooke Huntington. All rights reserved.
//

import Foundation

//Name: string
//Hit points: integer (how much damage a character can take before it dies)
//Attack speed: integer (1 is the slowest)
//Damage range: two integers (minimum and maximum amount of damage a character can do on an attack)
//Chance to hit opponent when attacking: double
//Anything else you deem necessary

class DungeonCharacter {
    var name: String
    var hit_points: Int
    var attackSpeed: Int
    var damageMax: Int
    var damageMin: Int
    var chanceToHit: Double

    
    init(name: String, hit_points: Int, attackSpeed: Int, damageMax: Int, damageMin: Int, chanceToHit: Double) {
        self.name = name
        self.hit_points = hit_points
        self.attackSpeed = attackSpeed
        self.damageMax = damageMax
        self.damageMin = damageMin
        self.chanceToHit = chanceToHit
    }
    
    //First checks if the character can attack (based on chance to hit)
    //If it can, a hit in the range of minimum to maximum damage is generated and applied to opponent
    //User should be informed of what happens
    //If it cannot attack, a message should be displayed that says the attack failed
    
    func attack() -> Int {
        var attackChance:Double = Double(arc4random_uniform(UInt32(100))) + 1
        attackChance = attackChance / 100
        print(attackChance)
        print(chanceToHit)
        var difference = damageMax - damageMin
        var hitDamage = Int(arc4random_uniform(UInt32(difference))) + damageMin
        if (attackChance >= chanceToHit) {
            //did they block- do the same things as attackChance
            //damage applied to opponent
            print("Opponent hit for \(hitDamage) points")
            return hitDamage
        } else {
            print("Attack failed.")
            return hitDamage
        }
    }
    
}
