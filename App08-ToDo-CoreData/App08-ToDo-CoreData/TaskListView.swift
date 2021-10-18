//
//  ContentView.swift
//  App08-ToDo-CoreData
//
//  Created by A00828633 on 18/10/21.
//

import SwiftUI
import CoreData

struct TaskListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
//    @AppStorage("Counter") var counter : Int = 0
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Task.priority_id, ascending: true)],
        animation: .default)
    private var tasks: FetchedResults<Task>
    
    var body: some View {
        NavigationView{
            ZStack{
                List {
                    ForEach(tasks) { task in
                        NavigationLink(destination: TaskDetailView(task: Task(), newTask: task.task_wrapped, mode: .edit), label:{
                            Text(task.task_wrapped)
                        })
                    }
                    .onDelete(perform: deleteTasks)
                }
                VStack{
                    Spacer()
                    NavigationLink(destination: TaskDetailView(task: Task(), newTask: "", mode: .add), label: {
//                        Button(action: addTask){
                            Image(systemName: "plus.circle.fill")
                                .font(.largeTitle)
                                .foregroundColor(.green)
                                .padding(.bottom, 20)

                    })
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    EditButton()
                }
            }
        }
    }
    
    private func addTask() {
        withAnimation {
            let newTask = Task(context: viewContext)
            newTask.task = UUID().uuidString
            newTask.category_id = "01"
            newTask.priority_id = "01"
            newTask.isCompleted = false
            newTask.date_created = Date()
            newTask.due_date = Date()
            
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
    
    private func deleteTasks(offsets: IndexSet) {
        withAnimation {
            offsets.map { tasks[$0] }.forEach(viewContext.delete)
            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let taskFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}
