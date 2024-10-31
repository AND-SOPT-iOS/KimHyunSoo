import UIKit

import SnapKit

class PaidRankingView: UIView {
    
    private let appLabel: UILabel = {
        let label = UILabel()
        label.text = "유료 순위"
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        label.textColor = .white
        return label
    }()
    
    private let viewAll: UIButton = {
        let btn = UIButton()
        btn.setTitle("모두보기", for: .normal)
        btn.titleLabel?.font = .systemFont(ofSize: 20, weight: .regular)
        btn.setTitleColor(.tintColor, for: .normal)
        return btn
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
        }
    }
}
