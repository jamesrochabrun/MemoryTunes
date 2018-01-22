/**
 * Copyright (c) 2017 Razeware LLC
 */

import ReSwift

func gameReducer(action: Action, state: GameState?) -> GameState {
  
  var state = state ?? GameState(memoryCards: [], showLoading: false, gameFinished: false)
  
  switch action {
    // 1 On FetchTunesAction, this sets showLoading to true.
  case _ as FetchTunesAction:
    state = GameState(memoryCards: [], showLoading: true, gameFinished: false)
    // 2  On SetCardsAction, this randomizes the cards and sets showLoading to false. generateNewCards can be found in MemoryGameLogic.swift, which is included with the starter.
  case let setCardsAction as SetCardsAction:
    state.memoryCards = generateNewCards(with: setCardsAction.cardImageUrls)
    state.showLoading = false
    
    //3 For a FlipCardAction, flipCard changes the state of the memory cards based on the cardIndexToFlip and other game logic. hasFinishedGame is called to determine if the game has finished and update the state accordingly. Both functions can be found in MemoryGameLogic.swift.
  case let flipCardAction as FlipCardAction:
    state.memoryCards = flipCard(index: flipCardAction.cardIndexToFlip, memoryCards: state.memoryCards)
    state.gameFinished = hasFinishedGame(cards: state.memoryCards)
  default: break
  }
  return state
}
