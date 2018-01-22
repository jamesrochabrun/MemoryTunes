/**
 * Copyright (c) 2017 Razeware LLC
 */

import UIKit
import ReSwift

final class GameViewController: UIViewController {
  
  @IBOutlet weak var collectionView: UICollectionView!
  @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
  var collectionDataSource: CollectionDataSource<CardCollectionViewCell, MemoryCard>?
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    store.subscribe(self) {
      $0.select {
        $0.gameState
      }
    }
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    store.unsubscribe(self)
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    //1 Dispatches fetchTunes to start fetching the images from iTunes API. (network call)
    store.dispatch(fetchTunes)
    collectionView.delegate = self
    loadingIndicator.hidesWhenStopped = true
    
    //2 Configures cells using CollectionDataSource which gets the appropriate model to configureCell.
    collectionDataSource = CollectionDataSource(cellIdentifier: "CardCell", models: [], configureCell: { (cell, model) -> CardCollectionViewCell in
      cell.configureCell(with: model)
      return cell
    })
    
    collectionView.dataSource = collectionDataSource
  }
  
  
  fileprivate func showGameFinishedAlert() {
    let alertController = UIAlertController(title: "Congratulations!",
                                            message: "You've finished the game!",
                                            preferredStyle: .alert)
    
    let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
    alertController.addAction(defaultAction)
    
    present(alertController, animated: true, completion: nil)
  }
}

// MARK: - UICollectionViewDelegate
extension GameViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    ///The final piece of the puzzle is to send a flip action when a card is selected. This will kick off the game logic and make associated state changes.
    store.dispatch(FlipCardAction(cardIndexToFlip: indexPath.row))
  }
}

//MARK: - StoreSubscriber
extension GameViewController: StoreSubscriber {
  
  /// This implements newState to handle state changes. It updates the datasource as well as:
  
  func newState(state: GameState) {
    
    collectionDataSource?.models = state.memoryCards
    collectionView.reloadData()
    
    //1 Updating the loading indicator status depending on the state.
    state.showLoading ? loadingIndicator.startAnimating() : loadingIndicator.stopAnimating()
    
    //2 Restarting the game and showing an alert when the game has been finished.
    if state.gameFinished {
      showGameFinishedAlert()
      /// restart
      store.dispatch(fetchTunes)
    }
  }
}











