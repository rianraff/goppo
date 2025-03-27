//
//  LoadTenant.swift
//  goppo
//
//  Created by Aldrian Raffi Wicaksono on 27/03/25.
//

import SwiftData
import Foundation

func loadTenantData() -> [LocalTenant] {
    guard let url = Bundle.main.url(forResource: "tenantData", withExtension: "json"),
          let data = try? Data(contentsOf: url) else {
        return []
    }
    let decoder = JSONDecoder()
    return (try? decoder.decode([LocalTenant].self, from: data)) ?? []
}

@MainActor
func seedTenantDatabase(context: ModelContext) async {
    let existingTenants = (try? context.fetch(FetchDescriptor<Tenant>())) ?? []
    
    // Avoid duplicate inserts
    if !existingTenants.isEmpty { return }
    
    let localTenants = loadTenantData()
    for localTenant in localTenants {
        let newTenant = localTenant.toTenant()
        context.insert(newTenant)
    }
    
    try? context.save()
    
    // Fetch and print the stored tenants
    let storedTenants = (try? context.fetch(FetchDescriptor<Tenant>())) ?? []
    
    print("Successfully inserted \(storedTenants.count) tenant items:")
    for tenant in storedTenants.prefix(5) { // Print first 5 tenants
        print("🍽️ \(tenant.name) - \(tenant.va_number) - \(tenant.va_bank)")
    }
}
