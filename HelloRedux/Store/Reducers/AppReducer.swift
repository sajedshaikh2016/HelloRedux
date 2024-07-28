//
//  AppReducer.swift
//  HelloRedux
//
//  Created by Sajed Shaikh on 28/07/24.
//

import Foundation

func appReducer(_ state: AppState, _ action: Action) -> AppState {
    var state = state
    state.counterState = counterReducer(state.counterState, action)
    return state
}
