//
//  InputCollectionNameView.swift
//  goppo
//
//  Created by Michelle PL on 07/04/25.
//

import SwiftUI

struct InputCollectionNameView: View {
    
    @State private var collectionName: String = ""
    
    var body: some View {
        
        VStack(spacing: 16.0) {
            
            VStack (alignment: .leading, spacing: 16.0) {
                Text("Nama Koleksi")
                    .frame(width: 361, height: 20, alignment: .leading)
                    .font(.system(size: 22, weight: .bold, design: .default))
                    .multilineTextAlignment(.leading)
                
                TextField("Tulis nama koleksi", text: $collectionName)
                    .padding(12)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.accentColor, lineWidth: 1)
                    )
                    .frame(width: 361)
                
                Spacer()
                
                HStack{
                    Text("Buat Koleksi")
                }
                .foregroundStyle(Color.white)
                .font(.system(size: 16, weight: .semibold, design: .default))
                .fontWeight(.semibold)
                .frame(width: 361, height: 48)
                .background(Color.accent)
                .cornerRadius(8)
                
            }

        }
        .padding()
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color.white)
    }
}

#Preview {
    InputCollectionNameView()
}
