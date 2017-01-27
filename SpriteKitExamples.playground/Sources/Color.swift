import UIKit

public extension UIColor {

    static let randomColors: [UIColor] =
        [
            .white,
            .gray,
            .blue,
            .purple,
            .green,
            .orange,
            .red,
            .clear,
            .cyan,
            .brown
        ]

    public static var random: UIColor {
        let index = Int.random(max: randomColors.count)
        return randomColors[index]
    }

}


extension Int {

    public static func random(max: Int) -> Int {
        return Int(arc4random_uniform(UINT32_MAX)) % max
    }

}
