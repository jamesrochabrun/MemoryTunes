/**
 * Copyright (c) 2017 Razeware LLC
 */

import ReSwift

//Anything can be a StoreSubscriber, but most of the time it will be a view reacting to state changes. Your objective is to make MenuTableViewController show two different menu options. It’s time for your State/Reducer routine!

struct MenuState: StateType {
  var menuTitles: [String]
  init() {
    menuTitles = ["New Game", "Choose Category"]
  }
}
