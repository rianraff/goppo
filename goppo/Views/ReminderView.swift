//
//  ReminderView.swift
//  goppo
//
//  Created by Michelle PL on 27/03/25.
//

import SwiftUI
import UserNotifications

struct ReminderView: View {
    @Binding var showReminder: Bool
    @State private var selectedTime = Date()
    @State private var repeatDays: [String] = []
    @State private var didLoadOnce = false
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack(alignment: .leading, spacing: 8.0) {
                    Text("Atur Pengingat")
                        .font(.title2)
                        .fontWeight(.semibold)
                    
                    Text("GOPPO siap ingatin kamu buat pesan makan siang tepat waktu!")
                        .font(.subheadline)
                        .foregroundStyle(.accent)
                }
                
                TimePicker(selectedTime: $selectedTime)
                
                NavigationLink(destination: RepeatView(repeatDays: $repeatDays)) {
                    HStack {
                        Text("Ulangi Setiap")
                            .foregroundStyle(Color.primary)
                        Spacer()
                        if !repeatDays.isEmpty {
                            Text(formatRepeatDays(repeatDays))
                                .font(.subheadline)
                                .foregroundStyle(.gray)
                        }
                        Image(systemName: "chevron.right")
                    }
                    .padding()
                }
                
                Spacer()
            }
            .padding()
            .onAppear(perform: handleOnAppear)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    Button(action: {
                        saveReminderTime()
                        scheduleNotifications()
                        showReminder = false
                        dismiss()
                    }) {
                        Text("Simpan")
                            .foregroundStyle(.accent)
                    }
                }
            }
        }
    }
    
    func formatRepeatDays(_ days: [String]) -> String {
        let indonesianWeekdays = [
            "Sun": "Min", "Mon": "Sen", "Tue": "Sel",
            "Wed": "Rab", "Thu": "Kam", "Fri": "Jum", "Sat": "Sab"
        ]

        let localizedDays = days.compactMap { indonesianWeekdays[$0] }
        
        return localizedDays.joined(separator: ", ")
    }
    
    func handleOnAppear() {
        if !didLoadOnce {
            loadReminderTime()
            requestNotificationPermission()
            didLoadOnce = true
        }
    }
    
    func requestNotificationPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
            if let error = error {
                print("Permission error: \(error.localizedDescription)")
            }
        }
    }
    
    func saveReminderTime() {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        let timeString = formatter.string(from: selectedTime)
        UserDefaults.standard.set(timeString, forKey: "savedReminderTime")
        UserDefaults.standard.set(repeatDays, forKey: "repeatDays")
    }
    
    func loadReminderTime() {
        if let timeString = UserDefaults.standard.string(forKey: "savedReminderTime") {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            if let savedDate = formatter.date(from: timeString) {
                selectedTime = savedDate
            }
        }
        if let savedDays = UserDefaults.standard.stringArray(forKey: "repeatDays") {
            repeatDays = savedDays
        }
    }
    
    func scheduleNotifications() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
        let content = UNMutableNotificationContent()
        content.title = "Pengingat dari GOPPO 😋"
        content.body = "Saatnya pesan makan siang!"
        content.sound = .default
        
        let calendar = Calendar.current
        let timeComponents = calendar.dateComponents([.hour, .minute], from: selectedTime)
        
        let weekdays = calendar.shortWeekdaySymbols  // ["Sun", "Mon", ..., "Sat"]
        
        for (index, day) in weekdays.enumerated() {
            if repeatDays.contains(day) {
                var components = timeComponents
                components.weekday = index + 1 // Sunday = 1, Monday = 2, etc.
                let trigger = UNCalendarNotificationTrigger(dateMatching: components, repeats: true)
                let id = "GOPPO_REMINDER_\(day)"
                let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}


#Preview {
    ReminderView(showReminder: .constant(true))
}

