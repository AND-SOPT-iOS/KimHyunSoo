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
    
    
    //스택뷰2 위에 올릴 거
    private let c1: UIView = {
        let c1 = UIView()
        c1.backgroundColor = .black
        
        let text = UILabel()
        text.text = "8.4만개의 평가"
        text.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        text.textColor = .gray
        
        let num = UILabel()
        num.text = "4.4"
        num.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        num.textColor = .gray
        
        let starFill = UIImageView()
        starFill.image = UIImage(systemName: "star.fill")
        starFill.tintColor = .gray
        let starHalf = UIImageView()
        starHalf.image = UIImage(systemName: "star.leadinghalf.filled")
        starHalf.tintColor = .gray
        
        c1.addSubview(text)
        c1.addSubview(num)
        
        text.snp.makeConstraints{
            $0.top.equalToSuperview().offset(10)
            $0.centerX.equalToSuperview()
        }
        num.snp.makeConstraints{
            $0.top.equalTo(text.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
        }
        
        return c1
    }()
    
    private let c2: UIView = {
        let c2 = UIView()
        c2.backgroundColor = .black
        
        let c2text = UILabel()
        c2text.text = "수상"
        c2text.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        c2text.textColor = .gray
        
        let person = UIImageView()
        person.image = UIImage(systemName: "person")
        
        c2.addSubview(c2text)
        c2.addSubview(person)
        
        c2text.snp.makeConstraints{
            $0.top.equalToSuperview().offset(10)
            $0.centerX.equalToSuperview()
        }
        person.snp.makeConstraints{
            $0.top.equalTo(c2text.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
        }

        
        return c2
    }()
    
    private let c3: UIView = {
        let c3 = UIView()
        c3.backgroundColor = .black
        
        let text = UILabel()
        text.text = "연령"
        text.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        text.textColor = .gray
        
        let age = UILabel()
        age.text = "4+"
        age.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        age.textColor = .gray
        
        let a = UILabel()
        a.text = "세"
        a.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        a.textColor = .gray
        
        
        c3.addSubview(text)
        c3.addSubview(age)
        c3.addSubview(a)
        
        text.snp.makeConstraints{
            $0.top.equalToSuperview().offset(10)
            $0.centerX.equalToSuperview()
        }
        age.snp.makeConstraints{
            $0.top.equalTo(text.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
        }
        a.snp.makeConstraints{
            $0.top.equalTo(age.snp.bottom).offset(5)
            $0.centerX.equalToSuperview()
        }
        
        return c3
    }()
    
    
    
    private let scrollView = UIScrollView()
    private var contentView = UIView()

    
    
    //스택뷰
    private let stackView1: UIStackView = {
        let stackView1 = UIStackView()
        stackView1.axis = .horizontal
        stackView1.distribution = .fillEqually
        stackView1.spacing = 10
        return stackView1
    }()
    
    private let stackView2: UIStackView = {
       let stackView2 = UIStackView()
        stackView2.axis = .horizontal
        stackView2.distribution = .fillEqually
        stackView2.spacing = 5
        stackView2.backgroundColor = .gray
        stackView2.alignment = .center
        return stackView2
    }()
    
    
    
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
        
        //스택뷰1
        [titleLabel, tossImg, detailTextField, openButton, shareImg].forEach {
            stackView1.addSubview($0)
        }
        
        //스택뷰2
        [c1, c2, c3].forEach {
            stackView2.addArrangedSubview($0)
        }
        
        //content뷰
        [prevImg, appLabel, stackView1, stackView2].forEach{
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
        
        //스택뷰1 레이아웃 설정
        stackView1.snp.makeConstraints{
            $0.top.equalTo(appLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(120)
        }
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(55)
            $0.height.equalTo(16)
            $0.leading.equalTo(tossImg.snp.trailing).offset(20)
        }
        tossImg.snp.makeConstraints{
            //$0.top.equalTo(appLabel.snp.bottom).offset(15)
            $0.height.equalTo(115)
            //$0.leading.equalTo(view.safeAreaLayoutGuide.snp.leading).offset(20)
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
            $0.trailing.equalToSuperview().offset(-20)
            $0.top.equalTo(openButton.snp.top)
        }
        
        
        //스택뷰2 레이아웃 설정
        stackView2.snp.makeConstraints{
            $0.top.equalTo(stackView1.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(90)
        }
        c1.snp.makeConstraints{
            $0.width.equalTo(stackView2.snp.width).multipliedBy(0.9/3.0)
            $0.height.equalTo(stackView2.snp.height).multipliedBy(0.98)
        }
        c2.snp.makeConstraints{
            $0.width.equalTo(stackView2.snp.width).multipliedBy(0.9/3.0)
            $0.height.equalTo(stackView2.snp.height).multipliedBy(0.98)
        }
        c3.snp.makeConstraints{
            $0.width.equalTo(stackView2.snp.width).multipliedBy(0.9/3.0)
            $0.height.equalTo(stackView2.snp.height).multipliedBy(0.98)
        }
        
    }


}


