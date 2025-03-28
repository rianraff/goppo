//
//  ModalCollectionView.swift
//  goppo
//
//  Created by Aissya Jelitawati on 28/03/25.
//

import SwiftUI

struct CollectionViewModal: View {
    @State private var showModal = false

    var body: some View {
        VStack {
            Button("Tampilkan Modal") {
                showModal.toggle()
            }
        }
        .sheet(isPresented: $showModal) {
            ModalView()
                .presentationDetents([.height(500)])
                .presentationDragIndicator(.visible) // Menampilkan indikator drag
        }
    }
}

struct ModalView: View {
    var body: some View {
        VStack(spacing: 16.0) {
            Spacer()
            VStack (alignment: .leading, spacing: 16.0) {
                Text("Simpan ke Koleksi")
                    .frame(width: 361, height: 20, alignment: .leading)
                    .font(.system(size: 22, weight: .bold, design: .default))
                    .multilineTextAlignment(.leading)
                
                Text("Tambahkan menu ke koleksi pesanan andalanmu!")
                    .frame(width: 361, height: 20, alignment: .leading)
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.secondary)
            }
            .padding(.leading, 16.0)
            
            ScrollView {
                VStack {
                    CollectionRadio()
                    CollectionRadio()
                    CollectionRadio()
                }
            }
            .frame(height: 270)
            
            VStack {
                Button(action: {} ){
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        
    }
}


#Preview {
    CollectionViewModal()
}
