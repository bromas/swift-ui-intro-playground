//: [Previous](@previous)

import Foundation
//import UIKit
import SwiftUI

// @State = @Published that renders 'body'
// @StateObject = An Object with @Published that renders 'body'

class SwiftUIObservable: ObservableObject {
    @Published var publishedInt: Int = 0
    @Published var publishedString: String = "initial"
}

struct SwiftView: View {
    
    @StateObject var observing: SwiftUIObservable = SwiftUIObservable()          // Strong
    // @ObservedObject var observing: SwiftUIObservable                          // Weak
    
    @State var localState: Int = 0                                               // Strong
    //@Binding var localState: Int = 0                                          // Weak
    
    var body: some View {
        VStack {
            Text("Hello World!")
            Text("localState: \(localState)")
            Text("observed Int: \(observing.publishedInt)")
            Text("observed String: \(observing.publishedString)")
        }
    }
    
}

//: [Next](@next)
