import UIKit
import SnapKit

class DetailViewController: UIViewController {
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "버전 기록"
        label.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    private lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("뒤로", for: .normal)
        btn.backgroundColor = .clear
        btn.setTitleColor(.tintColor, for: .normal)
        btn.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        self.navigationController?.navigationBar.isHidden = true;
    }
    
    
    private func setStyle() {
        self.view.backgroundColor = .black
    }
    
    private func setUI() {
        [backButton, titleLabel].forEach {
            self.view.addSubview($0)
        }
        
    }
    
    private func setLayout() {
        backButton.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
            $0.leading.equalTo(20)
        }
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(backButton.snp.bottom).offset(20)
            $0.leading.equalTo(20)
        }
        
    }
    
    @objc func backButtonTapped() {
        if self.navigationController == nil {
            self.dismiss(animated: true)
        } else {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}


