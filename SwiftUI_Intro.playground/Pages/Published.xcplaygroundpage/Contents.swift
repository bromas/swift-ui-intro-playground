//: [Previous](@previous)

import Foundation
import Combine


class PublishingClass {
//  var publishedInt: CurrentValueSubject<Int, Never>(0)
    @Published var publishedInt: Int = 0
}

let pub = PublishingClass()
let readValue = pub.publishedInt

print("simple read: \(readValue)")

let cancellable = pub.$publishedInt.sink { nextInt in
    print("subscriber-1: \(nextInt)")
}

pub.publishedInt = 1
pub.publishedInt = 2

pub.$publishedInt.sink { completion in
    print("can it complete?")
} receiveValue: { value in
    print("subscriber-2: \(value)")
}

pub.publishedInt = 3




// Using structs... (SwiftUI View is a struct)

// Like a @Published
//struct PublishingStructSucceeds {
//    var publishedInt = CurrentValueSubject<Int, Never>(0)
//}

// Fails to compile
//struct PublishingStructFails {
//    @Published var publishedInt: Int = 0
//}



//: [Next](@next)
