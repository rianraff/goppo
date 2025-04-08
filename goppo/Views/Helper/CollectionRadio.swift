//
//  CollectionRadio.swift
//  goppo
//
//  Created by Aissya Jelitawati on 27/03/25.
//

import SwiftUI

struct CollectionRadio: View {
    var collection: Collection
    var isSelected: Bool
    var onTap: () -> Void

    var body: some View {
        ZStack {
            HStack(alignment: .center, spacing: 12) {
                collection.image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 62, height: 62)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                
                Text(collection.name)
                    .font(.body)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.leading)
                    .lineLimit(nil)
                    .fixedSize(horizontal: false, vertical: true)
                
                Spacer(minLength: 8)
 
                RadioButton(isSelected: isSelected) {
                    onTap()
                }
                .padding(.top, 4)
            }
         
        }
        .padding(6)
        .frame(maxWidth: .infinity, alignment: .leading)
        //.background(Color.white)
        .cornerRadius(12)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(isSelected ? Color.accentColor : Color.clear, lineWidth: 1.5)
        )
        .padding(1.5)
        .onTapGesture {
            onTap()
        }
        .animation(.easeInOut, value: isSelected)
    }
}




//#Preview {
//    CollectionRadio()
//}
