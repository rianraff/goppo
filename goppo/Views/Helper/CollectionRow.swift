//
//  KoleksiCard.swift
//  goppo
//
//  Created by Michelle PL on 27/03/25.
//

import SwiftUI

struct CollectionRow: View {
    var body: some View {
        
        ZStack{
            
            HStack(spacing: 15.0){
                Image("b_bakso_besar")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 97, height: 97)
                    .clipShape(Rectangle())
                    .cornerRadius(8)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 10.0){
                    VStack(alignment: .leading){
                        Text("Koleksi 1")
                            .font(.body)
                            .fontWeight(.semibold)
                        
                        Text("1x Bakso Polos")
                            .font(.footnote)
                            .fontWeight(.regular)
                            .foregroundStyle(.secondary)
                    }
                    
                    HStack{
                        Text("Rp 25.000")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        Button(action: {} ){
                            Text("Pesan")
                                .foregroundStyle(.white)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .frame(width: 80, height: 26)
                                .background(Color.accent)
                                .cornerRadius(8)
                        }
                    }
                }
            }
            .padding()
        }
        .frame(width: 359, height: 113)
        .background(Color.white)
        .cornerRadius(10)
    }
}

#Preview {
    CollectionRow()
}
