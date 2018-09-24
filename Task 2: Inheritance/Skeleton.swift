//
//  Skeleton.swift
//  Task 2: Inheritance
//
//  Created by Brooke Huntington on 9/21/18.
//  Copyright © 2018 Brooke Huntington. All rights reserved.
//

import Foundation

class Skeleton: Monster {
    init(name: String) {

        let hitPoints = 100
        let attackSpeed = 3
        let chanceToHit = 0.8
        let damageMin = 30
        let damageMax = 50
        let chanceToHeal = 0.3
        let healMin = 30
        let healMax = 50
        
        super.init(chanceToHeal: chanceToHeal, healMax: healMax, healMin: healMin, name: name, hitPoints: hitPoints, attackSpeed: attackSpeed, damageMax: damageMax, damageMin: damageMin, chanceToHit: chanceToHit)
    }
}

var skeleton1 = Skeleton(name: "Benny the skeleton")
var skeleton2 = Skeleton(name: "Mattias the skeleton")
var skeleton3 = Skeleton(name: "Fiona the skeleton")
