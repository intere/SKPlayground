import Cocoa

public extension NSColor {

    static let randomColors: [NSColor] =
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

    public static var random: NSColor {
        let index = Int.random(max: randomColors.count)
        return randomColors[index]
    }

}


extension Int {

    public static func random(max: Int) -> Int {
        return Int(arc4random_uniform(UINT32_MAX)) % max
    }

}
