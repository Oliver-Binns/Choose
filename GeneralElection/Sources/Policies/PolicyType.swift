import Foundation

public enum PolicyType: String, CaseIterable {
    case constitutional = "Constitutional"
    case defence = "Defence"
    case economy = "Economy"
    case education = "Education"
    case environment = "Environment"
    case families = "Families"
    case foreignAffairs = "Foreign Affairs"
    case healthSocialCare = "Health & Social Care"
    case infrastructure = "Infrastructure"
    case rights = "Rights"
}

extension PolicyType: Codable { }

#if canImport(UIKit)
import UIKit

extension PolicyType {
    public var image: UIImage! {
        UIImage(named: rawValue, in: .module, with: nil)
    }

    public var colour: UIColor! {
        UIColor(named: rawValue, in: .module, compatibleWith: nil)
    }
}
#else
import AppKit

extension PolicyType {
    public var image: NSImage! {
        Bundle.module.image(forResource: rawValue)
    }

    public var colour: NSColor! {
        NSColor(named: rawValue, bundle: .module)
    }
}
#endif
