//
//  CryptoView.swift
//  UNGUARDED
//
//  Created by Salman Hasan on 11/13/23.
//

import SwiftUI

struct CryptoView: View {
    @StateObject var viewModel = HomeViewModel()
    
    
    var body: some View {
        NavigationView{
                ScrollView(.vertical, showsIndicators:  false){
                    TopMoversView(viewModel: viewModel)

                    Divider()
                    
                    AllCoinViews(viewModel: viewModel)
                }
                .navigationTitle("UNGUARDED")
            }
        }
    }

struct CryptoView_Previews: PreviewProvider{
    static var previews: some View{
        CryptoView()
    }
}
