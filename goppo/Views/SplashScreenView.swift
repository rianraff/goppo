//
//  SplashScreenView.swift
//  goppo
//
//  Created by Aissya Jelitawati on 09/04/25.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            
            Color.accent
                .ignoresSafeArea()
            VStack (spacing: 8){
                Image("Logo Trans 1")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 180, height: 180)
                Image("Logo Text")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame (height: 56)
            }
                
        }
        
    }
}

#Preview {
    SplashScreenView()
}
