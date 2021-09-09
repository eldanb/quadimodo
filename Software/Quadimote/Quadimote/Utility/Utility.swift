
extension Comparable {
    public func clamped(_ f: Self, _ t: Self)  ->  Self {
        var r = self
        if r < f { r = f }
        if r > t { r = t }
        // (use SIMPLE, EXPLICIT code here to make it utterly clear
        // whether we are inclusive, what form of equality, etc etc)
        return r
    }
}

extension Double {
    public func quantized(_ q: Double) -> Double {
        return (self / q).rounded() * q
    }
}
