import UIKit


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
    NSLayoutConstraint.activate(
      [
        titleLabel.topAnchor.constraint(
          equalTo: view.safeAreaLayoutGuide.topAnchor,
          constant: 20
        ),
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        contentLabel.topAnchor.constraint(
          equalTo: titleLabel.bottomAnchor,
          constant: 20
        ),
        contentLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        backButton.topAnchor.constraint(
          equalTo: feelingLabel.bottomAnchor,
          constant: 20
        ),
        feelingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        feelingLabel.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 20),
        backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        backButton.heightAnchor.constraint(equalToConstant: 44),
        backButton.widthAnchor.constraint(equalToConstant: 300),
      ]
    )
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


