//
//  Warrior.swift
//  Task 2: Inheritance
//  Programming Assignment 3- Task 2: Inheritance
//  Created by Brooke Huntington on 9/21/18.
//  Copyright © 2018 Brooke Huntington. All rights reserved.
//  CPSC 315-01, Fall 2018
//  This is a subclass of the Hero class.
//  It contains the initial stats for every Warrior,
//  a special attack, and warrior attack function

import Foundation

class Warrior: Hero {
    
    init(name: String) {
        let heroClass = "Warrior"
        let hitPoints = 55
        let attackSpeed = 4
        let chanceToHit = 0.8
        let damageMin = 35
        let damageMax = 60
        let block = 0.2
        let turns_per_round = 0
        super.init(name: name, hitPoints: hitPoints, attackSpeed: attackSpeed, damageMax: damageMax, damageMin: damageMin, chanceToHit: chanceToHit, block: block, turns_per_round: turns_per_round, heroClass: heroClass)
//        
    }
    
    //warrior's special attack
    func crushingBlow (warrior: Warrior, monster: Monster) {
        var attackChance:Double = Double(arc4random_uniform(UInt32(100))) + 1
        attackChance = attackChance / 100
        if(attackChance <= 0.4) {
            let hitDamage = Int(arc4random_uniform(UInt32(50))) + 75
            print("Wow! You did a crushing blow!")
            print("Your attack did \(hitDamage) damage")
            //add damage to enemy
            monster.hitPoints -= hitDamage
            if monster.hitPoints > 0 {
                monster.heal(monster: monster)
            }
            
        } else {
            print("Whoops, looks like you slipped on a banana peel and your attack failed.")
            if monster.hitPoints > 0 {
                monster.heal(monster: monster)
            }
        }
    }
    
    func attack (hero: Warrior, opponent: Monster) -> Int {
        var playerTurns = 1
        while playerTurns == 1 {
            print("""
                
                ~~~~~ It's \(hero.name)'s turn (1 of 1) ~~~~~
                \(hero.name) has \(hero.hitPoints) HP
                \(opponent.name) has \(opponent.hitPoints) HP
                
                Please choose your attack from the following menu
                1) Normal attack
                2) Special attack
                3) Quit game
                """)
            let choice = readLine()
            if let attackChoice = Int(choice!) {
                if attackChoice == 1 {
                    hero.attackMonster(hero: hero, monster: opponent)
                    
                    if opponent.hitPoints <= 0 {
                        print("You killed \(opponent.name)")
                        playerTurns = 0
                    }
                    playerTurns = 0
                } else if attackChoice == 2 {
                    hero.crushingBlow(warrior: hero, monster: opponent)
                    playerTurns = 0
                } else {
                    print("Okay, goodbye")
                    return 1
                }
            } else {
                print("Wrong input")
            }
            print("Press enter to continue...")
            _ = readLine()
        }
        return 0
    }

}
