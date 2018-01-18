/**
 * Copyright (c) 2017 Razeware LLC
 */

import ReSwift

var store = Store<AppState>(reducer: appReducer, state: nil)

//This creates a store global variable initialized by the appReducer. appReducer is the Store’s main Reducer, which contains instructions on how the store should change when it receives an Action. Because this is the initial creation, rather than an iterative change, you pass a nil state.

@UIApplicationMain

//MARK: - Step 3 create the main store
/// There’s only one Store in the app, and it has only one main Reducer.

class AppDelegate: UIResponder, UIApplicationDelegate {
  
  var window: UIWindow?
  var appRouter: AppRouter?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    
    let window = UIWindow(frame: UIScreen.main.bounds)
    self.window = window
    window.makeKeyAndVisible()
    appRouter = AppRouter(window: window)
    return true
  }
}

