//
//  FirstSectionCollectionCell.swift
//  2nd-Seminar
//
//  Created by MaengKim on 10/30/24.
//

import UIKit

import SnapKit
import Then

class FirstSectionCollectionCell: UICollectionViewCell {
    static let identifier = "FirstSectionCollectionCell"
    
    private let category = UILabel().then {
        $0.font = .systemFont(ofSize: 12, weight: .regular)
        $0.textColor = .tintColor
    }
    
    private let nameLabel = UILabel().then{
        $0.font = .systemFont(ofSize: 20, weight: .regular)
        $0.textColor = .white
    }
    
    private let infoLabel = UILabel().then {
        $0.font = .systemFont(ofSize: 18, weight: .regular)
        $0.textColor = .gray
    }
    
    private let appImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
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
            category,
            nameLabel,
            infoLabel,
            appImageView
        ].forEach { addSubview($0) }
    }
    
    private func setLayout() {
        
        category.snp.makeConstraints{
            $0.top.equalToSuperview().offset(80)
            $0.leading.equalToSuperview().inset(15)
        }
        
        nameLabel.snp.makeConstraints{
            $0.top.equalTo(category.snp.bottom).offset(5)
            $0.leading.equalTo(category.snp.leading)
        }
        
        infoLabel.snp.makeConstraints{
            $0.top.equalTo(nameLabel.snp.bottom).offset(3)
            $0.leading.equalTo(category.snp.leading)
        }
        
        appImageView.snp.makeConstraints{
            $0.top.equalTo(infoLabel.snp.bottom).offset(5)
            $0.leading.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(180)
        }
    }
    
    private func setStyle() {
        
    }
    
    func configure(with app: FirstSectionApps) {
         category.text = app.category
         nameLabel.text = app.name
         infoLabel.text = app.info
         appImageView.image = app.appImage
     }
    
}
