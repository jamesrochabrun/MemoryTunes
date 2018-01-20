/**
 * Copyright (c) 2017 Razeware LLC
 */

import ReSwift

/// Helper struct
enum Category: String {
  case pop = "Pop"
  case electronic = "Electronic"
  case rock = "Rock"
  case metal = "Metal"
  case rap = "Rap"
}

struct CategoriesState: StateType {
  
  let categories: [Category]
  var currentCategorySelected: Category
  
  init(currentCategory: Category) {
    categories = [.pop, .electronic, .rock, .metal, .rap]
    currentCategorySelected = currentCategory
  }
}
