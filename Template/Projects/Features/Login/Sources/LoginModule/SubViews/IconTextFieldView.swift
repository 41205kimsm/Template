/**
 @module: IconTextField
 @author: kimsm
 @since: 12/22/25
 @desc
 @remark
 */
import UIKit
import SnapKit
import Extensions
import DesignSystem
import CommonUI

final class IconTextFieldView: UIView {
            
    private let iconImageview: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    private let textField: CustomTextField = {
        let tf = CustomTextField()
        tf.textColor = AppColor.hex6E63E9
        tf.font = AppFont.bold(28.ratioValue)        
        return tf
    }()
    
    private let iconImageName: String
    private let placeHolder: String
    
    init(iconImageName: String, placeHolder: String) {
        self.iconImageName = iconImageName
        self.placeHolder = placeHolder
        super.init(frame: .zero)
        layout()
    }
    
    override init(frame: CGRect) {
        self.iconImageName = ""
        self.placeHolder = ""
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func attribute(){    
        self.layer.cornerRadius = 12.ratioValue
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.hex(0xC3C3C3).cgColor
        textField.placeholder = placeHolder
        iconImageview.image = UIImage(named: iconImageName)
    }
    
    private func layout(){
        addSubview(iconImageview)
        addSubview(textField)
        
        iconImageview.snp.makeConstraints({
            $0.leading.equalToSuperview().inset(16.ratioValue)
            $0.width.height.equalTo(50.ratioValue)
            $0.centerY.equalToSuperview()
        })
        
        textField.snp.makeConstraints({
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(iconImageview.snp.trailing).offset(22.ratioValue)
            $0.height.equalTo(50.ratioValue)
            $0.trailing.equalToSuperview().inset(16.ratioValue)
        })
    }
}
