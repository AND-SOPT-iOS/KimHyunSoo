import UIKit

import SnapKit

class ViewController: UIViewController {
    
    private lazy var startButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("시작", for: .normal)
        btn.backgroundColor = .tintColor
        btn.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    private var serverButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("서버", for: .normal)
        btn.backgroundColor = .tintColor
        btn.addTarget(self, action: #selector(serverButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backBarButtonItem = UIBarButtonItem(title: "앱", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backBarButtonItem

        setUI()
    }
    
    private func setUI() {
        
        self.view.addSubviews(startButton,serverButton)
        
        startButton.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
        serverButton.snp.makeConstraints{
            $0.top.equalTo(startButton.snp.bottom).offset(30)
            $0.leading.equalTo(startButton)
        }
    }
    
    @objc func startButtonTapped() {
        let nextViewController = FinanceViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    @objc func serverButtonTapped() {
        let nextViewController = LoginViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

#Preview {
    ViewController()
}


