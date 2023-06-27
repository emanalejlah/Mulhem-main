//
//  Model .swift
//  Molhem
//
//  Created by eman alejilah on 19/10/1444 AH.
//

import Foundation
import CoreData

struct ChatProvider {
    static let shared = ChatProvider()
    
    let persistenceController = PersistenceController.shared
    var viewContext: NSManagedObjectContext {
        persistenceController.container.viewContext
    }
    
    func _search() -> [ChatEntity] {
        var items = [ChatEntity]()
        let request = ChatEntity.fetchRequest()
        
        do {
            items = try viewContext.fetch(request)
        } catch {
            debugPrint("error retrieving cards: \(error)")
        }
        
        return items
    }
    
    func search() -> [ChatModel] {
        return _search().map { $0.toModel }
    }
    
    
    func saveOrUpdate(_ item: ChatModel) {
        let request = ChatEntity.fetchRequest()
        request.predicate = NSPredicate(format: "id == %@", item.id.uuidString)
        
        if let old = try? viewContext.fetch(request).first {
            // 1. update
//             It is often used in the context of software development or data management, and refers to the act of making changes or improvements to a program or database to ensure it is current and functioning properly.
            old.id = item.id
            old.isAI = item.isGPT
            old.message = item.message
        } else {
            // 2. add
//It is often used in the context of software development or data management to refer to the act of adding new features, functions, or data to an existing program or database.
            let new = ChatEntity(context: viewContext)
            new.id = item.id
            new.isAI = item.isGPT
            new.message = item.message
        }
        
        if viewContext.hasChanges {
          do {
            try viewContext.save()
          } catch {
            let nserror = error as NSError
            debugPrint("Unresolved error \(nserror), \(nserror.userInfo)")
          }
        }
    }
    
    func clear() {
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: ChatEntity.fetchRequest())
        
        do {
            try viewContext.execute(deleteRequest)
            try viewContext.save()
        } catch {
            debugPrint("error retrieving cards: \(error)")
        }
    }
    
    func remove(_ indexSet: IndexSet) {
        let items = _search()
        for index in indexSet {
            let entity = items[index]
            
            viewContext.delete(entity)
            if viewContext.hasChanges {
              do {
                try viewContext.save()
              } catch {
                let nserror = error as NSError
                debugPrint("Unresolved error \(nserror), \(nserror.userInfo)")
              }
            }
        }
    }
}
