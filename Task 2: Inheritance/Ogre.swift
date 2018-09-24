//
//  Ogre.swift
//  Task 2: Inheritance
//
//  Created by Brooke Huntington on 9/21/18.
//  Copyright © 2018 Brooke Huntington. All rights reserved.
//

import Foundation

class Ogre: Monster {
    //    Hit points: 200
    //    Attack speed: 2
    //    Chance to hit: 0.6 (60%)
    //    Minimum damage: 30
    //    Maximum damage: 60
    //    Chance to heal: 0.1 (10%)
    //    Minimum heal points: 30
    //    Maximum heal points: 60
    init(name: String) {
        let hitPoints = 200
        let attackSpeed = 2
        let chanceToHit = 0.6
        let damageMax = 30
        let damageMin = 60
        let chanceToHeal = 0.1
        let healMax = 30
        let healMin = 60
        
        super.init(chanceToHeal: chanceToHeal, healMax: healMax, healMin: healMin, name: name, hitPoints: hitPoints, attackSpeed: attackSpeed, damageMax: damageMax, damageMin: damageMin, chanceToHit: chanceToHit)
    }
    
}

var ogre1 = Ogre(name: "Wanda the Ogre")
var ogre2 = Ogre(name: "Rambo the Ogre")
var ogre3 = Ogre(name: "Val the Ogre")
