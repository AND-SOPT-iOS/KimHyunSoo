import Foundation

import SnapKit
import UIKit

class UserupdateViewController: UIViewController {
    
    let userService = UserService()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "🔏 취미를 수정해요"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        return label
    }()
    
    private var hobbyTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "수정할 내용을 입력해주세요."
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.systemGray.cgColor
        return textField
    }()
    
    var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "비밀번호를 입력해주세요."
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.systemGray.cgColor
        return textField
    }()
    
    private lazy var updateButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("내 정보 변경하기", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = .clear
        btn.addTarget(self, action: #selector(updateButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    var resultLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubviews(
            titleLabel,
            hobbyTextField,
            updateButton,
            resultLabel
        )
        
        setUI()
        setLayout()
    }
    
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(100)
            $0.centerX.equalToSuperview()
        }
        
        hobbyTextField.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(30)
        }
        
        updateButton.snp.makeConstraints{
            $0.top.equalTo(hobbyTextField.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(30)
        }
        
        resultLabel.snp.makeConstraints{
            $0.top.equalTo(updateButton.snp.bottom).offset(20)
            $0.width.equalTo(250)
            $0.height.equalTo(30)
            $0.centerX.equalToSuperview()
        }
        
    }
    
    @objc func updateButtonTapped() {
        if hobbyTextField.text == "" {
            return
        }
        userService.updateUserInfo(hobby: hobbyTextField.text!, password: passwordTextField.text!) { [weak self] result in
            guard let self = self else { return }
            
            var text: String
            switch result {
            case .success:
                text = "변경을 성공했어요."
            case let .failure(error):
                text = error.errorMessage
            }
            self.resultLabel.text = text
        }
    }
}

#Preview {UserupdateViewController()}



