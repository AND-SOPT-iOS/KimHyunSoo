import Foundation

import SnapKit
import UIKit

class SearchViewController: UIViewController {
    
    let userService = UserService()
    
    // MARK: - UI Propertise
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "🔈 친구의 취미를 공개합니다 !"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        return label
    }()
    
    private var otherNoTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "친구의 no를 입력해주세요."
        textField.layer.borderWidth = 1.0
        textField.layer.borderColor = UIColor.systemGray.cgColor
        return textField
    }()
    
    private var hobbyLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var submitButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("찾아보기", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor.systemBlue
        btn.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubviews(
            hobbyLabel,
            titleLabel,
            otherNoTextField,
            submitButton
        )
        
        setUI()
        setLayout()
    }
    
    // MARK: - SetUI
    
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(100)
            $0.centerX.equalToSuperview()
        }
        
        otherNoTextField.snp.makeConstraints{
            $0.width.equalTo(250)
            $0.height.equalTo(20)
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        
        submitButton.snp.makeConstraints{
            $0.width.equalTo(100)
            $0.height.equalTo(20)
            $0.top.equalTo(otherNoTextField.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        
        hobbyLabel.snp.makeConstraints{
            $0.top.equalTo(submitButton.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        
    }
    
    // MARK: - @objc Func
    
    @objc func searchButtonTapped() {
        userService.getOtherHobby(num: Int (otherNoTextField.text!) ?? 0) { [weak self] result in
            guard let self = self else { return }
            
            var text: String
            
            switch result {
            case let .success(searchResponse):
                text = searchResponse.result.hobby
            case let .failure(error):
                text = error.errorMessage
            }
            self.hobbyLabel.text = text
        }
    }
}


#Preview {SearchViewController()}



