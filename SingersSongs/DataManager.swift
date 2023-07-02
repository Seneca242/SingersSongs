//
//  DataManager.swift
//  SingersSongs
//
//  Created by Dmitry Dmitry on 27.06.2023.
//

import Foundation
import CoreData

class DataManager {
    static let shared = DataManager()
    
    private let persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "SingersSongs")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    private let viewContext: NSManagedObjectContext
    
    private init(){
        viewContext = persistentContainer.viewContext
    }
    
    func createSinger(name: String) -> Singer {
        let singer = Singer(context: viewContext)
        singer.name = name
        return singer
    }
    
    func createSong(title: String, realeseData: String, singer: Singer) -> Song {
        let song = Song(context: viewContext)
        song.title = title
        song.releaseDate = realeseData
        song.singer = singer
        return song
    }
    
    func fetchSingers() -> [Singer] {
        let request: NSFetchRequest<Singer> = Singer.fetchRequest()
        var fetchedSingers: [Singer] = []
        
        do {
            fetchedSingers = try viewContext.fetch(request)
        } catch let error {
            print("Error fetching singers \(error)")
        }
        return fetchedSingers
    }
    
    func fetchSongs(singer: Singer) -> [Song] {
        let request: NSFetchRequest<Song> = Song.fetchRequest()
        request.predicate = NSPredicate(format: "singer = %@", singer)
        request.sortDescriptors = [NSSortDescriptor(key: "releaseDate", ascending: false)]
        var fetchedSongs: [Song] = []
        
        do {
            fetchedSongs = try viewContext.fetch(request)
        } catch let error {
            print("Error fetching songs \(error)")
        }
        return fetchedSongs
    }
    
    

    // MARK: - Core Data Saving support

    func saveContext () {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}
