//
//  InputParser.swift
//  adventofcode2019
//
//  Created by Rob Allie on 12/5/19.
//  Copyright © 2019 Socially Awkward Software. All rights reserved.
//

import Cocoa

class InputParser {
   
   class func autoParse(string: String) -> [Int] {
      var parsedArray: [String.SubSequence] = []
      if string.contains("\n") {
         parsedArray = string.split(separator: "\n")
      }
      
      return parsedArray.compactMap({ Int(String($0)) })
   }
   
}
