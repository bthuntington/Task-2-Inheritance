//
//  Gremlin.swift
//  Task 2: Inheritance
//
//  Created by Brooke Huntington on 9/21/18.
//  Copyright © 2018 Brooke Huntington. All rights reserved.
//

import Foundation

class Gremlin: Monster {
    override init(chanceToHeal: Double, healMax: Int, healMin: Int, name: String, hit_points: Int, attackSpeed: Int, damageMax: Int, damageMin: Int, chanceToHit: Double) {
        let hit_Points = 70
        let attackSpeed = 5
        let chanceToHit = 0.8
        let damageMin = 15
        let damageMax = 30
        let chanceToHeal = 0.4
        let healMin = 20
        let healMax = 40
        
        super.init(chanceToHeal: chanceToHeal, healMax: healMax, healMin: healMin, name: name, hit_points: hit_points, attackSpeed: attackSpeed, damageMax: damageMax, damageMin: damageMin, chanceToHit: chanceToHit)
    }
    
    override func attack() -> Int {
        //change code to fit gremlin
        return 0
    }

}
