/**
 * Copyright (c) 2017 Razeware LLC
 */

import ReSwift

private struct CategoriesReducerConstants {
  static let userDefaultsCategoryKey = "currentCategoryKey"
}

private typealias C = CategoriesReducerConstants

func categoriesReducer(action: Action, state: CategoriesState?) -> CategoriesState {
  
  var currentCategory: Category = .pop
  //1 Loads the current category from UserDefaults if available, and uses it to instantiate CategoriesState if it doesn’t already exist.
  if let loadedCategory = getCurrentCategoryStateFromUserDefaults() {
    currentCategory = loadedCategory
  }
  var state = state ?? CategoriesState(currentCategory: currentCategory)
  
  switch action {
  case let changeCategoryAction as ChangeCategoryAction:
    //2 Reacts to ChangeCategoryAction by updating the state and saving the new category to UserDefaults.
    let newCategory = state.categories[changeCategoryAction.categoryIndex]
    state.currentCategorySelected = newCategory
    saveCurrentCategoryStateToUserDefaults(category: newCategory)
  default:
    break
  }
  return state
}

// 3 getCurrentCategoryStateFromUserDefaults is a helper function that loads the category from UserDefaults.
private func getCurrentCategoryStateFromUserDefaults() -> Category? {
  let userDefaults = UserDefaults.standard
  let rawValue = userDefaults.string(forKey: C.userDefaultsCategoryKey)
  if let rawValue = rawValue {
    return Category(rawValue: rawValue)
  } else {
    return nil
  }
}

// 4 saveCurrentCategoryStateToUserDefaults is a helper function that saves the category to UserDefaults.
private func saveCurrentCategoryStateToUserDefaults(category: Category) {
  let userDefaults = UserDefaults.standard
  userDefaults.set(category.rawValue, forKey: C.userDefaultsCategoryKey)
  userDefaults.synchronize()
}





