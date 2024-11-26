//
//  ItemView.swift
//  MNAD23-ICT
//
//  Created by Dinith Fernando on 2024-11-26.
//

import SwiftUI

struct ItemView: View {
    
    @Binding var item:ShopItem
    
    @State var value:Int = 0
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Image("\(item.name.lowercased())")
                    .resizable()
                    .frame(width: 70,height:70)
                Section{
                    VStack{
                        Text("\(item.name)")
                        Text("\(item.price,specifier:"%.2f")")
                    }
                    
                    Stepper(
                        value: $item.quantity,
                        in: 0...10,
                        step: 1
                    ){
                    }
                    Text("\(item.quantity)")
                    
                }
                Spacer()
            }
           
        }
        .padding()
    }
}

#Preview {
    var item:ShopItem = .init(name: "Water", price: 10, quantity: 0)
    
    ItemView(
        item:.constant(item)
    )
}
