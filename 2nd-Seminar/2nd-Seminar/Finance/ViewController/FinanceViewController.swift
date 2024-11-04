import UIKit

import SnapKit

class FinanceViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    private var contentView = UIView()
    
    private var firstSectionView = FirstSectionView()
    private var secondSectionView = SecondSectionView()
    private var paidRanking = PaidRankingView()
    private var freeRanking = FreeRankingView()
    
    private lazy var viewAllButton = freeRanking.viewAll
    
    private var apps: [FirstSectionApps] = []
    
    private let codeChangeButton = UIButton().then {
        $0.setTitle("코드 교환", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.layer.cornerRadius = 15
        $0.backgroundColor = .darkGray
        $0.titleLabel?.font = .systemFont(ofSize: 20, weight: .heavy)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        register()
        setAddTarget()
        
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
        secondSectionView.configure(with: SecondSectionApps.secondSectionApps)
        paidRanking.configure(with: PaidRankingApps.paidRankingApps)
        freeRanking.configure(with: FreeRankingApps.freeRankingApps)
    }
    
    
    private func setUI() {
        self.view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        contentView.addSubviews(
            firstSectionView,
            secondSectionView,
            paidRanking,
            freeRanking,
            codeChangeButton
        )
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
        
        secondSectionView.snp.makeConstraints{
            $0.top.equalTo(firstSectionView.snp.bottom).offset(25)
            $0.leading.trailing.equalToSuperview().offset(10)
            $0.height.equalTo(450)
        }
        
        paidRanking.snp.makeConstraints{
            $0.top.equalTo(secondSectionView.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().offset(10)
            $0.height.equalTo(450)
        }
        
        freeRanking.snp.makeConstraints{
            $0.top.equalTo(paidRanking.snp.bottom).offset(10)
            $0.leading.trailing.equalToSuperview().offset(10)
            $0.height.equalTo(250)
        }
        
        codeChangeButton.snp.makeConstraints{
            $0.top.equalTo(freeRanking.snp.bottom).offset(250)
            $0.height.equalTo(50)
            $0.width.equalTo(300)
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().offset(-20)
        }
    }
    
    private func register() {
        firstSectionView.collectionView.register(FirstSectionCollectionCell.self, forCellWithReuseIdentifier: "FirstSectionCollectionCell")
    }
    
    private func setAddTarget() {
        viewAllButton.addTarget(self, action: #selector(viewAllButtonTapped), for: .touchUpInside)
    }
    
    @objc func viewAllButtonTapped() {
        let nextViewController = PopularChartsViewController()
        self.navigationController?.pushViewController(nextViewController, animated: true)
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
