import UIKit
import SnapKit
import Then

class PhotoViewController: UIViewController {
    
    private var photoList = Photo.samplePhotos
    
    private lazy var collectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: UICollectionViewFlowLayout()
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
        setCollectionView()
    }
    
    private func setUI() {
        view.addSubview(collectionView)
    }
    
    private func setLayout() {
        collectionView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.bottom.horizontalEdges.equalToSuperview()
        }
    }

    private func setCollectionView(){
        let flowLayout = UICollectionViewFlowLayout()
        let itemSize = (UIScreen.main.bounds.width - 6) / 3
        flowLayout.itemSize = .init(width: itemSize, height: itemSize)
        flowLayout.minimumLineSpacing = 3
        flowLayout.minimumInteritemSpacing = 3
        
        collectionView.do{
            $0.setCollectionViewLayout(flowLayout, animated: true)
            $0.register(PhotoCell.self,
                        forCellWithReuseIdentifier: PhotoCell.identifier)
            $0.delegate = self
            $0.dataSource = self
        }
    }
}

extension PhotoViewController: UICollectionViewDelegate { }
extension PhotoViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return 10
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let item = collectionView.dequeueReusableCell(
            withReuseIdentifier: PhotoCell.identifier,
            for: indexPath
        ) as? PhotoCell else {
            return UICollectionViewCell()
        }
        
        item.likeButtonAction = { [weak self] in
            guard let self else { return }
            self.photoList[indexPath.row].isLiked.toggle()
            self.collectionView.reloadItems(at: [indexPath])
        }
        
        item.bind(photoList[indexPath.row])
        return item
    }
}




