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
    }
    
    private func map(state: State) -> Props {
        Props(counter: state.counter, onIncrement: {
            store.dispatch(action: IncrementAction())
        })
    }
    
    var body: some View {
        let props = map(state: store.state)
        VStack {
            Text("\(props.counter)")
            Button("Increment") {
                props.onIncrement()
            }
        }
        .padding()
    }
}

#Preview {
    let store = Store(reducer: reducer)
    return ContentView().environmentObject(store)
}
