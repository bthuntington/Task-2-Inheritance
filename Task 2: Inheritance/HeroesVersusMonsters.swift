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
        var playAgain = 1
        while playAgain == 1 {
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
                        let warrior = Warrior(name: name)
                        var gameStillGoing = 0
                        let opponent = selectOpponent()
                        print("Your hero is battling \(opponent.name)")
                        print("Press enter to continue...")
                        _ = readLine()
                        while(gameStillGoing == 0) {
                            let heroSpeed = warrior.attackSpeed
                            let monsterSpeed = opponent.attackSpeed
                            let turn = whoGoesNext(hero: heroSpeed, monster: monsterSpeed)
                            warrior.turns_per_round = turn
                            //player gets one turn
                            if turn == 1 {
                                //variable for exiting loop when
                                // player wants to or game is over
                                var inGame = 0
                                while inGame == 0 {
                                    // player attacks
                                    inGame = warrior.attack(hero: warrior, opponent: opponent)
                                    //monster attacks
                                    if opponent.hitPoints > 0 {
                                        opponent.attackHero(monster: opponent, hero: warrior)
                                        // warrior is dead
                                        if warrior.hitPoints <= 0 {
                                            print("\(opponent.name) killed \(warrior.name)")
                                            inGame = 1
                                        }
                                        //monster is dead - exit loop
                                    } else {
                                        print("You killed \(opponent.name)")
                                        inGame = 1
                                    }
                                }
                                //monster goes first
                            } else {
                                var inGame = 0
                                while inGame == 0 {
                                    opponent.attackHero(monster: opponent, hero: warrior)
                                    if warrior.hitPoints <= 0 {
                                        print("\(opponent.name) killed \(warrior.name)")
                                        //playerTurns = 0
                                        gameStillGoing = 1
                                        inGame = 1
                                        print("Press enter to continue...")
                                        _ = readLine()
                                    } else {
                                        print("Press enter to continue...")
                                        _ = readLine()
                                        inGame = warrior.attack(hero: warrior, opponent: opponent)
                                        if opponent.hitPoints <= 0 {
                                            print("You defeated \(opponent.name)")
                                            inGame = 1
                                            gameStillGoing = 1
                                        }
                                    }
                                }
                            }
                            gameStillGoing = 1
                        }
                        print("Game is over")
                        print("Play again? y or n")
                        let yesOrNo = readLine()
                        if let answer = yesOrNo {
                            if answer == "y" {
                                print("Alright! Let's boot the game back up!")
                            } else {
                                print("Thanks for playing")
                                playAgain = 0
                            }
                        }
                        //sorceress class is choosen
                    } else if (charChoice == 2) {
                        //get user's character name
                        let name = Hero.getCharacterName()
                        let sorceress = Sorceress(name: name)
                        var gameStillGoing = 0
                        let opponent = selectOpponent()
                        print("Your hero is battling \(opponent.name)")
                        print("Press enter to continue...")
                        _ = readLine()
                        while(gameStillGoing == 0) {
                            let heroSpeed = sorceress.attackSpeed
                            let monsterSpeed = sorceress.attackSpeed
                            let turn = whoGoesNext(hero: heroSpeed, monster: monsterSpeed)
                            sorceress.turns_per_round = turn
                            //player gets one turn
                            if turn == 1 {
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
                                            gameStillGoing = 1
                                        }
                                        //monster is dead - exit loop
                                    } else {
                                        inGame = 1
                                        gameStillGoing = 1
                                    }
                                }
                                //monster goes first
                            } else {
                                var inGame = 0
                                while inGame == 0 {
                                    opponent.attackHero(monster: opponent, hero: sorceress)
                                    if sorceress.hitPoints <= 0 {
                                        print("\(opponent.name) killed \(sorceress.name)")
                                        //playerTurns = 0
                                        gameStillGoing = 1
                                        inGame = 1
                                        print("Press enter to continue...")
                                        _ = readLine()
                                    } else {
                                        print("Press enter to continue...")
                                        _ = readLine()
                                        inGame = sorceress.attack(hero: sorceress, opponent: opponent)
                                        if opponent.hitPoints <= 0 {
                                            print("You defeated \(opponent.name)")
                                            inGame = 1
                                            gameStillGoing = 1
                                        }
                                    }
                                }
                            }
                            gameStillGoing = 1
                        }
                        print("Game is over")
                        print("Play again? y or n")
                        let yesOrNo = readLine()
                        if let answer = yesOrNo {
                            if answer == "y" {
                                print("Alright! Let's boot the game back up!")
                            } else {
                                print("Thanks for playing")
                                playAgain = 0
                            }
                        }
                        //thief class is choosen
                    } else if (charChoice == 3) {
                        //get user's character name
                        let name = Hero.getCharacterName()
                        let thief = Thief(name: name)
                        var gameStillGoing = 0
                        var inGame = 0
                        let opponent = selectOpponent()
                        print("Your hero is battling \(opponent.name)")
                        print("Press enter to continue...")
                        _ = readLine()
                        while(gameStillGoing == 0) {
                            let heroSpeed = thief.attackSpeed
                            let monsterSpeed = opponent.attackSpeed
                            print("thief speed: \(heroSpeed) monster speed: \(monsterSpeed)")
                            let turn = whoGoesNext(hero: heroSpeed, monster: monsterSpeed)
                            thief.turns_per_round = turn
                            //thief gets to attack three times
                            if turn == 3 || turn == 2 || turn == 1 {
                                while inGame == 0 {
                                    inGame = thief.attack(hero: thief, opponent: opponent)
                                    //monster attacks
                                    if opponent.hitPoints > 0 {
                                        opponent.attackHero(monster: opponent, hero: thief)
                                        // warrior is dead
                                        if thief.hitPoints <= 0 {
                                            inGame = 1
                                            gameStillGoing = 1
                                        }
                                        //monster is dead - exit loop
                                    } else {
                                        inGame = 1
                                        gameStillGoing = 1
                                    }
                                }
                                //monster gets to attack first
                            } else if turn == 3 {
                                print("what is happening?")
                            } else {
                                print("Oops, that was not one of the choices")
                            }
                        }
                        print("Game is over")
                        print("Play again? y or n")
                        let yesOrNo = readLine()
                        if let answer = yesOrNo {
                            if answer == "y" {
                                print("Alright! Let's boot the game back up!")
                            } else {
                                print("Thanks for playing")
                                playAgain = 0
                            }
                        }
                        
                    } else {
                        print("Oops, that's not one of the choices.")
                    }
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
        //hero gets three attacks
        if hero >= (monster * 3) {
            return 3
            //hero gets two turns
        } else if hero >= (monster * 2) {
            return 2
            //hero get one turn
        } else if hero > monster {
            return 1
            // monster is faster and goes first
        } else {
            return 0
        }
    }
    
}
