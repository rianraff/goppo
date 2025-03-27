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
            HStack {
                Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
                    .foregroundColor(isSelected ? .accentColor : .accentColor)
            }
        }
    }
}


struct CollectionRadio: View {
    @State private var isSelected: Bool = false // State untuk radio button
    
    var body: some View {
        ZStack{
            HStack(spacing: 10.0){
                Image("b_bakso_besar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 62, height: 62)
                    .clipShape(Rectangle())
                    .cornerRadius(8)
                    .clipped()
                
                VStack(alignment: .leading){
                    Text("Koleksi 1")
                        .font(.body)
                        .fontWeight(.semibold)
                        .multilineTextAlignment(.leading)

    
                    Text("1x Telor Ceplok, 1x Nasi Putih, 1x Ayam Panggang, 1x Lemon Tea")
                        .font(.footnote)
                        .fontWeight(.regular)
                        .foregroundStyle(.secondary)
                        .frame(width: 218, height: 36, alignment: .leading) // Atur ukuran frame
                        .multilineTextAlignment(.leading) // Pusatkan teks jika perlu
                        .lineLimit(nil) // Izinkan teks melanjutkan ke baris berikutnya
                }
                
                Spacer()
 
                
                RadioButton(isSelected: isSelected) {
                    isSelected.toggle()
                }
            }
            .padding()
        }
        .frame(width: 361, height: 78)
        .background(Color.gray)
        .cornerRadius(10)

    }
}



#Preview {
    CollectionRadio()
}
