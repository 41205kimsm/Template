/**
 @module: CustomCheckBox
 @author: kimsm
 @since: 12/23/25
 @desc
 @remark
 */
import UIKit
import SnapKit
import Combine

public final class CustomCheckBox: UIView {
        
    @Published public private(set) var isChecked: Bool = false
    
    private var imageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    private var actionButton: CustomButton = {
        let btn = CustomButton()
        return btn
    }()
    
    private var onImageName: String
    private var offImageName: String
    
    private var cancellables = Set<AnyCancellable>()
    
    init(isChecked: Bool,
         onImageName: String,
         offImageName: String)
    {
        self.isChecked = isChecked
        self.onImageName = onImageName
        self.offImageName = offImageName
        super.init(frame: .zero)
        layout()
        bind()
    }
    
    public override init(frame: CGRect) {
        self.isChecked = false
        self.onImageName = "ic_check_on"
        self.offImageName = "ic_check_off"
        super.init(frame: frame)
        layout()
        bind()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func layout() {
        addSubview(imageView)
        addSubview(actionButton)
        
        imageView.snp.makeConstraints({
            $0.edges.equalToSuperview()
        })
        actionButton.snp.makeConstraints({
            $0.edges.equalToSuperview()
        })
    }
    
    private func bind() {
        actionButton.tapPublisher
            .receive(on: RunLoop.main)
            .sink(receiveValue: {[weak self] _ in
                guard let self else { return }
                isChecked.toggle()
                updateUI()
            }).store(in: &cancellables)
        
        $isChecked
           .receive(on: RunLoop.main)
           .sink {[weak self] _ in
               guard let self else { return }
               updateUI()
           }
           .store(in: &cancellables)
    }
    
    private func updateUI(){
        imageView.image = UIImage(named: isChecked ? onImageName : offImageName,
                                  in: Bundle(for: Self.self),
                                  compatibleWith: nil)
    }
}
