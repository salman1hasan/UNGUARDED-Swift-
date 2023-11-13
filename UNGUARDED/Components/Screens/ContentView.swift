//
//  ContentView.swift
//  UNGUARDED
//
//  Created by Salman Hasan on 11/8/23.
//

import SwiftUI

struct ContentView: View {
@AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
var body: some View{
    ZStack{
        if isOnboardingViewActive{
            OnboardingView()
        }else{
            HomeView()
        }
      }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

