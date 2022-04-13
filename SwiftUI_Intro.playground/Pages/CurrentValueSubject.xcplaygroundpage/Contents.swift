//: [Previous](@previous)

import Foundation
import Combine

let intSequence: [Int] = [0, 1, 2, 3, 4]

" - - - - - - - - - -  Through Time - - - - - - - - - - "
"Data Source <-> Publisher(s) -> |Data| -> Subscriber(s)"

"internal cache                                        "
"                                              .sink    "
"              updates to value                         "


/// A subject that wraps a single value and publishes a new element whenever the value changes.
let currentValue = CurrentValueSubject<Int, Never>(0)

let readValue = currentValue.value
print("from read: \(readValue)")

print(" ")
print("sink_1 subscribes")
let cancellableValue = currentValue.sink { result in
    print("from sink_1: \(result)")
}

print(" ")
currentValue.value = 1

print(" ")
currentValue.value = 2

print(" ")
print("sink_2 subscribes")
let cancellableValue2 = currentValue.sink { result in
    print("from sink_2: \(result)")
}

print(" ")
currentValue.value = 3

//: [Next](@next)
