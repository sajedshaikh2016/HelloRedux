//
//  TaskReducer.swift
//  HelloRedux
//
//  Created by Sajed Shaikh on 28/07/24.
//

import Foundation

func taskReducer(_ state: TaskState, _ action: Action) -> TaskState {
    var state = state
    
    switch action {
        case let action as AddTaskAction:
            state.tasks.append(action.task)
        default:
            break
    }
    
    return state
}
