/**
 @module:
 @author: kimsm
 @since:
 @desc
 @remark
 */
import UIKit

extension Int {
    public var ratioValue: CGFloat {
        return CGFloat(self) * UIScreen.ratio
    }
}
