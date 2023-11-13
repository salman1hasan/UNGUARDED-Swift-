//
//  ContentView.swift
//  Pinch
//
//  Created by Salman Hasan on 11/10/23.
//

import SwiftUI

struct HomeView: View {
    
    
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    @State private var isDrawerOpen: Bool = false

    func resetImageState(){
        return withAnimation(.spring()){
            imageScale = 1
            imageOffset = .zero
        }
    }
    
    var body: some View {
        NavigationView{
          ZStack{
            Color.clear
              
    Link(destination: URL(string: "https://www.unguarded.com")!, label: {
                Image("QRCode")
            .resizable()
            .aspectRatio(contentMode:.fit)
            .cornerRadius(8)
            .padding()
            .opacity(isAnimating ? 1:0)
            .offset(x: imageOffset.width, y:
            imageOffset.height)
            .scaleEffect(imageScale)
            .onTapGesture(count:2, perform: {
            if imageScale == 1 {
            withAnimation(.spring()){
            imageScale = 5
            }
            }else{
            withAnimation(.spring()){
            resetImageState()
            }
            }
            })
            .gesture(
            DragGesture()
            .onChanged { value in
            withAnimation(.linear(duration: 1)){
            imageOffset = value.translation
            }
            }
            .onEnded { _ in
            if imageScale <= 1 {
            resetImageState()
            }
        }
    )})
             
                 
    .gesture(
        MagnificationGesture()
            .onChanged { value in
        withAnimation(.linear(duration: 1)){
        if imageScale >= 1 && imageScale <= 5 {
        imageScale = value
        } else if imageScale > 5 {
        imageScale = 5
        }
        }
        }
       .onEnded { _ in
        if imageScale > 5 {
        imageScale = 5
        } else if imageScale <= 1 {
        resetImageState()
        }
        }
        )
        }
                 
        .navigationBarTitleDisplayMode(.inline)
        .onAppear(perform: {
            withAnimation(.linear(duration:1)){
                isAnimating = true
            }
})
                   
        .overlay(
        InfoPanelView(scale: imageScale, offset: imageOffset)
        .padding(.horizontal)
        .padding(.top,30)
        , alignment: .top
        )

        .overlay(
            Group{
                HStack{
                    
                    NavigationLink(destination: PinchView().navigationBarBackButtonHidden(true), label:{
                        Image("UNGUARDEDOne")
                            .resizable()
                            .frame(width: 20.0, height: 20.0)
                            .scaledToFit()
                            .opacity(isAnimating ? 1 : 0)
                            .animation(.easeOut(duration: 0.5), value: isAnimating)
                    })
                    Button{
                        withAnimation(.spring()){
                            if imageScale > 1 {
                                imageScale -= 1
                                if imageScale <= 1 {
                                    resetImageState()
                                }
                            }
                        }
                    }label:{
                        ControlImageView(icon: "minus.magnifyingglass")
                    }
                    
            Button{
            resetImageState()
            }label:{
            ControlImageView(icon: "arrow.up.left.and.down.right.magnifyingglass")
            }
                    
            
            
            
                    
        Button{
        withAnimation(.spring()){
        if imageScale < 5 {
        imageScale += 1
        if imageScale > 5 {
        imageScale = 5
        }
        }
        }
        }label:{
        ControlImageView(icon: "plus.magnifyingglass")
        .font(.system(size:36))
        }
                    
        NavigationLink(destination: CryptoView().navigationBarBackButtonHidden(true), label:{
                        Image("UNGUARDEDOne")
                            .resizable()
                            .frame(width: 20.0, height: 20.0)
                            .scaledToFit()
                            .opacity(isAnimating ? 1 : 0)
                            .animation(.easeOut(duration: 0.5), value: isAnimating)
                    })
            
}
            
        .padding(EdgeInsets(top:12, leading:20, bottom: 12, trailing: 20))
        .background(.ultraThinMaterial)
        .cornerRadius(12)
            .opacity(isAnimating ? 1 : 0)
        }
            .padding(.bottom, 30)
            , alignment: .bottom
        )
        }
        .navigationViewStyle(.stack)
        }
}
                   
struct HomeView_Previews: PreviewProvider{
    static var previews: some View{
        HomeView()
    }
}


