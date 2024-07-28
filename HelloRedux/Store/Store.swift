//
//  Store.swift
//  HelloRedux
//
//  Created by Sajed Shaikh on 28/07/24.
//

import Foundation

typealias Reducer = (_ state: State, _ action: Action) -> State

struct State {
    var counter: Int = 0
}

protocol Action {
    
}

func reducer(_ state: State, _ action: Action) -> State {
    return state
}

class Sore {
    var reducer: Reducer
    var state: State
    
    init(reducer: @escaping Reducer, state: State = State()) {
        self.reducer = reducer
        self.state = state
    }
}
