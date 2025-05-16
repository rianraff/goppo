//
//  DataSeeder.swift
//  goppo
//
//  Created by Aldrian Raffi Wicaksono on 15/05/25.
//


import SwiftData
import Foundation
import SwiftData

struct SampleDataSeeder {
    static func seedIfNeeded(context: ModelContext) async throws {
        let fetchDescriptor = FetchDescriptor<Tenant>()
        let existingTenants = try context.fetch(fetchDescriptor)
        
        guard existingTenants.isEmpty else {
            print("❌ Tenants already exist, skipping seeding.")
            return
        }
        
        // Must insert tenants into context to track them
        let mustafaMinang = Tenant(
            name: "Mustafa Minang",
            openHour: 8,
            openMinute: 0,
            closeHour: 14,
            closeMinute: 0,
            phoneNumber: "+6287778599173",
            imageName: "mustafa_minang",
            qrisImageName: "qris_dummy"
        )
        mustafaMinang.uuid = UUID()
        
        mustafaMinang.menus = [
            Menu(name: "Nasi Padang", price: 20000, category: .food, tenant: mustafaMinang, imageName: "dummy_food"),
            Menu(name: "Nasi Padang Komplit", price: 25000, category: .food, tenant: mustafaMinang, imageName: "dummy_food"),
            Menu(name: "Teh Tawar", price: 2000, category: .drink, tenant: mustafaMinang, imageName: "dummy_drink"),
            Menu(name: "Teh Manis", price: 4000, category: .drink, tenant: mustafaMinang, imageName: "dummy_drink")
        ]
        
        let wongJowo = Tenant(
            name: "Wong Jowo",
            openHour: 8,
            openMinute: 0,
            closeHour: 14,
            closeMinute: 0,
            phoneNumber: "+6287778599173",
            imageName: "wong_jowo",
            qrisImageName: "qris_dummy"
        )
        wongJowo.uuid = UUID()
        
        wongJowo.menus = [
            Menu(name: "Bubur Ayam", price: 15000, category: .food, tenant: wongJowo, imageName: "dummy_food"),
            Menu(name: "Siomay", price: 20000, category: .food, tenant: wongJowo, imageName: "dummy_food"),
            Menu(name: "Air Aqua", price: 5000, category: .drink, tenant: wongJowo, imageName: "dummy_drink")
        ]
        
        //Kantin Kasturi
        let kantinKasturiUUID = UUID()
        let kantinKasturi = Tenant(
            name: "Kantin Kasturi",
            openHour: 8,
            openMinute: 0,
            closeHour: 14,
            closeMinute: 0,
            phoneNumber: "+6287778599173",
            imageName: "kantin_kasturi",
            qrisImageName: "qris_dummy"
        )
        kantinKasturi.uuid = kantinKasturiUUID
        
        kantinKasturi.menus = [
            Menu(
                name: "Ayam Teriyaki",
                price: 10000,
                category: .food,
                tenant: kantinKasturi,
                imageName: "dummy_food"
            ),
            Menu(
                name: "Sapi Lada Hitam",
                price: 10000,
                category: .food,
                tenant: kantinKasturi,
                imageName: "dummy_food"
            ),
            Menu(
                name: "Mapo Tofu",
                price: 5000,
                category: .food,
                tenant: kantinKasturi,
                imageName: "dummy_food"
            ),
            Menu(
                name: "Cumi Cabai Hijau",
                price: 7000,
                category: .food,
                tenant: kantinKasturi,
                imageName: "dummy_food"
            ),
            Menu(
                name: "Telor Masak Semur",
                price: 4000,
                category: .food,
                tenant: kantinKasturi,
                imageName: "dummy_food"
            ),
            Menu(
                name: "Bakwan Jagung",
                price: 2000,
                category: .food,
                tenant: kantinKasturi,
                imageName: "dummy_food"
            )
        ]
        
        //Mama Djempol
        let mamaDjempolUUID = UUID()
        let mamaDjempol = Tenant(
            name: "Mama Djempol",
            openHour: 8,
            openMinute: 0,
            closeHour: 14,
            closeMinute: 0,
            phoneNumber: "+6287778599173",
            imageName: "mama_djempol",
            qrisImageName: "qris_dummy"
        )
        mamaDjempol.uuid = mamaDjempolUUID
        
        mamaDjempol.menus = [
            Menu(
                name: "Ayam Teriyaki",
                price: 10000,
                category: .food,
                tenant: mamaDjempol,
                imageName: "dummy_food"
            ),
            Menu(
                name: "Sapi Lada Hitam",
                price: 10000,
                category: .food,
                tenant: mamaDjempol,
                imageName: "dummy_food"
            ),
            Menu(
                name: "Mapo Tofu",
                price: 5000,
                category: .food,
                tenant: mamaDjempol,
                imageName: "dummy_food"
            ),
            Menu(
                name: "Cumi Cabai Hijau",
                price: 7000,
                category: .food,
                tenant: mamaDjempol,
                imageName: "dummy_food"
            ),
            Menu(
                name: "Telor Masak Semur",
                price: 4000,
                category: .food,
                tenant: mamaDjempol,
                imageName: "dummy_food"
            ),
            Menu(
                name: "Bakwan Jagung",
                price: 2000,
                category: .food,
                tenant: mamaDjempol,
                imageName: "dummy_food"
            )
        ]
        
        //Kedai Aneka Rasa
        let anekaRasaUUID = UUID()
        let anekaRasa = Tenant(
            name: "Aneka Rasa",
            openHour: 8,
            openMinute: 0,
            closeHour: 14,
            closeMinute: 0,
            phoneNumber: "+6287778599173",
            imageName: "kedai_aneka_rasa",
            qrisImageName: "qris_dummy"
        )
        anekaRasa.uuid = anekaRasaUUID
        
        anekaRasa.menus = [
            Menu(
                name: "Mie Ayam Komplit",
                price: 25000,
                category: .food,
                tenant: anekaRasa,
                imageName: "k_mie_ayam_komplit"
            ),
            Menu(
                name: "Mie Ayam Polos", price: 20000, category: .food, tenant: anekaRasa, imageName: "k_mie_ayam_polos"
            ),
            Menu(
                name: "Mie Ayam Dino", price: 30000, category: .food, tenant: anekaRasa, imageName: "k_mie_ayam_dino"
            ),
            Menu(
                name: "Mie Ayam Dino Komplit", price: 35000, category: .food, tenant: anekaRasa, imageName: "k_mie_ayam_dino_komplit"
            ),
            Menu(name: "Mie Yamin Komplit", price: 25000, category: .food, tenant: anekaRasa, imageName: "k_mie_yamin_komplit"
                ),
            Menu(name: "Mie Yamin", price: 25000, category: .food, tenant: anekaRasa, imageName: "k_mie_yamin"
                ),
            Menu(name: "Mie Lebar", price: 25000, category: .food, tenant: anekaRasa, imageName: "k_mie_lebar"
                ),
            Menu(name: "Kwetiau Kuah", price: 25000, category: .food, tenant: anekaRasa, imageName: "k_kwetiau_kuah"
                ),
            Menu(name: "Bihun Kuah", price: 25000, category: .food, tenant: anekaRasa, imageName: "k_bihun_kuah"
                ),
            Menu(name: "Bakso Kuah 1 Porsi", price: 20000, category: .food, tenant: anekaRasa, imageName: "k_bakso_kuah_1_porsi"
                ),
            Menu(name: "Bakso Kuah ½ Porsi", price: 10000, category: .food, tenant: anekaRasa, imageName: "k_bakso_kuah_setengah_porsi"
                ),
            Menu(name: "Pangsit Kuah 1 Porsi", price: 20000, category: .food, tenant: anekaRasa, imageName: "k_pangsit_kuah_1_porsi"
                ),
            Menu(name: "Pangsit Kuah ½ Porsi", price: 10000, category: .food, tenant: anekaRasa, imageName: "k_pangsit_kuah_setengah_porsi"
                )
        ]
        
        //Bakso Bakwan Malang
        let baksoBakwanMalangUUID = UUID()
        var baksoBakwanMalang = Tenant(
            name: "Bakso Bakwan Malang",
            openHour: 8,
            openMinute: 0,
            closeHour: 14,
            closeMinute: 0,
            phoneNumber: "+6287778599173",
            imageName: "bakso_bakwan_malang",
            qrisImageName: "qris_dummy"
        )
        baksoBakwanMalang.uuid = baksoBakwanMalangUUID
        
        baksoBakwanMalang.menus = [
            Menu(
                name: "Bakso Besar",
                price: 28000,
                category: .food,
                tenant: baksoBakwanMalang,
                imageName: "b_bakso_besar"
            ),
            Menu(name: "Paket Komplit", price: 28000, category: .food, tenant: baksoBakwanMalang, imageName: "b_paket_komplit"
                ),
            Menu(name: "Bakwan Malang", price: 15000, category: .food, tenant: baksoBakwanMalang, imageName: "b_bakwan_malang"
                ),
            Menu(name: "Pangsit Goreng", price: 3000, category: .food, tenant: baksoBakwanMalang, imageName: "b_pangsit_goreng"
                ),
            Menu(name: "Bakso Goreng", price: 3000, category: .food, tenant: baksoBakwanMalang, imageName: "b_bakso_goreng"
                ),
            Menu(name: "Risol", price: 3000, category: .food, tenant: baksoBakwanMalang, imageName: "b_risol"
                ),
            Menu(name: "Pangsit Rebus", price: 3000, category: .food, tenant: baksoBakwanMalang, imageName: "b_pangsit_rebus"
                ),
            Menu(name: "Tahu", price: 3000, category: .food, tenant: baksoBakwanMalang, imageName: "b_tahu"
                ),
            Menu(name: "Siomay Kecil", price: 3000, category: .food, tenant: baksoBakwanMalang, imageName: "b_siomay_kecil"
                ),
            Menu(name: "Pilus", price: 3000, category: .food, tenant: baksoBakwanMalang, imageName: "b_pilus"
                ),
            Menu(name: "Es Teh Manis", price: 3000, category: .drink, tenant: baksoBakwanMalang, imageName: "b_teh_manis"
                )
        ]
        
        // Insert tenants into context
        context.insert(mustafaMinang)
        context.insert(wongJowo)
        context.insert(anekaRasa)
        context.insert(baksoBakwanMalang)
        context.insert(kantinKasturi)
        
        try context.save()
        
        // Verify save
        let savedTenants = try context.fetch(fetchDescriptor)
        
        if savedTenants.isEmpty {
            print("❌ No tenants found after saving")
        } else {
            print("✅ Seeded tenants:")
            for tenant in savedTenants {
                print("Tenant Name: \(tenant.name)")
            }
        }
    }
}
