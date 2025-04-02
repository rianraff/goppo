//
//  ReminderView.swift
//  goppo
//
//  Created by Michelle PL on 27/03/25.
//

import SwiftUI

struct ReminderView: View {
    var body: some View {
        
        VStack{
            VStack(alignment: .leading, spacing: 16.0){
                Text("Atur Pengingat")
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text("GOPPO siap ingatin kamu buat pesan makan siang tepat waktu!")
                    .font(.subheadline)
                    .foregroundStyle(.accent)
            }
            
            TimePicker()
            
            Reminder()
            
            Spacer()
            
            Button(action: {
                
            } ){
                Text("Simpan")
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 361, height: 48)
                    .background(Color.accent)
                    .cornerRadius(8)
            }
            Spacer()
        }
        .padding()
    }
}

//#Preview {
//    ReminderView()
//}
