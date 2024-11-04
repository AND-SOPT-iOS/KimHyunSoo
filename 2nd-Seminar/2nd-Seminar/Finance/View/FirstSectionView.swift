import UIKit

import SnapKit

class FirstSectionView: UIView {
    
    private var apps: [FirstSectionApps] = []
    
    lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
            $0.minimumLineSpacing = 10
            $0.minimumInteritemSpacing = 10
            $0.itemSize = CGSize(width: 300, height: 400)
        }
    ).then {
        $0.dataSource = self
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .clear
        $0.register(FirstSectionCollectionCell.self, forCellWithReuseIdentifier: FirstSectionCollectionCell.identifier)
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
        addSubview(collectionView)
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }
    
    
    func configure(with apps: [FirstSectionApps]) {
        self.apps = apps
    }
}

extension FirstSectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return apps.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FirstSectionCollectionCell.identifier, for: indexPath) as? FirstSectionCollectionCell {
            cell.configure(with: apps[indexPath.row])
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
}
