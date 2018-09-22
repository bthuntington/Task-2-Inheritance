//
//  Warrior.swift
//  Task 2: Inheritance
//
//  Created by Brooke Huntington on 9/21/18.
//  Copyright © 2018 Brooke Huntington. All rights reserved.
//

import Foundation

class Warrior: Hero {
    
    init(name: String, hit_points: Int, attackSpeed: Int, damageRangeMax: Int, damageRangeMin: Int, chanceToHit: Double, damagblock: Double, block: Double, turns_per_round: Int) {
        super.init(name: name, hit_points: hit_points, attackSpeed: attackSpeed, damageRangeMax: damageRangeMax, damageRangeMin: damageRangeMin, chanceToHit: chanceToHit, block: block, turns_per_round: turns_per_round)
    }
    
    //warrior's special attack
    func crushingBlow () {
        var attackChance:Double = Double(arc4random_uniform(UInt32(100))) + 1
        attackChance = attackChance / 100
        if(attackChance >= 0.6) {
            var hitDamage = Int(arc4random_uniform(UInt32(100))) + 75
            print("Wow! You did a crushing blow!")
            print("Your attack had + \(hitDamage) damage")
            //add damage to enemy
            
        } else {
            
        }
    }
}
