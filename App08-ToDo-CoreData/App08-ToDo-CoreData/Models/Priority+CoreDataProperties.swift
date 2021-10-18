//
//  Priority+CoreDataProperties.swift
//  App08-ToDo-CoreData
//
//  Created by Alumno on 18/10/21.
//
//

import Foundation
import CoreData


extension Priority {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Priority> {
        return NSFetchRequest<Priority>(entityName: "Priority")
    }

    @NSManaged public var priority_id: String?
    @NSManaged public var id: UUID?
    @NSManaged public var image: String?
    @NSManaged public var priority: String?
    
    var priority_wrapped: String {
        priority ?? ""
    }
    var priority_id_wrapped: String {
        priority_id ?? ""
    }
    var image_wrapped: String{
        image ?? ""
    }

}

extension Priority : Identifiable {

}
