//
//  SplashScreenView.swift
//  goppo
//
//  Created by Aissya Jelitawati on 09/04/25.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    
    var body: some View {
        if isActive {
            HomeView()
        } else {
            ZStack {
                
                Color.accent
                    .ignoresSafeArea()
                VStack (spacing: 8){
                    Image("Logo Trans 1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 150, height: 150)
                    Text("GOPPO")
                        .font(Font.custom("FredokaOne-Regular", size: 45))
                        .foregroundStyle(.white)
                }
                
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    withAnimation{
                        isActive = true
                    }
                }
            }
        }
        
    }
}

#Preview {
    SplashScreenView()
}
