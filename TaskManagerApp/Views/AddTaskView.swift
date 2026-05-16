//
//  AddTaskView.swift
//  TaskManagerApp
//
//  Created by RPS on 16/05/26.
//

import SwiftUI

struct AddTaskView: View {
    
    @EnvironmentObject var taskVM: TaskViewModel
    @Environment(\.dismiss) var dismiss
    
    @State private var taskTitle = ""
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 20) {
                
                TextField("Enter Task", text: $taskTitle)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Add Task") {
                    
                    taskVM.addTask(title: taskTitle)
                    
                    dismiss()
                }
                .padding()
                
                Spacer()
            }
            .navigationTitle("Add Task")
        }
        .onAppear {
            
            // Closure + Memory Management
            taskVM.onTaskAdded = { [weak taskVM] title in
                
                guard let taskVM = taskVM else {
                    return
                }
                
                print("Task Added: \(title)")
                print("Total Tasks: \(taskVM.tasks.count)")
            }
        }
    }
}
