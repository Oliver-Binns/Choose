public enum Opinion: String {
    case agree
    case disagree
    case ignore
}

extension Opinion: Codable { }
