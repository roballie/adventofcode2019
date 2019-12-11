//
//  Day4Tests.swift
//  adventofcode2019Tests
//
//  Created by Rob Allie on 12/10/19.
//  Copyright © 2019 Socially Awkward Software. All rights reserved.
//

import XCTest
@testable import adventofcode2019

class Day4Tests: XCTestCase {

   func test1_1() {
      let input1 = 111111
      let input2 = 223450
      let input3 = 123789
      
      let day4 = Day4(lowerRange: 0, upperRange: 0)
      
      XCTAssertTrue(day4.doesAdhereToDay4_1Rule(input: input1))
      XCTAssertFalse(day4.doesAdhereToDay4_1Rule(input: input2))
      XCTAssertFalse(day4.doesAdhereToDay4_1Rule(input: input3))
   }
   
   func test2_1() {
      let input1 = 112233 //true
      let input2 = 123444 //false
      let input3 = 111122 //true
      
      let day4 = Day4(lowerRange: 0, upperRange: 0)
      
      XCTAssertTrue(day4.doesAdhereToDay4_2Rule(input: input1))
      XCTAssertFalse(day4.doesAdhereToDay4_2Rule(input: input2))
      XCTAssertTrue(day4.doesAdhereToDay4_2Rule(input: input3))
   }

}
