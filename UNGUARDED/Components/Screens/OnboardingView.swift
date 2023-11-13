//
//  OnboardingView.swift
//  UG
//
//  Created by Salman Hasan on 11/7/23.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTY
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    
    
   // MARK: - BODY
    
var body: some View {
    ZStack {
        Color("ColorBlack")
            .ignoresSafeArea(.all, edges: .all)
               
        VStack(spacing: 20) {
            Spacer()
            
            NavigationView {
                ZStack{
                    Color("ColorBlack")
                        .ignoresSafeArea(.all, edges: .all)
                
    NavigationLink(destination: PinchView().navigationBarBackButtonHidden(true), label:{
                    Image("UNGUARDED")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                })
            }
    }
    .navigationViewStyle(.stack)
      ZStack{
              }
             }
          } //: HEADER
           .onAppear(perform: {
               isAnimating = true
           })
       }
    
}
        
struct OnboardingView_Previews: PreviewProvider {
  static var previews: some View {
    OnboardingView()
  }
}
