
import Cocoa

public extension NSColor {
    static let randomColorList: [NSColor] = [
        .black,
        .white,
        .red,
        .limeColor,
        .blue,
        .yellow,
        .cyan,
        .silverColor,
        .gray,
        .maroonColor,
        .oliveColor,
        .brown,
        .green,
        .lightGray,
        .magenta,
        .orange,
        .purple,
        .tealColor
    ]

    public static var random: NSColor {
        let maxValue = randomColorList.count
        let rand = Int(arc4random_uniform(UInt32(maxValue)))
        return randomColorList[rand]
    }

    public static var limeColor: NSColor {
        return NSColor(red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
    }

    public static var silverColor: NSColor {
        return NSColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1.0)
    }

    public static var maroonColor: NSColor {
        return NSColor(red: 0.5, green: 0.0, blue: 0.0, alpha: 1.0)
    }

    public static var oliveColor: NSColor {
        return NSColor(red: 0.5, green: 0.5, blue: 0.0, alpha: 1.0)
    }

    public static var tealColor: NSColor {
        return NSColor(red: 0.0, green: 0.5, blue: 0.5, alpha: 1.0)
    }
    
    public static var navyColor: NSColor {
        return NSColor(red: 0.0, green: 0.0, blue: 128, alpha: 1.0)
    }
}
