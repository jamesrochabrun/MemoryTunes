/**
 * Copyright (c) 2017 Razeware LLC
 */

import UIKit
import ReSwift


final class MenuTableViewController: UITableViewController {
  
  // 1  TableDataSource is included in the starter and acts as a declarative data source for UITableView.
  var tableDataSource: TableDataSource<UITableViewCell, String>?
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    // 2 Subscribe to the menuState on viewWillAppear. Now you’ll get callbacks in newState every time menuState changes.
    store.subscribe(self) { subscriptor in
      subscriptor.select { state in
        state.menustate
      }
    }
    self.updateNavigationState()
  }
  
  private func updateNavigationState() {
    store.dispatch(RoutingAction(destination: .menu))
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    // 3 Unsubscribe, when needed.
    store.unsubscribe(self)
  }
}

// MARK: - StoreSubscriber
extension MenuTableViewController: StoreSubscriber {
  
  func newState(state: MenuState) {
    // 4 This is the declarative part. It’s where you populate the UITableView. You can clearly see in code how state is transformed into view.
    tableDataSource = TableDataSource(cellIdentifier:"TitleCell", models: state.menuTitles) { cell, model in
      cell.textLabel?.text = model
      cell.textLabel?.textAlignment = .center
      return cell
    }
    
    tableView.dataSource = tableDataSource
    tableView.reloadData()
  }
}

/*
 Note: As you might have noticed, ReSwift favors immutability – heavily using structures (values) not objects. It also encourages you to create declarative UI code. Why?
 The newState callback defined in StoreSubscriber passes state changes. You might be tempted to capture the value of the state in a property, like this:
 
 final class MenuTableViewController: UITableViewController {
 var currentMenuTitlesState: [String]
 ...
 But writing declarative UI code that clearly shows how state is transformed into view is cleaner and much easier to follow. The problem in this example is that UITableView doesn’t have a declarative API. That’s why I created TableDataSource to bridge the gap. If you’re interested in the details, take a look at TableDataSource.swift.
 */

// MARK: - Actions
extension MenuTableViewController {
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    var routeDestination: RoutingDestination = .categories
    switch indexPath.row {
    case 0: routeDestination = .game
    case 1: routeDestination = .categories
    default:
      break
    }
    // This sets routeDestination based on the row selected. It then uses dispatch to pass the RoutingAction to the Store.
    store.dispatch(RoutingAction(destination: routeDestination))
  }
}


















