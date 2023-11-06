//
//  ContentView.swift
//  SweaterShopApp
//
//  Created by Stephanie Diep on 2021-12-23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cartManager = CartManager()
    var columns = [GridItem(.adaptive(minimum: 200), spacing: 50)]
    
    var body: some View {
    NavigationView {
    ScrollView {
        LazyVGrid(columns: columns, spacing: 10) {
            ForEach(productList, id: \.id) { product in
                ProductCard(product: product)
                    .environmentObject(cartManager)
                    }
                }
                .padding()
            }
            .toolbar {
                NavigationLink{
                    CartView()
                        .environmentObject(cartManager)
                }label:{
                    CartButton(numberOfProducts:cartManager.products.count)
                    
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
