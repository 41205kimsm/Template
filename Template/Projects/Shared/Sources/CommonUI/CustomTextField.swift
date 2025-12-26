/**
 @module: CustomTextField
 @author: kimsm
 @since:12/23/25
 @desc
 @remark
 */
import UIKit

public final class CustomTextField: UITextField {

    /// 최대 입력 길이 (0 이하 = 제한 없음)
    public var maxLength: Int = 0

    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        addTarget(self,
                  action: #selector(textDidChange),
                  for: .editingChanged)
    }

    @objc
    private func textDidChange() {
        guard maxLength > 0 else { return }
        guard let currentText = text else { return }

        // 한글 조합 중이면 제한 적용 X
        if let markedTextRange = markedTextRange,
           position(from: markedTextRange.start, offset: 0) != nil {
            return
        }

        if currentText.count > maxLength {
            text = String(currentText.prefix(maxLength))
        }
    }
}

