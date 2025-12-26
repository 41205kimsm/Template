/**
 @module: CustomButton
 @author: kimsm
 @since: 12/23/25
 @desc
 @remark
 */
import UIKit
import Combine

public final class CustomButton: UIButton {

    // MARK: - Combine
    public var tapPublisher: AnyPublisher<Void, Never> {
        tapSubject.eraseToAnyPublisher()
    }

    private let tapSubject = PassthroughSubject<Void, Never>()

    // MARK: - Init
    public override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        addTarget(self, action: #selector(didTap), for: .touchUpInside)
    }

    // MARK: - Action
    @objc
    private func didTap() {
        tapSubject.send(())
    }
}

