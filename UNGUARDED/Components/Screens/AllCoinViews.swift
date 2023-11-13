//
//  AllCoinViews.swift
//  UNGUARDED
//
//  Created by Salman Hasan on 11/13/23.
//

import SwiftUI

struct AllCoinViews: View {
    @StateObject var viewModel: HomeViewModel
    var body: some View {
        VStack(alignment: .leading){
            Text("All Coins")
                .font(.headline)
                .padding()
            
            HStack{
                Text("Coin")
                
                Spacer()
                
                Text("Prices")
            }
            .foregroundColor(.gray)
            .font(.caption)
            .padding(.horizontal)
            
            ScrollView{
                VStack{
                    ForEach(viewModel.coins) { coin in
                        CoinRowView(coin: coin)
                    }
                }
            }
        }
    }
}

