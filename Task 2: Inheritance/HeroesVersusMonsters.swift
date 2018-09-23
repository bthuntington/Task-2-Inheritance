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
            if(charChoice == 1) {
                var name = Hero.getCharacterName()
                var warrior = Warrior(name: name)
                
            } else if (charChoice == 2) {
                var name = Hero.getCharacterName()
                var sorceress = Sorceress(name: name)
            } else if (charChoice == 3) {
                var name = Hero.getCharacterName()
                var warrior = Thief(name: name)
            } else {
                print("Oops, that's not one the choices.")
            }
        }
        }
    }
}
