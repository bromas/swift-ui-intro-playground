//: [Previous](@previous)

import Foundation
import Combine

class PublishingClass {
    @Published var publishedInt: Int = 0
    @Published var publishedString: String = "initial"
}

let pub = PublishingClass()

class MockView {
    
    var bag: Set<AnyCancellable> = Set<AnyCancellable>()
    
    var observedInt: Int?
    var observedString: String?
    
    init(observe: PublishingClass) {
        Publishers.CombineLatest(
            observe.$publishedInt,
            observe.$publishedString
        ).sink { [weak self] nextInt, nextString in
            self?.observedInt = nextInt
            self?.observedString = nextString
            self?.renderBody()
        }.store(in: &bag)
    }
    
    func renderBody() {
        print(" ")
        print("rendering")
        print("observed Int: \(observedInt ?? 99999)")
        print("observed String: \(observedString ?? "never called")")
    }
    
}

let view = MockView(observe: pub)

pub.publishedInt = 1
pub.publishedString = "configured"

//   @StateObject

//: [Next](@next)
