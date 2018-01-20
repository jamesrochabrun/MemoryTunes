/**
 * Copyright (c) 2017 Razeware LLC
 */

import ReSwift

// Helper struct
struct MemoryCard {
  
  let imageUrl: String
  var isFlipped: Bool
  var isAlreadyGuessed: Bool
}

struct GameState: StateType {
  var memoryCards: [MemoryCard]
  //1 the loading indicator is visible or not
  var showLoading: Bool
  //2 the game is finished
  var gameFinished: Bool
}



