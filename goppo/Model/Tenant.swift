/*
See the LICENSE.txt file for this sample’s licensing information.

Abstract:
A representation of a single landmark.
*/

import Foundation

struct Tenant: Codable, Identifiable {
    var id: Int
    var name: String
    var operation_time: String
    var image: String
    var phone_number: String
    var qris_image: String
    var va_number: String
    var va_bank: String
    
    init(
        id: Int,
        name: String,
        operation_time: String,
        image: String,
        phone_number: String,
        qris_image: String,
        va_number: String,
        va_bank: String
    ) {
        self.id = id
        self.name = name
        self.operation_time = operation_time
        self.image = image
        self.phone_number = phone_number
        self.qris_image = qris_image
        self.va_number = va_number
        self.va_bank = va_bank
        
        
    }
}
