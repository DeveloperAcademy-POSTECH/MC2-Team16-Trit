// https://www.raywenderlich.com/1702-uicollectionview-custom-layout-tutorial-a-spinning-wheel
//
//  CircularCollectionViewLayout.swift
//  CardCollectioinView
//
//  Created by Woody on 2022/06/01.
//

import UIKit

class CircularCollectionViewLayoutAttributes: UICollectionViewLayoutAttributes {
    
    var anchorPoint = CGPoint(x: 0.5, y: 0.5)
    var angle: CGFloat = 0 {
        didSet {
            zIndex = Int(angle * -10000)
            transform = CGAffineTransform(rotationAngle: angle)
        }
    }
    
    override func copy(with zone: NSZone? = nil) -> Any {
        let copiedAttributes: CircularCollectionViewLayoutAttributes =
        super.copy(with: zone) as! CircularCollectionViewLayoutAttributes
        copiedAttributes.anchorPoint = self.anchorPoint
        copiedAttributes.angle = self.angle
        return copiedAttributes
    }
}

final class CircularCollectionViewLayout: UICollectionViewLayout {
    
    private var currentContentOffsetX: CGFloat = 0
    private let itemSize = CGSize(width: 160, height: 215)
    private var angleAtExtreme: CGFloat {
        guard let collectionView = collectionView else { return 0 }
        let numberOfItems: Int = collectionView.numberOfItems(inSection: 0)
        guard numberOfItems > 0 else { return 0 }
        
        return -CGFloat(numberOfItems - 1) * anglePerItem
    }
    private var angle: CGFloat {
        guard let collectionView = collectionView else { return 0 }
        let maxContentOffset = collectionViewContentSize.width - collectionView.bounds.width
        
        return angleAtExtreme * collectionView.contentOffset.x / maxContentOffset
    }
    
    private var radius: CGFloat = 500 {
        didSet {
            invalidateLayout()
        }
    }
    
    private var anglePerItem: CGFloat {
        return atan((itemSize.width + 20) / radius)
    }
    
    private var attributesList = [CircularCollectionViewLayoutAttributes]()
    
    override var collectionViewContentSize: CGSize {
        guard let collectionView = collectionView else { return .zero }
        let numberOfItems = collectionView.numberOfItems(inSection: 0)
        let width: CGFloat = CGFloat(numberOfItems) * itemSize.width
        let height: CGFloat = collectionView.bounds.height
        
        return CGSize(width: width, height: height)
    }
    
    override func prepare() {
        super.prepare()
        guard let collectionView = collectionView else { return }
        let numberOfItems = collectionView.numberOfItems(inSection: 0)
        
        let centerX = collectionView.contentOffset.x + (collectionView.bounds.width / 2.0)
        let anchorPointY = ((itemSize.height / 2.0) + radius) / (itemSize.height)
        
        attributesList = (0..<numberOfItems).map { (i)
            -> CircularCollectionViewLayoutAttributes in
            
            let attributes = CircularCollectionViewLayoutAttributes(forCellWith: IndexPath(item: i,
                                                                                           section: 0))
            attributes.size = self.itemSize
            
            attributes.center = CGPoint(x: centerX,
                                        y: self.collectionView!.bounds.midY)
            
            attributes.angle = self.angle + (self.anglePerItem * CGFloat(i))
            attributes.anchorPoint = CGPoint(x: 0.5, y: anchorPointY)
            
            return attributes
        }
    }
    
    override func targetContentOffset(
        forProposedContentOffset proposedContentOffset: CGPoint,
        withScrollingVelocity velocity: CGPoint
    ) -> CGPoint {
        guard let collectionView = collectionView else { return .zero }
        
        var finalContentOffset = proposedContentOffset

        let maxContentOffset: CGFloat = collectionViewContentSize.width - collectionView.bounds.width
        let factor = -angleAtExtreme / maxContentOffset
        
        var multiplier: CGFloat
        print(velocity.x)
        let proposedAngle = proposedContentOffset.x*factor
        if (velocity.x > 0) {
//            let proposedAngle = (currentContentOffsetX + 1) * factor
            let ratio = proposedAngle / anglePerItem
            multiplier = ceil(ratio)
        } else if (velocity.x < 0) {
//            let proposedAngle = (currentContentOffsetX - 1) * factor
            let ratio = proposedAngle / anglePerItem
            multiplier = floor(ratio)
        } else {
//            let proposedAngle = (currentContentOffsetX - 1) * factor
            let ratio = proposedAngle / anglePerItem
            multiplier = round(ratio)
        }
        finalContentOffset.x = multiplier * anglePerItem / factor
        currentContentOffsetX = finalContentOffset.x
        
        return finalContentOffset
    }
    
    override func shouldInvalidateLayout(
        forBoundsChange newBounds: CGRect
    ) -> Bool {
        return true
    }
    
    override func layoutAttributesForElements(
        in rect: CGRect
    ) -> [UICollectionViewLayoutAttributes]? {
        return attributesList
    }
    
    override func layoutAttributesForItem(
        at indexPath: IndexPath
    ) -> UICollectionViewLayoutAttributes? {
        return attributesList[indexPath.row]
    }
    
    override class var layoutAttributesClass: AnyClass {
        CircularCollectionViewLayoutAttributes.self
    }
}

struct DeviceInfo {
    static var width: CGFloat {
        return UIScreen.main.bounds.width
    }
}
