/**
 * Copyright (c) 2017 Razeware LLC
 */

import UIKit
import Kingfisher

final class CardCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var cardImageView: UIImageView!
  
  func configureCell(with cardState: MemoryCard) {
   
    let url = URL(string: cardState.imageUrl)
    // 1 Uses the awesome Kingfisher library to cache images.
    cardImageView.kf.setImage(with: url)
    // 2 Shows the card image when a card is already guessed or the card is flipped.
    cardImageView.alpha = cardState.isAlreadyGuessed || cardState.isFlipped ? 1 : 0
  }
}
