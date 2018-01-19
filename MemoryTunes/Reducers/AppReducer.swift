/**
 * Copyright (c) 2017 Razeware LLC
 */

import ReSwift

//MARK: - Step 2 - Create the main reducer

// Reducers are the only blocks that can directly change the current value of the AppState held by the Store. Only Actions can initiate a Reducer to start changing the current application state. The Reducer changes the current value of AppState depending on the type of Action it receives.

func appReducer(action: Action, state: AppState?) -> AppState {
  
  //This adds the routingState argument to the AppState initializer. action and state from the main reducer are passed to routingReducer to determine the new state. Get used to this routine, because you’ll have to repeat it for each sub-state and sub-reducer you create.
  
  let routingState = routingReducer(action: action, state: state?.routingState)
  let menuState = menuReducer(action: action, state: state?.menustate)
  
  return AppState(routingState: routingState, menustate: menuState)
}







