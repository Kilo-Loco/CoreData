//
//  Person+CoreDataProperties.swift
//  Saving Data BayBeh
//
//  Created by Kyle Lee on 7/2/17.
//  Copyright © 2017 Kyle Lee. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var medicamento: String?
    @NSManaged public var inicio: String?
    @NSManaged public var frequencia: String?
    @NSManaged public var mododaaplicacao: String?
    @NSManaged public var periododaaplicacao: String?
    @NSManaged public var proposito: String?

}
