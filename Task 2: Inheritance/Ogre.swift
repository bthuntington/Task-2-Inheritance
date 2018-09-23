//
//  Ogre.swift
//  Task 2: Inheritance
//
//  Created by Brooke Huntington on 9/21/18.
//  Copyright © 2018 Brooke Huntington. All rights reserved.
//

import Foundation

class Orgre: Monster {
    //    Hit points: 200
    //    Attack speed: 2
    //    Chance to hit: 0.6 (60%)
    //    Minimum damage: 30
    //    Maximum damage: 60
    //    Chance to heal: 0.1 (10%)
    //    Minimum heal points: 30
    //    Maximum heal points: 60
    override init(chanceToHeal: Double, healMax: Int, healMin: Int, name: String, hit_points: Int, attackSpeed: Int, damageMax: Int, damageMin: Int, chanceToHit: Double) {
        let hit_Points = 200
        let attackSpeed = 2
        let chanceToHit = 0.6
        let damageMax = 30
        let damageMin = 60
        let chanceToHeal = 0.1
        let healMax = 30
        let healMin = 60
        
        super.init(chanceToHeal: chanceToHeal, healMax: healMax, healMin: healMin, name: name, hit_points: hit_points, attackSpeed: attackSpeed, damageMax: damageMax, damageMin: damageMin, chanceToHit: chanceToHit)
    }
    
}
