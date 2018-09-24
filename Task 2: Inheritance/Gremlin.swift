//
//  Gremlin.swift
//  Task 2: Inheritance
//
//  Created by Brooke Huntington on 9/21/18.
//  Copyright © 2018 Brooke Huntington. All rights reserved.
//

import Foundation

class Gremlin: Monster {
    init(name: String) {
        let hitPoints = 70
        let attackSpeed = 5
        let chanceToHit = 0.8
        let damageMin = 15
        let damageMax = 30
        let chanceToHeal = 0.4
        let healMin = 20
        let healMax = 40
        
        super.init(chanceToHeal: chanceToHeal, healMax: healMax, healMin: healMin, name: name, hitPoints: hitPoints, attackSpeed: attackSpeed, damageMax: damageMax, damageMin: damageMin, chanceToHit: chanceToHit)
    }
    
    func attack() -> Int {
        //change code to fit gremlin
        return 0
    }

}

var gremlin1 = Gremlin(name: "Lief the Gremlin")
var gremlin2 = Gremlin(name: "Jamie the Gremlin")
var gremlin3 = Gremlin(name: "Indigo the Gremlin")

