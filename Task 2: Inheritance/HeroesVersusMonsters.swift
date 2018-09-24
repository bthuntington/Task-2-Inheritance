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
                    //player gets one turn
                    if turn == 2 {
                        //variable for exiting loop when
                        // player wants to or game is over
                        var inGame = 0
                        while inGame == 0 {
                            //var playerTurns = 1
                            inGame = warrior.attack(hero: warrior, opponent: opponent)
                            //monster attacks
                            if opponent.hitPoints > 0 {
                                opponent.attackHero(monster: opponent, hero: warrior)
                                // warrior is dead
                                if warrior.hitPoints <= 0 {
                                    inGame = 1
                                }
                            //monster is dead - exit loop
                            } else {
                                inGame = 1
                            }
                        }
                        print("Game is over")
                    //monster goes first
                    } else {
                        var playerTurns = 0
                        print("""
                            
                        ~~~~~ It's \(opponent.name)'s turn
                        """)
                        opponent.attackHero(monster: opponent, hero: warrior)
                        if warrior.hitPoints <= 0 {
                            print("Monster killed \(warrior.name)")
                            playerTurns = 0
                        }
                        print("Press enter to continue...")
                        let response = readLine()
                    }
                }
                gameStillGoing = 1
            //sorceress class is choosen
            } else if (charChoice == 2) {
                //get user's character name
                let name = Hero.getCharacterName()
                var sorceress = Sorceress(name: name)
                 var gameStillGoing = 0
                let opponent = selectOpponent()
                print("Your hero is battling \(opponent.name)")
                print("Press enter to continue...")
                let response = readLine()
                while(gameStillGoing == 0) {
                    let heroSpeed = sorceress.attackSpeed
                    let monsterSpeed = sorceress.attackSpeed
                    var turn = whoGoesNext(hero: heroSpeed, monster: monsterSpeed)
                    //player gets one turn
                    if turn == 2 {
                        //variable for exiting loop when
                        // player wants to or game is over
                        var inGame = 0
                        while inGame == 0 {
                            //var playerTurns = 1
                            inGame = sorceress.attack(hero: sorceress, opponent: opponent)
                            //monster attacks
                            if opponent.hitPoints > 0 {
                                opponent.attackHero(monster: opponent, hero: sorceress)
                                // warrior is dead
                                if sorceress.hitPoints <= 0 {
                                    inGame = 1
                                }
                                //monster is dead - exit loop
                            } else {
                                inGame = 1
                                gameStillGoing = 1
                            }
                        }
                        print("Game is over")
                        //monster goes first
                    } else {
                        var inGame = 0
                        while inGame == 0 {
                            var playerTurns = 0
                            print("""
                                
                                ~~~~~ It's \(opponent.name)'s turn
                                """)
                            opponent.attackHero(monster: opponent, hero: sorceress)
                            if sorceress.hitPoints <= 0 {
                                print("Monster killed \(sorceress.name)")
                                //playerTurns = 0
                                gameStillGoing = 1
                            } else {
                            print("Press enter to continue...")
                            let response = readLine()
                            sorceress.attack(hero: sorceress, opponent: opponent)
                                if opponent.hitPoints <= 0 {
                                    "You defeated \(opponent.name)"
                                }
                            }
                        }
                    }
                    gameStillGoing = 1
                }
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
        let randomMonster = Int(arc4random_uniform(UInt32(3)))
        print(randomMonster)
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
