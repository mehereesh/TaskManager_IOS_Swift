//
//  TaskManagerAppApp.swift
//  TaskManagerApp
//
//  Created by RPS on 16/05/26.
//

import SwiftUI

@main
struct TaskManagerAppApp: App {
    
    @StateObject private var taskVM = TaskViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(taskVM)
        }
    }
}
