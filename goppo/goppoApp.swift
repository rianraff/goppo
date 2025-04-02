//
//  goppoApp.swift
//  goppo
//
//  Created by Aldrian Raffi Wicaksono on 26/03/25.
//

import SwiftUI
import Foundation
import SwiftData

@main
struct goppoApp: App {
    
    var body: some Scene {
        WindowGroup {
//            Tenants_Page(tenant: Tenant(id: 1,
//                                        name: "Kedai Aneka Rasa",
//                                        operation_time: "08.00 - 14.00",
//                                        phone_number: "085777129912",
//                                        va_number: "123456",
//                                        va_bank: "qris_kedai_aneka_rasa",
//                                        imageName : "kedai_aneka_rasa",
//                                        qrisImageName : "BCA"
//                                       )
            
            NavigationStack{
                HomeView()
            }
                .modelContainer(for: [Menu.self, Tenant.self], inMemory: false)
        }
    }
}
