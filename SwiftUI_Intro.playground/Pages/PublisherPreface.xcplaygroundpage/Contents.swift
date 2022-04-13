//: [Previous](@previous)

import Foundation
import SwiftUI_Intro_Sources

// From Imperative to Functional using Combine
// pointSource is declared in CombinePreface_Sources

" - - - - - - - - - -  Through Time - - - - - - - - - - "
"Data Source <-> Publisher(s) -> |Data| -> Subscriber(s)"

"pointSource                                            "
"                                             function  "
"                    me                                 "

"                                  vv                   "
"                         putting the variable in       "


func subscriberSink(source: String, value: Point) {
    print("\(source)... \(value)")
}

let constantPoint: Point = pointSource()
subscriberSink(source: "Constant-1", value: constantPoint)

subscriberSink(source: "Constant-2", value: constantPoint)


var variedPoint: Point = pointSource()
subscriberSink(source: "Varied-1", value: variedPoint)

variedPoint = pointSource()
subscriberSink(source: "Varied-2", value: variedPoint)

variedPoint = pointSource()
// I don't need to pass this one on so I 'cancel' the process

//: [Next](@next)
