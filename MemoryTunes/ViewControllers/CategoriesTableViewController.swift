/**
  Copyright (c) 2017 Razeware LLC
 */

import UIKit
import ReSwift

final class CategoriesTableViewController: UITableViewController {

  var tableDataSource: TableDataSource<UITableViewCell, Category>?

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    // 1 Subscribe to categoriesState changes on viewWillAppear and unsubscribe on viewWillDisappear.
    store.subscribe(self) { subscriptor in
      subscriptor.select { state in
        state.categoriesState
      }
    }
  }
  
  override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    store.unsubscribe(self)
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //2 Dispatch the ChangeCategoryAction when user selects a cell.
    store.dispatch(ChangeCategoryAction(categoryIndex: indexPath.row))
  }
}


// MARK: - StoreSubscriber

extension CategoriesTableViewController: StoreSubscriber {
  func newState(state: CategoriesState) {
    tableDataSource = TableDataSource(cellIdentifier:"CategoryCell", models: state.categories) {cell, model in
      cell.textLabel?.text = model.rawValue
      // 3 On newState, mark the cell for the currently selected category with a checkmark.
      cell.accessoryType = (state.currentCategorySelected == model) ? .checkmark : .none
      return cell
    }
    self.tableView.dataSource = tableDataSource
    self.tableView.reloadData()
  }
}
