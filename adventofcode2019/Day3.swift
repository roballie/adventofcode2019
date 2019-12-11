//
//  Day3.swift
//  adventofcode2019
//
//  Created by Rob Allie on 12/8/19.
//  Copyright © 2019 Socially Awkward Software. All rights reserved.
//

import Cocoa

class Day3 {
   let datasArray: [[String]]
   
   init(datasArray: [[String]]) {
      self.datasArray = datasArray
   }
   
   func part1DiscoverClosestIntersection() -> Int {
      guard datasArray.count == 2 else { return 0 }
      let instructions1 = datasArray[0]
      let instructions2 = datasArray[1]
      let results1 = pointsArray(instructions: instructions1)
      let results2 = pointsArray(instructions: instructions2)
      let intersectionArray = intersections(pointsArray1: results1, pointsArray2: results2)
      
      var minVal = Int.max
      for intersection in intersectionArray {
         guard intersection.x != 0 && intersection.y != 0 else { continue }
         let val = abs(intersection.x) + abs(intersection.y)
         let intVal = Int(val)
         minVal = min(minVal, intVal)
      }
      
      return minVal
   }
   
   func part2InetersectionInLeastSteps() -> Int {
      guard datasArray.count == 2 else { return 0 }
      let instructions1 = datasArray[0]
      let instructions2 = datasArray[1]
      let results1 = pointsArray(instructions: instructions1)
      let results2 = pointsArray(instructions: instructions2)
      let intersectionArray = intersections(pointsArray1: results1, pointsArray2: results2)
      
      var minMoves = Int.max
      for intersection in intersectionArray {
         let movements1 = movementsToGetToIntersection(pointsArray: results1, intersection: intersection)
         let movements2 = movementsToGetToIntersection(pointsArray: results2, intersection: intersection)
         let totalMovements = movements1 + movements2
         minMoves = min(minMoves, totalMovements)
      }
      
      return minMoves
   }
   
   private func pointsArray(instructions: [String]) -> [CGPoint] {
      var visitedPoints: [CGPoint] = [.zero]
      var lastPoint = CGPoint.zero
      
      //convert instructions to points
      for instruction in instructions {
         var instrCopy = instruction
         let direction = String(instrCopy.removeFirst())
         guard let intAmount = Int(instrCopy) else { return [] }
         let amount = CGFloat(intAmount)
         
         var newPoint: CGPoint
         switch direction {
         case "D":
            newPoint = CGPoint(x: lastPoint.x, y: lastPoint.y - amount)
         case "U":
            newPoint = CGPoint(x: lastPoint.x, y: lastPoint.y + amount)
         case "L":
            newPoint = CGPoint(x: lastPoint.x - amount, y: lastPoint.y)
         case "R":
            newPoint = CGPoint(x: lastPoint.x + amount, y: lastPoint.y)
         default:
            newPoint = .zero
            assertionFailure()
         }
         
         visitedPoints += [newPoint]
         lastPoint = newPoint
      }
      
      return visitedPoints
   }
   
   private func intersections(pointsArray1: [CGPoint], pointsArray2: [CGPoint]) -> [CGPoint] {
      var intersections: [CGPoint] = []
      for outerIndex in 1..<pointsArray1.count {
         for innerIndex in 1..<pointsArray2.count {
            let pt1 = pointsArray1[outerIndex - 1]
            let pt2 = pointsArray1[outerIndex]
            let pt3 = pointsArray2[innerIndex - 1]
            let pt4 = pointsArray2[innerIndex]
            
            if let intersection = getIntersectionOfLines(line1: (pt1, pt2), line2: (pt3, pt4)) {
               intersections += [intersection]
            }
         }
      }
      return intersections
   }
   
   private func getIntersectionOfLines(line1: (a: CGPoint, b: CGPoint), line2: (a: CGPoint, b: CGPoint)) -> CGPoint? {
      let distance = (line1.b.x - line1.a.x) * (line2.b.y - line2.a.y) - (line1.b.y - line1.a.y) * (line2.b.x - line2.a.x)
      guard distance != 0 else { return nil }
      
      let u = ((line2.a.x - line1.a.x) * (line2.b.y - line2.a.y) - (line2.a.y - line1.a.y) * (line2.b.x - line2.a.x)) / distance
      let v = ((line2.a.x - line1.a.x) * (line1.b.y - line1.a.y) - (line2.a.y - line1.a.y) * (line1.b.x - line1.a.x)) / distance
      
      if (u < 0.0 || u > 1.0) {
         print("error, intersection not inside line1")
         return nil
      }
      if (v < 0.0 || v > 1.0) {
         print("error, intersection not inside line2")
         return nil
      }
      
      return CGPoint(x: line1.a.x + u * (line1.b.x - line1.a.x), y: line1.a.y + u * (line1.b.y - line1.a.y))
   }
   
   private func movementsToGetToIntersection(pointsArray: [CGPoint], intersection: CGPoint) -> Int {
      guard intersection.x != 0 && intersection.y != 0 else { return Int.max/2 }
      var movements: CGFloat = 0
      for index in 1..<pointsArray.count {
         let pt1 = pointsArray[index - 1]
         let pt2 = pointsArray[index]
         
         let path = NSBezierPath()
         path.move(to: pt1)
         path.line(to: pt2)
         
         if path.contains(intersection) {
            let extraMove = abs(intersection.x - pt1.x) + abs(intersection.y - pt1.y)
            return Int(movements + extraMove)
         }
         
         let movement = abs(pt2.x - pt1.x) + abs(pt2.y - pt1.y)//works because they dont move diagnally
         movements += movement
      }
      assertionFailure()
      return 0
   }
}
