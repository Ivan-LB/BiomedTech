//
//  SplashScreenView.swift
//  CoronaTracker
//
//  Created by Ivan Lorenzana Belli on 01/08/22.
//

import SwiftUI

struct SplashScreenView: View {
    // Will tell if the SplashScreen is active
    @State private var isActive = false
    
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var dynamicImage: UIImage {
        let configuration = UIImage.SymbolConfiguration(textStyle: .body, scale: .large)
        let image = UIImage(named: "Covid19Icon") ?? UIImage()
        return image.withConfiguration(configuration)
    }
    
    var body: some View {
        if isActive{
            LoginView()
        } else{
            ZStack{
                Color.biomedPrimary
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    VStack{
                        Image("LogoModificado")
                            .resizable()
                            .scaledToFit()
                    }
                    .scaleEffect(size)
                    .opacity(opacity)
                    .onAppear{
                        withAnimation(.easeIn(duration: 1.5)){
                            self.size = 0.9
                            self.opacity = 1.0
                        }
                    }
                    Spacer()
                }
                .onAppear{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.4){
                        withAnimation {
                            self.isActive = true
                        }
                    }
                }
            }
        }
    }
}
struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}
