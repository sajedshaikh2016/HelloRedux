//
//  HelloReduxApp.swift
//  HelloRedux
//
//  Created by Sajed Shaikh on 28/07/24.
//

import SwiftUI

@main
struct HelloReduxApp: App {
    
    let store = Store(reducer: reducer)
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(store)
        }
    }
}
