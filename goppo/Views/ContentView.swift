//
//  ContentView.swift
//  goppo
//
//  Created by Aldrian Raffi Wicaksono on 26/03/25.
//

import SwiftUI
import Foundation

struct ContentView: View {
    
    @State var menu: Menu
    
    var body: some View {
        Text(menu.name)
    }
}

#Preview {
    ContentView(menu: menu[0])
}
