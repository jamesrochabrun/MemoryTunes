/**
 * Copyright (c) 2017 Razeware LLC

 */

import ReSwift

//MARK: - There’s only one main Reducer function, but just as with state, reducers should be divided between sub-reducers.

func routingReducer(action: Action, state: RoutingState?) -> RoutingState {
  let state = state ?? RoutingState()
  return state
}

// Sub-reducers are responsible for initializing the start values of their corresponding sub-states.
