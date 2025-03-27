//
//  ReminderView.swift
//  goppo
//
//  Created by Michelle PL on 27/03/25.
//

import SwiftUI

struct ReminderView: View {
    var body: some View {
        
        //ini nanti pake navigation link
        HStack{
            Image(systemName: "chevron.backward")
            
            Spacer()
            
            Text("Pengingat")
                .font(.headline)
                .fontWeight(.semibold)
            
            Spacer()
        }
        
        VStack(alignment: .leading, spacing: 16.0){
            Text("Atur Pengingat")
                .font(.title2)
                .fontWeight(.semibold)
            
            Text("GOPPO siap ingatin kamu buat pesan makan siang tepat waktu!")
                .font(.subheadline)
                .foregroundStyle(.accent)
        }
        
        TimePicker()
        
        Button(action: {} ){
            Text("Simpan")
                .foregroundStyle(.white)
                .font(.subheadline)
                .fontWeight(.semibold)
                .frame(width: 361, height: 48)
                .background(Color.accent)
                .cornerRadius(8)
        }
        
    }
}

#Preview {
    ReminderView()
}
