//
//  ContentView.swift
//  TaskManagerApp
//
//  Created by RPS on 16/05/26.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var taskVM: TaskViewModel
    
    @State private var showAddTask = false
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                let summary = taskVM.taskSummary()
                
                VStack(spacing: 8) {
                    Text("Total Tasks: \(summary.total)")
                    Text("Completed Tasks: \(summary.completed)")
                }
                .padding()
                
                List {
                    
                    ForEach(taskVM.tasks) { task in
                        
                        TaskRowView(task: task) {
                            
                            taskVM.toggleTask(task: task)
                        }
                    }
                    .onDelete(perform: taskVM.deleteTask)
                }
            }
            .navigationTitle("Task Manager")
            .toolbar {
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    
                    Button {
                        showAddTask.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddTask) {
                
                AddTaskView()
            }
        }
    }
}
