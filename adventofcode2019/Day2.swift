//
//  Day2.swift
//  adventofcode2019
//
//  Created by Rob Allie on 12/8/19.
//  Copyright © 2019 Socially Awkward Software. All rights reserved.
//

import Cocoa

class Day2: DayParent {
   
   private var dataCopy: [Int]
   
   override init(dataArray: [Int]) {
      dataCopy = dataArray
      super.init(dataArray: dataArray)
   }
   
   func part1CorrectedGravityAssist() -> [Int] {
      dataCopy[1] = 12
      dataCopy[2] = 2
      return part1GravityAssit()
   }
   
   func part1GravityAssit() -> [Int] {
      var nextInput = 0
      var storeInstruction = true
      
      while storeInstruction {
         let instruction = dataCopy[nextInput]
         
         var instructionResult = 0
         switch instruction {
         case 1:
            instructionResult = dataCopy[dataCopy[nextInput + 1]] + dataCopy[dataCopy[nextInput + 2]]
         case 2:
            instructionResult = dataCopy[dataCopy[nextInput + 1]] * dataCopy[dataCopy[nextInput + 2]]
         case 99:
            storeInstruction = false
            break
         default:
            assertionFailure()
            break
         }
         
         if storeInstruction {
            dataCopy[dataCopy[nextInput + 3]] = instructionResult
            nextInput += 4
         }
      }
      
      return dataCopy
   }
}
