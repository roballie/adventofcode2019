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
   
   func part2MultipleNounAndVerbChanges() -> Int {
      let valueToCheck = 19690720
      
      for noun in 0...99 {
         for verb in 0...99 {
            dataCopy = data
            dataCopy[1] = noun
            dataCopy[2] = verb
            
            let resultArray = part1GravityAssit()
            if let firstResult = resultArray.first, firstResult == valueToCheck {
               return 100 * noun + verb
            }
         }
      }
      
      assertionFailure()
      return -1
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
