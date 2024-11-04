import UIKit

class PhotoCell: UICollectionViewCell {
    static let identifier = "PhotoCell"
    
    private lazy var photoImageView = UIImageView()
    private lazy var likeButton = UIButton()
    
    var likeButtonAction: (() -> ())?
    
    var isLiked = false {
      didSet {
        updateUI()
      }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
        setStyle()
        setAddTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setAddTarget(){
        likeButton.addTarget(self, action: #selector(likeButtonTapped), for: .touchUpInside)
    }
    
    private func setUI() {
        [
            photoImageView,
            likeButton
        ].forEach { addSubview($0) }
    }
    
    private func setLayout() {
        photoImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        likeButton.snp.makeConstraints {
            $0.trailing.bottom.equalToSuperview().inset(8)
            $0.size.equalTo(20)
        }
    }
    
    private func setStyle(){
        photoImageView.do{
            $0.clipsToBounds = true
            $0.contentMode = .scaleAspectFill
        }
    }

    
    @objc
    func likeButtonTapped() {
        isLiked.toggle()
        likeButtonAction?()
    }
    
    private func updateUI() {
        let image = isLiked ? "heart.fill" : "heart"
        likeButton.setImage(UIImage(systemName: image), for: .normal)
    }
    
    func bind(_ photo: Photo) {
        photoImageView.image = photo.image
        isLiked = photo.isLiked
    }
    
}


