//
//  Thief.swift
//  Task 2: Inheritance
//  Programming Assignment 3- Task 2: Inheritance
//  Created by Brooke Huntington on 9/21/18.
//  Copyright © 2018 Brooke Huntington. All rights reserved.
//  CPSC 315-01, Fall 2018
//  This is a subclass of the Hero class.
//  It contains the initial stats for every Thief,
//  a special sneak attack, and thief attack function

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
    
    func surpriseAttack(hero: Thief, monster: Monster) -> Int {
        var attackChance:Double = Double(arc4random_uniform(UInt32(100))) + 1
        attackChance = attackChance / 100
        
        var thiefCaught:Double = Double(arc4random_uniform(UInt32(100))) + 1
        thiefCaught = thiefCaught / 100
        
        let difference = hero.damageMax - hero.damageMin
        let hitDamage = Int(arc4random_uniform(UInt32(difference))) + hero.damageMin
        if thiefCaught <= 0.20 {
           print("Oh no, your thief was caught trying to sneak attack.")
            print("You can't attack this turn.")
            return 0
        } else if(attackChance <= 0.4) {
            print("You were super sneaky and attacked managed to attack from behind!")
            print("Your attack did \(hitDamage) damage and you get another turn!")
            //add damage to enemy
            monster.hitPoints -= hitDamage
            return 1
        } else {
            print("You weren't sneaky enough to surprise the monster, but you still got an attack in.")
            print("Your attack did \(hitDamage) hit points")
            monster.hitPoints -= hitDamage
            return 0
        }
    }
    
    func attack (hero: Thief, opponent: Monster) -> Int {
        var turnsLeft = 1
        var playerTurns = 1
        var turns = hero.turns_per_round
        while playerTurns == 1 {
                print("""
                    
                    ~~~~~ It's \(hero.name)'s turn (\(turnsLeft) of \(turns)) ~~~~~
                    \(hero.name) has \(hero.hitPoints) HP
                    \(opponent.name) has \(opponent.hitPoints) HP
                    
                    Please choose your attack from the following menu
                    1) Normal attack
                    2) Special attack
                    3) Quit game
                    """)
                    turnsLeft += 1
            
            let choice = readLine()
            if let attackChoice = Int(choice!) {
                if attackChoice == 1 {
                    hero.attackMonster(hero: hero, monster: opponent)
                    
                    if opponent.hitPoints <= 0 {
                        print("You killed \(opponent.name)")
                        playerTurns = 0
                    }
                    if turnsLeft > turns {
                        playerTurns = 0
                    }
                    //sneak attack, gives extra turn if successful
                } else if attackChoice == 2 {
                    let result = hero.surpriseAttack(hero: hero, monster: opponent)
                    if result == 1 {
                        turns += 1
                    }
                    if opponent.hitPoints <= 0 {
                        print("You killed \(opponent.name)")
                        playerTurns = 0
                    }
                    if turnsLeft > turns {
                        playerTurns = 0
                    }
                } else {
                    print("Okay, goodbye")
                    playerTurns = 0
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
