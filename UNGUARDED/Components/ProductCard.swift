//
//  ProductCard.swift
//  UNGUARDED
//
//  Created by Salman Hasan on 11/5/23.
//

import SwiftUI

struct ProductCard: View{
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
                .frame(width:180,alignment: .leading)
                .background(.ultraThinMaterial)
                .cornerRadius(10)
                
            }
            .frame(width: 180, height:250)
            .shadow(radius:1)
            
            Button{
                print("Added to cart!")
            }label:{
                Image(systemName:"plus")
                    .padding(10)
                    .foregroundColor(.white)
                    .background(.black)
                    .cornerRadius(10)
                    .padding()
            }
        }
    }
    
    struct ProductCard_Previews: PreviewProvider{
        static var previews: some View{
            ProductCard(product:productList[0])
        }
    }
}
