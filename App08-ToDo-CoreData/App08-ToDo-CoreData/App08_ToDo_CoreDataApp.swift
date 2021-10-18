//
//  App08_ToDo_CoreDataApp.swift
//  App08-ToDo-CoreData
//
//  Created by Alumno on 18/10/21.
//

import SwiftUI

@main
struct App08_ToDo_CoreDataApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            TaskListView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
