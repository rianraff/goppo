/*
 See the LICENSE.txt file for this sample’s licensing information.
 
 Abstract:
 A representation of a single landmark.
 */

import SwiftData
import SwiftUI

@Model
class Tenant {
    var id: Int
    var name: String
    var operation_time: String
    var phone_number: String
    var va_number: String
    var va_bank: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var qrisImageName: String
    var qrisImage: Image {
        Image(qrisImageName)
    }
    
    init(id: Int, name: String, operation_time: String, phone_number: String, va_number: String, va_bank: String, imageName: String, qrisImageName: String) {
        self.id = id
        self.name = name
        self.operation_time = operation_time
        self.phone_number = phone_number
        self.va_number = va_number
        self.va_bank = va_bank
        self.imageName = imageName
        self.qrisImageName = qrisImageName
    }
}
