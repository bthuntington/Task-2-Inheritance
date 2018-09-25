//
//  Skeleton.swift
//  Task 2: Inheritance
//
//  Created by Brooke Huntington on 9/21/18.
//  Copyright © 2018 Brooke Huntington. All rights reserved.
//

import Foundation

class Skeleton: Monster {
    init(name: String) {

        let hitPoints = 100
        let attackSpeed = 3
        let chanceToHit = 0.8
        let damageMin = 30
        let damageMax = 50
        let chanceToHeal = 0.3
        let healMin = 30
        let healMax = 50
        let monsterType = "Skeleton"
        
        super.init(chanceToHeal: chanceToHeal, healMax: healMax, healMin: healMin, monsterType: monsterType, name: name, hitPoints: hitPoints, attackSpeed: attackSpeed, damageMax: damageMax, damageMin: damageMin, chanceToHit: chanceToHit)
    }
    static func rattle(monster: Monster, hero: Hero) {
        var attackChance:Double = Double(arc4random_uniform(UInt32(100))) + 1
        attackChance = attackChance / 100
        if(attackChance <= 0.4) {
            let hitDamage = Int(arc4random_uniform(UInt32(50))) + 75
            print("Oh no! \(monster.name) rattled his bones at you!")
            print("You got so scared his attack did \(hitDamage) damage!")
            hero.hitPoints -= hitDamage
            
        } else {
            print("\(monster.name) tried to scare you but you were too tough!")
        }
    }
}

var skeleton1 = Skeleton(name: "Benny the skeleton")
var skeleton2 = Skeleton(name: "Mattias the skeleton")
var skeleton3 = Skeleton(name: "Fiona the skeleton")
