//
//  Thief.swift
//  Task 2: Inheritance
//
//  Created by Brooke Huntington on 9/21/18.
//  Copyright © 2018 Brooke Huntington. All rights reserved.
//

import Foundation

class Thief: Hero {
    init(name: String) {
        let hitPoints = 75
        let attackSpeed = 6
        let chanceToHit = 0.8
        let damageMin = 20
        let damageMax = 40
        let block = 0.4
        let turns_per_round = 0
        
        super.init(name: name, hitPoints: hitPoints, attackSpeed: attackSpeed, damageMax: damageMax, damageMin: damageMin, chanceToHit: chanceToHit, block: block, turns_per_round: turns_per_round)
    }
    
    func surpriseAttack() {
        var attackChance:Double = Double(arc4random_uniform(UInt32(100))) + 1
        attackChance = attackChance / 100
        
        var thiefCaught:Double = Double(arc4random_uniform(UInt32(100))) + 1
        thiefCaught = thiefCaught / 100
        if thiefCaught >= 0.8 {
           print("Oh no, your thief was caught trying to sneak attack.")
        print("You can't attack this turn.")
        } else if(attackChance >= 0.6) {
            print("You were super sneaky and attacked managed to attack from behind")
            //print("Your attack did \(hitDamage) damage and you get another turn!")
            //add damage to enemy
        } else {
            print("You weren't sneaky enough to surprise the monster, but you still got an attack in.")
        }
    }
}
