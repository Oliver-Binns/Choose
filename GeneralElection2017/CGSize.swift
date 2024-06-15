import CoreGraphics

extension CGSize {
    var distance: Double {
        sqrt(pow(width, 2) + pow(height, 2))
    }
}
