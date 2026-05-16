//
//  TaskRowView.swift
//  TaskManagerApp
//
//  Created by RPS on 16/05/26.
//

import SwiftUI

struct TaskRowView: View {
    
    var task: Task
    
    // Closure Passing
    var onToggle: () -> Void
    
    var body: some View {
        
        HStack {
            
            VStack(alignment: .leading) {
                
                Text(task.title)
                    .font(.headline)
                    .strikethrough(task.isCompleted)
            }
            
            Spacer()
            
            Toggle("", isOn: Binding(
                get: {
                    task.isCompleted
                },
                set: { _ in
                    onToggle()
                }
            ))
            .labelsHidden()
        }
        .padding(.vertical, 5)
    }
}
