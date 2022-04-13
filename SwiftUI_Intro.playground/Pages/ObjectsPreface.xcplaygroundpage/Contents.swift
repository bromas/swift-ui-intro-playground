//: [Previous](@previous)

import Foundation

// "From 0 to Combine + SwiftUI"

// From Imperative to Objective
// Finding a midpoint

// Without objects
let fromPoint_x: Double = -43.953426
let fromPoint_y: Double = 91.21028

let toPoint_x: Double = -43.92023
let toPoint_y: Double = 91.34528

func average(val1: Double, val2: Double) -> Double {
    return (val1 + val2) / 2
}

let point_averaged_x = average(val1: fromPoint_x, val2: toPoint_x)
let point_averaged_y = average(val1: fromPoint_y, val2: toPoint_y)
print("variables: \(point_averaged_x), \(point_averaged_y)")



// With Objects
struct Point {
    let x: Double
    let y: Double
    
    func midpoint(to: Point) -> Point {
        Point(x: (self.x + to.x) / 2, y: (self.y + to.y) / 2)
    }
}

let fromPoint = Point(x: -43.953426, y: 91.21028)
let toPoint =  Point(x: -43.92023, y: 91.34528)
let midpoint = fromPoint.midpoint(to: toPoint)
print("point: \(midpoint)")

// We take some of the reasoning and relationships out of our heads and put it in the code.
// Improves readability and maintainability.

//: [Next](@next)
