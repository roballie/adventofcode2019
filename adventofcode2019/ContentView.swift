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
            }) {
               Text("1")
            }
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
