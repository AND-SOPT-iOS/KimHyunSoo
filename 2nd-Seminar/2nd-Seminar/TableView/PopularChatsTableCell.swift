import Foundation
import UIKit

import Then
import SnapKit

class PopularChartsTableCell: UITableViewCell {
    static let identifier = "PopularChartsTableCell"
    weak var delegate: TableCellDelegate?
    
    private var index: Int = 0
    
    private let iconImageView = UIImageView().then{
        $0.layer.cornerRadius = 15
        $0.clipsToBounds = true
    }
    private let titleLabel = UILabel().then{
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 20, weight: .semibold)
        $0.textAlignment = .left
    }
    private let subTitleLabel = UILabel().then{
        $0.textColor = .gray
        $0.font = .systemFont(ofSize: 15, weight: .regular)
        $0.lineBreakMode = .byTruncatingTail
        $0.textAlignment = .left
    }
    private let rankingLabel = UILabel().then{
        $0.textColor = .white
        $0.font = .systemFont(ofSize: 20, weight: .heavy)
        $0.textAlignment = .left
    }
    private var downloadButton = UIButton().then{
        $0.backgroundColor = .darkGray
        $0.setTitleColor(.tintColor, for: .normal)
        $0.layer.cornerRadius = 12
        $0.titleLabel?.font = .systemFont(ofSize: 15, weight: .semibold)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setUI()
        setStyle()
        setLayout()
        setupGesture()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setStyle() {
        titleLabel.do {
            $0.numberOfLines = 2
        }
        
        backgroundColor = .black
        let selectedView = UIView()
        selectedView.backgroundColor = .black
        selectedBackgroundView = selectedView
    }
    
    private func setUI() {
        addSubviews(
            iconImageView,
            titleLabel,
            subTitleLabel,
            rankingLabel,
            downloadButton
        )
    }
    
    private func setLayout() {
        iconImageView.snp.makeConstraints{
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(20)
            $0.size.equalTo(80)
        }
        
        rankingLabel.snp.makeConstraints{
            $0.leading.equalTo(iconImageView.snp.trailing).offset(10)
            $0.top.equalToSuperview().offset(12)
        }
        
        //우선순위 설정
        rankingLabel.setContentHuggingPriority(.required, for: .horizontal)
        
        titleLabel.snp.makeConstraints{
            $0.centerY.equalTo(rankingLabel)
            $0.leading.equalTo(rankingLabel.snp.trailing).offset(8)
        }
        
        subTitleLabel.snp.makeConstraints{
            $0.top.equalTo(titleLabel.snp.bottom).offset(5)
            $0.leading.equalTo(titleLabel)
            $0.trailing.equalTo(titleLabel)
        }
        
        downloadButton.snp.makeConstraints{
            $0.centerY.equalTo(titleLabel)
            $0.trailing.equalToSuperview().offset(-10)
            $0.leading.equalTo(titleLabel.snp.trailing).offset(8)
            $0.width.equalTo(60)
            $0.height.equalTo(25)
        }
    }
    
    func configurate(app: PopularChartsApp, index: Int) {
        self.index = index
        iconImageView.image = app.iconImage
        rankingLabel.text = app.ranking.description
        titleLabel.text = app.title
        subTitleLabel.text = app.subTitle
        downloadButton.setTitle(app.downloadState.rawValue, for: .normal)
    }
    
    private func setupGesture() {
            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
            self.addGestureRecognizer(tapGesture)
        }

    @objc private func handleTap() {
        delegate?.didTapCell(index: index)
    }
}
