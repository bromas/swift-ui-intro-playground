//: [Previous](@previous)

import Foundation
import Combine
import SwiftUI_Intro_Sources

// pointSource is declared in CombinePreface_Sources

" - - - - - - - - - -  Through Time - - - - - - - - - - "
"Data Source <-> Publisher(s) -> |Data| -> Subscriber(s)"

"pointSource                                            "
"                                              .sink    "
"                   Just                                "
"                 Deferred                              "



/// A publisher that emits an output to each subscriber just once, and then finishes.
let justPublisher: Just<Point> = Just(pointSource())

let _ = justPublisher.sink { result in
    print("Just-1 emitted: \(result)")
}

let _ = justPublisher.sink { result in
    print("Just-2 emitted: \(result)")
}

print("")
print("")


/// A publisher that awaits subscription before running a supplied closure to create a publisher for the new subscriber.
let deferredPublisher = Deferred<Just<Point>> {
    return Just(pointSource())
}

let _ = deferredPublisher.sink { result in
    print("Deferred-1 emitted: \(result)")
}

let _ = deferredPublisher.sink { result in
    print("Deferred-2 emitted: \(result)")
}

//: [Next](@next)
