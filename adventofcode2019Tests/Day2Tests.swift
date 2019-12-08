//
//  Day2Tests.swift
//  adventofcode2019Tests
//
//  Created by Rob Allie on 12/8/19.
//  Copyright © 2019 Socially Awkward Software. All rights reserved.
//

import XCTest
@testable import adventofcode2019

class Day2Tests: XCTestCase {
   
   func test1_1() {
      let input = "1,0,0,0,99"
      let inputArray = InputParser.autoParse(string: input)
      let day2 = Day2(dataArray: inputArray)
      
      let expected = "2,0,0,0,99"
      
      let result = day2.part1GravityAssit()
      let resultString = InputParser.unparseToCSV(intArray: result)
      
      XCTAssertEqual(resultString, expected)
   }
   
}
