//
//  TenantModel.swift
//  goppo
//
//  Created by Aldrian Raffi Wicaksono on 06/05/25.
//

import SwiftData
import Foundation
import SwiftUI

@Model
class Tenant: Identifiable {
    @Attribute(.unique) var uuid: UUID
    var name: String
    
    // Flattened OperationTime
    var openHour: Int
    var openMinute: Int
    var closeHour: Int
    var closeMinute: Int

    var phoneNumber: String

    var imageName: String
    var image: Image {
        Image(imageName)
    }

    var qrisImageName: String
    var qrisImage: Image {
        Image(qrisImageName)
    }

    @Relationship(inverse: \Menu.tenant)
    var menus: [Menu] = []

    // Computed property to get operationTime as struct
    var operationTime: OperationTime {
        OperationTime(
            openHour: openHour,
            openMinute: openMinute,
            closeHour: closeHour,
            closeMinute: closeMinute
        )
    }

    var formattedOperationTime: String {
        operationTime.formatted
    }

    init(
        name: String,
        openHour: Int,
        openMinute: Int,
        closeHour: Int,
        closeMinute: Int,
        phoneNumber: String,
        imageName: String,
        qrisImageName: String
    ) {
        self.uuid = UUID()
        self.name = name
        self.openHour = openHour
        self.openMinute = openMinute
        self.closeHour = closeHour
        self.closeMinute = closeMinute
        self.phoneNumber = phoneNumber
        self.imageName = imageName
        self.qrisImageName = qrisImageName
    }
}
