//
//  HeroesVersusMonsters.swift
//  Task 2: Inheritance
//
//  Created by Brooke Huntington on 9/21/18.
//  Copyright © 2018 Brooke Huntington. All rights reserved.
//

import Foundation

class HeroesVersusMonsters {
    
    static func playGame () {
        print("Welcome to Heroes vs. Monsters")
        print("""
        Please choose your hero from one the following options
            1) Warrior
            2) Sorceress
            3) Thief
        """)
        var charChoice = 0
        while( charChoice != 1 && charChoice != 2 && charChoice != 3) {
        let response = readLine()
        if let choice = response {
            charChoice = Int(choice)!
            //warrior class is choosen
            if(charChoice == 1) {
                //get user's character name
                let name = Hero.getCharacterName()
                var warrior = Warrior(name: name)
                var gameStillGoing = 0
                let opponent = selectOpponent()
                print("Your hero is battling \(opponent.name)")
                print("Press enter to continue...")
                let response = readLine()
                while(gameStillGoing == 0) {
                    let heroSpeed = warrior.attackSpeed
                    let monsterSpeed = opponent.attackSpeed
                    var turn = whoGoesNext(hero: heroSpeed, monster: monsterSpeed)
                    // player gets two turns
                    if turn == 1 {
                        var playerTurns = 2
                        while playerTurns != 0 {
                            
                            print("""
                                
                             ~~~~~ It's \(warrior.name)'s turn (turn 1 of 2)
                            
                                Please choose your attack from the following menu
                                    1) Normal attack
                                    2) Special attack
                                    3) Quit game
                            """)
                            
                            warrior.attackMonster(hero: warrior, monster: opponent)
                            if opponent.hitPoints <= 0 {
                                print("You killed \(opponent.name)")
                                playerTurns = 0
                            }
                            playerTurns -= 1
                            
                            print("Press enter to continue...")
                            let response = readLine()
                        }
                        
                        print("Press enter to continue...")
                        let response = readLine()
                    // players gets one turn
                    } else if turn == 2 {
                        var playerTurns = 1
                        print("""
                            
                        ~~~~~ It's \(warrior.name)'s turn (1 of 1)
                            
                            Please choose your attack from the following menu
                            1) Normal attack
                            2) Special attack
                            3) Quit game
                        """)
                        let choice = readLine()
                        if let attackChoice = Int(choice!) {
                            if attackChoice == 1 {
                                warrior.attackMonster(hero: warrior, monster: opponent)
                            
                            if opponent.hitPoints <= 0 {
                                print("You killed \(opponent.name)")
                                playerTurns = 0
                            }
                            playerTurns -= 1
                            } else {
                                warrior.crushingBlow(warrior: warrior, monster: opponent)
                                playerTurns -= 1
                            }
                        } else {
                            print("Wrong input")
                        }
                        print("Press enter to continue...")
                        let response = readLine()
                    //monster goes first
                    } else {
                        var playerTurns = 0
                        print("""
                            
                        ~~~~~ It's \(opponent.name)'s turn
                        """)
                        
                        opponent.attackHero(monster: opponent, hero: warrior)
                        
                        if opponent.hitPoints <= 0 {
                            print("Monster killed \(warrior.name)")
                            playerTurns = 0
                        }
                        print("Press enter to continue...")
                        let response = readLine()
                    }
                    gameStillGoing = 1
                }
            //sorceress class is choosen
            } else if (charChoice == 2) {
                //get user's character name
                let name = Hero.getCharacterName()
                var sorceress = Sorceress(name: name)
                let opponent = selectOpponent()
                print("Your hero is battling \(opponent.name)")
                
            //thief class is choosen
            } else if (charChoice == 3) {
                //get user's character name
                let name = Hero.getCharacterName()
                var thief = Thief(name: name)
                let opponent = selectOpponent()
                print("Your hero is battling \(opponent.name)")
            } else {
                print("Oops, that's not one the choices.")
            }
        }
        }
    }
    
    static func selectOpponent() -> Monster {
        let randomMonster = Int(arc4random_uniform(UInt32(2))) + 1
        let opponent = monsterArray[randomMonster]
        return opponent
    }
    
    static func whoGoesNext(hero: Int, monster: Int) -> Int {
        //hero gets two turns
        if hero > monster * 2 {
            return 1
        //hero get one turn
        } else if hero > monster {
            return 2
        //
        } else {
            return 3
        }
    }

}
