#if canImport(UIKit)
import UIKit
#else
import AppKit
#endif

public enum Party: String {
    case reform
    case conservatives
    case labour
    case liberalDemocrats
    case green
    case snp
    case plaidCymru
    case binface
}

extension Party: CaseIterable { }
extension Party: Codable { }
extension Party: Equatable { }

extension Party: RawRepresentable {
    public var rawValue: String {
        switch self {
        case .binface:
            return "Count Binface"
        case .reform:
            return "Reform UK"
        case .conservatives:
            return "Conservatives"
        case .labour:
            return "Labour"
        case .liberalDemocrats:
            return "Liberal Democrats"
        case .green:
            return "Green Party"
        case .plaidCymru:
            return "Plaid Cymru"
        case .snp:
            return "Scottish Nationalist Party"
        }
    }

    public init?(rawValue: String) {
        switch rawValue {
        case "Reform UK",
             "Brexit Party",
             "Brexit":
            self = .reform
        case "Conservative and Unionist Party",
             "Conservatives":
            self = .conservatives
        case "Count Binface Party",
             "Count Binface":
            self = .binface
        case "Labour Party",
             "Labour and Co-operative Party",
            "Labour":
            self = .labour
        case "Liberal Democrats":
            self = .liberalDemocrats
        case "Green Party",
             "Green":
            self = .green
        case "Scottish National Party (SNP)",
             "Scottish Nationalist Party",
             "SNP":
            self = .snp
        case "Plaid Cymru - The Party of Wales",
             "Plaid Cymru":
            self = .plaidCymru
        default:
            return nil
        }
    }
}

extension Party {
    public var name: String {
        rawValue
    }

    #if canImport(UIKit)
    public var colour: UIColor! {
        UIColor(named: name, in: .module, compatibleWith: nil)
    }

    public var logo: UIImage! {
        UIImage(named: name, in: .module, with: nil)
    }
    #else
    public var colour: NSColor! {
        NSColor(named: name, bundle: .module)
    }

    public var logo: NSImage! {
        Bundle.module.image(forResource: name)
    }
    #endif
}

extension Party: Identifiable {
    public var id: String {
        rawValue
    }
}
