//
//  HelloReduxApp.swift
//  HelloRedux
//
//  Created by Sajed Shaikh on 28/07/24.
//

import SwiftUI

@main
struct HelloReduxApp: App {
    
    let store = Store(reducer: appReducer, state: AppState())
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(store)
        }
    }
}
