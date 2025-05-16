//
//  OrderCollectionIntent.swift
//  goppo
//
//  Created by Aldrian Raffi Wicaksono on 16/05/25.
//

import AppIntents
import UIKit
import SwiftUI

struct CopyCollectionOrderIntent: AppIntent {
    static var title: LocalizedStringResource = "Copy Order from Collection"
    
    @Parameter(title: "Collection")
    var collection: CollectionEntity
    
    static var openAppWhenRun: Bool = true
    
    @MainActor
    func perform() async throws -> some IntentResult & ProvidesDialog {
        let model = try collection.model()
        
        let summary = model.order.orderItems.isEmpty
        ? "No items in this collection's order."
        : model.order.orderSummary
        
        // Copy to clipboard
        UIPasteboard.general.string = summary
        
        // Set the order in our app state
        AppState.shared.pendingSelectedOrder = model.order
        AppState.shared.shouldNavigateToReceipt = true
        
        return .result(dialog: "Copied order from \"\(model.name)\" to clipboard and opening receipt.")
    }
    
    static var parameterSummary: some ParameterSummary {
        Summary("Copy order from \(\.$collection)")
    }
}
