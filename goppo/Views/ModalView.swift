//
//  ModalCollectionView.swift
//  goppo
//
//  Created by Aissya Jelitawati on 28/03/25.
//

import SwiftUI

struct ModalView: View {
    var body: some View {
        VStack(spacing: 12) {
            Spacer()
            
            VStack (alignment: .leading, spacing: 8.0) {
                
                Text("Simpan ke Koleksi")
                    .font(.title2)
                    .fontWeight(.semibold)

                Text("Tambahkan menu ke koleksi pesanan andalanmu!")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
            .padding(.trailing)
            
            ScrollView {
                VStack (spacing: 0) {
                    CollectionRadio()
                    CollectionRadio()
                    CollectionRadio()
                }
            }
            .frame(height: 250)
            
            VStack (spacing: 12) {
                Button(action: {} ){
                    HStack{
                        Image(systemName: "plus")
                        Text("Tambah Koleksi Baru")
                    }
                    .foregroundStyle(Color.accentColor)
                    .font(.body.weight(.semibold))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.accentColor, lineWidth: 2)
                    )
                }
                Button(action: {} ){
                    HStack{
                        Text("Simpan")
                    }
                    .foregroundStyle(Color.white)
                    .font(.body.weight(.semibold))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .background(Color.accent)
                    .cornerRadius(8)
                }
            }
            
        }
        .padding(.horizontal)
        .padding(.vertical, 24)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        
    }
}


#Preview {
    ModalView()
}
