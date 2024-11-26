//
//  MainViewVM.swift
//  MNAD23-ICT
//
//  Created by Dinith Fernando on 2024-11-26.
//

import Foundation
import SwiftUI


class CartViewVM : ObservableObject{
    
    @Published var total:Double = 0.0
    
    func calculatePurchasedItems(item: ShopItem) -> Double {
        // calculate price for each purchase item
        // price = item price X item quantity
        return item.price * Double(item.quantity);
    }
    
    func calculateTotal(shopItems: [ShopItem]) {
        // calculate total bill value
        // total bill = each item price X each item quantity
        // hint: you need to calculate a new bill every time a user lands on this page;
        // this might be useful to decide when to display the 'Empty Cart' text.
        
//        ForEach(shopItems){ item in
//            let purchasedItemPrice = calculatePurchasedItems(item: item)
//            total += purchasedItemPrice
//        }
        shopItems.forEach { item in
            let priceForItem = calculatePurchasedItems(item: item)
            total += priceForItem
        }
    }
    
    
    
}
