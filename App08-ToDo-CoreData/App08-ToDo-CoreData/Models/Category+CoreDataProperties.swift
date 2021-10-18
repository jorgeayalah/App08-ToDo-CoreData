//
//  Category+CoreDataProperties.swift
//  App08-ToDo-CoreData
//
//  Created by Alumno on 18/10/21.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var category_id: String?
    @NSManaged public var category: String?
    @NSManaged public var image: String?
    
    var category_wrapped: String{
        category ?? ""
    }
    var cateory_id_wrapped: String{
        category_id ?? ""
    }
    var image_wrapped: String{
        image ?? ""
    }

}

extension Category : Identifiable {

}
