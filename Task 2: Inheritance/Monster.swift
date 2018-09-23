//
//  Monster.swift
//  Task 2: Inheritance
//
//  Created by Brooke Huntington on 9/21/18.
//  Copyright © 2018 Brooke Huntington. All rights reserved.
//

import Foundation

class Monster: DungeonCharacter {
    var chanceToHeal: Double
    var healMax: Int
    var healMin: Int
    
    init(chanceToHeal: Double, healMax: Int, healMin: Int, name: String, hit_points: Int, attackSpeed: Int, damageMax: Int, damageMin: Int, chanceToHit: Double) {
        self.chanceToHeal = chanceToHeal
        self.healMax = healMax
        self.healMin = healMin
        super.init(name: name, hit_points: hit_points, attackSpeed: attackSpeed, damageMax: healMax, damageMin: healMin, chanceToHit: chanceToHit)
        
    }
    //a Monster has a chance to heal after any attack that causes a loss of hit points. This should be checked after the Monster has been attacked and hit points have been lost. Note that if the hit points lost kill the Monster, it cannot heal itself!
    func heal() {
        var healChance:Double = Double(arc4random_uniform(UInt32(100))) + 1
        healChance = healChance / 100
        print(healChance)
        print(chanceToHeal)
        let difference = healMax - healMin
        let healing = Int(arc4random_uniform(UInt32(difference))) + damageMin
        if (healChance >= chanceToHeal) {
            //did they block- do the same things as attackChance
            //healing applied to monster
            print("Monster healed for \(healing) points")
        } else {
            print("Attack failed.")
        }
    }

}


