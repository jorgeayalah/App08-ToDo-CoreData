//
//  Task+CoreDataProperties.swift
//  App08-ToDo-CoreData
//
//  Created by Alumno on 18/10/21.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var task: String?
    @NSManaged public var category_id: String?
    @NSManaged public var priority_id: String?
    @NSManaged public var isCompleted: Bool
    @NSManaged public var date_created: Date?
    @NSManaged public var due_date: Date?

    var task_wrapped: String{
        task ?? ""
    }
    var category_id_wrapped: String{
        category_id ?? ""
    }
    var priority_id_wrapped: String{
        priority_id ?? ""
    }
}

extension Task : Identifiable {

}
