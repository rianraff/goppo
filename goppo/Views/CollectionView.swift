//
//  CollectionView.swift
//  goppo
//
//  Created by Michelle PL on 27/03/25.
//

import SwiftUI

struct CollectionView: View {
    var body: some View {
        
        ZStack{
            Color("BackgroundColor") // Warna background
                .ignoresSafeArea()
            
            VStack{
                //ini nanti pake navigation link
                HStack{
                    Image(systemName: "chevron.backward")
                    
                    Spacer()
                    
                    Text("Pesanan Andalan")
                        .font(.headline)
                        .fontWeight(.semibold)
                    
                    Spacer()
                }
                
                VStack{
                    //on delete
                    CollectionRow()
                    CollectionRow()
                    CollectionRow()
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    CollectionView()
}
