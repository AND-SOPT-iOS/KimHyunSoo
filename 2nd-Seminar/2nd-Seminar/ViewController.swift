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
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.textAlignment = .center
        return label
    }()
    
    
    private let tossImg: UIImageView = {
        let tossImg = UIImageView()
        tossImg.image = UIImage(named: "toss")
        tossImg.layer.cornerRadius = 20
        tossImg.layer.masksToBounds = true
        return tossImg
    }()
    
    private let detailTextField: UITextField = {
        let textField = UITextField()
        textField.text = "금융이 쉬워진다"
        textField.textColor = .gray
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return textField
    }()
    
    private let openButton: UIButton = {
        let button = UIButton()
        button.setTitle("열기", for:  .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
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
    
    
    //버전쪽
    private let newsLabel: UILabel = {
        let label = UILabel()
        label.text = "새로운 소식"
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.textColor = .white
        return label
    }()

    private let versionLabel: UILabel = {
        let label = UILabel()
        label.text = "버전 5.183.0"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    private let recordBtn: UIButton = {
        let btn = UIButton()
        btn.setTitle("버전 기록", for: .normal)
        btn.setTitleColor(.tintColor, for: .normal)
        btn.backgroundColor = .clear
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        btn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return btn
    }()
    
    private let dateLabel: UILabel = {
        let label = UILabel()
        label.text = "5일 전"
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        return label
    }()
    
    private let newsText: UILabel = {
        let textField = UILabel()
        textField.text = " · 구석구석 숨어있던 버그들을 잡았어요. 또 다른 버그가 나타난다면 토스 고객센터를 찾아주세요. 늘 열려있답니다. \n365일 24시간 언제든지요."
        textField.font = UIFont.systemFont(ofSize: 14, weight: .bold)
        textField.textColor = .white
        textField.numberOfLines = 0
        return textField
    }()
    
    
    //이미지 미리보기
    private let line: UIView = {
        let line = UIView()
        line.backgroundColor = .gray
        return line
    }()
    
    private let previewText: UILabel = {
        let label = UILabel()
        label.text = "미리 보기"
        label.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        label.textColor = .white
        return label
    }()
    
    private let previewImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "img")
        img.layer.cornerRadius = 20
        img.layer.masksToBounds = true
        return img
    }()
    
    private let phoneImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(named: "iphone")
        return img
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.text = "iPhone"
        label.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
        label.textColor = .gray
        return label
    }()
    
    
    //앱 설명 및 개발자
    private let line2: UIView = {
        let line = UIView()
        line.backgroundColor = .gray
        return line
    }()
    private let explainText: UILabel = {
        let label = UILabel()
        label.text = "토스뱅크, 토스증권 서비스를 이용하시려면 토스 앱 설치가 필요합니다.\n𒊹 내 금융 현황을 한 눈에, 홈·소비"
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    private let moreLabel: UILabel = {
        let label = UILabel()
        label.text = "더 보기"
        label.textColor = .tintColor
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    private let vivaLabel: UILabel = {
        let label = UILabel()
        label.text = "Viva Republica"
        label.textColor = .tintColor
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    private let developerLabel: UILabel = {
        let label = UILabel()
        label.text = "개발자"
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    private let nextRightImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "chevron.right")
        img.tintColor = .gray
        return img
    }()
    
    
    //평가 및 리뷰
    private let reviewLabel: UIButton = {
        let btn = UIButton()
        btn.setTitle("평가 및 리뷰", for: .normal)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .clear
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 25, weight: .heavy)
        btn.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return btn
    }()
    private let reviewImg: UIImageView = {
        let img = UIImageView()
        img.image = UIImage(systemName: "chevron.right")
        img.tintColor = .gray
        return img
    }()
    private let gradeLabel: UILabel = {
        let label = UILabel()
        label.text = "4.4"
        label.font = UIFont.systemFont(ofSize: 40, weight: .heavy)
        label.textColor = .white
        return label
    }()
    private let helpfulReview: UILabel = {
        let label = UILabel()
        label.text = "가장 도움이 되는 리뷰"
        label.font = UIFont.systemFont(ofSize: 18, weight: .heavy)
        label.textColor = .white
        return label
    }()
    private let helpfulReviewDetail: UILabel = {
        let label = UILabel()
        label.text = "8.4만개의 평가"
        label.font = UIFont.systemFont(ofSize: 15, weight: .heavy)
        label.textColor = .gray
        return label
    }()
    private let reviewTitle: UILabel = {
        let label = UILabel()
        label.text = "토스 UX 전버전으로 해주세요"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .white
        return label
    }()
    private let reviewDetail: UIView = {
        let review = UIView()
        review.backgroundColor = .darkGray
        review.layer.cornerRadius = 20
        return review
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
        stackView2.spacing = 2
        stackView2.backgroundColor = .gray
        stackView2.alignment = .center
        return stackView2
    }()
    
    private let stackView3: UIStackView = {
        let stackView3 = UIStackView()
        stackView3.axis = .horizontal
        stackView3.distribution = .fillEqually
        stackView3.spacing = 1
        
        let starImages = ["star.fill", "star.fill", "star.fill", "star.fill", "star.leadinghalf.filled"]
        
        for starImageName in starImages {
            let star = UIImageView()
            star.image = UIImage(systemName: starImageName)
            star.tintColor = .white
            stackView3.addArrangedSubview(star)
        }
        
        return stackView3
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
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        //스택뷰1 - 구분용,,
        [titleLabel, tossImg, detailTextField, openButton, shareImg].forEach {
            stackView1.addSubview($0)
        }
        
        //스택뷰2
        [c1, c2, c3].forEach {
            stackView2.addArrangedSubview($0)
        }
        
        [reviewTitle].forEach {
            reviewDetail.addSubview($0)
        }
        
        
        //content뷰
        [
            prevImg, appLabel, stackView1, stackView2, newsLabel, versionLabel, newsText, dateLabel, recordBtn, line, previewText, previewImg, phoneImg, phoneLabel,line2, explainText, moreLabel, vivaLabel, developerLabel, nextRightImg, reviewImg, reviewLabel, gradeLabel, stackView3, helpfulReviewDetail, helpfulReview, reviewDetail
        ].forEach{
            contentView.addSubview($0)
        }
    }
    
    private func setLayout() {
        scrollView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        contentView.snp.makeConstraints{
            $0.edges.equalTo(scrollView)
            $0.width.equalTo(scrollView)
            $0.height.greaterThanOrEqualTo(view.snp.height).priority(.required)
        }
        prevImg.snp.makeConstraints{
            $0.top.equalTo(contentView).offset(15)
            $0.height.equalTo(18)
            $0.width.equalTo(18)
            $0.leading.equalToSuperview().offset(20)
        }
        appLabel.snp.makeConstraints{
            $0.top.equalTo(contentView).offset(15)
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
        tossImg.snp.makeConstraints{
            $0.height.equalTo(115)
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
        }
        titleLabel.snp.makeConstraints{
            $0.top.equalTo(contentView).offset(55)
            $0.height.equalTo(16)
            $0.leading.equalTo(tossImg.snp.trailing).offset(20)
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
            $0.height.equalTo(stackView2.snp.height).multipliedBy(0.98)
        }
        c2.snp.makeConstraints{
            $0.height.equalTo(stackView2.snp.height).multipliedBy(0.98)
        }
        c3.snp.makeConstraints{
            $0.height.equalTo(stackView2.snp.height).multipliedBy(0.98)
        }
        
        //새로운 소식 부분
        newsLabel.snp.makeConstraints{
            $0.top.equalTo(stackView2.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        versionLabel.snp.makeConstraints{
            $0.top.equalTo(newsLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview().offset(20)
        }
        newsText.snp.makeConstraints{
            $0.top.equalTo(versionLabel.snp.bottom).offset(15)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
        }
        recordBtn.snp.makeConstraints{
            $0.top.equalTo(newsLabel)
            $0.trailing.equalToSuperview().offset(-20)
        }
        dateLabel.snp.makeConstraints{
            $0.top.equalTo(versionLabel)
            $0.trailing.equalToSuperview().offset(-20)
        }
        
        line.snp.makeConstraints{
            $0.top.equalTo(newsText.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(1)
        }
        
        //미리보기 부분
        previewText.snp.makeConstraints{
            $0.top.equalTo(line.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
        }
        previewImg.snp.makeConstraints{
            $0.top.equalTo(previewText.snp.bottom).offset(15)
            $0.center.equalToSuperview()
            $0.width.equalTo(200)
            $0.height.equalTo(200)
        }
        phoneImg.snp.makeConstraints{
            $0.top.equalTo(previewImg.snp.bottom).offset(15)
            $0.leading.equalTo(20)
            $0.width.equalTo(15)
            $0.height.equalTo(15)
        }
        phoneLabel.snp.makeConstraints{
            $0.top.equalTo(previewImg.snp.bottom).offset(15)
            $0.leading.equalTo(phoneImg.snp.trailing).offset(10)
        }
        line2.snp.makeConstraints{
            $0.top.equalTo(phoneLabel.snp.bottom).offset(20)
            $0.leading.equalToSuperview().offset(20)
            $0.trailing.equalToSuperview().offset(-20)
            $0.height.equalTo(1)
        }
        
        
        //설명 및 개발자
        explainText.snp.makeConstraints{
            $0.top.equalTo(line2.snp.bottom).offset(20)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
        }
        moreLabel.snp.makeConstraints{
            $0.top.equalTo(line2.snp.bottom).offset(60)
            $0.trailing.equalTo(-20)
        }
        vivaLabel.snp.makeConstraints{
            $0.top.equalTo(explainText.snp.bottom).offset(20)
            $0.leading.equalTo(20)
        }
        developerLabel.snp.makeConstraints{
            $0.top.equalTo(vivaLabel.snp.bottom).offset(3)
            $0.leading.equalTo(20)
        }
        nextRightImg.snp.makeConstraints{
            $0.top.equalTo(moreLabel.snp.bottom).offset(25)
            $0.trailing.equalTo(-20)
        }
        
        //평가 및 리뷰
        reviewLabel.snp.makeConstraints{
            $0.top.equalTo(developerLabel.snp.bottom).offset(30)
            $0.leading.equalTo(20)
        }
        reviewImg.snp.makeConstraints{
            $0.top.equalTo(developerLabel.snp.bottom).offset(40)
            $0.leading.equalTo(reviewLabel.snp.trailing).offset(3)
        }
        gradeLabel.snp.makeConstraints{
            $0.top.equalTo(reviewLabel.snp.bottom).offset(7)
            $0.leading.equalTo(20)
        }
        stackView3.snp.makeConstraints{
            $0.top.equalTo(gradeLabel)
            $0.trailing.equalTo(-20)
        }
        helpfulReview.snp.makeConstraints{
            $0.top.equalTo(gradeLabel.snp.bottom).offset(15)
            $0.leading.equalTo(20)
        }
        helpfulReviewDetail.snp.makeConstraints{
            $0.top.equalTo(stackView3.snp.bottom).offset(2)
            $0.trailing.equalTo(-20)
        }
        reviewDetail.snp.makeConstraints{
            $0.top.equalTo(helpfulReview.snp.bottom).offset(10)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.height.greaterThanOrEqualTo(250)
            //$0.bottom.equalToSuperview().offset(-20)
        }
        reviewTitle.snp.makeConstraints{
            $0.top.equalToSuperview().offset(15)
            $0.leading.equalToSuperview().offset(15)
        }
    }
    
    private func transitionToNextViewController() {
        let nextViewController = DetailViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    
    @objc private func buttonTapped() {
        transitionToNextViewController()
    }


}



