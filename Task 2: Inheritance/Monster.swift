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
    
    init(chanceToHeal: Double, healMax: Int, healMin: Int, name: String, hitPoints: Int, attackSpeed: Int, damageMax: Int, damageMin: Int, chanceToHit: Double) {
        self.chanceToHeal = chanceToHeal
        self.healMax = healMax
        self.healMin = healMin
        super.init(name: name, hitPoints: hitPoints, attackSpeed: attackSpeed, damageMax: healMax, damageMin: healMin, chanceToHit: chanceToHit)
        
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
    
    func attackHero(monster: Monster, hero: Hero) {
        
        print("""
        ~~~~~~~~ It's \(monster.name)'s turn
            \(hero.name) has \(hero.hitPoints) HP
            \(monster.name) has \(monster.hitPoints) HP
            
        """)
        var attackChance:Double = Double(arc4random_uniform(UInt32(100))) + 1
        attackChance = attackChance / 100
        print(attackChance)
        print(monster.chanceToHit)
        let difference = hero.damageMax - monster.damageMin
        let hitDamage = Int(arc4random_uniform(UInt32(difference))) + monster.damageMin
        if (attackChance <= monster.chanceToHit) {
            //did they block- do the same things as attackChance
            var blockChance:Double = Double(arc4random_uniform(UInt32(100))) + 1
            blockChance = blockChance / 100
            print("blockChance: \(blockChance), hero's block = \(hero.block)")
            if blockChance > hero.block {
                //damage applied to hero
                print("\(monster.name) hit \(hero.name) for \(hitDamage) points")
                hero.hitPoints -= hitDamage
            } else {
                print("\(hero.name) blocked attack!")
            }
        } else {
            print("\(monster.name)'s attack failed.")
        }
    }

}

var monsterArray = [skeleton1, ogre1, gremlin1]
