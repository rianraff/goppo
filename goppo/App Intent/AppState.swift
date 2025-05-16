//
//  AppState.swift
//  goppo
//
//  Created by Aldrian Raffi Wicaksono on 16/05/25.
//


import SwiftUI
import SwiftData
import Combine

class AppState: ObservableObject {
    static let shared = AppState()
    
    @Published var pendingSelectedOrder: Order? = nil
    @Published var shouldNavigateToReceipt: Bool = false
}