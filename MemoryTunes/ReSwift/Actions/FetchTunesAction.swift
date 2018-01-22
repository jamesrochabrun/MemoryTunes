/**
 * Copyright (c) 2017 Razeware LLC
 */

// MARK: - Asynchronous action!

import ReSwift

/// Helper function
/// fetchTunes fetches the images using iTunesAPI (included with the starter). In the closure you’re dispatching a SetCardsAction with the result. Asynchronous tasks in ReSwift are that simple: just dispatch an action later in time, when complete. That’s it.
/// fetchTunes returns FetchTunesAction which will be used to signify the fetch has kicked off.


func fetchTunes(state: AppState, store: Store<AppState>) -> FetchTunesAction {
  
  iTunesAPI.searchFor(category: state.categoriesState.currentCategorySelected.rawValue) { imageUrls in
    store.dispatch(SetCardsAction(cardImageUrls: imageUrls))
  }
  return FetchTunesAction()
}

struct FetchTunesAction: Action {
  
}
