/**
 * Copyright (c) 2017 Razeware LLC
 */

import ReSwift

func gameReducer(action: Action, state: GameState?) -> GameState {
  let state = state ?? GameState(memoryCards: [], showLoading: false, gameFinished: false)
  return state
}
