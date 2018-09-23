//
//  Warrior.swift
//  Task 2: Inheritance
//
//  Created by Brooke Huntington on 9/21/18.
//  Copyright © 2018 Brooke Huntington. All rights reserved.
//

import Foundation

class Warrior: Hero {
    
    init(name: String) {
        let hit_points = 25
        let attackSpeed = 4
        let chanceToHit = 0.8
        let damageMin = 35
        let damageMax = 60
        let block = 0.2
        let turns_per_round = 0
        super.init(name: name, hit_points: hit_points, attackSpeed: attackSpeed, damageMax: damageMax, damageMin: damageMin, chanceToHit: chanceToHit, block: block, turns_per_round: turns_per_round)
//        self.name = name
//        self.hit_points = hit_points
//        self.attackSpeed = attackSpeed
//        self.chanceToHit = chanceToHit
//        self.damageMin = damageMin
//        self.damageMax = damageMax
//        self.block = block
//        
    }
    
    //warrior's special attack
    func crushingBlow () {
        var attackChance:Double = Double(arc4random_uniform(UInt32(100))) + 1
        attackChance = attackChance / 100
        if(attackChance <= 0.4) {
            var hitDamage = Int(arc4random_uniform(UInt32(100))) + 75
            print("Wow! You did a crushing blow!")
            print("Your attack did \(hitDamage) damage")
            //add damage to enemy
            
        } else {
            
        }
    }
}
