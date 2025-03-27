//
//  Receipt Page.swift
//  goppo
//
//  Created by Aissya Jelitawati on 26/03/25.
//

import SwiftUI

struct ReceiptView: View {
    var body: some View {
        HStack{
            Image(systemName: "chevron.backward")
            
            Spacer()
            
            Text("Tenant")
                .font(.headline)
                .fontWeight(.semibold)
            
            Spacer()
        }
        .padding()
       VStack {
           //Judul
           HStack {
               Text("Detail Pemesanan")
                   .font(.system(size: 22, weight: .bold, design: .default))
               Spacer()
           }
           .padding(.horizontal, 16.0)
           .padding(.vertical, 8.0)
           
           //Detail Order
           HStack(spacing: 20) {
               Text("1x")
               
               HStack {
                   Text("Bakso Polos")
                   Spacer()
               }
               
               Text("Rp25.000")
           }
           .padding(.horizontal, 16.0)
           .padding(.vertical, 8.0)
           
           //QR
           Image("qris_dummy")
               .resizable()
               .aspectRatio(contentMode: .fit)
               .frame(width: 240, height: 240)
           Spacer()
           
           //Button
           Button(action: {}) {
               Text("Bayar")
                   
                    }
                    
        }
        
    }
}

#Preview {
    ReceiptView()
}
