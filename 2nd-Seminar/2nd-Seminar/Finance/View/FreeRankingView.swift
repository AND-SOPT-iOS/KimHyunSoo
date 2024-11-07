import UIKit

import SnapKit

class FreeRankingView: UIView {
    
    private var apps:[FreeRankingApps] = []
    
    private let itemWidth = UIScreen.main.bounds.width - 4
    private let itemHeight = UIScreen.main.bounds.width / 3 - 8
    
    private let appLabel: UILabel = {
        let label = UILabel()
        label.text = "무료 순위"
        label.font = .systemFont(ofSize: 25, weight: .heavy)
        label.textColor = .white
        return label
    }()
    
    let viewAll: UIButton = {
        let btn = UIButton()
        btn.setTitle("모두보기", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 25, weight: .regular)
        btn.setTitleColor(.tintColor, for: .normal)
        return btn
    }()
    
    lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
            $0.minimumLineSpacing = 2
            $0.minimumInteritemSpacing = 4
            $0.scrollDirection = .horizontal
            $0.itemSize = .init(width: itemWidth, height: itemHeight)
        }
    ).then {
        $0.dataSource = self
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .clear
        $0.isPagingEnabled = false
        $0.register(FreeRankingCollectionCell.self, forCellWithReuseIdentifier: FreeRankingCollectionCell.identifier)
    }

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        [
            collectionView,
            appLabel,
            viewAll
        ].forEach { addSubview($0) }
    }
    
    private func setLayout() {
        
        appLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(15)
            $0.leading.trailing.equalToSuperview()
        }
        
        viewAll.snp.makeConstraints{
            $0.centerY.equalTo(appLabel)
            $0.trailing.equalToSuperview().offset(-10)
        }
        
        collectionView.snp.makeConstraints{
            $0.top.equalTo(appLabel.snp.bottom).offset(12)
            $0.height.equalTo(itemHeight * 3 + 8)
            $0.leading.trailing.equalToSuperview()
        }
    }
    
    func configure(with apps: [FreeRankingApps]) {
        self.apps = apps
    }
}

// MARK: - UICollectionViewDataSource
extension FreeRankingView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return apps.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FreeRankingCollectionCell.identifier, for: indexPath) as? FreeRankingCollectionCell {
            cell.configure(with: apps[indexPath.row])
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}
