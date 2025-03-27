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
            
            Button(action: {}){
                Image(systemName: "chevron.right")
            }
        }
        .padding()
    }
}

#Preview {
    Reminder()
}
