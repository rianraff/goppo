//
//  CollectionRadio.swift
//  goppo
//
//  Created by Aissya Jelitawati on 27/03/25.
//

import SwiftUI

struct RadioButton: View {
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
        Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
            .foregroundColor(isSelected ? .accentColor : .gray)
            .font(.system(size: 16))
            .imageScale(.large)
            .accessibilityLabel(isSelected ? "Terpilih" : "Tidak terpilih")
            
        }
        .buttonStyle(PlainButtonStyle())
    }
}


struct CollectionRadio: View {
    @State private var isSelected: Bool = false // State untuk radio button
    
    var body: some View {
        
        HStack(alignment: .center, spacing: 12) {
            Image("b_bakso_besar")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 62, height: 62)
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            Text("Koleksi 1")
                .font(.body)
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .lineLimit(nil)
                .fixedSize(horizontal: false, vertical: true)
            
            Spacer(minLength: 8)

            RadioButton(isSelected: isSelected) {
                isSelected.toggle()
            }
            .padding(.top, 4)
        }
        .padding(10)
        .frame(maxWidth: .infinity, minHeight: 84, alignment: .leading)
        .background(Color.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10).stroke(isSelected ? Color.accentColor : Color.clear, lineWidth: 1.5)
                )
        
        .onTapGesture {
            isSelected.toggle()
        }
        .animation(.easeInOut, value: isSelected)
        
    }
}



#Preview {
    CollectionRadio()
}
