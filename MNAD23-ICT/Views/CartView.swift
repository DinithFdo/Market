//
//  CartView.swift
//  MNAD23-ICT
//
//  Created by Pubudu Mihiranga on 2023-11-12.
//

import SwiftUI

struct CartView: View {
    
    @AppStorage("PreviousDeal") var previousDeal: String = "0.0"
    @StateObject var cartViewVM = CartViewVM()
    @State var items: [ShopItem]
    // declare your properties here
    
    var body: some View {
        NavigationStack {
            Text("My Cart")
                .bold()
                .padding(.top)
            
            VStack(alignment:.leading,spacing: 8) {
                if(cartViewVM.total == 0){
                    VStack{
                        Spacer()
                        Image(systemName:"cart")
                        Text("Empty Cart")
                            .foregroundStyle(.secondary)
                            .font(.system(size: 16))
                        Spacer()
                    }
                }else{
                    Section{
                        ForEach(items){ item in
                            if(item.quantity>0){
                                HStack{
                                    Text("\(item.name)")
                                    Spacer()
                                    Text("\(cartViewVM.calculatePurchasedItems(item: item),specifier: "%.1f")")
                                }
                                
                                Divider()
                            }
                        }
                        
                    } header:{
                        Text("Purchased Items")
                            .bold()
                            .foregroundStyle(.secondary)
                        Divider()
                    }
                    
                    Section{
                        HStack{
                            Text("Net Amount")
                            Spacer()
                            Text("\(cartViewVM.total,specifier: "%.1f")")
                        }
                        Divider()
                        
                    }header:{
                        Text("Payment Details")
                            .bold()
                            .foregroundStyle(.secondary)
                            .padding(.top,30)
                        Divider()
                    }

                    
                }
            }
            .padding()
            
            Spacer()
            
            ZStack{
                RoundedRectangle(cornerSize: .init(width: 20, height: 20), style: .continuous)
                    .frame(width:350,height:100)
                    .foregroundStyle(.green)
                Text("Your Previous Deal with Us was $ \(previousDeal)")
                    .foregroundStyle(.white)
            }

        }
        .onAppear{
            cartViewVM.calculateTotal(shopItems: items)
        }
        .onDisappear{
            if(cartViewVM.total > 0){
                previousDeal = String(cartViewVM.total)
            }
        }
    }
    
    //    private func calculatePurchasedItems(item: ShopItem) -> Double {
    //        // calculate price for each purchase item
    //        // price = item price X item quantity
    //        return 0.0
    //    }
    //
    //    private func calculateTotal() {
    //        // calculate total bill value
    //        // total bill = each item price X each item quantity
    //        // hint: you need to calculate a new bill every time a user lands on this page;
    //        // this might be useful to decide when to display the 'Empty Cart' text.
    //    }
}

#Preview {
    var items: [ShopItem] = [
        ShopItem(name: "Broccoli", price: 8.00, quantity: 1),
        ShopItem(name: "Banana", price: 10.00, quantity: 2),
        ShopItem(name: "Avocado", price: 7.00, quantity: 3),
        ShopItem(name: "Chicken", price: 20.00, quantity: 0),
        ShopItem(name: "Water", price: 5.00, quantity: 5)
    ]
    
    CartView(items: items)
}
