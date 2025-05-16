//
//  CollectionEntity.swift
//  goppo
//
//  Created by Aldrian Raffi Wicaksono on 16/05/25.
//

import AppIntents
import SwiftData
import SwiftUI

struct CollectionEntity: AppEntity {
    static var typeDisplayRepresentation: TypeDisplayRepresentation {
        TypeDisplayRepresentation(
            name: "Collection",
            numericFormat: "\(placeholder: .int) collections"
        )
    }

    // Store only the UUID to be Swift 6-safe
    var id: UUID

    // Load the full model when needed
    func model() throws -> Collection {
        let context = try ModelContext(ModelContainer(for: Collection.self))
        let descriptor = FetchDescriptor<Collection>(predicate: #Predicate { $0.uuid == id })
        guard let collection = try context.fetch(descriptor).first else {
            throw NSError(domain: "CollectionEntity", code: 404, userInfo: [NSLocalizedDescriptionKey: "Collection not found"])
        }
        return collection
    }

    var displayRepresentation: DisplayRepresentation {
        // Attempt to load synchronously-safe preview (optional)
        if let collection = try? model() {
            return DisplayRepresentation(
                title: "\(collection.name)",
                subtitle: "\(collection.order.orderItems.count) item(s)"
            )
        } else {
            return DisplayRepresentation(title: "Unknown Collection")
        }
    }

    static let defaultQuery = CollectionEntityQuery()
}
