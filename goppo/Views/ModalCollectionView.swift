//
//  ModalCollectionView.swift
//  goppo
//
//  Created by Aissya Jelitawati on 28/03/25.
//

import SwiftUI

struct ModalCollectionView: View {
    @State private var showModal = false

    var body: some View {
        VStack {
            Button("Tampilkan Modal") {
                showModal.toggle()
            }
        }
        .sheet(isPresented: $showModal) {
            ModalView()
                .presentationDetents([.medium]) // Ukuran modal bisa medium atau large
                .presentationDragIndicator(.visible) // Menampilkan indikator drag
        }
    }
}

struct ModalView: View {
    var body: some View {
        VStack(spacing: 16.0) {
            VStack (alignment: .leading, spacing: 8.0) {
                Text("Simpan ke Koleksi")
                    .frame(width: 361, height: 20, alignment: .leading)
                    .font(.system(size: 22, weight: .bold, design: .default))
                    .multilineTextAlignment(.leading)
                
                Text("Tambahkan menu ke koleksi pesanan andalanmu!")
                    .frame(width: 361, height: 20, alignment: .leading)
                    .font(.system(size: 15, weight: .regular, design: .default))
                    .multilineTextAlignment(.leading)
                    .foregroundStyle(.accent)
            }
            
            VStack {
                CollectionRadio()
                CollectionRadio()
                CollectionRadio()
            }
            VStack {
                Button(action: {} ){
                    HStack{
                        Image(systemName: "square.and.arrow.up")
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
                    .background(Color.black)
                    
                    
                }
            }
            .frame(maxWidth: .infinity, alignment: .center) // Membatasi VStack agar tidak memanjang ke bawah
            .padding(.bottom, 16) // Memberi jarak dari bawah modal
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.white)
        
    }
}


#Preview {
    ModalCollectionView()
}
