//
//  Sorceress.swift
//  Task 2: Inheritance
//
//  Created by Brooke Huntington on 9/21/18.
//  Copyright © 2018 Brooke Huntington. All rights reserved.
//

import Foundation

class Sorceress: Hero {
    init(name: String, hit_points: Int, attackSpeed: Int, damageRangeMax: Int, damageRangeMin: Int, chanceToHit: Double, damagblock: Double, block: Double, turns_per_round: Int) {
    super.init(name: name, hit_points: hit_points, attackSpeed: attackSpeed, damageRangeMax: damageRangeMax, damageRangeMin: damageRangeMin, chanceToHit: chanceToHit, block: block, turns_per_round: turns_per_round)
    }
    //sorceress special attack
    func heal () {
        var pointsHealed = Int(arc4random_uniform(UInt32(15))) + 5
        print("Your spell healed \(pointsHealed) hit points")
        //add pointsHealed to hero hp
    }
}
