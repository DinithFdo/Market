//
//  ContentView.swift
//  MNAD23-ICT
//
//  Created by Pubudu Mihiranga on 2023-11-12.
//

import SwiftUI

struct MainView: View {
    
    // declare your properties here
    
    @State var shopItems = [
        ShopItem(name: "Broccoli", price: 8.00, quantity: 0),
        ShopItem(name: "Banana", price: 10.00, quantity: 0),
        ShopItem(name: "Avocado", price: 7.00, quantity: 0),
        ShopItem(name: "Chicken", price: 20.00, quantity: 0),
        ShopItem(name: "Water", price: 5.00, quantity: 0)
        // complete remaining data
    ]
    
    @State var showCartView = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 10) {
                Divider()
//                Text("Home Page")
                ForEach($shopItems){ item in
                    ItemView(item: item)
                }
                
                Spacer()
                
                Button("Checkout") {
                    showCartView.toggle()
                }
                .buttonStyle(.bordered)
                .tint(.green)
            }
            .padding()
            .navigationTitle("Buy Fresh Groceries")
            .navigationDestination(isPresented: $showCartView) {
                CartView(items: shopItems)
            }
        }
    }
}

#Preview {
    MainView()
}
