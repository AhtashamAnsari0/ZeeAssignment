//
//  CoreDataManager.swift
//  ZeeAssignment
//
//  Created by Ahtasham Ansari on 15/07/21.
//

/**CoreDataManager  for save and fetch search queries locally */
import UIKit
import CoreData

class CoreDataManager {
    static let shareInstance = CoreDataManager()
    private init() { }
    
    func saveSearchQuery(with searchText: String) {
        guard let manageObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return }
        let objSearchQuery = SearchQuery(context: manageObjectContext)
        objSearchQuery.query = searchText
        manageObjectContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        do  {
            try manageObjectContext.save()
        } catch {
        }
    }
    
    func fetchSearchQuery() ->[SearchQuery]?  {
        guard let manageObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext else { return nil}
        var searchList:[SearchQuery]?
        let fetchRequest = NSFetchRequest<SearchQuery>(entityName: "SearchQuery")
        do {
            searchList = try manageObjectContext.fetch(fetchRequest)
        } catch {
        }
        return searchList
    }

}
