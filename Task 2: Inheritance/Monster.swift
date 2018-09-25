//
//  Monster.swift
//  Task 2: Inheritance
//  Programming Assignment 3- Task 2: Inheritance
//  Created by Brooke Huntington on 9/21/18.
//  Copyright © 2018 Brooke Huntington. All rights reserved.
//  CPSC 315-01, Fall 2018
//  This file contains the monster class, a subclass of
//  DungeonCharacter. It contains functions heal() and attackHero()

import Foundation

class Monster: DungeonCharacter {
    var chanceToHeal: Double
    var healMax: Int
    var healMin: Int
    var monsterType: String
    
    init(chanceToHeal: Double, healMax: Int, healMin: Int, monsterType: String, name: String, hitPoints: Int, attackSpeed: Int, damageMax: Int, damageMin: Int, chanceToHit: Double) {
        self.chanceToHeal = chanceToHeal
        self.healMax = healMax
        self.healMin = healMin
        self.monsterType = monsterType
        super.init(name: name, hitPoints: hitPoints, attackSpeed: attackSpeed, damageMax: healMax, damageMin: healMin, chanceToHit: chanceToHit)
        
    }
    //a Monster has a chance to heal after any attack that causes a loss of hit points
    func heal(monster: Monster) {
        var healChance:Double = Double(arc4random_uniform(UInt32(100))) + 1
        healChance = healChance / 100
        print(healChance)
        print(chanceToHeal)
        let difference = healMax - healMin
        let healing = Int(arc4random_uniform(UInt32(difference))) + damageMin
        if (healChance <= chanceToHeal) {
            //did they block- do the same things as attackChance
            //healing applied to monster
            print("\(monster.name) healed for \(healing) points")
        } else {
            print("\(monster.name) cannot heal at this time.")
        }
    }
    
    // allows monster to attack heroes
    func attackHero(monster: Monster, hero: Hero) {
        
        print("""
        ~~~~~~It's \(monster.name)'s turn ~~~~~
            \(hero.name) has \(hero.hitPoints) HP
            \(monster.name) has \(monster.hitPoints) HP
            
        """)
        var attackChance:Double = Double(arc4random_uniform(UInt32(100))) + 1
        attackChance = attackChance / 100
        let difference = hero.damageMax - monster.damageMin
        let hitDamage = Int(arc4random_uniform(UInt32(difference))) + monster.damageMin
        // special attacks that have a 30% chance to happen
        if attackChance <= 0.3 {
            if monster.monsterType == "Ogre" {
                Ogre.smash(monster: monster, hero: hero)
            } else if monster.monsterType == "Gremlin" {
                Gremlin.bite(monster: monster, hero: hero)
            } else if monster.monsterType == "Skeleton" {
                Skeleton.rattle(monster: monster, hero: hero)
            }
        // regular attack
        } else if (attackChance <= monster.chanceToHit) {
            //did they block- do the same things as attackChance
            var blockChance:Double = Double(arc4random_uniform(UInt32(100))) + 1
            blockChance = blockChance / 100
            // gives hero a chance to block
            if blockChance > hero.block {
                //damage applied to hero
                print("\(monster.name) hit \(hero.name) for \(hitDamage) points")
                hero.hitPoints -= hitDamage
            
            } else {
                print("\(hero.name) blocked attack!")
            }
        //monster attack failed
        } else {
            print("\(monster.name)'s attack failed.")
        }
    }

}
// monster arrays
var monsterArray1 = [skeleton1, ogre1, gremlin1]
var monsterArray2 = [skeleton2, ogre2, gremlin2]
var monsterArray3 = [skeleton3, ogre3, gremlin3]
