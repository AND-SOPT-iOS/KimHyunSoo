import Foundation

import SnapKit
import UIKit

class SignupViewController: UIViewController {
    
    let userService = UserService()
    
    // MARK: - UI Properties
    
    var usernameTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "이름을 입력해주세요."
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
    
    var hobbyTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "취미를 입력해주세요."
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.systemGray.cgColor
        return textField
    }()
    
    private lazy var submitButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("회원가입하기", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor.systemBlue
        btn.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    var resultLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubviews(
            usernameTextField,
            submitButton,
            passwordTextField,
            resultLabel,
            hobbyTextField
        )
        
        setUI()
        setLayout()
    }
    
    // MARK: - SetUI
    
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        usernameTextField.snp.makeConstraints{
            $0.width.equalTo(250)
            $0.height.equalTo(20)
            $0.top.equalToSuperview().offset(100)
            $0.centerX.equalToSuperview()
        }
        
        passwordTextField.snp.makeConstraints{
            $0.width.equalTo(250)
            $0.height.equalTo(20)
            $0.top.equalTo(usernameTextField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()

        }
        
        hobbyTextField.snp.makeConstraints{
            $0.width.equalTo(250)
            $0.height.equalTo(20)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
        }
        
        submitButton.snp.makeConstraints{
            $0.width.equalTo(100)
            $0.height.equalTo(20)
            $0.top.equalTo(hobbyTextField.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        
        resultLabel.snp.makeConstraints{
            $0.top.equalTo(submitButton).offset(100)
            $0.width.equalTo(250)
            $0.height.equalTo(20)
            $0.centerX.equalToSuperview()
        }
    }
    
    //MARK: -  @objc Func
    
    @objc func signUpButtonTapped() {
      userService.register(
        username: usernameTextField.text!,
        password: passwordTextField.text!,
        hobby: hobbyTextField.text!
      ) { [weak self] result in
        DispatchQueue.main.async {
          guard let self = self else { return }

          var text: String
          switch result {
          case .success:
            text = "회원 등록 성공했어요."
          case let .failure(error):
            text = error.errorMessage
          }
          self.resultLabel.text = text
        }
      }
    }
}


#Preview {SignupViewController()}


