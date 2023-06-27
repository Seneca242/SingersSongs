//
//  Song+CoreDataProperties.swift
//  SingersSongs
//
//  Created by Dmitry Dmitry on 27.06.2023.
//
//

import Foundation
import CoreData


extension Song {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Song> {
        return NSFetchRequest<Song>(entityName: "Song")
    }

    @NSManaged public var title: String?
    @NSManaged public var releaseDate: String?
    @NSManaged public var singer: Singer?

}

extension Song : Identifiable {

}
