import Foundation

import SnapKit
import UIKit

class LoginViewController: UIViewController {
    
    let userService = UserService()
    
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
    
    private lazy var submitButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("로그인하기", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor.systemBlue
        btn.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    private let moveToSignupButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("아직 회원이 아니신가요 ?", for: .normal)
        btn.setTitleColor(.tintColor, for: .normal)
        btn.backgroundColor = .clear
        btn.addTarget(self, action: #selector(signupButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    var resultLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubviews(
            usernameTextField,
            submitButton,
            passwordTextField,
            resultLabel,
            moveToSignupButton
        )
        
        setUI()
        setLayout()
    }
    
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
        
        submitButton.snp.makeConstraints{
            $0.width.equalTo(100)
            $0.height.equalTo(20)
            $0.top.equalTo(passwordTextField.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        
        moveToSignupButton.snp.makeConstraints{
            $0.top.equalTo(submitButton.snp.bottom).offset(10)
            $0.width.equalTo(300)
            $0.height.equalTo(20)
            $0.center.equalToSuperview()
        }
        
        resultLabel.snp.makeConstraints{
            $0.top.equalTo(moveToSignupButton.snp.bottom).offset(20)
            $0.width.equalTo(250)
            $0.height.equalTo(20)
            $0.centerX.equalToSuperview()
        }
    }
    
    @objc func loginButtonTapped() {
        userService.login(username: usernameTextField.text!, password: passwordTextField.text!) { [weak self] result in
            
            guard let self = self else { return }
            
            var text: String
            
            switch result {
            case let .success(loginResponse):
                text = "로그인되었습니다."
                UserManager.shared.updateToken(loginResponse.result.token)
                let viewController = MypageViewController()
                navigationController?.pushViewController(viewController, animated: true)
            case let .failure(error):
                text = error.errorMessage
            }
            self.resultLabel.text = text
        }
    }
    
    @objc func signupButtonTapped() {
        let nextViewController = SignupViewController()
        navigationController?.pushViewController(nextViewController, animated: true)
    }
}


#Preview {LoginViewController()}
