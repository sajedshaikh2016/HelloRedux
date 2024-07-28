//
//  AddTaskView.swift
//  HelloRedux
//
//  Created by Sajed Shaikh on 28/07/24.
//

import SwiftUI

struct AddTaskView: View {
    @EnvironmentObject var store: Store<AppState>
    @State private var name: String = ""
    
    struct Props {
        // Props
        let task: [Task]
        
        // Dispatch action
        let onTaskAdded: (Task) -> ()
    }
    
    private func map(state: TaskState) -> Props {
        return Props(task: state.tasks) { task in
            store.dispatch(action: AddTaskAction(task: task))
        }
    }
    
    var body: some View {
        let props = map(state: store.state.taskState)
        
        return VStack {
            TextField("Enter task", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Button("Add") {
                let task = Task(title: self.name)
                props.onTaskAdded(task)
            }
            
            List(props.task, id: \.id) { task in
                Text(task.title)
            }
            
            Spacer()
        }.padding()
    }
}

#Preview {
    let store = Store(reducer: appReducer, state: AppState())
    return AddTaskView().environmentObject(store)
}
