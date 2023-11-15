//
//  WelcomeView.swift
//  UNGUARDED
//
//  Created by Salman Hasan on 11/14/23.
//

import SwiftUI
import CoreLocationUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View{
        VStack{
            VStack(spacing: 20){
                NavigationLink(destination: CryptoView().navigationBarBackButtonHidden(true), label:{
                    Image("UNGUARDED")
                        .resizable()
                        .aspectRatio(contentMode:.fit)
                        .cornerRadius(8)
                        .frame(width: 300, height: 300)
                })
            }
           
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(Color(red: 0.953, green:0.678 , blue:0.212 ))
            .tint(.white)
        }
        
    
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        
    }
    
    
}


struct WelcomeView_Previews: PreviewProvider{
    static var previews: some View{
        WelcomeView()
    }
}
