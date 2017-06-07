//
//  EventData+CoreDataProperties.swift
//  Kaijosai2017
//
//  Created by Yosuke Onuma on 2017/06/07.
//  Copyright © 2017年 bunjitsu.programming. All rights reserved.
//

import Foundation
import CoreData


extension EventData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EventData> {
        return NSFetchRequest<EventData>(entityName: "EventData")
    }

    @NSManaged public var eventName: String?
    @NSManaged public var organName: String?
    @NSManaged public var category: String?

}
