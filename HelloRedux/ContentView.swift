//
//  ContentView.swift
//  HelloRedux
//
//  Created by Sajed Shaikh on 28/07/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var store: Store
    
    struct Props {
        let counter: Int
        let onIncrement: () -> Void
        let onDecrement: () -> Void
        let onAdd: (Int) -> Void
    }
    
    private func map(state: State) -> Props {
        Props(counter: state.counter, onIncrement: {
            store.dispatch(action: IncrementAction())
        }) {
            store.dispatch(action: DecrementAction())
        } onAdd: { Int in
            store.dispatch(action: AddAction(value: Int))
        }
        
    }
    
    var body: some View {
        let props = map(state: store.state)
        VStack {
            Text("\(props.counter)")
            Button("Increment") {
                props.onIncrement()
            }
            Button("Decrement") {
                props.onDecrement()
            }
            Button("Add") {
                props.onAdd(100)
            }
        }
        .padding()
    }
}

#Preview {
    let store = Store(reducer: reducer)
    return ContentView().environmentObject(store)
}
