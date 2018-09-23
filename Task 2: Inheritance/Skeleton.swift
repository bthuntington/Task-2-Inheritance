//
//  Skeleton.swift
//  Task 2: Inheritance
//
//  Created by Brooke Huntington on 9/21/18.
//  Copyright © 2018 Brooke Huntington. All rights reserved.
//

import Foundation

class Skeleton: Monster {
    override init(chanceToHeal: Double, healMax: Int, healMin: Int, name: String, hit_points: Int, attackSpeed: Int, damageMax: Int, damageMin: Int, chanceToHit: Double) {

        let hit_Points = 100
        let attackSpeed = 3
        let chanceToHit = 0.8
        let damageMin = 30
        let damageMax = 50
        let chanceToHeal = 0.3
        let healMin = 30
        let healMax = 50
        
        super.init(chanceToHeal: chanceToHeal, healMax: healMax, healMin: healMin, name: name, hit_points: hit_points, attackSpeed: attackSpeed, damageMax: damageMax, damageMin: damageMin, chanceToHit: chanceToHit)
    }
}
