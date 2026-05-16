//
//  MemoryManager.swift
//  TaskManagerApp
//
//  Created by RPS on 16/05/26.
//

import Foundation

class Employee {
    
    let name: String
    
    init(name: String) {
        self.name = name
        print("\(name) Initialized")
    }
    
    deinit {
        print("\(name) Deallocated")
    }
}

class Department {
    
    let deptName: String
    
    // Weak Reference
    weak var employee: Employee?
    
    init(deptName: String) {
        self.deptName = deptName
    }
}
