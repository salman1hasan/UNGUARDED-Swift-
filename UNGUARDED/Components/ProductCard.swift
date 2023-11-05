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
        ZStack(alignment: .bottom){
            Image(product.image)
                .resizable()
                .cornerRadius(0)
                .frame(width: 250)
                .scaledToFit()
            
            VStack(alignment:.leading){
                Text(product.name)
                    .bold()
                
                Text("\(product.price)$")
                    .font(.caption)
            }
            .padding()
            .frame(width:180,alignment: .leading)
           
        }
        .frame(width: 180, height:250)
        .shadow(radius:3)
    }
}

struct ProductCard_Previews: PreviewProvider{
    static var previews: some View{
        ProductCard(product:productList[0])
    }
}
