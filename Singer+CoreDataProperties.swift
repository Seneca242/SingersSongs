//
//  Singer+CoreDataProperties.swift
//  SingersSongs
//
//  Created by Dmitry Dmitry on 27.06.2023.
//
//

import Foundation
import CoreData


extension Singer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Singer> {
        return NSFetchRequest<Singer>(entityName: "Singer")
    }

    @NSManaged public var name: String?
    @NSManaged public var song: NSSet?

}

// MARK: Generated accessors for song
extension Singer {

    @objc(addSongObject:)
    @NSManaged public func addToSong(_ value: Song)

    @objc(removeSongObject:)
    @NSManaged public func removeFromSong(_ value: Song)

    @objc(addSong:)
    @NSManaged public func addToSong(_ values: NSSet)

    @objc(removeSong:)
    @NSManaged public func removeFromSong(_ values: NSSet)

}

extension Singer : Identifiable {

}
