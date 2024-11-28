import Foundation

import SnapKit
import UIKit

class MypageViewController: UIViewController {
    
    let userService = UserService()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "🔈 내 취미를 공개합니다 !"
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        return label
    }()
    
    private var hobbyLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var updateButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("내 정보 변경하기", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = .clear
        btn.addTarget(self, action: #selector(updateInfoButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    private lazy var searchButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("다른 사람이 궁금해?👀", for: .normal)
        btn.setTitleColor(UIColor.black, for: .normal)
        btn.backgroundColor = .clear
        btn.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubviews(
            hobbyLabel,
            titleLabel,
            updateButton,
            searchButton
        )
        
        setUI()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        getMyHobby()
    }
    
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func setLayout() {
        titleLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(100)
            $0.centerX.equalToSuperview()
        }
        
        hobbyLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(30)
            $0.centerX.equalToSuperview()
        }
        
        updateButton.snp.makeConstraints{
            $0.top.equalTo(hobbyLabel.snp.bottom).offset(40)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(30)
        }
        
        searchButton.snp.makeConstraints{
            $0.top.equalTo(updateButton.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()
            $0.width.equalTo(300)
            $0.height.equalTo(30)
        }
        
    }
    
    private func getMyHobby() {
        userService.getMyHobby() { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                var text: String
                
                switch result {
                case let .success(mypageResponse):
                    print("성공")
                    text = mypageResponse.result.hobby
                case let .failure(error):
                    print("실패")
                    text = error.errorMessage
                }
                self.hobbyLabel.text = text
                print(text)
            }
        }
    }
    
    @objc func updateInfoButtonTapped() {
        let viewController = UserupdateViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
    @objc func searchButtonTapped() {
        let viewController = SearchViewController()
        navigationController?.pushViewController(viewController, animated: true)
    }
    
}


#Preview {MypageViewController()}


