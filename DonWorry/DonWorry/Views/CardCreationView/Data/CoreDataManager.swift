////
////  CoreDataManager.swift
////  DonWorry
////
////  Created by 임영후 on 2022/06/03.
////
//
//import SwiftUI
//import CoreData
//
//class CoreDataManager {
//
//    static let instance = CoreDataManager()
//
//    let container: NSPersistentContainer
//    let context: NSManagedObjectContext
//
//    init(inMemory: Bool = false) {
//        container = NSPersistentContainer(name: "DonworryModel")
//
//        if inMemory {
//            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
//        }
//
//        container.loadPersistentStores { description, error in
//            if let error = error {
//                print("Error loading Core Data \(error)")
//            }
//        }
//        context = container.viewContext
//    }
//
//    func save() {
//        do {
//            try context.save()
//        } catch let error {
//            print("Error saving Core Data \(error)")
//        }
//    }
//}
