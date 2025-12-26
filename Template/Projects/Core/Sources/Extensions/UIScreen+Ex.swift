/**
 @module: UIScreen+Ex
 @author: kimsm
 @since: 12/23/25
 @desc
 @remark
 */
import UIKit

extension UIScreen {
    static var width: CGFloat {
        return main.bounds.width
    }
    static var height: CGFloat {
        return main.bounds.height
    }
    static var ratio: CGFloat {
        let baseSize: CGFloat = 810
        let currentSize = min(width, height)
        return currentSize / baseSize
    }
}
