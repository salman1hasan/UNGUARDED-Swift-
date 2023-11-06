//
//  ContentView.swift
//  UNGUARDED
//
//  Created by Salman Hasan on 11/5/23.
//

import SwiftUI

struct ContentView: View {
var columns=[GridItem(.adaptive(minimum:160),spacing: 20)]
    
    var body: some View {
        NavigationView{
            HStack{
                ForEach(productList, id: \.id){ product in
                    ProductCard(product: product)
                }
            }
            .navigationTitle(Text("UNGUARDED"))
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
