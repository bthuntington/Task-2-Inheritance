//
//  DungeonCharacter .swift
//  Task 2: Inheritance
//  Programming Assignment 3- Task 2: Inheritance
//  Created by Brooke Huntington on 9/21/18.
//  Copyright © 2018 Brooke Huntington. All rights reserved.
//  CPSC 315-01, Fall 2018
//  This contains the DungeonCharacter class
//  with the generic properties all other subclasses
//  will need as well as a generic attack function

import Foundation


class DungeonCharacter {
    var name: String
    var hitPoints: Int
    var attackSpeed: Int
    var damageMax: Int
    var damageMin: Int
    var chanceToHit: Double

    
    init(name: String, hitPoints: Int, attackSpeed: Int, damageMax: Int, damageMin: Int, chanceToHit: Double) {
        self.name = name
        self.hitPoints = hitPoints
        self.attackSpeed = attackSpeed
        self.damageMax = damageMax
        self.damageMin = damageMin
        self.chanceToHit = chanceToHit
    }
    
    // basic attack function
    func attack (character1: DungeonCharacter, character2: DungeonCharacter) {
        //First checks if the character can attack (based on chance to hit)
        var attackChance:Double = Double(arc4random_uniform(UInt32(100))) + 1
        attackChance = attackChance / 100
        print(attackChance)
        print(chanceToHit)
        let difference = damageMax - damageMin
        let hitDamage = Int(arc4random_uniform(UInt32(difference))) + damageMin
        //If it can, a hit in the range of minimum to maximum damage is generated and applied to opponent
        if (attackChance >= chanceToHit) {
            //did they block- do the same things as attackChance
            //damage applied to opponent
            print("Opponent hit for \(hitDamage) points")
            //return hitDamage
        } else {
            print("Attack failed.")
            //return hitDamage
        }
    }
    
}
