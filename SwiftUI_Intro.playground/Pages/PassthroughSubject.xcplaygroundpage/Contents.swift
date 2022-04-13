//: [Previous](@previous)

import Foundation
import Combine

let intSequence: [Int] = [0, 1, 2, 3, 4]

" - - - - - - - - - -  Through Time - - - - - - - - - - "
"Data Source <-> Publisher(s) -> |Data| -> Subscriber(s)"

"int sequence                                           "
"                                              .sink    "
"              .send function                           "


/// A subject that broadcasts elements to downstream subscribers.
let passThrough = PassthroughSubject<Int, Never>()

passThrough.send(0)

let sink_1 = passThrough.sink { value in
    print("sink_1 value: \(value)")
}

let sink_2 = passThrough.sink { value in
    print("sink_2 value: \(value)")
}

print("sent 0 then attached 2 sinks")
print("")

passThrough.send(1)
print("")
passThrough.send(2)

print("")
sink_1.cancel()
passThrough.send(3)

print("")
passThrough.send(completion: .finished)
passThrough.send(4)

print("4 is never passed on")





print("")
print("-------------------")
print("PassThrough delaying a collection of events")
print("")
print("")


let passMotor = PassthroughSubject<Int, Never>()
let passObserver = CurrentValueSubject<Int, Never>(0)

let motorListener = passMotor
    .delay(
        for: 1.5,
           tolerance: .none,
           scheduler: DispatchQueue.main,
           options: .none
    ).sink { newValue in
        if newValue < 8 {
            passMotor.send(newValue + 1)
            passObserver.value = newValue
        }
    }

let passiveListener1 = passObserver.sink { newValue in
    print("passive-1 heard: \(newValue)")
}

let passiveListener2 = passObserver.sink { newValue in
    print("passive-2 heard: \(newValue)")
}

passMotor.send(1)

//: [Next](@next)
