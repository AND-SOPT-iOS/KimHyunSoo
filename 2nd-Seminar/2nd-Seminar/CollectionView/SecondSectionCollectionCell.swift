import UIKit

import SnapKit
import Then

class SecondSectionCollectionCell: UICollectionViewCell {
    static let identifier = "SecondSectionCollectionCell"
    
    private let appImage = UIImageView().then {
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
    }
    private let titleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
        $0.textColor = .white
    }
    private let subTitleLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 15, weight: .semibold)
        $0.textColor = .gray
    }
    private let downloadButton = UIButton().then {
        $0.backgroundColor = .darkGray
        $0.setTitleColor(.tintColor, for: .normal)
        $0.layer.cornerRadius = 25/2
        $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
        $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        [
            appImage,
            titleLabel,
            subTitleLabel,
            downloadButton
        ].forEach { addSubview($0) }
    }
    
    private func setLayout() {
        appImage.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.size.equalTo(70)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(appImage)
            $0.leading.equalTo(appImage.snp.trailing).offset(10)
        }
        
        subTitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(4)
            $0.leading.equalTo(titleLabel)
        }
        
        downloadButton.snp.makeConstraints {
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview().offset(-10)
            $0.leading.equalTo(titleLabel.snp.trailing).offset(8)
            $0.width.equalTo(60)
            $0.height.equalTo(25)
        }
    }
    
    private func setStyle() {
        titleLabel.do {
            $0.numberOfLines = 2
        }
    }
    
    func configure(with app: SecondSectionApps) {
        appImage.image = app.iconImage
        titleLabel.text = app.title
        subTitleLabel.text = app.subTitle
        downloadButton.setTitle(app.downloadState.rawValue, for: .normal)
     }
    
}
