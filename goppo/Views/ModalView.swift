//
//  ModalCollectionView.swift
//  goppo
//
//  Created by Aissya Jelitawati on 28/03/25.
//

import SwiftUI

struct ModalView: View {
        
    var body: some View {
        
        NavigationStack{
            VStack(spacing: 12.0) {
                Spacer()
                VStack (alignment: .leading, spacing: 8.0) {
                    Text("Simpan ke Koleksi")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                    
                    Text("Tambahkan menu ke koleksi pesanan andalanmu!")
                        .font(.subheadline)
                        .foregroundStyle(.gray)
                }
                .padding(.trailing)
                
                ScrollView {
                    VStack(spacing: 0) {
                        CollectionRadio()
                        CollectionRadio()
                        CollectionRadio()
                    }
                }
                .frame(height: 265)
                
                VStack(spacing: 12.0) {
                    NavigationLink(destination: InputCollectionNameView()){
                        HStack{
                            Image(systemName: "plus")
                            Text("Tambah Koleksi Baru")
                        }
                        .foregroundStyle(Color.accentColor)
                        .font(.system(size: 16, weight: .semibold, design: .default))
                        .fontWeight(.semibold)
                        .frame(width: 361, height: 48)
                        .background(Color.white)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.accentColor, lineWidth: 3)
                                .cornerRadius(8)
                        )
                    }
        
                    Button(action: {} ){
                        HStack{
                            Text("Simpan")
                        }
                        .foregroundStyle(Color.white)
                        .font(.system(size: 16, weight: .semibold, design: .default))
                        .fontWeight(.semibold)
                        .frame(width: 361, height: 48)
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
}


#Preview {
    ModalView()
}
