//
//  Hero.swift
//  Task 2: Inheritance
//  Programming Assignment 3- Task 2: Inheritance
//  Created by Brooke Huntington on 9/21/18.
//  Copyright © 2018 Brooke Huntington. All rights reserved.
//  CPSC 315-01, Fall 2018
//  This file is a subclass of DungeonCharacter
//  that contains the properies any hero should have,
//  as well as a generic attack monster function and
//  a function to get a the hero's name from the user

import Foundation

class Hero: DungeonCharacter {
    var block: Double
    //number of attacks/special operations a Hero gets to perform per round
    var turns_per_round: Int
    //describes which hero class character is
    var heroClass: String
    
    init(name: String, hitPoints: Int, attackSpeed: Int, damageMax: Int, damageMin: Int, chanceToHit: Double, block: Double, turns_per_round: Int, heroClass: String) {
        self.block = block
        self.turns_per_round = turns_per_round
        self.heroClass = heroClass
        super.init(name: name, hitPoints: hitPoints, attackSpeed: attackSpeed, damageMax: damageMax, damageMin: damageMin, chanceToHit: chanceToHit)
    }
    //gets character's name from the user
    static func getCharacterName () -> String {
        
        print("What is the name of your hero?")
        let response = readLine()
        var characterName = ""
        while (characterName == "") {
            if let name = response {
                characterName = name
            } else {
                print("That name doesn't work")
            }
        }
        return characterName
    }
    // attacks monsters
    func attackMonster (hero: Hero, monster: Monster) {
        var attackChance:Double = Double(arc4random_uniform(UInt32(100))) + 1
        attackChance = attackChance / 100
        // determines if the attack succeeds
        let difference = hero.damageMax - hero.damageMin
        let hitDamage = Int(arc4random_uniform(UInt32(difference))) + hero.damageMin
        // attack succeeds
        if (attackChance <= hero.chanceToHit) {
            //did they block- do the same things as attackChance
            //damage applied to opponent
            print("\(hero.name) hit \(monster.name) for \(hitDamage) damage points")
            monster.hitPoints -= hitDamage
            if monster.hitPoints > 0 {
                monster.heal(monster: monster)
            }
            // attack fails
        } else {
            print("Attack failed.")
            monster.heal(monster: monster)
        }
    }
}
