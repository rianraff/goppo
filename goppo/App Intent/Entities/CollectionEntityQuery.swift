//
//  CollectionEntityQuery.swift
//  goppo
//
//  Created by Aldrian Raffi Wicaksono on 16/05/25.
//

import AppIntents
import SwiftData

struct CollectionEntityQuery: EntityQuery {
    func entities(for identifiers: [UUID]) async throws -> [CollectionEntity] {
        let context = try ModelContext(ModelContainer(for: Collection.self))

        let descriptor = FetchDescriptor<Collection>(
            predicate: #Predicate { identifiers.contains($0.uuid) }
        )

        let collections = try context.fetch(descriptor)

        return collections.map { CollectionEntity(id: $0.uuid) }
    }

    func suggestedEntities() async throws -> [CollectionEntity] {
        let context = try ModelContext(ModelContainer(for: Collection.self))

        var descriptor = FetchDescriptor<Collection>(
            sortBy: [SortDescriptor(\Collection.name)]
        )
        descriptor.fetchLimit = 5

        let collections = try context.fetch(descriptor)
        return collections.map { CollectionEntity(id: $0.uuid) }
    }

    func defaultResult() async -> CollectionEntity? {
        guard let context = try? ModelContext(ModelContainer(for: Collection.self)) else {
            return nil
        }

        var descriptor = FetchDescriptor<Collection>(
            sortBy: [SortDescriptor(\Collection.name)]
        )
        descriptor.fetchLimit = 1

        if let first = try? context.fetch(descriptor).first {
            return CollectionEntity(id: first.uuid)
        }

        return nil
    }

}


