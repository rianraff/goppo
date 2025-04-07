//
//  ModalCollectionView.swift
//  goppo
//
//  Created by Aissya Jelitawati on 28/03/25.
//

import SwiftUI
import SwiftData

struct ModalView: View {
    @Environment(\.modelContext) private var modelContext
    @Query var menus: [Menu]
    @Query var collections: [Collection]
    @Query var CollctionItems: [CollectionItem]
    var order: [Int: Int]
    
    var body: some View {
        
        NavigationStack{
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
                        .foregroundStyle(.accent)
                }
                .padding(.leading, 16.0)
                
                ScrollView {
                    VStack {
                        ForEach(collections, id: \.id) { collection in
                            CollectionRadio(collection: collection)
                                .onAppear {
                                    print("Collection Name: \(collection.name)")
                                    
                                    // Find all items belonging to this collection
                                    let itemsInCollection = CollctionItems.filter { $0.collection_id == collection.id }
                                    
                                    for item in itemsInCollection {
                                        if let menu = menus.first(where: { $0.id == item.menu_id }) {
                                            print("Menu in Collection: \(menu.tenant_id)")
                                        }
                                    }
                                }
                        }

                    }
                }
                .frame(height: 270)
                
                VStack {
                    //                Button(action: {
                    //                    showModal = true
                    //                }) {
                    
                    //                NavigationLink(destination: RepeatView(repeatDays: $repeatDays)) {
                    //                    HStack {
                    //                        Text("Ulangi Setiap")
                    //                            .foregroundStyle(.black)
                    //                        Spacer()
                    //                        if !repeatDays.isEmpty {
                    //                            Text(formatRepeatDays(repeatDays))
                    //                                .font(.subheadline)
                    //                                .foregroundStyle(.gray)
                    //                        }
                    //                        Image(systemName: "chevron.right")
                    //                    }
                    //                }
                    
                    NavigationLink(destination: InputCollectionNameView(order: order, menus: menus)){
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
                    //                }
                    //            .sheet(isPresented: $showModal) {
                    //                InputCollectionNameView()
                    //                    .presentationDetents([.height(500)])
                    //                    .presentationDragIndicator(.visible)
                    //            }
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
}


//#Preview {
//    ModalView()
//}
