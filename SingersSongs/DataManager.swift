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
