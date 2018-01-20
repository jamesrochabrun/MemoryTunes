/**
 * Copyright (c) 2017 Razeware LLC
 */

import ReSwift

///Because it’s good practice, you’ll group state variables into sub-state structures

struct RoutingState: StateType {
  var navigationState: RoutingDestination
  
  init(navState: RoutingDestination = .menu) {
    self.navigationState = navState
  }
}

// RoutingState contains navigationState, which represents the current destination on screen.






