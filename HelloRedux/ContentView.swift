//
//  ContentView.swift
//  HelloRedux
//
//  Created by Sajed Shaikh on 28/07/24.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var store: Store<AppState>
    @State private var isPresented: Bool = false
    
    struct Props {
        let counter: Int
        let onIncrement: () -> Void
        let onDecrement: () -> Void
        let onAdd: (Int) -> Void
        let onIncrementAsync: () -> Void
    }
    
    private func map(state: CounterState) -> Props {
        Props(counter: state.counter, onIncrement: {
            store.dispatch(action: IncrementAction())
        }, onDecrement: {
            store.dispatch(action: DecrementAction())
        }, onAdd: { Int in
            store.dispatch(action: AddAction(value: Int))
        }, onIncrementAsync: {
            store.dispatch(action: IncrementActionAsync())
        })
    }
    
    var body: some View {
        let props = map(state: store.state.counterState)
        VStack {
            Spacer()
            
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
            Button("Increment Async") {
                props.onIncrementAsync()
            }
            
            Spacer()
            
            Button("Add Task") {
                isPresented = true
            }
            
            Spacer()
        }
        .sheet(isPresented: $isPresented, content: {
            AddTaskView()
        })
    }
}

#Preview {
    let store = Store(reducer: appReducer, state: AppState())
    return ContentView().environmentObject(store)
}
