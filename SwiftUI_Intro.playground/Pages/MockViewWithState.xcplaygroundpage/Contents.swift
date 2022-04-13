//: [Previous](@previous)

import Foundation
import Combine

class MockView {
    
    @Published var localState: Int = 1
    private var stateSubscription: AnyCancellable?
        
    init() {
        stateSubscription = self.$localState.sink(receiveValue: { value in
            self.renderBody(newState: value)
        })
    }
    
    func renderBody(newState: Int) {
        print(" ")
        print("rendering")
        print("Int: \(newState)")
    }
    
}

let view = MockView()

view.localState = 10

//  @State

//: [Next](@next)
