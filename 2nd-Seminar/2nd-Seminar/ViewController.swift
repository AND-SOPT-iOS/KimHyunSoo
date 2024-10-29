import UIKit

import SnapKit

class ViewController: UIViewController {
    
    private let startButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("시작", for: .normal)
        btn.backgroundColor = .tintColor
        btn.addTarget(self, action: #selector(startButtonTapped), for: .touchUpInside)
        return btn
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let backBarButtonItem = UIBarButtonItem(title: "앱", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backBarButtonItem

        setUI()
    }
    
    private func setUI() {
        self.view.addSubview(startButton)
        
        startButton.snp.makeConstraints{
            $0.center.equalToSuperview()
        }
    }
    
    @objc func startButtonTapped() {
        let nextViewController = FinanceViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
    }
}

#Preview {
    ViewController()
}


