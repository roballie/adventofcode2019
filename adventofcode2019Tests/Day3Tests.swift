//
//  Day3Tests.swift
//  adventofcode2019Tests
//
//  Created by Rob Allie on 12/8/19.
//  Copyright © 2019 Socially Awkward Software. All rights reserved.
//

import XCTest
@testable import adventofcode2019

class Day3Tests: XCTestCase {

   func test1_1() {
      let input = "R75,D30,R83,U83,L12,D49,R71,U7,L72\nU62,R66,U55,R34,D71,R55,D58,R83"
      let parsed = InputParser.parseCSVsWithNewlines(string: input)
      
      let day3 = Day3(datasArray: parsed)
      let result = day3.part1DiscoverClosestIntersection()
      
      let expected = 159
      
      XCTAssertEqual(result, expected)
   }

}
