//
//  task_6_5App.swift
//  task-6.5
//
//  Created by Mirzabek on 23/09/22.
//
import SwiftUI

@main
struct TaskCoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
