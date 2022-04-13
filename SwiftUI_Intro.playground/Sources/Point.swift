import Foundation

public struct Point {
    let x: Double
    let y: Double
    
    public init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    public func midpoint(to: Point) -> Point {
        Point(x: (self.x + to.x) / 2, y: (self.y + to.y) / 2)
    }
}

public func pointSource() -> Point {
    return Point(
        x: Double.random(in: -100.0...100.0),
        y: Double.random(in: -100.0...100.0)
    )
}
