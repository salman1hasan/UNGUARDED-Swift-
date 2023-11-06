//
//  CartView.swift
//  UNGUARDED
//
//  Created by Salman Hasan on 11/6/23.
//

import SwiftUI

struct CartView: View{
    @EnvironmentObject var cartManager: CartManager
    var body: some View{
        ScrollView{
            Text("Your cart is empty")
        }
        .navigationTitle(Text("My Cart"))
        .padding(.top)
    }
}

struct CartView_Previews: PreviewProvider{
    static var previews: some View{
        CartView()
            .environmentObject(CartManager())
    }
}
