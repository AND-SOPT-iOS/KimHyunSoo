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
    
    private let prevImg: UIImageView = {
        let prevImg = UIImageView()
        prevImg.image = UIImage(systemName: "chevron.left")
        return prevImg
    }()
    
    private lazy var backButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("뒤로", for: .normal)
        btn.backgroundColor = .clear
        btn.setTitleColor(.tintColor, for: .normal)
        btn.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    private let textField: UITextField = {
        let text = UITextField()
        text.text = "버전기록 페이지"
        text.textColor = .white
        text.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return text
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
        [prevImg, backButton, titleLabel, textField].forEach {
            self.view.addSubview($0)
        }
        
    }
    
    private func setLayout() {
        prevImg.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
            $0.height.equalTo(18)
            $0.width.equalTo(18)
            $0.leading.equalTo(20)
        }
        backButton.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(13)
            $0.leading.equalTo(prevImg.snp.trailing).offset(2)
        }
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(backButton.snp.bottom).offset(20)
            $0.leading.equalTo(20)
        }
        textField.snp.makeConstraints{
            $0.center.equalToSuperview()
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


