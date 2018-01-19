/**
 * Copyright (c) 2017 Razeware LLC
 */

import ReSwift

// Actions initiate a change in the Store. An Action is a simple structure that can contain variables: the Action’s parameters. A Reducer handles a dispatched Action and changes the state of the app depending on the type of the action and its parameters.

/// RoutingAction changes the current routing destination.
struct RoutingAction: Action {
  let destination: RoutingDestination
}

