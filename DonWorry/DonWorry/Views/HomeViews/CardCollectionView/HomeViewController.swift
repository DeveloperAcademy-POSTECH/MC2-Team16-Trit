//
//  ViewController.swift
//  CardCollectioinView
//
//  Created by Woody on 2022/06/01.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let images: [String] = [
        "a"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let imageView = UIImageView(image: UIImage(named: "bg-dark"))
        imageView.contentMode = .scaleAspectFill
        collectionView.backgroundView = imageView
        collectionView.dataSource = self
        collectionView.collectionViewLayout = CircularCollectionViewLayout()
        
        let nib = UINib(nibName: "CircularCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "Cell")
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView,
        numberOfItemsInSection section: Int
    ) -> Int {
        return images.count
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell",
                                                            for: indexPath) as? CircularCollectionViewCell
        else { fatalError() }
        cell.imageName = images[indexPath.row]
        return cell
    }
}
