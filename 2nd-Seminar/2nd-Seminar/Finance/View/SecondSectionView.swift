import UIKit

import SnapKit

class SecondSectionView: UIView {
    
    private let appLabel: UILabel = {
        let label = UILabel()
        label.text = "필수 금융 앱"
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        label.textColor = .white
        return label
    }()
    
    private let appInfo: UILabel = {
        let label = UILabel()
        label.text = "에디터가 직접 골랐습니다."
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textColor = .gray
        return label
    }()
    
    lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout().then {
            $0.scrollDirection = .horizontal
            $0.minimumLineSpacing = 10
            $0.minimumInteritemSpacing = 10
            $0.itemSize = CGSize(width: 300, height: 400)
        }
    ).then {
        //$0.dataSource = self
        $0.showsHorizontalScrollIndicator = false
        $0.backgroundColor = .clear
        //$0.register(SecondSectionCollectionCell.self, forCellWithReuseIdentifier: SecondSectionCollectionCell.identifier)
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
            appInfo
        ].forEach { addSubview($0) }
    }
    
    private func setLayout() {
        
        appLabel.snp.makeConstraints{
            $0.top.equalToSuperview().offset(15)
            $0.leading.trailing.equalToSuperview()
        }
        
        appInfo.snp.makeConstraints{
            $0.top.equalTo(appLabel.snp.bottom).offset(5)
            $0.leading.trailing.equalToSuperview()
        }
        
        collectionView.snp.makeConstraints{
            $0.top.equalTo(appInfo.snp.bottom).offset(12)
        }
    }
}
