/**
 @module: UIView+Ex
 @author: kimsm
 @since:
 @desc
 @remark
 */
import UIKit

public enum GradientDirection {
    case topToBottom
    case leftToRight
    case topLeftToBottomRight
    case topRightToBottomLeft
}

public extension UIView {

    @discardableResult
    func applyGradient(
        colors: [UIColor],
        direction: GradientDirection = .topToBottom,
        locations: [NSNumber]? = nil,
        cornerRadius: CGFloat = 0
    ) -> CAGradientLayer {

        // 기존 gradient 제거
        layer.sublayers?
            .filter { $0 is CAGradientLayer }
            .forEach { $0.removeFromSuperlayer() }

        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.locations = locations
        gradientLayer.cornerRadius = cornerRadius

        switch direction {
        case .topToBottom:
            gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)
            gradientLayer.endPoint   = CGPoint(x: 0.5, y: 1.0)

        case .leftToRight:
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradientLayer.endPoint   = CGPoint(x: 1.0, y: 0.5)

        case .topLeftToBottomRight:
            gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
            gradientLayer.endPoint   = CGPoint(x: 1.0, y: 1.0)

        case .topRightToBottomLeft:
            gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
            gradientLayer.endPoint   = CGPoint(x: 0.0, y: 1.0)
        }

        layer.insertSublayer(gradientLayer, at: 0)
        return gradientLayer
    }
    
    /// 특정 코너만 라운드 처리
        func roundCorners(
            _ corners: UIRectCorner,
            radius: CGFloat
        ) {
            clipsToBounds = true
            layer.cornerRadius = radius

            var masked: CACornerMask = []

            if corners.contains(.topLeft) {
                masked.insert(.layerMinXMinYCorner)
            }
            if corners.contains(.topRight) {
                masked.insert(.layerMaxXMinYCorner)
            }
            if corners.contains(.bottomLeft) {
                masked.insert(.layerMinXMaxYCorner)
            }
            if corners.contains(.bottomRight) {
                masked.insert(.layerMaxXMaxYCorner)
            }

            layer.maskedCorners = masked
        }
}
