import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var feelings: [String] = ["🤩", "🥰", "🌈", "🤪", "😞"]
    private var pushMode = true
    private let picker = UIPickerView()
    
    private let titleLabel: UILabel = { //선언과 동시에 초기화를 시켜주는 방식
        let label = UILabel()
        label.text = "방명록"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        return label
    }()

    private let titleTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = " 제목을 입력해주세요."
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.clearButtonMode = .whileEditing //지우기 버튼
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        return textField
    }()

    private let contentTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 14)
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 10
        return textView
    }()

    private lazy var nextButton: UIButton = { //버튼을 눌렀을 때 초기화가 되며 트리거를 불러옴 == lazy var
        let button = UIButton()
        button.setTitle("다음", for: .normal)
        button.setTitleColor(.gray, for: .normal)
        button.backgroundColor = UIColor(_colorLiteralRed: 1, green: 0.9098, blue: 0.502, alpha: 1.0)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside) //눌렀을 때 트리거 되는 것을 설정함
        return button
    }()
    
    private lazy var pushModeToggleButton: UIButton = {
       let button = UIButton()
        button.setTitle("전환모드변경", for: .normal)
        button.backgroundColor = UIColor(_colorLiteralRed: 1, green: 0.9098, blue: 0.502, alpha: 1.0)
        button.setTitleColor(.gray, for: .normal)
        button.layer.cornerRadius = 10
        button.addTarget(self, action: #selector(toggleButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let feelingField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "현재 기분을 선택해주세요."
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.layer.borderColor = UIColor.gray.cgColor
        textField.layer.borderWidth = 1
        textField.layer.cornerRadius = 10
        return textField
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setStyle()
        setUI()
        setLayout()
        pickerView()
    }
    
    private func setStyle() { //따로 메소드로 빼서 선언 후에 UI의 속성을 초기화
        self.view.backgroundColor = .white
    }
    
    private func setUI() {
        [titleLabel, titleTextField, contentTextView, nextButton, pushModeToggleButton, feelingField].forEach {
            self.view.addSubview($0)
        }
    }
    
    private func setLayout(){
        titleLabel.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(100)
            make.centerX.equalToSuperview()
        }
        
        titleTextField.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(150)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(40)
        }
        
        contentTextView.snp.makeConstraints{ make in
            make.top.equalTo(titleTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(200)
            make.height.equalTo(80)
        }
        
        feelingField.snp.makeConstraints{ make in
            make.top.equalTo(contentTextView.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(150)
            make.height.equalTo(40)
        }
        
        nextButton.snp.makeConstraints{ make in
            make.top.equalTo(feelingField.snp.bottom).offset(30)
            make.centerX.equalToSuperview()
            make.width.equalTo(50)
            make.height.equalTo(40)
        }
        
        pushModeToggleButton.snp.makeConstraints{ make in
            make.top.equalTo(nextButton.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(100)
            make.height.equalTo(40)
        }
    }
    
    func pickerView() {
        picker.delegate = self
        picker.dataSource = self
        feelingField.inputView = picker
    }

    private func transitionToNextViewController() {
        let nextViewController = DetailViewController()
        if let title = titleTextField.text,
           let content = contentTextView.text,
           let feeling = feelingField.text {
            nextViewController.dataBind(title: title, content: content, feeling: feeling)
        }
        if pushMode {
            self.navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            self.present(nextViewController, animated: true)
        }
    }
    
    private func updateUI() {
        self.titleLabel.text = pushMode ? "네비게이션":"모달"
    }
    
    @objc func nextButtonTapped() {
        transitionToNextViewController()
    }
    
    @objc func toggleButtonTapped() {
        self.pushMode.toggle()
        self.updateUI()
    }
}

extension ViewController: UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return feelings.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return feelings[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        feelingField.text = feelings[row]
        feelingField.resignFirstResponder()
    }
}

extension ViewController: UIPickerViewDelegate {
}
