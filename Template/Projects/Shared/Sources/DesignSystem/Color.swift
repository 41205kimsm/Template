/**
 @module: Color
 @author: kimsm
 @since: 12/23/25
 @desc
 @remark
 */
import UIKit

extension UIColor {
    public static func rgb(_ r: Int, _ g: Int, _ b: Int, alpha: CGFloat = 1.0) -> UIColor {
        UIColor(
            red: CGFloat(r) / 255.0,
            green: CGFloat(g) / 255.0,
            blue: CGFloat(b) / 255.0,
            alpha: alpha
        )
    }
    
    public static func hex(_ hex: Int, alpha: CGFloat = 1.0) -> UIColor {
        UIColor(
            red: CGFloat((hex >> 16) & 0xFF) / 255.0,
            green: CGFloat((hex >> 8) & 0xFF) / 255.0,
            blue: CGFloat(hex & 0xFF) / 255.0,
            alpha: alpha
        )
    }
}

public enum AppColor {

    public static let hex6E63E9 = UIColor.hex(0x6E63E9)
    public static let hex2A3447 = UIColor.hex(0x2A3447)
    public static let hex6B717D = UIColor.hex(0x6B717D)
}

