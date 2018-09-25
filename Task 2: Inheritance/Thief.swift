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
        let heroClass = "Thief"
        let hitPoints = 75
        let attackSpeed = 6
        let chanceToHit = 0.8
        let damageMin = 20
        let damageMax = 40
        let block = 0.4
        let turns_per_round = 0
        
        super.init(name: name, hitPoints: hitPoints, attackSpeed: attackSpeed, damageMax: damageMax, damageMin: damageMin, chanceToHit: chanceToHit, block: block, turns_per_round: turns_per_round, heroClass: heroClass)
    }
    
    func surpriseAttack(hero: Thief, monster: Monster) {
        var attackChance:Double = Double(arc4random_uniform(UInt32(100))) + 1
        attackChance = attackChance / 100
        
        var thiefCaught:Double = Double(arc4random_uniform(UInt32(100))) + 1
        thiefCaught = thiefCaught / 100
        
        let difference = hero.damageMax - hero.damageMin
        let hitDamage = Int(arc4random_uniform(UInt32(difference))) + hero.damageMin
        if thiefCaught <= 0.20 {
           print("Oh no, your thief was caught trying to sneak attack.")
        print("You can't attack this turn.")
        } else if(attackChance <= 0.4) {
            print("You were super sneaky and attacked managed to attack from behind!")
            print("Your attack did \(hitDamage) damage and you get another turn!")
            monster.hitPoints -= hitDamage
            //add damage to enemy
        } else {
            print("You weren't sneaky enough to surprise the monster, but you still got an attack in.")
            print("Your attack did \(hitDamage) hit points")
            monster.hitPoints -= hitDamage
        }
    }
    
    func attack (hero: Thief, opponent: Monster) -> Int {
        var playerTurns = 1
        var doubleAttack = 0
        while playerTurns == 1 {
            doubleAttack = hero.turns_per_round
            if doubleAttack == 2 {
            print("""
                
                ~~~~~ It's \(hero.name)'s turn (1 of 2)
                \(hero.name) has \(hero.hitPoints) HP
                \(opponent.name) has \(opponent.hitPoints) HP
                
                Please choose your attack from the following menu
                1) Normal attack
                2) Special attack
                3) Quit game
                """)
                doubleAttack -= 1
            } else if doubleAttack == 1 {
                print("""
                    
                    ~~~~~ It's \(hero.name)'s turn (2 of 2)
                    \(hero.name) has \(hero.hitPoints) HP
                    \(opponent.name) has \(opponent.hitPoints) HP
                    
                    Please choose your attack from the following menu
                    1) Normal attack
                    2) Special attack
                    3) Quit game
                    """)
                doubleAttack = 0
            } else {
                print("""
                    
                    ~~~~~ It's \(hero.name)'s turn (1 of 1)
                    \(hero.name) has \(hero.hitPoints) HP
                    \(opponent.name) has \(opponent.hitPoints) HP
                    
                    Please choose your attack from the following menu
                    1) Normal attack
                    2) Special attack
                    3) Quit game
                    """)
            }
            let choice = readLine()
            if let attackChoice = Int(choice!) {
                if attackChoice == 1 {
                    hero.attackMonster(hero: hero, monster: opponent)
                    
                    if opponent.hitPoints <= 0 {
                        print("You killed \(opponent.name)")
                        playerTurns = 0
                    }
                    playerTurns = 0
                    //heals sorceress
                } else if attackChoice == 2 {
                    hero.surpriseAttack(hero: hero, monster: opponent)
                    doubleAttack = 2
                } else {
                    print("Okay, goodbye")
                    playerTurns = 0
                    return 1
                }
            } else {
                print("Wrong input")
            }
            print("Press enter to continue...")
            let response = readLine()
        }
        return 0
    }
}
