//
//  TaskViewModel.swift
//  TaskManagerApp
//
//  Created by RPS on 16/05/26.
//
import Foundation
import SwiftUI

class TaskViewModel: ObservableObject {
    
    @Published var tasks: [Task] = []
    
    // Closure Example
    var onTaskAdded: ((String) -> Void)?
    
    init() {
        print("TaskViewModel Initialized")
    }
    
    deinit {
        print("TaskViewModel Deallocated")
    }
    
    // Add Task
    func addTask(title: String) {
        
        // Guard Example
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            print("Invalid Task")
            return
        }
        
        // Defer Example
        defer {
            print("Add Task Completed")
        }
        
        let task = Task(title: title, isCompleted: false)
        
        tasks.append(task)
        
        onTaskAdded?(title)
    }
    
    // Mark Complete
    func toggleTask(task: Task) {
        
        guard let index = tasks.firstIndex(where: { $0.id == task.id }) else {
            return
        }
        
        tasks[index].isCompleted.toggle()
    }
    
    // Delete Task
    func deleteTask(indexSet: IndexSet) {
        tasks.remove(atOffsets: indexSet)
    }
    
    // Tuple Example
    func taskSummary() -> (total: Int, completed: Int) {
        
        let completedCount = tasks.filter { $0.isCompleted }.count
        
        return (tasks.count, completedCount)
    }
}
