import Policies

public struct Statistics<Category: Hashable> {
    public let agree: [Category: Int]
    public let disagree: [Category: Int]

    public var alignment: Double {
        let agreeCount = Double(agree.values.reduce(0, +))
        let disagreeCount = Double(disagree.values.reduce(0, +))
        
        return agreeCount / (agreeCount + disagreeCount)
    }

    public init(agree: [Category: Int],
                disagree: [Category: Int]) {
        self.agree = agree
        self.disagree = disagree
    }
}
