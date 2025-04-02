//
//  Reminder.swift
//  goppo
//
//  Created by Michelle PL on 27/03/25.
//

import SwiftUI

struct Reminder: View {
    var body: some View {
        
            HStack{
                Text("Ulangi Setiap")
                Spacer()
                NavigationLink(destination: RepeatView()) {
                    Image(systemName: "chevron.right")
                }
            }
            .padding()
    }
}

#Preview {
    Reminder()
}
