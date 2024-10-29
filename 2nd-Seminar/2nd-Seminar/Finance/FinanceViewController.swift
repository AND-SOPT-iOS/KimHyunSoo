import UIKit

import SnapKit

class FinanceViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    private var firstSectionView = FirstSectionView()
    
    private var apps: [FirstSectionApps] = []
    
    private let fake = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        register()
        
        
        //네비바 설정
        self.navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: 18)
        ]
        self.navigationItem.title = "금융"
        view.backgroundColor = .black
        let backBarButtonItem = UIBarButtonItem(title: "앱", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backBarButtonItem
        
        firstSectionView.configure(with: FirstSectionApps.firstSectionApps)
        
    }
    
    private func setUI() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        [firstSectionView, fake].forEach { contentView.addSubview($0) }
        
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
        
        firstSectionView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().offset(10)
            $0.height.equalTo(250)
        }
        
        fake.snp.makeConstraints{
            $0.top.equalToSuperview().offset(2000)
            $0.leading.trailing.equalToSuperview()
            $0.bottom.equalToSuperview()
            $0.height.equalTo(10)
        }
    }
    
    private func register() {
        firstSectionView.collectionView.register(FirstSectionCollectionCell.self, forCellWithReuseIdentifier: "FirstSectionCollectionCell")
    }
}

// MARK: - UICollectionViewDataSource, UICollectionViewDelegate
extension FinanceViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return apps.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstSectionCollectionCell.identifier, for: indexPath) as? FirstSectionCollectionCell else {
            return UICollectionViewCell()
        }
        let app = apps[indexPath.row]
        cell.configure(with: app)
        return cell
    }
}

#Preview {
    ViewController()
}
