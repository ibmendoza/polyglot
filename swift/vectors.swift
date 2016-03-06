import Foundation

struct Vector: CustomStringConvertible {

    var x: Double
    var y: Double

    init(x: Double, y: Double){
        self.x = x;
        self.y = y;
    }

    func magnititude() -> Double {
        return sqrt(x * x + y * y)
    }

    var description: String {
        return "<\(x),\(y)>"
    }
}

func + (left: Vector, right: Vector) -> Vector {
    return Vector(x: left.x + right.x, y: left.y + right.y)
}

func * (left: Vector, right: Vector) -> Double {
    return left.x * right.x + left.y * right.y
}

let u = Vector(x: 3, y: 4)
let v = Vector(x: -5, y: 10)

assert(u.x == 3)
assert(u.y == 4)
assert(u.magnititude() == 5)
assert(String(u + v) == "<-2.0,14.0>")
assert(u * v == 25)