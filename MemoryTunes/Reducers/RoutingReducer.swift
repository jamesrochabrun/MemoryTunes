/**
 * Copyright (c) 2017 Razeware LLC

 */

import ReSwift

//MARK: - There’s only one main Reducer function, but just as with state, reducers should be divided between sub-reducers.

func routingReducer(action: Action, state: RoutingState?) -> RoutingState {
  var state = state ?? RoutingState()
  /// The switch checks if the passed action is a RoutingAction. If so, it uses its destination to change the RoutingState, then returns it.
  switch action {
  case let routingAction as RoutingAction:
    state.navigationState = routingAction.destination
  default: break
  }
  return state
}

// Sub-reducers are responsible for initializing the start values of their corresponding sub-states.
