//
//  ContentView.swift
//  adventofcode2019
//
//  Created by Rob Allie on 12/5/19.
//  Copyright © 2019 Socially Awkward Software. All rights reserved.
//

import SwiftUI

struct ContentView: View {
   @State var inputText: String = ""
   @State var outputText: String = ""
   
   var body: some View {
      VStack {
         Text("Advent of Code 2019")
            .font(.title)
         ScrollView {
            TextField("Paste input here", text: $inputText)
         }
         
         HStack {
            Text("Day 1:")
            Button(action: {
               let inputArray = InputParser.autoParse(string: self.inputText)
               let day1 = Day1(dataArray: inputArray)
               self.outputText = "\(day1.fullFuelRequirement())"
            }) {
               Text("1")
            }
            Button(action: {
               let inputArray = InputParser.autoParse(string: self.inputText)
               let day1 = Day1(dataArray: inputArray)
               self.outputText = "\(day1.fullFuelRequirementAdjustedForFuelMass())"
            }) {
               Text("2")
            }
         }
         
         HStack {
            Text("Day 2:")
            Button(action: {
               let inputArray = InputParser.autoParse(string: self.inputText)
               let day2 = Day2(dataArray: inputArray)
               let unparsed = InputParser.unparseToCSV(intArray: day2.part1CorrectedGravityAssist())
               self.outputText = unparsed
            }) {
               Text("1")
            }
            Button(action: {
               let inputArray = InputParser.autoParse(string: self.inputText)
               let day2 = Day2(dataArray: inputArray)
               let value = day2.part2MultipleNounAndVerbChanges()
               self.outputText = "\(value)"
            }) {
               Text("2")
            }
         }
         
         HStack {
            Text("Day 3:")
            Button(action: {
               let inputsArray = InputParser.parseCSVsWithNewlines(string: self.inputText)
               let day3 = Day3(datasArray: inputsArray)
               let value = day3.part1DiscoverClosestIntersection()
               self.outputText = String(value)
            }) {
               Text("1")
            }
//            Button(action: {
//               let inputArray = InputParser.autoParse(string: self.inputText)
//               let day2 = Day2(dataArray: inputArray)
//               let value = day2.part2MultipleNounAndVerbChanges()
//               self.outputText = "\(value)"
//            }) {
//               Text("2")
//            }
         }

         
         Text("Output")
         Text(outputText)
      }
      .frame(width: 500.0)
   }
}


struct ContentView_Previews: PreviewProvider {
   static var previews: some View {
      ContentView()
   }
}
