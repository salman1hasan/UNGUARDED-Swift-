//
//  ProductCard.swift
//  UNGUARDED
//
//  Created by Salman Hasan on 11/5/23.
//

import SwiftUI

struct ProductCard: View{
    @EnvironmentObject var cartManager: CartManager
    var product:Product
    
    var body: some View{
        ZStack(alignment:.topTrailing){
            ZStack(alignment: .bottom){
                Image(product.image)
                    .resizable()
                    .cornerRadius(0)
                    .frame(width: 250)
                    .scaledToFit()
                
                VStack(alignment:.leading){
                    
                }
                .frame(width:200,alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(10)
                
            }
            .frame(width: 180, height:250)
            .shadow(radius:1)
            
            Button{
            cartManager.addToCart(product: product)
            }label:{
                Image(systemName:"plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.black)
                
            }
        }
    }
}
    
struct ProductCard_Previews: PreviewProvider{
        static var previews: some View{
            ProductCard(product:productList[1])
                .environmentObject(CartManager())
    }
}
