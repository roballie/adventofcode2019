//
//  Day1.swift
//  adventofcode2019
//
//  Created by Rob Allie on 12/5/19.
//  Copyright © 2019 Socially Awkward Software. All rights reserved.
//

import Cocoa

class Day1 {
   private let data: [Int]
   
   init(dataArray: [Int]) {
      data = dataArray
   }
   
   func fullFuelRequirement() -> Int {
      let fuelArray: [Int] = data.map({ $0.fuelRequirement() })
      let fuelRequirement = fuelArray.reduce(0, +)
      return fuelRequirement
   }
}

private extension Int {
   func fuelRequirement() -> Int {
      return (self / 3) - 2
   }
}
