//
//  Gremlin.swift
//  Task 2: Inheritances
//  Programming Assignment 3- Task 2: Inheritance
//  Created by Brooke Huntington on 9/21/18.
//  Copyright © 2018 Brooke Huntington. All rights reserved.
//  CPSC 315-01, Fall 2018
//  This file is a subclass of Monster that
//  has the statistics for the monster type,
//  a special attack function, and three gremlin
//  instances

import Foundation

class Gremlin: Monster {
    init(name: String) {
        let hitPoints = 70
        let attackSpeed = 5
        let chanceToHit = 0.8
        let damageMin = 15
        let damageMax = 30
        let chanceToHeal = 0.4
        let healMin = 20
        let healMax = 40
        let monsterType = "Gremlin"
        
        super.init(chanceToHeal: chanceToHeal, healMax: healMax, healMin: healMin, monsterType: monsterType, name: name, hitPoints: hitPoints, attackSpeed: attackSpeed, damageMax: damageMax, damageMin: damageMin, chanceToHit: chanceToHit)
    }
    //special gremlin attack
    static func bite(monster: Monster, hero: Hero) {
        var attackChance:Double = Double(arc4random_uniform(UInt32(100))) + 1
        attackChance = attackChance / 100
        if(attackChance <= 0.6) {
            let hitDamage = Int(arc4random_uniform(UInt32(50))) + 75
            print("Oh no! \(monster.name) jumped on you and started biting you!")
            print("His attack did \(hitDamage) damage!")
            hero.hitPoints -= hitDamage
            
        } else {
            print("\(monster.name) tried to jump on you but you dodged just in time!")
        }
    }

}

var gremlin1 = Gremlin(name: "Lief the Gremlin")
var gremlin2 = Gremlin(name: "Jamie the Gremlin")
var gremlin3 = Gremlin(name: "Indigo the Gremlin")

