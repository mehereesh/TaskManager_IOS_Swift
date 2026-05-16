//
//  Task.swift
//  TaskManagerApp
//
//  Created by RPS on 16/05/26.
//

import Foundation

struct Task: Identifiable {
    
    let id = UUID()
    var title: String
    var isCompleted: Bool
}
