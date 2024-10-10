import UIKit
import SnapKit


class DetailViewController: UIViewController {
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 16, weight: .semibold)
    return label
  }()
  
  private let contentLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 12, weight: .regular)
    label.numberOfLines = 0
    label.textAlignment = .left
    return label
  }()
    
    private let feelingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        return label
    }()

  private lazy var backButton: UIButton = {
    let button = UIButton()
    button.setTitle("이전 화면으로", for: .normal)
    button.backgroundColor = .tintColor
    button.setTitleColor(.white, for: .normal)
    button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
    return button
  }()
    
    private var receivedTitle: String?
    private var receivedContent: String?
    private var receivedFeeling: String?

  override func viewDidLoad() {
    super.viewDidLoad()
    setStyle()
    setUI()
    setLayout()
  }
  
  private func setStyle() {
    self.view.backgroundColor = .lightGray
  }
  
  private func setUI() {
    [titleLabel, contentLabel, feelingLabel, backButton].forEach {
      $0.translatesAutoresizingMaskIntoConstraints = false
      self.view.addSubview($0)
    }
  }
  
  private func setLayout() {
      titleLabel.snp.makeConstraints {
          $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
          $0.centerX.equalToSuperview()
      }
      
      contentLabel.snp.makeConstraints {
          $0.top.equalTo(titleLabel.snp.bottom).offset(20)
          $0.centerX.equalToSuperview()
      }
      
      feelingLabel.snp.makeConstraints {
          $0.top.equalTo(contentLabel.snp.bottom).offset(20)
          $0.centerX.equalToSuperview()
      }
      
      backButton.snp.makeConstraints {
          $0.top.equalTo(feelingLabel.snp.bottom).offset(20)
          $0.centerX.equalToSuperview()
          $0.width.equalTo(300)
          $0.height.equalTo(44)
      }
  }
    
    func updateUI() {
       self.titleLabel.text = receivedTitle
       self.contentLabel.text = receivedContent
        self.feelingLabel.text = receivedFeeling
     }

     func dataBind(
       title: String,
       content: String,
       feeling: String
     ) {
       self.receivedTitle = title
       self.receivedContent = content
       self.receivedFeeling = feeling
       updateUI()
     }

  @objc func backButtonTapped() {
    if self.navigationController == nil {
      self.dismiss(animated: true)
    } else {
      self.navigationController?.popViewController(animated: true)
    }
  }
}


