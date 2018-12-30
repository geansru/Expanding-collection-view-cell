import UIKit

class InspirationCell: UICollectionViewCell {
  static let reuseIdentifier = String(describing: InspirationCell.self)
    
  @IBOutlet private var imageView: UIImageView!
  @IBOutlet private var imageCoverView: UIView!
  @IBOutlet private var titleLabel: UILabel!
  @IBOutlet private var detailsLabel: UILabel!
  @IBOutlet private var speakerLabel: UILabel!
  
  var inspiration: Inspiration? {
    didSet {
      guard let inspiration = inspiration else {
          assertionFailure("Expected inspiration model.")
          return
      }
      imageView.image = inspiration.backgroundImage
      titleLabel.text = inspiration.title
      detailsLabel.text = inspiration.roomAndTime
      speakerLabel.text = inspiration.speaker
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
    
    let scale = max(0.5, delta)
    titleLabel.transform = CGAffineTransform(scaleX: scale, y: scale)
    
    detailsLabel.alpha = delta
    speakerLabel.alpha = delta
  }

}
