//
//  OperationTime.swift
//  goppo
//
//  Created by Aldrian Raffi Wicaksono on 06/05/25.
//

import Foundation
import SwiftData

@Model
class OperationTime: Codable {
    var open: DateComponents
    var close: DateComponents

    init(openHour: Int, openMinute: Int, closeHour: Int, closeMinute: Int) {
        self.open = DateComponents(hour: openHour, minute: openMinute)
        self.close = DateComponents(hour: closeHour, minute: closeMinute)
    }

    // Custom Codable conformance
    enum CodingKeys: String, CodingKey {
        case openHour, openMinute, closeHour, closeMinute
    }

    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let openHour = try container.decode(Int.self, forKey: .openHour)
        let openMinute = try container.decode(Int.self, forKey: .openMinute)
        let closeHour = try container.decode(Int.self, forKey: .closeHour)
        let closeMinute = try container.decode(Int.self, forKey: .closeMinute)

        self.open = DateComponents(hour: openHour, minute: openMinute)
        self.close = DateComponents(hour: closeHour, minute: closeMinute)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(open.hour ?? 0, forKey: .openHour)
        try container.encode(open.minute ?? 0, forKey: .openMinute)
        try container.encode(close.hour ?? 0, forKey: .closeHour)
        try container.encode(close.minute ?? 0, forKey: .closeMinute)
    }

    var formatted: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short

        let calendar = Calendar.current
        let openDate = calendar.date(from: open) ?? Date()
        let closeDate = calendar.date(from: close) ?? Date()

        return "\(formatter.string(from: openDate)) - \(formatter.string(from: closeDate))"
    }
}
