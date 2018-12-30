import UIKit

class InspirationCell: UICollectionViewCell {
  static let reuseIdentifier = String(describing: InspirationCell.self)
    
  @IBOutlet private weak var imageView: UIImageView!
  @IBOutlet private weak var imageCoverView: UIView!
  @IBOutlet private weak var titleLabel: UILabel!
  
  var inspiration: Inspiration? {
    didSet {
      guard let inspiration = inspiration else {
          assertionFailure("Expected inspiration model.")
          return
      }
      imageView.image = inspiration.backgroundImage
      titleLabel.text = inspiration.title
    }
  }
  
  override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
    super.apply(layoutAttributes)
    
    let standardHeight = UltravisualLayoutConstants.Cell.standardHeight
    let featuredHeight = UltravisualLayoutConstants.Cell.featuredHeight
    
    let heightRatio = (featuredHeight - frame.height) / (featuredHeight - standardHeight)
    let delta = 1 - heightRatio
    
    let minAlpha: CGFloat = 0.3
    let maxAlpha: CGFloat = 0.75
    let peaksAlphaDiff = maxAlpha - minAlpha
    let alphaRatio = peaksAlphaDiff * delta
    imageCoverView.alpha = maxAlpha - alphaRatio
  }

}
