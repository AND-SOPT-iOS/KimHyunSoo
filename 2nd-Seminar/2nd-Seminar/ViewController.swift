import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private let prevImg: UIImageView = {
        let prevImg = UIImageView()
        prevImg.image = UIImage(systemName: "chevron.left")
        return prevImg
    }()
    
    private let appLabel: UILabel = {
        let label = UILabel()
        label.text = "앱"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textColor = .systemBlue
        label.textAlignment = .center
        return label
    }()

    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "토스"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()
    
    
    private let tossImg: UIImageView = {
        let tossImg = UIImageView()
        tossImg.image = UIImage(named: "toss")
        tossImg.layer.cornerRadius = 20
        return tossImg
    }()
    
    private let detailTextField: UITextField = {
        let textField = UITextField()
        textField.text = "금융이 쉬워진다"
        textField.textColor = .white
        textField.font = UIFont.systemFont(ofSize: 10, weight: .regular)
        return textField
    }()
    
    private let openButton: UIButton = {
        let button = UIButton()
        button.setTitle("열기", for:  .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15
        return button
    }()
    
    private let shareImg: UIImageView = {
        let shareImg = UIImageView()
        shareImg.image = UIImage(systemName: "square.and.arrow.up")
        return shareImg
    }()
    
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    private let stackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
    }
    
    private func setStyle() {
        self.view.backgroundColor = .black
    }
    
    private func setUI() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        [prevImg, appLabel, titleLabel, tossImg, detailTextField, openButton, shareImg].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints{
            $0.edges.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.greaterThanOrEqualToSuperview()
        }
        prevImg.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(15)
            $0.height.equalTo(18)
            $0.width.equalTo(18)
            $0.leading.equalToSuperview().offset(20)
        }
        appLabel.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(15)
            $0.height.equalTo(18)
            $0.leading.equalTo(prevImg.snp.trailing).offset(2)
        }
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(55)
            $0.height.equalTo(16)
            $0.leading.equalTo(tossImg.snp.trailing).offset(20)
        }
        tossImg.snp.makeConstraints{
            $0.top.equalTo(appLabel.snp.bottom).offset(15)
            $0.height.equalTo(115)
            $0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
        }
        detailTextField.snp.makeConstraints{
            $0.height.equalTo(10)
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.equalTo(tossImg.snp.trailing).offset(20)
        }
        openButton.snp.makeConstraints{
            $0.height.equalTo(30)
            $0.width.equalTo(70)
            $0.top.equalTo(detailTextField.snp.bottom).offset(50)
            $0.leading.equalTo(tossImg.snp.trailing).offset(20)
        }
        shareImg.snp.makeConstraints{
            $0.height.equalTo(18)
            $0.width.equalTo(18)
            $0.trailing.equalTo(view.safeAreaLayoutGuide).offset(20)
        }
        
    }


}

