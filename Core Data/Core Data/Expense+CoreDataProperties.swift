//
//  Expense+CoreDataProperties.swift
//  Core Data
//
//  Created by Sarah Wooldridge on 11/1/18.
//  Copyright © 2018 Sarah Wooldridge. All rights reserved.
//
//

import Foundation
import CoreData


extension Expense {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Expense> {
        return NSFetchRequest<Expense>(entityName: "Expense")
    }

    @NSManaged public var name: String?
    @NSManaged public var amount: Double
    @NSManaged public var rawDate: NSDate?

}
