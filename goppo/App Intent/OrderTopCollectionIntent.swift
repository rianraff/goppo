//
//  OrderCollectionIntent.swift
//  goppo
//
//  Created by Aldrian Raffi Wicaksono on 16/05/25.
//

import AppIntents
import SwiftData
import UIKit

struct OrderTopCollectionIntent: AppIntent {
    static var title: LocalizedStringResource = "Open First Saved Collection"
    static var openAppWhenRun: Bool = true
    
    @MainActor
    func perform() async throws -> some IntentResult & ProvidesDialog & ReturnsValue<String> {
        let container = try ModelContainer(for: Menu.self, Tenant.self, Collection.self)
        let context = container.mainContext
        
        var fetchDescriptor = FetchDescriptor<Collection>(
            sortBy: [SortDescriptor(\Collection.name)]
        )
        fetchDescriptor.fetchLimit = 1
        
        let collections = try context.fetch(fetchDescriptor)
        
        guard let firstCollection = collections.first else {
            return .result(value: "No collections found", dialog: "I couldn't find any collections.")
        }
        
        UIPasteboard.general.string = firstCollection.order.orderSummary
        
        return .result(value: "Copied to clipboard", dialog: "I've copied the order summary to your clipboard.")
    }
}
