//
//  LocalTenant.swift
//  goppo
//
//  Created by Aldrian Raffi Wicaksono on 27/03/25.
//

import Foundation

struct LocalTenant: Codable {
    let id: Int
    let name: String
    let operation_time: String
    let phone_number: String
    let va_number: String
    let va_bank: String
    let imageName: String
    let qrisImageName: String

    func toTenant() -> Tenant {
        return Tenant(id: id, name: name, operation_time: operation_time, phone_number: phone_number, va_number: va_number, va_bank: va_bank, imageName: imageName, qrisImageName: qrisImageName)
    }
}
