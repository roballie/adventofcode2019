//
//  Day4.swift
//  adventofcode2019
//
//  Created by Rob Allie on 12/10/19.
//  Copyright © 2019 Socially Awkward Software. All rights reserved.
//

import Cocoa

class Day4 {
   private var lowerRange: Int
   private var upperRange: Int
   
   init(lowerRange: Int, upperRange: Int) {
      self.lowerRange = lowerRange
      self.upperRange = upperRange
   }
   
   func amountInRangeForPart1() -> Int {
      
      var goodValues = 0
      for value in lowerRange...upperRange {
         if doesAdhereToDay4_1Rule(input: value) {
            goodValues += 1
         }
      }
      return goodValues
   }
   
   func doesAdhereToDay4_1Rule(input: Int) -> Bool {
      let stringNumber = String(input)
      
      var rule1Met = false
      var lastChar: String.Element = "x"
      for char in stringNumber {
         if lastChar == char {
            rule1Met = true
         }
         lastChar = char
      }
      guard rule1Met else { return false }
      
      var rule2Met = true
      var lastNum = 0
      for char in stringNumber {
         guard let intVal = Int(String(char)) else { continue }
         if intVal < lastNum {
            rule2Met = false
         }
         lastNum = intVal
      }
      guard rule2Met else { return false }
      
      return true
   }
   
   func doesAdhereToDay4_2Rule(input: Int) -> Bool {
      return false
   }
   
}
