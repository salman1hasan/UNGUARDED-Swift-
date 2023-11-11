//
//  ContentView.swift
//  Pinch
//
//  Created by Salman Hasan on 11/10/23.
//

import SwiftUI

struct PinchView: View {
    
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    
    var body: some View {
        NavigationView{
          ZStack{
            Image("UNGUARDED")
                .resizable()
                .aspectRatio(contentMode:.fit)
                .cornerRadius(10)
                .padding()
                .shadow(color:.black.opacity(0.2), radius:12, x:2, y:2)
                .opacity(isAnimating ? 1:0)
                .scaleEffect(imageScale)
                .onTapGesture(count:2, perform: {
                    if imageScale == 1 {
                        withAnimation(.spring()){
                            imageScale = 5
                        }
                    }else{
                        withAnimation(.spring()){
                            imageScale = 1
                        }
                    }
                })
            }
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                withAnimation(.linear(duration:1)){
                     isAnimating = true
                }
            })
        }
        .navigationViewStyle(.stack)
        }
}

#Preview {
    PinchView()
}
