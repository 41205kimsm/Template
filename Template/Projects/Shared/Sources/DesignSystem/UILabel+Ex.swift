/**
 @module: UILabel+Ex
 @author: kimsm
 @since: 12/24/25
 @desc
 @remark
 */
import UIKit

public extension UILabel {

    /// 특정 문자열의 폰트 / 색상 변경
    func setStyle(targetText: String, font: UIFont? = nil, color: UIColor? = nil) {
        guard
            let text = self.text,
            let range = text.range(of: targetText)
        else { return }

        let nsRange = NSRange(range, in: text)
        let attributedText = NSMutableAttributedString(string: text)

        if let font {
            attributedText.addAttribute(.font, value: font, range: nsRange)
        }

        if let color {
            attributedText.addAttribute(.foregroundColor, value: color, range: nsRange)
        }

        self.attributedText = attributedText
    }
    
    func setLineSpacing(
        _ spacing: CGFloat,
        alignment: NSTextAlignment? = nil
    ) {
        guard let text = text, !text.isEmpty else { return }

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacing
        paragraphStyle.alignment = alignment ?? textAlignment

        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(
            .paragraphStyle,
            value: paragraphStyle,
            range: NSRange(location: 0, length: attributedString.length)
        )

        attributedText = attributedString
    }

}
